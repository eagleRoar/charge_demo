/*-------------------------------------------
  L1211 12槽充电器 - 主程序
  MCU: SC8F096AD832 QFN32 @ 16MHz
  功能: 系统初始化 + Timer0 ISR(软件PWM/上电自检/NTC计时/UART计时) + 主循环轮询
  版本: 2026/08/23 <V57B> 修复V57A两个误判(基于V55A):
         1. B3线性锂DIODE_TEST高压段(pre>3500)误判DRY: 删V54R"无爬升→DRY"
            分支, 高压段VCC不塌一律放行线性锂(真实线性锂体二极管钳位节点,
            tr=+4平直, 并非碳性特征).
         2. B11碳性DET/DIO/CC无限循环: g_ccBlocks bit7(CC_RETRY_FLAG)置位后
            值为0x80被CC_MAX_BLOCKS(18)误判为已充180分钟→二次入CC瞬间ERROR
            →重判死循环; 块计数检查屏蔽bit7; 且标志置位后imp_linear_li拒绝
            再次放行并清highVFlag直接DRY锁死(真实线性锂CC必升压, 不受影响).
  (V57A: 显式节拍改造(基于V55A):
         1. 新增ISR 10ms硬件节拍g_hwTick, 状态机chargeTimer按真实经过的10ms数
            累加(charge_mgr.c), 与主循环轮速/UART打印阻塞完全解耦.
         2. UART打印触发从TICK_PER_SEC(12.5ms/次→主循环几乎全被打印占用)
            改为独立10ms节拍计数PRINT_INTERVAL_TICKS=200(每2秒一次),
            PWM冻结占比从~86%降至~35%.
         3. 时间常量按注释设计物理时长/10ms重新校准(DETECT 2.4s/8s,
            NO_PROGRESS 60s, DIODE 2.4s等); 原V55A因打印阻塞这些常量
            实际慢~81倍(如DETECT实为24s).
  (V54X: 单槽同步控制架构重构; 去除ISR三阶段扫描状态机, 主循环顺序调用
         Slot_Charge_Ctrl(i) 处理12槽. 单槽内同步完成 ADC采样+VCC+检测+充电+MOSFET,
         全部ADC值经Adc_Norm()归一化到VCC=5000mV基准.)
-------------------------------------------*/
#include "config.h"

/*========================================================================
  全局变量定义 (符合config.h extern声明)
========================================================================*/
/* 系统电压与PWM控制 */
volatile unsigned int  g_vcc_mv = 5000;         /* 系统电压(mV), VREF反推, 每轮采样更新 */
volatile unsigned char g_pwmDuty = 0;           /* PWM占空比(0~PWM_MAX) */
volatile unsigned char g_pwmCounter = 0;        /* PWM计数器(ISR自增) */
signed int g_cvIntegral = 0;                    /* CV PI积分累加器 */

/* 系统计时 */
volatile unsigned int  g_powerOnTimer = 0;      /* 上电自检计时器 */
volatile unsigned char g_powerOnPhase = 0;      /* 上电自检阶段: 0→1→2 */

/* 显式节拍(V57A): ISR维护10ms硬件节拍, 主循环每轮计算经过的节拍数,
   状态机chargeTimer按真实时间累加(charge_mgr.c), 与打印阻塞/轮速解耦 */
volatile unsigned int  g_hwTick = 0;            /* 10ms硬件节拍(ISR递增) */
volatile unsigned char g_hwTickDiv = 0;         /* 125us中断分频计数(80次=10ms) */
volatile unsigned int  g_elapsedTicks = 1;      /* 主循环本轮经过的10ms节拍数 */
volatile unsigned int  g_lastHwTick = 0;        /* 上一轮记录的g_hwTick快照 */

/* NTC温度读取状态机(ISR中计时, 主循环中执行ADC) */
volatile unsigned char g_tempPhase = 0;         /* 0=等待间隔, 1=建立中 */
volatile unsigned int  g_tempSettleCnt = 0;     /* NTC建立等待计数器(轮) */
volatile unsigned int  g_tempReadRoundCnt = 0;  /* 温度读取间隔计数器(轮) */
volatile bit g_doNtcRead = 0;                   /* NTC读取请求标志 */

/* UART打印(仅调试用, 生产固件UART_PRINT_EN=0时整体移除, 释放RAM) */
#if UART_PRINT_EN
volatile bit g_printFlag = 0;
volatile unsigned int  g_printTick = 0;
#endif

/* ADC通道映射表(ROM) */
const unsigned char s_adcChannels[BATTERY_SLOTS] = {
	ADC_CH_B1AD,   /* B1  = AN17 (RC1) */
	ADC_CH_B2AD,   /* B2  = AN16 (RC0) */
	ADC_CH_B3AD,   /* B3  = AN12 (RB4) */
	ADC_CH_B4AD,   /* B4  = AN13 (RB5) */
	ADC_CH_B5AD,   /* B5  = AN5  (RA5) */
	ADC_CH_B6AD,   /* B6  = AN4  (RA4) */
	ADC_CH_B7AD,   /* B7  = AN28 (高通道) */
	ADC_CH_B8AD,   /* B8  = AN29 (高通道) */
	ADC_CH_B9AD,   /* B9  = AN27 (高通道) */
	ADC_CH_B10AD,  /* B10 = AN26 (高通道) */
	ADC_CH_B11AD,  /* B11 = AN7  (RA7) */
	ADC_CH_B12AD   /* B12 = AN6  (RA6) */
};

/*========================================================================
  函数: System_Init
  功能: 系统初始化 - 时钟/GPIO/ANSEL/ADC/UART/Timer0
  引脚状态: MOSFET全部关闭(Gate=High), ADC输入高阻, LED灭
  参考: 09-test GPIO已验证配置
========================================================================*/
void System_Init(void)
{
	unsigned char i;

	/* 1. 时钟: 16MHz内部RC */
	asm("nop");
	asm("clrwdt");
	OSCCON = 0x72;

	/* 2. GPIO初始化: MOSFET Gate=High(关闭AO3401 P沟道)
	   TRIS=1→输入(模拟引脚), TRIS=0→输出(数字控制) */
	TRISA = 0xF0;  PORTA = 0x0F;   /* RA4-7模拟输入, RA0-3=High(B1/B2/B5/B6关) */
	TRISB = 0x30;  PORTB = 0x4F;   /* RB4-5输入, RB6(EN)=1, RB7(PWM)=0, RB0-3=High */
	TRISC = 0x07;  PORTC = 0x00;   /* RC0-2模拟输入(B2AD/B1AD/NTC), RC3(CD)=0,
	                                   RC4(LED_IO2绿)=0, RC5(LED_IO1红)=0 */
	TRISD = 0xF0;  PORTD = 0x0F;   /* RD4-7模拟输入, RD0-3=High(B12/B7/B11/B8关) */

	/* 3. 弱上拉/下拉全关 */
	WPUA = 0x00;  WPDA = 0x00;
	WPUB = 0x00;  WPDB = 0x00;
	WPUC = 0x00;
	WPUD = 0x00;

	/* 4. 中断边沿全关 */
	IOCA = 0x00;  IOCB = 0x00;

	/* 5. 比较器全关 */
	CC0CON = 0;
	CC1CON = 0;

	/* 6. ANSEL: 模拟输入引脚配置
	   AN4=RA4, AN5=RA5, AN6=RA6, AN7=RA7 → ANSEL0
	   AN12=RB4, AN13=RB5                → ANSEL1
	   AN16=RC0, AN17=RC1, AN18=RC2(NTC) → ANSEL2
	   AN26=RD2, AN27=RD3, AN28=RD4, AN29=RD5 → ANSEL3 */
	ANSEL0 = 0xF0;   /* RA4-7: B6AD/B5AD/B12AD/B11AD */
	ANSEL1 = 0x30;   /* RB4-5: B3AD/B8AD */
	ANSEL2 = 0x07;   /* RC0-1: B2AD/B1AD, RC2: NTC(AN18) */
	ANSEL3 = 0x3C;   /* RD2-5: B10AD/B9AD/B7AD/B4AD */

	/* 7. ADC模块初始化 (Fosc/32, Tad=2μs) */
	AD_Init();

#if UART_PRINT_EN
	/* 8. 软件UART初始化 (RC4, 9600bps, 与LED_IO2复用) */
	uart_init();
#endif

	/* 9. Timer0配置: 125μs周期
	   Fosc=16MHz, Tcy=0.25μs, 预分频1:2
	   TMR0 reload = 256 - 125μs/(0.25μs×2) = 256 - 250 = 6
	   OPTION_REG: T0LSE_EN=0(正常模式), T0CS=0, PSA=0, PS2:0=000(1:2) */
	OPTION_REG = 0x00;      /* T0LSE_EN=0(正常), T0CS=0, PSA=0, PS2:0=000(1:2) */
	TMR0 = 6;
	T0IF = 0;
	INTCON = 0xE0;          /* 一次写入: GIE=1, PEIE=1, T0IE=1, 其余清零 */

	/* 10. 初始状态: 所有充电关闭, PWM=0, LED灭
	   V2.3 LED低有效(0=亮): IO1=1(红灭), IO2=1(绿灭) */
	g_pwmDuty = 0;
	g_pwmCounter = 0;
	PIN_LED_IO1 = 1;
	PIN_LED_IO2 = 1;
	PIN_EN = 1;             /* 主电源使能(Q3 4435) */
	PIN_PWM = 0;

	/* 11. 初始化槽位数据 */
	for(i = 0; i < 12; i++)
	{
		g_slot[i].state = CHG_IDLE;
		g_slot[i].type = BAT_TYPE_UNKNOWN;
		g_slot[i].voltage = 0;
		g_slot[i].chargeTimer = 0;
		g_ccBlocks[i] = 0;
		g_ovCnt[i] = 0;
	}

	/* 12. 开全局中断(已在INTCON中设置) */
}

/*========================================================================
  Timer0 中断服务程序
  周期: ~125μs (Timer0重载值6, 预分频1:2)
  功能:
    1. 软件PWM生成(RB7, 250Hz, 32级分辨率)
    2. 上电自检序列(前2秒)
    3. NTC温度读取计时(仅计时, ADC由主循环执行)
    4. UART打印触发(每秒一次)
  说明: 槽位采样/检测/充电均在主循环 Slot_Charge_Ctrl 中同步执行, ISR不再扫描槽位.
========================================================================*/
void interrupt Isr_Timer(void)
{
	/* --- Timer0中断处理 --- */
	if(T0IF)
	{
		T0IF = 0;
		TMR0 = 6;                   /* 重载125μs周期 */
		asm("clrwdt");              /* 喂狗 */

		/* === 1. 软件PWM生成(RB7, 250Hz, 4ms周期) === */
		g_pwmCounter++;
		if(g_pwmCounter >= PWM_RESOLUTION)
			g_pwmCounter = 0;

		if(g_pwmDuty > 0 && g_pwmCounter < g_pwmDuty)
			PIN_PWM = 1;
		else
			PIN_PWM = 0;

		/* === 2. 显式节拍(V57A): 10ms硬件节拍(状态机计时基准, 与打印解耦) ===
		   125us×80=10ms → g_hwTick++; chargeTimer按此节拍累加,
		   状态机计时不再受UART打印阻塞/主循环轮速影响.
		   打印触发同时挂在10ms节拍上(PRINT_INTERVAL_TICKS=200 → 每2秒一次).
		   上电自检计时同样改用10ms节拍(V55A按125us递增使自检仅12.5ms/阶段). */
		if(++g_hwTickDiv >= 80U)
		{
			g_hwTickDiv = 0;
			g_hwTick++;
			if(g_powerOnPhase < 2U)
				g_powerOnTimer++;
#if UART_PRINT_EN
			if(++g_printTick >= PRINT_INTERVAL_TICKS)
			{
				g_printTick = 0;
				g_printFlag = 1;
			}
#endif
		}

		/* === 3. 上电自检序列(前2秒) === */
		if(g_powerOnPhase < 2)
		{
			PowerOnLedSequence();   /* 仅延时稳定电路, 无其他功能 */
			return;                 /* 自检期间不进行槽位/温度/打印计时 */
		}

		/* === 4. NTC温度读取状态机(仅计时) === */
		if(g_tempPhase == 0)
		{
			g_tempReadRoundCnt++;
			if(g_tempReadRoundCnt >= TEMP_READ_INTERVAL)
			{
				g_tempReadRoundCnt = 0;
				g_tempPhase = 1;
				g_tempSettleCnt = 0;
			}
		}
		else
		{
			g_tempSettleCnt++;
			if(g_tempSettleCnt >= NTC_SETTLE_ROUNDS)
			{
				g_doNtcRead = 1;
				g_tempSettleCnt = 0;
				g_tempPhase = 0;
			}
		}
	}
}

#if UART_PRINT_EN
/*========================================================================
  函数: Print_NtcTemp
  功能: 打印NTC温度(每秒一次, 独立于系统状态打印)
========================================================================*/
void Print_NtcTemp(void)
{
	uart_send_string("NTC=");
	uart_send_number(g_temperature / 10U);
	uart_send_string(".");
	uart_send_number(g_temperature % 10U);
	uart_send_string("C\r\n");
}

/*========================================================================
  函数: Print_SystemStatus
  功能: 打印12槽系统状态(每秒一次)
  输出: VCC=电压 T=温度 B1~B12 ADC值(归一化)/电池mV/状态
  说明: BxAD打印值为 VCC=5000mV 基准归一化ADC, 与实时VCC一起打印,
        便于同一电池在不同槽位/不同电源下直接对比.
========================================================================*/
/* B2-B12打印开关: 0=仅B1详细, 1=全部12槽 */
#define PRINT_ALL_SLOTS     1
/* B1-B6打印开关: 1=B1~B6逐行打印 */
#define PRINT_B1_B6         0

void Print_SystemStatus(void)
{
	unsigned char i;
	unsigned int vcc_mv;

	uart_send_string("\r\n== L1211 12CH CHARGER ");
	uart_send_string(FIRMWARE_VERSION);
	uart_send_string(" ==\r\n");

	/* VCC测量(内部1.2V参考反推, 真实mV) */
	test_adc = ADC_Sample(ADC_CH_VREF, 0);
	if(ADC_OK == test_adc)
	{
		unsigned long pt = POWER_RATIO / adresult;
		vcc_mv = (unsigned int)pt;
	}
	else
		vcc_mv = 5000;

	g_vcc_mv = vcc_mv;

	uart_send_string("VCC=");
	uart_send_number(vcc_mv);
	uart_send_string("mV T=");
	uart_send_number(g_temperature / 10U);
	uart_send_string(".");
	uart_send_number(g_temperature % 10U);
	uart_send_string("C IMP_LOCK=");
	uart_send_number(g_impCheckSlot == 0xFF ? 0xFFU : (unsigned int)g_impCheckSlot);
	uart_send_string("\r\n");

#if PRINT_B1_B6
	for(i = 0; i < 6; i++)
#elif PRINT_ALL_SLOTS
	for(i = 0; i < 12; i++)
#else
	for(i = 0; i < 1; i++)
#endif
	{
		unsigned int v = S_VOLT(i);
		unsigned char s = S_STATE(i);

		uart_send_char('B');
		uart_send_number((unsigned int)i + 1U);
		uart_send_char('=');
		uart_send_number(v);

		/* 电池mV校准(归一化基准 VCC_REF_MV=5000):
		   vx_mv = ADC_norm * 5000 / 4096 → BxAD引脚mV
		   bat_mv = (124 * vx_mv + 206 * 5000) / 1000 */
		{
			unsigned long vx_mv = (unsigned long)v * VCC_REF_MV / 4096UL;
			if(vx_mv + 200U >= VCC_REF_MV)
			{
				uart_send_string(" OPEN");
			}
			else
			{
				unsigned long bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV;
				bat_mv_long = (bat_mv_long + CAL_DEN/2UL) / CAL_DEN;
				uart_send_string(" BAT(");
				uart_send_number((unsigned int)bat_mv_long);
				uart_send_string("mV)");
			}
		}

		/* 状态缩写 */
		uart_send_char(' ');
		switch(s)
		{
		case CHG_IDLE:       uart_send_string("[IDLE]"); break;
		case CHG_DETECT:
			uart_send_string("[DET]");
			if(g_slotRefV[i] > 0U)
			{
				uart_send_string(" ref=");
				uart_send_number(g_slotRefV[i]);
			}
			break;
		case CHG_ACTIVATE:   uart_send_string("[ACT]");  break;
		case CHG_PRECHARGE:  uart_send_string("[PRE]");  break;
		case CHG_CC_CHARGE:  uart_send_string("[CC]");   break;
		case CHG_CV_CHARGE:  uart_send_string("[CV]");   break;
		case CHG_FULL:       uart_send_string("[FULL]"); break;
		case CHG_ERROR:
		{
			unsigned char t = S_TYPE(i);
			if(t == BAT_TYPE_NIMH || t == BAT_TYPE_DRY)
				uart_send_string("[Dry/NiMH ERR]");
			else if(t == BAT_TYPE_LI_ION)
				uart_send_string("[Li-ion ERR]");
			else if(t == BAT_TYPE_LINEAR_LI)
				uart_send_string("[Linear Li ERR]");
			else
				uart_send_string("[ERR]");
			if(g_slotRefV[i] > 0U)
			{
				uart_send_string(" ref=");
				uart_send_number(g_slotRefV[i]);
			}
			break;
		}
		case CHG_IMP_CHECK:  uart_send_string("[IMP]");  break;
		case CHG_IMP_DIODE_TEST:
			uart_send_string("[DIO]");
			uart_send_string(" pre=");
			uart_send_number(g_impData & 0x0FFFU);
			break;
		default:             uart_send_string("[???]");  break;
		}

		/* 打印 ct(chargeTimer) 和 ty(电池类型) */
		uart_send_string(" ct=");
		uart_send_number(S_TIMER(i));
		uart_send_string(" ty=");
		uart_send_number(S_TYPE(i));

		/* DIODE_TEST v偏移轨迹打印 */
		if(g_diodeTraceCnt > 0U && g_diodeTraceSlot == i)
		{
			unsigned char tc;
			uart_send_string(" tr=");
			for(tc = 0; tc < g_diodeTraceCnt; tc++)
			{
				signed int d = (signed int)g_diodeTrace[tc] - 128;
				if(d < 0)
				{
					uart_send_char('-');
					d = -d;
				}
				else if(d > 0)
					uart_send_char('+');
				uart_send_number((unsigned int)d * 4U);
				if(tc + 1U < g_diodeTraceCnt)
					uart_send_char(',');
			}
			g_diodeTraceCnt = 0;
			g_diodeTraceSlot = 0xFF;
		}

#if PRINT_B1_B6 || PRINT_ALL_SLOTS
		uart_send_string("\r\n");
#endif
	}
	uart_send_string("\r\n");
}

#endif

/*========================================================================
  主函数
  流程:
    1. System_Init() - 初始化所有模块, 启动Timer0 ISR
    2. 上电自检2秒(ISR中处理)
    3. 主循环:
       - 每轮采样一次 VCC 作为归一化基准
       - 顺序调用 Slot_Charge_Ctrl(i) 处理12槽(采样/检测/充电/MOSFET)
       - CCCV_Control() 更新全局PWM占空比
       - Update_LED_Global() 更新全局LED
       - NTC温度读取(g_doNtcRead标志)
       - UART状态打印(g_printFlag标志)
       - 喂狗
========================================================================*/
void main(void)
{
	unsigned char i;

	/* ICSP烧录保护延时 */
	__delay_ms(10);
	asm("clrwdt");

	/* 系统初始化 */
	System_Init();

#if UART_PRINT_EN
	uart_send_string("L1211 Charger V2.1\r\n");
	uart_send_string("Init...\r\n");
#endif

	/* 主循环 */
	while(1)
	{
		asm("clrwdt");

		/* --- 显式节拍(V57A): 计算本轮到现在的真实经过时间(10ms节拍) ---
		   打印阻塞期间GIE关ISR暂停→g_hwTick不增→elapsed=0, 状态机同步暂停,
		   与V55A(打印时状态机不走)语义一致; 恢复后按真实时间补回. */
		g_elapsedTicks = g_hwTick - g_lastHwTick;
		g_lastHwTick = g_hwTick;
		if(g_elapsedTicks == 0U)
			g_elapsedTicks = 1U;    /* 防0: 主循环一轮至少推进1tick(10ms) */

		/* --- 每轮一次 VCC 采样: 作为归一化基准(VCC为慢变量) --- */
		Get_Vcc();

		/* --- 顺序处理12槽: 单槽内同步完成 采样+检测+充电+MOSFET --- */
		for(i = 0; i < BATTERY_SLOTS; i++)
		{
			Slot_Charge_Ctrl(i);
		}

		/* --- 全局PWM占空比调节 --- */
		CCCV_Control();

		/* --- 全局LED状态显示 --- */
		Update_LED_Global();

		/* --- NTC温度读取: ISR建立完成后触发 --- */
		if(g_doNtcRead)
		{
			g_doNtcRead = 0;
			Read_Temperature();
		}

#if UART_PRINT_EN
		/* --- UART打印: 每秒触发一次 --- */
		if(g_printFlag)
		{
			g_printFlag = 0;
			Print_SystemStatus();
			Print_NtcTemp();
		}
#endif
	}
}

/*========================================================================
  合并编译: 以下模块通过#include方式并入main.c
  SCMCU IDE单文件编译模式下, 所有.c文件需合并为一个翻译单元
========================================================================*/
#include "adc_drv.c"       /* ADC驱动: adresult, test_adc, ADC_Sample, AD_Init */
#include "uart_dbg.c"      /* 软件UART: uart_init, uart_send_char/string/number */
#include "charge_mgr.c"    /* 充电管理: Read_Temperature, Get_Vcc, Adc_Norm, Slot_Charge_Ctrl, CCCV_Control */
#include "led.c"           /* LED控制: Update_LED_Global, PowerOnLedSequence */
