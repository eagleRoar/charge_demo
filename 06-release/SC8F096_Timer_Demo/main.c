/*-------------------------------------------
  L1211 12槽充电器 - 主程序入口
  包含: 系统初始化、主循环、Timer0中断服务、引脚模拟/数字切换
  扫描机制: 每250us(Timer0)扫描一个槽位, 三阶段扫描(ADC->充电处理->LED更新)
  主循环: 空闲等待UART数据回环测试
-------------------------------------------*/
#include "config.h"
#pragma warning disable 752
#pragma warning disable 373

/*========================================================================
  全局变量定义
========================================================================*/
volatile unsigned int power_ad;          /* 电源电压(mV), 每1s更新一次 */

/* 系统计时变量 */
unsigned int  g_timerTick = 0;           /* Timer0中断计数器(125us/tick) */
unsigned int  g_systemTick = 0;          /* 扫描轮次计数器(每轮+1, 222轮=1秒) */
unsigned char g_scanIndex = 0;           /* 当前扫描槽位索引(0~11循环) */
unsigned char g_scanPhase = 0;           /* 当前扫描阶段: 0=ADC采样, 1=充电处理, 2=扫描完成/收尾 */
unsigned int  g_powerOnTimer = 0;        /* 上电自检计时器 */
unsigned char g_powerOnPhase = 0;        /* 上电自检阶段: 0=全亮, 1=保持, 2=正常 */
#if UART_PRINT_EN
volatile bit   g_printFlag = 0;          /* 打印标志: ISR置1, 主循环清0并调用Print_Status */
#endif

/* PWM/CC-CV 控制变量 */
volatile unsigned char g_pwmDuty = 0;       /* 当前PWM占空比(0~PWM_MAX) */
volatile unsigned char g_pwmCounter = 0;    /* PWM计数器, ISR中0~31循环 */
signed int g_cvIntegral = 0;                /* CV PI积分累加器 */

/*========================================================================
  ROM只读配置表
========================================================================*/
/* 12槽BxAD ADC通道映射表
   每个槽位对应一个独立的ADC采样通道, BxAD引脚为纯模拟输入 */
const unsigned char s_adcChannels[BATTERY_SLOTS] = {
	ADC_CH_B1AD,  /* B1 电压采样: AN17 */
	ADC_CH_B2AD,  /* B2 电压采样: AN16 */
	ADC_CH_B3AD,  /* B3 电压采样: AN12 */
	ADC_CH_B4AD,  /* B4 电压采样: AN13 */
	ADC_CH_B5AD,  /* B5 电压采样: AN5  */
	ADC_CH_B6AD,  /* B6 电压采样: AN4  */
	ADC_CH_B7AD,  /* B7 电压采样: AN28 */
	ADC_CH_B8AD,  /* B8 电压采样: AN29 */
	ADC_CH_B9AD,  /* B9 电压采样: AN27 */
	ADC_CH_B10AD, /* B10 电压采样: AN26 */
	ADC_CH_B11AD, /* B11 电压采样: AN7  */
	ADC_CH_B12AD  /* B12 电压采样: AN6  */
};

/*========================================================================
  函数: System_Init
  功能: 系统初始化, 配置所有外设
  流程:
    1. 配置系统时钟(16MHz内部RC振荡器)
    2. 初始化所有GPIO端口(输出高电平, MOSFET默认关闭)
    3. 关闭所有模拟功能(需要时动态切换)
    4. 配置ADC模块(参考电压/时钟)
    5. 配置UART(9600bps, 8N1)
    6. 配置Timer0(250us周期, 16MHz/4/250=16, 256-16=240→预装TMR0=6)
    7. 使能中断(GIE/PEIE/T0IE)
    8. 初始化控制引脚和槽位数据
========================================================================*/
void System_Init(void)
{
	unsigned char i;

	/* --- ICSP烧录保护延时 ---
	   RC4/RC5复用为ICSP DAT/CLK和LED IO2/IO1, 上电时若MCU抢先初始化GPIO
	   会驱动RC4/RC5输出低电平, 与烧录器信号冲突导致编程失败
	   延时100ms确保烧录器有足够时间拉高VPP进入编程模式 */
	__delay_ms(100);

	/* --- 看门狗复位 --- */
	asm("nop");
	asm("clrwdt");

	/* --- 系统时钟配置: 16MHz内部RC --- */
	OSCCON = 0x72;          /* 内部16MHz, 软件模式 */
	OPTION_REG = 0x00;      /* PSA=0(Timer0), PS2:PS0=000 → 1:2分频 */
	asm("clrwdt");

	/* --- PORTA初始化 ---
	   RA0=B1, RA1=B2, RA2=B6, RA3=B5: 输出高(关闭充电)
	   RA4=AN4(B6AD): 模拟输入(ADC采样)
	   RA5=AN5(B5AD): 模拟输入(ADC采样)
	   RA6=AN6(B12AD): 模拟输入(ADC采样)
	   RA7=AN7(B11AD): 模拟输入(ADC采样)
	   初始值: TRISA=0B11110000(RA4-7输入), PORTA=0B00001111 */
	TRISA = 0B11110000;     /* RA4-7输入(ADC采样), RA0-3输出 */
	PORTA = 0B00001111;     /* B1-B6 MOSFET全部关闭(高), RA4-7输入 */
	WPUA = 0B00000000;      /* 关闭弱上拉 */
	WPDA = 0B00000000;      /* 关闭弱下拉 */
	IOCA = 0B00000000;      /* 关闭电平变化中断 */

	/* --- PORTB初始化 ---
	   RB0=B9, RB1=B10, RB2=B4, RB3=B3: 输出高(关闭充电)
	   RB4=UART RX: 输入
	   RB5=AN13(B4AD): 模拟输入(ADC采样)
	   RB6=EN: 输出高(使能主电源Q3)
	   RB7=PWM(VT_PWM1): 输出低(关闭PWM)
	   初始值: TRISB=0B00110000(RB4-5输入), PORTB=0B01001111 */
	TRISB = 0B00110000;     /* RB4-5输入, RB6(EN)/RB7(PWM)/RB0-3输出 */
	PORTB = 0B01001111;     /* EN=1(RB6), PWM关(RB7=0), B9-B3 MOSFET全部关闭(高) */
	WPUB = 0B00000000;      /* 关闭弱上拉 */
	WPDB = 0B00000000;      /* 关闭弱下拉 */
	IOCB = 0B00000000;      /* 关闭电平变化中断 */

	/* --- PORTC初始化 ---
	   RC0=AN16(B2AD): 模拟输入(ADC采样)
	   RC1=AN17(B1AD): 模拟输入(ADC采样)
	   RC2=CD IO2: 输出低(关闭充电组2 B7-B12)
	   RC3=CD IO1: 输出低(关闭充电组1 B1-B6)
	   RC4=LED IO2/CLK: 输出低(LED关闭)
	   RC5=LED IO1/DAT/NTC: 输出低(LED关闭)
	   初始值: 0B00000000 = 全部输出低 */
	TRISC = 0B00000011;     /* RC0-1输入(B2AD/B1AD), RC2-5输出 */
	PORTC = 0B00000000;     /* CD1/CD2=0关闭, LED全部关闭 */
	WPUC = 0B00000000;      /* 关闭弱上拉 */
	/* SC8F096只有WPDA/WPDB, 无WPDC/WPDD */

	/* --- PORTD初始化 ---
	   RD0=B12, RD1=B7, RD2=B11, RD3=B8: 输出高(关闭充电)
	   RD4=AN26(B10AD), RD5=AN27(B9AD): 模拟输入
	   RD6=AN28(B7AD),  RD7=AN29(B8AD): 模拟输入
	   初始值: TRISD=0B11110000(RD4-7输入), PORTD=0B00001111 */
	TRISD = 0B11110000;     /* RD4-7输入(ADC采样), RD0-3输出 */
	PORTD = 0B00001111;     /* RD0-3 MOSFET全部关闭(高电平) */
	WPUD = 0B00000000;      /* 关闭弱上拉 */

	/* --- 配置BxAD模拟输入引脚 ---
	   ANSEL0: RA4(B6AD), RA5(B5AD), RA6(B12AD), RA7(B11AD)
	   ANSEL1: RB4(B3AD)-UART时关闭, RB5(B4AD)
	   ANSEL2: RC0(B2AD), RC1(B1AD)
	   ANSEL3: RD4(B10AD), RD5(B9AD), RD6(B7AD), RD7(B8AD) */
	ANSEL0 = 0xF0;      /* RA4-7: B6AD/B5AD/B12AD/B11AD */
#if UART_PRINT_EN
	ANSEL1 = 0x20;      /* RB5: B4AD (RB4=UART RX, 不使能模拟) */
#else
	ANSEL1 = 0x30;      /* RB4-5: B3AD/B4AD */
#endif
	ANSEL2 = 0x03;      /* RC0-1: B2AD/B1AD */
	ANSEL3 = 0xF0;      /* RD4-7: B10AD/B9AD/B7AD/B8AD(AN26-AN29) */

	/* --- 比较器关闭 --- */
	CC0CON = 0;
	CC1CON = 0;

	/* --- ADC模块配置 ---
	   ADCON0=0x41: ADCS<1:0>=01→FHSI/32(500kHz), CHS=AN0, ADON=1
	   ADCON1=0: 右对齐, 参考电压=VDD=5V */
	ADCON0 = 0X41;
	ADCON1 = 0;

	/* --- UART1配置 ---
	   波特率: 16MHz/(16*(103+1)) = 9615 ≈ 9600bps
	   TXSTA1=0xA0: 异步模式, 8位, 发送使能
	   RCSTA1=0x90: 串口使能, 8位接收 */
	TXSTA1 = 0B10100000;
	RCSTA1 = 0B10010000;
	SPBRG1 = 103;           /* 9600bps @ 16MHz */

	/* --- Timer0配置 ---
	   OPTION_REG=0x00:
	     T0CS=0 → 内部指令周期时钟(FCPU), FCPU=FSYS/4(4T模式)
	     PSA=0 → 预分频分配给Timer0, PS2:PS0=000 → 1:2分频
	   时钟推导:
	     FSYS=16MHz, FCPU=FSYS/4=4MHz, 指令周期=0.25us
	     TMR0时钟=FCPU/2(分频)=2MHz, 每tick=0.5us
	     TMR0预装6→计数至256溢出=250tick, 中断周期=250×0.5us=125us */
	TMR0 = 6;               /* 预装值, 250tick后溢出(250×0.5us=125us) */
	T0IF = 0;               /* 清除Timer0中断标志 */
	T0IE = 1;               /* 使能Timer0中断 */

	/* --- 中断使能 --- */
	PEIE = 1;               /* 外设中断使能 */

	GIE = 1;                /* 全局中断使能 */

	/* --- 控制引脚初始状态 --- */
	PIN_EN = 1;             /* 主电源使能(高电平使能Q3) */
	PIN_PWM = 0;            /* PWM初始=0, ISR中软件生成125Hz/32级PWM波形 */
	PIN_CD1 = 0;            /* 充电组1关闭 */
	PIN_CD2 = 0;            /* 充电组2关闭 */
	PIN_LED_IO1 = 0;        /* LED电源1关闭 */
	PIN_LED_IO2 = 0;        /* LED电源2关闭 */

	/* --- 初始化所有槽位数据 --- */
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		GSLOT(i)->state = CHG_IDLE;             /* 初始状态: 空闲 */
		GSLOT(i)->type = BAT_TYPE_UNKNOWN;      /* 电池类型: 未知 */
		GSLOT(i)->voltage = 0;                  /* 电压清零 */
		GSLOT(i)->chargeTimer = 0;              /* 充电计时器清零 */
		GSLOT(i)->ledState = LED_OFF;           /* LED关闭 */
		GSLOT(i)->blinkTimer = 0;               /* 闪烁计时器清零 */
		GSLOT(i)->blinkPhase = 0;               /* 闪烁相位清零 */
		GSLOT(i)->stableCnt = 0;                /* 稳定计数器清零 */
		GSLOT(i)->activatePulseCnt = 0;         /* 激活脉冲计数清零 */
	}

	/* --- 系统变量初始化 --- */
	g_scanIndex = 0;        /* 从槽位0开始扫描 */
	g_scanPhase = 0;        /* 从阶段0开始 */
	g_systemTick = 0;       /* 系统秒计数器清零 */
	g_timerTick = 0;        /* Timer0计数器清零 */
	g_powerOnTimer = 0;     /* 上电计时器清零 */
	g_powerOnPhase = 0;     /* 上电阶段: 0=全亮自检 */
	g_tempProtect = 0;      /* 温度保护关闭 */
	g_temperature = 25;     /* 默认温度25度 */
}

/*========================================================================
  函数: main
  功能: 主程序入口
  流程:
    1. 调用System_Init()初始化所有外设
    2. 发送0x55 0xAA作为UART调试标记
    3. 主循环: 清看门狗, 处理UART回环数据
  说明: 所有核心功能(充电管理/ADC扫描/LED控制)均在Timer0中断中执行
========================================================================*/
void main(void)
{
	System_Init();

	/* 发送调试标记: 0x55 0xAA, 表示系统启动完成 */
	//TXREG1 = 0x55;
	//while(TRMT1 == 0);      /* 等待发送完成 */
	//TXREG1 = 0xAA;
	//while(TRMT1 == 0);
	uart_send_string("start...\r\n");
	/* 主循环: 持续运行, 实际逻辑在中断中执行 */
	while(1)
	{
		asm("clrwdt");       /* 喂狗 */

#if UART_PRINT_EN
		/* ISR每秒置位, 在主循环中打印(不在ISR中阻塞, 避免WDT复位) */
		if(g_printFlag)
		{
			g_printFlag = 0;
			Print_Status();
		}
#endif

	}
}

/*========================================================================
  函数: Interrupt_Isr (中断服务程序)
  功能: 处理Timer0定时中断
  Timer0中断(125us):
    扫描12个槽位, 每中断处理一个槽位的一个阶段
    三阶段扫描: Phase0=ADC采样 -> Phase1=充电处理+LED -> Phase2=温度/充电控制
    12槽*3阶段=36次中断*125us=4.5ms完成一轮完整扫描
========================================================================*/
void interrupt Interrupt_Isr(void)
{
	/* Timer0中断: 125us周期, 核心扫描驱动
	   注意: ISR耗时可能超过125us周期, 主循环可能被持续抢占,
	   因此在ISR中也需要喂狗防止WDT复位 */
	if(T0IF)
	{
		TMR0 += 6;                  /* 重装Timer0, 保持125us周期(250tick×0.5us) */
		T0IF = 0;                   /* 清除中断标志 */
		g_timerTick++;              /* 中断计数+1 */
		asm("clrwdt");              /* ISR内喂狗(ADC耗时可能>125us周期) */

		/* === 软件PWM生成(RB7/VT_PWM1, 250Hz, 32级占空比) ===
		   PWM周期=32×125us=4ms, 频率=250Hz
		   每Timer0中断递增计数器, 0~31循环
		   计数器 < 占空比 → 输出高(PIN_PWM=1), 否则输出低 */
		g_pwmCounter++;
		if(g_pwmCounter >= PWM_RESOLUTION)
			g_pwmCounter = 0;
		PIN_PWM = (g_pwmCounter < g_pwmDuty) ? 1 : 0;

		/* 上电自检阶段: 执行LED自检序列 */
		if(g_powerOnPhase < 2)
		{
			PowerOnLedSequence();
		}
		/* 正常扫描阶段 */
		else
		{
			switch(g_scanPhase)
			{
			/* --- Phase 0: ADC电压采样(BxAD专用模拟引脚, 无需模式切换) --- */
			case 0:
				GSLOT(g_scanIndex)->voltage = 
					ADC_ReadChannel(s_adcChannels[g_scanIndex]);
				g_scanPhase = 1;
				break;

			/* --- Phase 1: 充电状态机处理 + LED更新 ---
			   1. 调用充电状态机处理当前槽位
			   2. 更新当前槽位LED状态 */
			case 1:
				ChargeProcess_Slot(g_scanIndex);
				Update_LED_Slot(g_scanIndex);
				g_scanPhase = 2;
				break;

			/* --- Phase 2: 扫描收尾(仅在槽位0时执行) ---
			   1. 读取NTC温度(与LED IO1共用RC5, 分时复用)
			   2. LED闪烁处理
			   3. 充电组控制输出(Charging_Control + CCCV_Control)
			   4. 槽位索引+1, 循环到下一个槽位
			   5. 每1秒: 读取电源电压 + 打印状态 */
			case 2:
				/* 在槽位0扫描完成后读取温度(每轮一次, 避免频繁切换RC5) */
				if(g_scanIndex == 0)
				{
					/* 将RC5切换为模拟输入读NTC */
					ANSEL2 |= 0x20;     /* RC5/AN21使能模拟 */
					TRISC |= 0x20;      /* RC5设为输入 */
					Read_Temperature();
					/* 恢复RC5为数字输出(LED控制) */
					ANSEL2 &= ~0x20;
					TRISC &= ~0x20;

					/* LED闪烁计时处理 */
					Led_BlinkProcess();
					/* 充电组控制输出(含温度保护判断) */
					Charging_Control();
					/* CC-CV恒流恒压PWM占空比调节 */
					CCCV_Control();
				}

				/* 切换到下一个槽位 */
				g_scanIndex++;
				if(g_scanIndex >= BATTERY_SLOTS)
				{
					g_scanIndex = 0;        /* 12槽扫完, 回到槽位0 */
					g_systemTick++;         /* 系统秒计数器+1 */
				}
				g_scanPhase = 0;            /* 回到Phase 0开始下一槽 */

				/* 每秒任务: 12槽×3阶段=36次中断/轮, 36×125us=4.5ms/轮
				   1000ms/4.5ms≈222轮/秒 */
				if(g_systemTick >= TICK_PER_SEC)
				{
					g_systemTick = 0;

					/* 读取1.2V内部参考电压, 计算VDD电源电压 */
					test_adc = ADC_Sample(ADC_CH_VREF, 0);
					if(0xA5 == test_adc)
					{
						volatile unsigned long power_temp;
						/* 电源电压(mV) = POWER_RATIO / ADC值 */
						power_temp = (unsigned long)((POWER_RATIO)/adresult);
						power_ad = (unsigned int)(power_temp);
					}
					else
					{
						/* ADC参考电压采样失败, 复位ADC(下次启动自动重新初始化) */
						ADCON0 = 0;
						ADCON1 = 0;
					}

#if UART_PRINT_EN
					/* 通知主循环打印(不在ISR中调用, 避免UART阻塞导致WDT复位) */
					g_printFlag = 1;
#endif
				}
				break;

			default:
				g_scanPhase = 0;
				break;
			}
		}
	}


}

/* 包含其他模块文件(编译时合并到同一个翻译单元) */
#include "adc_drv.c"
#include "charge_mgr.c"
#include "led.c"
#include "uart_dbg.c"