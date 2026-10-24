/*-------------------------------------------
  L1211 12槽充电器 - 主程序
  MCU: SC8F096AD832 QFN32 @ 16MHz
  功能: 系统初始化 + Timer0 ISR(软件PWM/上电自检/NTC计时/UART计时/LED显示窗) + 主循环轮询
  版本: V0.0.28-SLOW180
  计时架构: 显式10ms硬件节拍(ISR维护g_hwTick), 状态机chargeTimer按真实经过的
  10ms数累加, 与主循环轮速/UART打印阻塞完全解耦; UART打印每2秒一次.
-------------------------------------------*/
#include "config.h"

/* 慢循环节拍整形: 主循环每2秒做一次该毫秒数的阻塞, 使检测链采样节奏回到标定环境.
   二分调参记录: 650ms/300ms(通过) → 150ms(失效) → 225ms → 180ms(通过, 最小可行值) */
#define SLOW_BLOCK_MS   180

/*========================================================================
  全局变量定义 (符合config.h extern声明)
========================================================================*/
/* 系统电压与PWM控制 */
unsigned int  g_vcc_mv = 5000;                  /* 系统电压(mV), VREF反推, 每轮采样更新(仅主循环) */
volatile unsigned char g_pwmDuty = 0;           /* PWM占空比(0~PWM_MAX) */
volatile unsigned char g_pwmCounter = 0;        /* PWM计数器(ISR自增) */
signed int g_cvIntegral = 0;                    /* CV PI积分累加器 */

/* 系统计时 */
volatile unsigned int  g_powerOnTimer = 0;      /* 上电自检计时器 */
volatile unsigned char g_powerOnPhase = 0;      /* 上电自检阶段: V58R=0→1→2(仅绿1s→仅红1s→正常)
                                                   ⚠ 相位总数必须与 led.c/main.c 的门限一致 */

/* 显式10ms节拍: ISR维护硬件节拍, 主循环每轮计算经过的节拍数,
   状态机chargeTimer按真实时间累加(charge_mgr.c), 与打印阻塞/轮速解耦 */
volatile unsigned int  g_hwTick = 0;            /* 10ms硬件节拍(ISR递增) */
volatile unsigned char g_hwTickDiv = 0;         /* 125us中断分频计数(80次=10ms) */
unsigned int  g_elapsedTicks = 1;               /* 主循环本轮经过的10ms节拍数(仅主循环读写) */
unsigned int  g_lastHwTick = 0;                 /* 上一轮记录的g_hwTick快照(仅主循环读写) */

/* LED显示窗/按槽下沉(AD脚时分复用点灯, 详见config.h/led.c说明) */
volatile unsigned int g_sinkMask = 0;           /* 12bit下沉掩码(led.c写, ISR读) */
volatile bit  g_dispWin = 0;                    /* ISR: 1=显示窗进行中(AD脚下沉) */
volatile bit  g_adcBusy = 0;                    /* 主循环: 1=采样进行中, ISR暂不进显示窗 */

/* FULL槽周期熄灯采样(led.c计算相位, 主循环据此避让; 详见 led.c Update_LED_Global) */
volatile bit  g_fullDark = 0;                   /* 1=FULL槽熄灭相位(回稳+采样) */
volatile bit  g_fullSample = 0;                 /* 1=FULL槽可采样(节点已回稳且未下沉);
                                                   led.c 每轮刷新, 上电无FULL槽故默认0无关 */

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
  函数: Sink_Slot_On / Sink_Slot_Off
  功能: 把指定槽的AD采样脚单独切为"数字输出低"(Sink_Slot_On) / 还原为
        "模拟输入"(Sink_Slot_Off). 用于LED显示窗内的按槽下沉点灯.
  引脚映射(与config.h ANSEL注释一致):
    B1=RC1 B2=RC0 B3=RB4 B4=RB5 B5=RA5 B6=RA4
    B7=RD4 B8=RD5 B9=RD3 B10=RD2 B11=RA7 B12=RA6
  注: 仅改本槽1个引脚, 不触碰相邻槽/NTC(RC2)/LED(RC4/RC5);
      下沉灌流≈亚mA级(见原理图), 不构成对电池的低阻放电.
========================================================================*/
static void Sink_Slot_On(unsigned char idx)
{
	switch(idx)
	{
	case 0:  ANSEL2 &= 0xFD; TRISC &= 0xFD; RC1 = 0; break;  /* B1  RC1/AN17 */
	case 1:  ANSEL2 &= 0xFE; TRISC &= 0xFE; RC0 = 0; break;  /* B2  RC0/AN16 */
	case 2:  ANSEL1 &= 0xEF; TRISB &= 0xEF; RB4 = 0; break;  /* B3  RB4/AN12 */
	case 3:  ANSEL1 &= 0xDF; TRISB &= 0xDF; RB5 = 0; break;  /* B4  RB5/AN13 */
	case 4:  ANSEL0 &= 0xDF; TRISA &= 0xDF; RA5 = 0; break;  /* B5  RA5/AN5  */
	case 5:  ANSEL0 &= 0xEF; TRISA &= 0xEF; RA4 = 0; break;  /* B6  RA4/AN4  */
	case 6:  ANSEL3 &= 0xEF; TRISD &= 0xEF; RD4 = 0; break;  /* B7  RD4/AN28 */
	case 7:  ANSEL3 &= 0xDF; TRISD &= 0xDF; RD5 = 0; break;  /* B8  RD5/AN29 */
	case 8:  ANSEL3 &= 0xF7; TRISD &= 0xF7; RD3 = 0; break;  /* B9  RD3/AN27 */
	case 9:  ANSEL3 &= 0xFB; TRISD &= 0xFB; RD2 = 0; break;  /* B10 RD2/AN26 */
	case 10: ANSEL0 &= 0x7F; TRISA &= 0x7F; RA7 = 0; break;  /* B11 RA7/AN7  */
	case 11: ANSEL0 &= 0xBF; TRISA &= 0xBF; RA6 = 0; break;  /* B12 RA6/AN6  */
	default: break;
	}
}

static void Sink_Slot_Off(unsigned char idx)
{
	switch(idx)
	{
	case 0:  TRISC |= 0x02; ANSEL2 |= 0x02; break;  /* B1  回模拟输入 */
	case 1:  TRISC |= 0x01; ANSEL2 |= 0x01; break;  /* B2 */
	case 2:  TRISB |= 0x10; ANSEL1 |= 0x10; break;  /* B3 */
	case 3:  TRISB |= 0x20; ANSEL1 |= 0x20; break;  /* B4 */
	case 4:  TRISA |= 0x20; ANSEL0 |= 0x20; break;  /* B5 */
	case 5:  TRISA |= 0x10; ANSEL0 |= 0x10; break;  /* B6 */
	case 6:  TRISD |= 0x10; ANSEL3 |= 0x10; break;  /* B7 */
	case 7:  TRISD |= 0x20; ANSEL3 |= 0x20; break;  /* B8 */
	case 8:  TRISD |= 0x08; ANSEL3 |= 0x08; break;  /* B9 */
	case 9:  TRISD |= 0x04; ANSEL3 |= 0x04; break;  /* B10 */
	case 10: TRISA |= 0x80; ANSEL0 |= 0x80; break;  /* B11 */
	case 11: TRISA |= 0x40; ANSEL0 |= 0x40; break;  /* B12 */
	default: break;
	}
}

/* 按12bit掩码批量设置/还原: on=1下沉(点灯), on=0还原模拟输入 */
static void Sink_Set(unsigned int mask, unsigned char on)
{
	unsigned char i;
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		if(mask & 1U)
		{
			if(on)
				Sink_Slot_On(i);
			else
				Sink_Slot_Off(i);
		}
		mask >>= 1;
	}
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

		/* === 2. 显式10ms节拍(状态机计时基准, 与打印解耦) ===
		   125us×80=10ms → g_hwTick++; chargeTimer按此节拍累加,
		   状态机计时不受UART打印阻塞/主循环轮速影响.
		   打印触发与上电自检计时同样挂在10ms节拍上(打印每2秒, 自检每阶段1秒). */
		if(++g_hwTickDiv >= 80U)
		{
			g_hwTickDiv = 0;
			g_hwTick++;
			if(g_powerOnPhase < 2U)     /* (V58Q)自检2段: 相位0/1 */
				g_powerOnTimer++;
#if UART_PRINT_EN
			if(++g_printTick >= PRINT_INTERVAL_TICKS)
			{
				g_printTick = 0;
				g_printFlag = 1;
			}
#endif
		}

		/* === 3. 上电自检序列 ===
		   (V58Q)相位0 = 仅红3s → 相位1 = 仅绿3s → 正常显示(各3s便于目视)
		   注意: LED为单槽两脚双色灯, 灯回路经该槽电池与MOSFET(见led.c/原理图),
		         所以自检图案必须在"插有电池且该槽导通"的槽上才能看到. */
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

		/* === 5. LED显示窗(AD脚按槽下沉点灯) ===
		   窗口取PWM帧尾计数值[PWM_DISPLAY_START..31](4拍=0.5ms), 该段恒为关断相
		   (g_pwmDuty已钳到≤28), 下沉不干扰充电电流.
		   进入条件: 主循环未在采样(g_adcBusy=0) 且 确有槽需要点灯(g_sinkMask≠0);
		   结束后(计数值回0)还原模拟输入.
		   ⚠ 必须带 g_sinkMask≠0 门限: 掩码为0(检测链槽不下沉/全空闲)时若仍开窗,
		     主循环Wait_Display_Idle会白等每帧半窗(4ms周期×12槽), 使采样相位被锁到
		     PWM帧并拖慢主循环轮速, 改变DETECT采样条件(实测致NiMH脉冲前电压pre偏低,
		     落入DIODE_TEST低压锂预充放行误判为LINEAR_LI)。掩码为0时不开窗, 主循环
		     时序即恢复与V58W等价(无等待), 测量条件完全一致. */
		if(g_pwmCounter == PWM_DISPLAY_START)
		{
			if(!g_adcBusy && g_sinkMask != 0U)
			{
				Sink_Set(g_sinkMask, 1);
				g_dispWin = 1;
			}
		}
		else if(g_pwmCounter == 0U)
		{
			if(g_dispWin)
			{
				/* 还原全部12槽AD脚为模拟输入(不依赖当前掩码, 避免掩码中途变化
				   导致曾被下沉的脚漏还原而污染其采样) */
				Sink_Set((unsigned int)0x0FFFU, 0);
				g_dispWin = 0;
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
	uart_send_string("C TOKEN=");
	uart_send_number(g_detectOwner == 0xFF ? 0xFFU : (unsigned int)g_detectOwner);
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
/*========================================================================
  函数: Sense_Pins_AsSink / Sense_Pins_Restore   (V58W)
  功能: 上电自检期(相位0/1)把12个槽采样引脚临时改为数字输出并驱动低电平, 自检
        结束后恢复为模拟输入.
  原因: 每槽双色LED(红管芯+绿管芯各一颗2脚LED)的"第2脚"经顶针压在该槽采样节点
        上; 两条颜色公共轨"LED VCC1"/"LED VCC2"由Q11/Q8(P沟道, 源=VCC)供电.
        有电池时LED回流走"电池+ → 电池- → GND"; 空板时该节点到GND的唯一通路
        就是MCU采样引脚本身:
          · 采样脚保持模拟高阻 ⇒ 空板无回流 ⇒ 灯不亮(现场现象: 有电池才看得到)
          · 采样脚拉低(灌电流)   ⇒ 空板也有回流 ⇒ 灯亮
        槽内AO3401是高边开关(源=VCC), 导通只会把节点抬到VCC而熄灭该槽LED, 所以
        自检期必须让它保持关闭(见主循环说明).
  安全: 灌电流 ≈ (5.1-1.9)V / (5.1k + 分压串联电阻) ⇒ 亚mA级, 远在引脚能力内;
        分压网络把采样脚与电池隔离, 不会对电池形成低阻放电. 自检期不采样/不充电.
========================================================================*/
static void Sense_Pins_AsSink(void)
{
	/* RA4-7 = B6AD/B5AD/B12AD/B11AD */
	ANSEL0 &= 0x0F;  TRISA &= 0x0F;  RA4 = 0; RA5 = 0; RA6 = 0; RA7 = 0;
	/* RB4-5 = B3AD/B8AD */
	ANSEL1 &= 0xCF;  TRISB &= 0xCF;  RB4 = 0; RB5 = 0;
	/* RD2-5 = B10AD/B9AD/B7AD/B4AD */
	ANSEL3 &= 0xC3;  TRISD &= 0xC3;  RD2 = 0; RD3 = 0; RD4 = 0; RD5 = 0;
	/* RC0-1 = B2AD/B1AD (RC2=NTC 保持模拟输入不动) */
	ANSEL2 &= 0xFC;  TRISC &= 0xFC;  RC0 = 0; RC1 = 0;
}

static void Sense_Pins_Restore(void)
{
	TRISA |= 0xF0;   /* RA4-7 回输入 */
	TRISB |= 0x30;   /* RB4-5 回输入 */
	TRISD |= 0xF0;   /* RD2-5 回输入 */
	TRISC |= 0x07;   /* RC0-2 回输入 */
	ANSEL0 = 0xF0;   /* RA4-7 模拟 */
	ANSEL1 = 0x30;   /* RB4-5 模拟 */
	ANSEL2 = 0x07;   /* RC0-1 + RC2(NTC) 模拟 */
	ANSEL3 = 0x3C;   /* RD2-5 模拟 */
}

/*========================================================================
  函数: Wait_Display_Idle / Display_Service
  功能: 采样窗与显示窗的时分互斥握手(main.c主循环与ISR协作).
    Wait_Display_Idle: 采样前调用. 置g_adcBusy阻止ISR新开显示窗; 若正处窗内,
      等本窗(ISR在计数值回0时)结束, 再延时50µs让AD节点电平回稳.
      (FULL槽已不下沉, 采样不受下沉扰动, 见 led.c pass2)
    Display_Service:   采样后调用. 清g_adcBusy放开显示窗, 并等一个完整显示窗
      过去, 保证LED刷新节拍(≈250Hz), 避免连续采样把显示窗饿死.
========================================================================*/
static void Wait_Display_Idle(void)
{
	g_adcBusy = 1;                       /* 先行置位, 阻止ISR在本轮采样期间开窗 */
	while(g_dispWin)                     /* 若已在窗内, 等ISR收尾(计数值回0) */
		asm("clrwdt");
	/* 快速路径: 若当前帧没人点灯(mask==0), AD节点根本没被下沉扰动,
	   跳过50µs稳定延时, 节省采样耗时 */
	if(g_sinkMask != 0U)
		__delay_us(50);                  /* 释放后50µs稳定延时 */
}

static void Display_Service(void)
{
	/* 快速路径: 若无槽下沉(全空闲 / 闪烁暗半周), 无需等显示窗过去,
	   省掉每槽白等 4ms × 12槽 ≈ 48ms 的主循环轮速开销 */
	g_adcBusy = 0;                       /* 放开: 允许ISR进入显示窗 */
	if(g_sinkMask == 0U)
		return;
	while(!g_dispWin)                    /* 等本帧显示窗开始 */
		asm("clrwdt");
	while(g_dispWin)                     /* 等显示窗结束 */
		asm("clrwdt");
}

/* 自检期整排下沉(Sense_Pins_AsSink)只需在退出自检时恢复一次,
   之后引脚模式由ISR显示窗自行下沉/还原, 避免每轮全体恢复打断显示窗. */
static bit s_senseRestored = 0;

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

		/* --- 显式节拍: 计算本轮到现在的真实经过时间(10ms节拍) ---
		   主循环一轮耗时<10ms时硬件节拍可能未跨越10ms边界,
		   对0值兜底为1(每轮至少推进1tick), 保证状态机时间单调前进,
		   与打印阻塞/主循环轮速解耦. */
		g_elapsedTicks = g_hwTick - g_lastHwTick;
		if(g_elapsedTicks == 0U)
			g_elapsedTicks = 1U;
		g_lastHwTick = g_hwTick;

		/* --- 每轮一次 VCC 采样: 作为归一化基准(VCC为慢变量) --- */
		Get_Vcc();

		/* --- 自检相位0/1 与 正常运行 的分界 ---
		   (V58W)空板可见自检的两个必要条件, 缺一不可:
		     ① 12槽MOSFET必须全关 —— 槽内AO3401是P沟道高边开关(源=VCC), 导通会把
		        槽节点抬到VCC, 与LED公共轨"LED VCC1/2"等电位 ⇒ 该槽LED两端压差≈0
		        而熄灭. 所以自检期不扫描12槽(避免正在检测的槽其MOSFET被打开),
		        更不能像V58T那样把12槽MOSFET全部打开"增亮"(那会让空板全黑);
		     ② 12个槽采样引脚必须改为数字输出并拉低 —— 每槽LED第2脚经顶针压在该槽
		        采样节点上, 有电池时回流走电池, 空板时该节点到GND的唯一通路就是
		        MCU采样引脚本身; 若它保持模拟高阻, 空板就没有回流路径(现场现象:
		        有电池才看得到灯). 自检结束必须恢复模拟输入, 否则无法采样电池电压.
		   LED引脚由ISR的PowerOnLedSequence独占, 此处不驱动. */
		if(g_powerOnPhase >= 2U)
		{
			/* 退出自检: 仅首次把12槽采样脚恢复为模拟输入(自检期整排下沉的还原).
			   此后引脚由ISR显示窗按掩码下沉并在窗口末尾还原, 不再整排恢复. */
			if(!s_senseRestored)
			{
				Sense_Pins_Restore();
				s_senseRestored = 1;
			}

			/* --- 顺序处理12槽: 单槽内同步完成 采样+检测+充电+MOSFET ---
			   每槽采样前先等显示窗结束(时分互斥), 采样后放开显示窗并等其完整过去,
			   保证采样窗(模拟输入)与显示窗(AD脚下沉)严格错开且LED刷新不被饿死. */
			for(i = 0; i < BATTERY_SLOTS; i++)
			{
				/* FULL槽周期熄灯采样: 点亮绿LED需下沉该槽AD脚, 下沉会把节点从~2937
				   拉到~2732(<2800) → 同拍采样会被判"欠压"误触发FULL→CC补电. 故
				   熄灭相位(节点已回稳)才采样推进状态机, 点亮相位跳过采样.
				   (非FULL槽不受影响) */
				if(S_STATE(i) == CHG_FULL && !g_fullSample)
					continue;
				Wait_Display_Idle();
				Slot_Charge_Ctrl(i);
				Display_Service();
			}

			/* --- 全局PWM占空比调节 --- */
			CCCV_Control();

			/* 占空比钳位: 保证PWM帧尾28~31恒为关断相, 供显示窗下沉使用 */
			if(g_pwmDuty > PWM_DISPLAY_SAFE_MAX)
				g_pwmDuty = PWM_DISPLAY_SAFE_MAX;

			/* --- 全局LED状态显示(输出下沉掩码+全局配色供ISR显示窗使用) --- */
			Update_LED_Global();
		}
		else
		{
			/* 自检期: 12槽采样脚拉低灌电流, 为空板LED提供回流; 12槽MOSFET保持关闭 */
			Sense_Pins_AsSink();
		}

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

		/* --- 慢循环节拍整形(V0.0.21-SLOW): 临时实验, 先给客户测试用 ---
		   正式版(UART_PRINT_EN=0)主循环轮速快、无周期性阻塞; 调试版因每2秒UART打印
		   会阻塞约0.65s. 此处人为加入等价的周期性延时, 使检测链采样节奏回到标定环境,
		   线性锂恢复正常识别(详见记忆/调试记录). */
		{
			static unsigned int s_slowLastTick = 0;
			if((unsigned int)(g_hwTick - s_slowLastTick) >= (2U * TICK_PER_SEC))
			{
				s_slowLastTick = g_hwTick;
				__delay_ms(SLOW_BLOCK_MS);
			}
		}
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
