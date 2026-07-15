/*-------------------------------------------
  L1211 12槽充电器 - 主程序
  MCU: SC8F096AD832 QFN32 @ 16MHz
  功能: 系统初始化 + Timer0 ISR(3阶段扫描/软件PWM) + 主循环
  版本: 2026/06/29 <V2.1> 修复ADC+UART, 恢复完整充电管理
-------------------------------------------*/
#include "config.h"

/*========================================================================
  全局变量定义 (符合config.h extern声明)
========================================================================*/
/* 扫描状态机 */
volatile unsigned char g_scanIndex = 0;         /* 当前扫描槽位索引(0~11) */
volatile unsigned char g_scanPhase = 0;         /* 当前扫描阶段: 0=ADC采集, 1=LED, 2=控制 */
volatile unsigned int  g_vcc_mv = 5000;         /* 系统电压(mV), VREF反推, Print_SystemStatus更新 */
volatile bit g_doAdcSample = 0;                 /* ADC采样请求标志: ISR置1, 主循环处理 */
volatile bit g_adcBusy = 0;                     /* ADC忙标志: 主循环采样中, ISR不重复请求 */

/* PWM控制 */
volatile unsigned char g_pwmDuty = 0;           /* PWM占空比(0~PWM_MAX) */
volatile unsigned char g_pwmCounter = 0;        /* PWM计数器(ISR自增) */
signed int g_cvIntegral = 0;                    /* CV PI积分累加器 */

/* 系统计时 */
volatile unsigned int  g_powerOnTimer = 0;      /* 上电自检计时器 */
volatile unsigned char g_powerOnPhase = 0;      /* 上电自检阶段: 0→1→2 */

/* NTC温度读取状态机(ISR中计时, 主循环中执行ADC) */
volatile unsigned char g_tempPhase = 0;         /* 0=等待间隔, 1=建立中 */
volatile unsigned int  g_tempSettleCnt = 0;     /* NTC建立等待计数器(轮) */
volatile unsigned int  g_tempReadRoundCnt = 0;  /* 温度读取间隔计数器(轮) */
volatile bit g_doNtcRead = 0;                   /* NTC读取请求标志 */

/* UART打印 */
volatile bit g_printFlag = 0;
volatile unsigned int  g_printTick = 0;

/* DEBUG: 状态机追踪 */
volatile unsigned char g_dbgSlot = 0;             /* 状态变化的槽位 */
volatile unsigned char g_dbgOldState = 0;         /* 跳转前的旧状态 */
volatile unsigned char g_dbgNewState = 0;         /* 跳转后的新状态 */
volatile unsigned char g_dbgNewType = 0;          /* 新电池类型 */
volatile unsigned int  g_dbgVoltage = 0;          /* 当前电压值 */
volatile bit g_dbgDetectFlag = 0;                 /* 状态变化标志, 主循环处理 */

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
	TRISC = 0x07;  PORTC = 0x00;   /* RC0-2模拟输入(B2AD/B1AD/NTC), RC3-5输出低 */
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

	/* 8. 软件UART初始化 (RC4, 9600bps) */
	uart_init();

	/* 9. Timer0配置: 125μs周期
	   Fosc=16MHz, Tcy=0.25μs, 预分频1:2
	   TMR0 reload = 256 - 125μs/(0.25μs×2) = 256 - 250 = 6
	   OPTION_REG: T0LSE_EN=0(正常模式), T0CS=0, PSA=0, PS2:0=000(1:2)
	   注意: SC8F096的OPTION_REG bit7是T0LSE_EN, 不是标准PIC的RBPU! */
	OPTION_REG = 0x00;      /* T0LSE_EN=0(正常), T0CS=0, PSA=0, PS2:0=000(1:2) */
	TMR0 = 6;
	T0IF = 0;
	INTCON = 0xE0;          /* 一次写入: GIE=1, PEIE=1, T0IE=1, 其余清零 */

	/* 10. 初始状态: 所有充电关闭, PWM=0 */
	g_pwmDuty = 0;
	g_pwmCounter = 0;
	PIN_CD1 = 0;
	PIN_CD2 = 0;
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
	g_blinkTick = 0;

	/* 12. 开全局中断(已在INTCON中设置) */
}

/*========================================================================
  Timer0 中断服务程序
  周期: ~125μs (Timer0重载值6, 预分频1:2)
  功能:
    1. 软件PWM生成(RB7, 250Hz, 32级分辨率)
    2. 3阶段扫描状态机: Phase0(请求ADC) → Phase1(LED更新) → Phase2(控制)
    3. NTC温度读取状态机(仅计时, ADC由主循环执行)
    4. UART打印触发(每秒一次)
  说明: ADC采集放在主循环中执行(耗时~680μs), ISR仅设置请求标志
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

		/* 输出PWM波形 */
		if(g_pwmDuty > 0 && g_pwmCounter < g_pwmDuty)
			PIN_PWM = 1;
		else
			PIN_PWM = 0;

		/* === 2. 上电自检序列(前2秒) === */
		if(g_powerOnPhase < 2)
		{
			PowerOnLedSequence();   /* 该函数仅仅作为延时2秒稳定电路，没有其他功能 */
			return;                 /* 自检期间不执行扫描 */
		}

		/* === 3. 3阶段扫描状态机 === */
		switch(g_scanPhase)
		{
		case 0:  /* Phase0: 请求ADC采集当前槽电压
		           关闭当前槽MOSFET, 设标志让主循环执行ADC_Sample */
			if(!g_adcBusy && !g_doAdcSample)
			{
				SLOT_CHARGE_OFF(g_scanIndex);
				g_doAdcSample = 1;      /* 主循环检测此标志后执行ADC */
			}
			/* 不切换阶段, 等待主循环完成ADC后再推进 */
			break;

		case 1:  /* Phase1: LED状态更新(ADC已完成, 电压已存入slot) */
			Update_LED_Slot(g_scanIndex);
			/* 根据充电状态恢复MOSFET(在Phase2的Charging_Control中统一处理) */
			g_scanPhase = 2;  		/* 当执行完ADC采集之后，跳转到这个阶段，之后推进到控制阶段 */
			break;

		case 2:  /* Phase2: 系统级控制(仅槽0执行) */
			if(g_scanIndex == 0)
			{
				/* 实时VCC采样: 每次扫描周期(~80ms)更新, 供IMP_CHECK做NiMH VCC塌陷检测 */
				if(!g_adcBusy)
				{
					g_adcBusy = 1;
					test_adc = ADC_Sample(ADC_CH_VREF, 0);
					if(ADC_OK == test_adc)
					{
						unsigned long pt = POWER_RATIO / adresult;
						g_vcc_mv = (unsigned int)pt;
					}
					g_adcBusy = 0;
				}

				Charging_Control();     /* 12路MOSFET使能更新 */
				CCCV_Control();         /* CC-CV PWM占空比调节 */
				Led_BlinkProcess();     /* LED闪烁计时 */

				/* === NTC温度读取状态机 === */
			{
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

			/* === UART打印触发(每秒一次) === */
			if(++g_printTick >= TICK_PER_SEC)
			{
				g_printTick = 0;
				g_printFlag = 1;
			}
			}

			/* 推进到下一个槽位 */
			if(++g_scanIndex >= BATTERY_SLOTS)
				g_scanIndex = 0;
			g_scanPhase = 0;
			break;

		default:
			g_scanPhase = 0;
			break;
		}
	}
}

/*========================================================================
  函数: Do_AdcSample
  功能: 执行ADC采样并存入槽位电压
  说明: 从主循环调用, 在ISR Phase0设置g_doAdcSample后执行
  使用VDD参考(与09-test完全一致)
========================================================================*/
void Do_AdcSample(void)
{
	unsigned char ch = s_adcChannels[g_scanIndex];
	unsigned char ty = S_TYPE(g_scanIndex);
	unsigned char st = S_STATE(g_scanIndex);
	unsigned char dly;       /* 延时循环计数器(8位MCU __delay_us参数溢出规避) */

	/* 延时等待Bx节点稳定到电池开路电压
	   ISR Phase0已关闭MOSFET, Bx节点从PWM驱动电压恢复到开路电压需要时间
	   线性锂电池(无charger IC拉载): MOSFET导通时BxAD电容被PWM充电至近VCC,
	   关断后电容通过高阻路径放电, 100μs远不够(实测读到伪OPEN=4091),
	   延长至2000μs确保电容放至电池真实电压
	   充电状态(MOSFET刚被关闭): ACTIVATE/PRECHARGE/CC/CV
	   DETECT状态: 配合Charging_Control中DETECT时MOSFET导通,
	   电容从电池真实电压Vbat起充, 需足够延时使读数匹配旧体二极管均衡电平
	   (~Vbat+0.5V), 否则低于NIMH_LOW(1015)的电池会漏过IMP_CHECK直接进LI_ION
	   IMP_CHECK状态: 脉冲后CDx总线拉低, P-ch MOSFET沟道关闭(V_GS=0),
	   若体二极管被线性锂电池阻断, BxAD电容通过100K上拉充电至VCC需足够延时,
	   100μs仅充至1967(测不到OPEN), 2000μs可充至≥3990触发LINEAR_LI检测
	   注: SC8F096 8位编译器__delay_us(2000)可能截断失效, 拆为20x100μs循环 */
	if((ty == BAT_TYPE_LINEAR_LI &&
	    (st == CHG_ACTIVATE || st == CHG_PRECHARGE ||
	     st == CHG_CC_CHARGE || st == CHG_CV_CHARGE)) ||
	   st == CHG_DETECT ||
	   st == CHG_IMP_CHECK)
	{
		for(dly = 0; dly < 20; dly++)
			__delay_us(100);
	}
	else
	{
		__delay_us(100);
	}

	test_adc = ADC_Sample(ch, 0);           /* VDD参考, 与09-test一致 */

	if(ADC_OK == test_adc)
		g_slot[g_scanIndex].voltage = adresult;
	else
		g_slot[g_scanIndex].voltage = 0;

	g_scanPhase = 1;                        /* 推进到LED更新阶段 */
}

/*========================================================================
  函数: Do_NtcRead
  功能: 执行NTC ADC读取并更新温度
  说明: RC2/AN18为NTC专用模拟引脚, 无需分时复用
        与09-test一致: VDD参考, 直接ADC_Sample(18, 0)
========================================================================*/
void Do_NtcRead(void)
{
	Read_Temperature();
}

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
  输出: VCC=电压 T=温度 B1~B12 ADC值/电池mV/状态
  移植自09-test: 双参数线性标定公式计算电池mV
========================================================================*/
/* B2-B12打印开关: 0=仅B1详细, 1=全部12槽 */
#define PRINT_ALL_SLOTS     0
/* B1-B6打印开关: 1=B1~B6逐行打印 */
#define PRINT_B1_B6         1

void Print_SystemStatus(void)
{
	unsigned char i;
	unsigned int vcc_mv;

	uart_send_string("\r\n== L1211 12CH CHARGER ==\r\n");

	/* VCC测量(内部1.2V参考反推) */
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
	/* B1-B6逐行打印(每个槽独立一行, 便于观察) */
	for(i = 0; i < 6; i++)
#elif PRINT_ALL_SLOTS
	/* 12槽全部打印 */
	for(i = 0; i < 12; i++)
#else
	/* 仅B1详细调试 */
	for(i = 0; i < 1; i++)
#endif
	{
		unsigned int v = S_VOLT(i);
		unsigned char s = S_STATE(i);

#if PRINT_ALL_SLOTS && !PRINT_B1_B6
		/* 换行: 每6个槽一行 */
		if(i == 6) uart_send_string("\r\n");
#endif

		uart_send_char('B');
		uart_send_number((unsigned int)i + 1U);
		uart_send_char('=');
		uart_send_number(v);

		/* 电池mV校准(与09-test一致):
		   vx_mv = ADC * VCC / 4096 → BxAD引脚mV
		   bat_mv = (1159 * vx_mv - 647 * VCC) / 1000 */
		{
			unsigned long vx_mv = (unsigned long)v * (unsigned long)vcc_mv / 4096UL;
			if(vx_mv + 200U >= (unsigned long)vcc_mv)
			{
				uart_send_string(" OPEN");
			}
			else
			{
				unsigned long bat_mv_long = ALPHA_NUM * vx_mv;
				if(bat_mv_long > (BETA_NUM * (unsigned long)vcc_mv))
				{
					bat_mv_long = (bat_mv_long - BETA_NUM * (unsigned long)vcc_mv + CAL_DEN/2UL) / CAL_DEN;
					uart_send_string(" BAT(");
					uart_send_number((unsigned int)bat_mv_long);
					uart_send_string("mV)");
				}
				/* else: 电压过低(无电池/短路), 不显示mV */
			}
		}

		/* 状态缩写 */
		uart_send_char(' ');
		switch(s)
		{
		case CHG_IDLE:       uart_send_string("[IDLE]"); break;
		case CHG_DETECT:     uart_send_string("[DET]");  break;
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
			break;
		}
		case CHG_IMP_CHECK:  uart_send_string("[IMP]");  break;
		case CHG_IMP_DIODE_TEST: uart_send_string("[DIO]"); break;
		default:             uart_send_string("[???]");  break;
		}

		/* 打印 ct(chargeTimer) 和 ty(电池类型) 用于调试 */
		uart_send_string(" ct=");
		uart_send_number(S_TIMER(i));
		uart_send_string(" ty=");
		uart_send_number(S_TYPE(i));

#if PRINT_B1_B6
		uart_send_string("\r\n");
#endif
	}
	uart_send_string("\r\n");
}

/*========================================================================
  函数: Print_DetectLog
  功能: 打印电池类型检测日志(检测到各类电池时调用)
========================================================================*/
void Print_DetectLog(void)
{
	uart_send_char('B');
	uart_send_number((unsigned int)g_detectLogSlot + 1U);

	if(g_detectLogType == BAT_TYPE_NIMH)
		uart_send_string(": NiMH detected! Not charging.\r\n");
	else if(g_detectLogType == BAT_TYPE_DRY)
		uart_send_string(": Dry/NiMH detected! Not charging.\r\n");
	else if(g_detectLogType == BAT_TYPE_LINEAR_LI)
		uart_send_string(": Linear Li detected! Charging.\r\n");
}

/*========================================================================
  主函数
  流程:
    1. System_Init() - 初始化所有模块, 启动Timer0 ISR
    2. 上电自检2秒(ISR中处理, 绿灯→红灯→正常)
    3. 主循环:
       - ADC采样(g_doAdcSample标志)
       - NTC温度读取(g_doNtcRead标志)
       - UART状态打印(g_printFlag标志)
       - 喂狗
========================================================================*/
void main(void)
{
	/* ICSP烧录保护延时 */
	__delay_ms(10);
	asm("clrwdt");

	/* 系统初始化 */
	System_Init();

	/* 等待上电自检完成(ISR中处理) */
	uart_send_string("L1211 Charger V2.1\r\n");
	uart_send_string("Init...\r\n");

	/* 主循环 */
	while(1)
	{
		asm("clrwdt");

		/* --- ADC采样: ISR Phase0请求, 主循环执行 --- */
		if(g_doAdcSample)
		{
			g_doAdcSample = 0;
			g_adcBusy = 1;
			Do_AdcSample();
			ChargeProcess_Slot(g_scanIndex);

			/* --- 槽位0状态变化调试输出(追踪每次状态跳转) --- */
			if(g_dbgDetectFlag)
			{
				g_dbgDetectFlag = 0;
			uart_send_string("DBG: slot=");
			uart_send_number(g_dbgSlot);
			uart_send_string(" old=");
			uart_send_number(g_dbgOldState);
			uart_send_string(" new=");
			uart_send_number(g_dbgNewState);
			uart_send_string(" ty=");
			uart_send_number(g_dbgNewType);
			uart_send_string(" V=");
			uart_send_number(g_dbgVoltage);
			uart_send_string("\r\n");
			}

			g_adcBusy = 0;
		}

		/* --- NTC温度读取: ISR建立完成后触发 --- */
		if(g_doNtcRead)
		{
			g_doNtcRead = 0;
			g_adcBusy = 1;
			Do_NtcRead();
			g_adcBusy = 0;
		}

		/* --- UART打印: 每秒触发一次 --- */
		if(g_printFlag)
		{
			g_printFlag = 0;
			Print_SystemStatus();
			Print_NtcTemp();
		}

		/* --- 电池检测日志: NiMH/干电池识别时打印 --- */
		if(g_detectLogFlag)
		{
			g_detectLogFlag = 0;
			Print_DetectLog();
		}
	}
}

/*========================================================================
  合并编译: 以下模块通过#include方式并入main.c
  SCMCU IDE单文件编译模式下, 所有.c文件需合并为一个翻译单元
========================================================================*/
#include "adc_drv.c"       /* ADC驱动: adresult, test_adc, ADC_Sample, AD_Init */
#include "uart_dbg.c"      /* 软件UART: uart_init, uart_send_char/string/number */
#include "charge_mgr.c"    /* 充电管理: g_temperature, Read_Temperature, ChargeProcess_Slot, CCCV_Control, Charging_Control */
#include "led.c"           /* LED控制: Update_LED_Slot, Led_BlinkProcess, PowerOnLedSequence */
