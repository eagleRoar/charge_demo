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
unsigned int  g_timerTick = 0;           /* Timer0中断计数器(250us/tick), 4000tick=1秒 */
unsigned int  g_systemTick = 0;          /* 系统秒计数器(每秒+1) */
unsigned char g_scanIndex = 0;           /* 当前扫描槽位索引(0~11循环) */
unsigned char g_scanPhase = 0;           /* 当前扫描阶段: 0=ADC采样, 1=充电处理, 2=扫描完成/收尾 */
unsigned int  g_powerOnTimer = 0;        /* 上电自检计时器 */
unsigned char g_powerOnPhase = 0;        /* 上电自检阶段: 0=全亮, 1=保持, 2=正常 */

/*========================================================================
  ROM只读配置表
========================================================================*/
/* 12槽ADC通道映射表
   每个槽位对应一个ADC通道号, 用于电压采样 */
const unsigned char s_adcChannels[BATTERY_SLOTS] = {
	ADC_CH_B1,  /* B1: AN0  */
	ADC_CH_B2,  /* B2: AN1  */
	ADC_CH_B3,  /* B3: AN11 */
	ADC_CH_B4,  /* B4: AN10 */
	ADC_CH_B5,  /* B5: AN3  */
	ADC_CH_B6,  /* B6: AN2  */
	ADC_CH_B7,  /* B7: AN23 */
	ADC_CH_B8,  /* B8: AN25 */
	ADC_CH_B9,  /* B9: AN8  */
	ADC_CH_B10, /* B10: AN9 */
	ADC_CH_B11, /* B11: AN24 */
	ADC_CH_B12  /* B12: AN22 */
};

/* 12槽引脚配置表(ROM)
   每个槽位包含: TRIS寄存器、PORT寄存器、引脚掩码、ANSEL寄存器、模拟选择掩码
   用于分时复用: 同一引脚在ADC测量时切换为模拟, 在MOSFET控制时切换为数字 */
const SlotPinConfig_t s_slotPins[BATTERY_SLOTS] = {
	/* B1: RA0/AN0 */ { &TRISA, &PORTA, 0x01, &ANSEL0, 0x01 },
	/* B2: RA1/AN1 */ { &TRISA, &PORTA, 0x02, &ANSEL0, 0x02 },
	/* B3: RB3/AN11*/ { &TRISB, &PORTB, 0x08, &ANSEL1, 0x08 },
	/* B4: RB2/AN10*/ { &TRISB, &PORTB, 0x04, &ANSEL1, 0x04 },
	/* B5: RA3/AN3 */ { &TRISA, &PORTA, 0x08, &ANSEL0, 0x08 },
	/* B6: RA2/AN2 */ { &TRISA, &PORTA, 0x04, &ANSEL0, 0x04 },
	/* B7: RD1/AN23*/ { &TRISD, &PORTD, 0x02, &ANSEL3, 0x02 },
	/* B8: RD3/AN25*/ { &TRISD, &PORTD, 0x08, &ANSEL3, 0x08 },
	/* B9: RB0/AN8 */ { &TRISB, &PORTB, 0x01, &ANSEL1, 0x01 },
	/* B10:RB1/AN9 */ { &TRISB, &PORTB, 0x02, &ANSEL1, 0x02 },
	/* B11:RD2/AN24*/ { &TRISD, &PORTD, 0x04, &ANSEL3, 0x04 },
	/* B12:RD0/AN22*/ { &TRISD, &PORTD, 0x01, &ANSEL3, 0x01 }
};

/*========================================================================
  函数: SlotPin_ToAnalog
  功能: 将指定槽位的引脚切换为模拟输入模式(用于ADC电压采样)
  参数: idx - 槽位索引(0~11)
  说明: 置位ANSEL(使能模拟)和TRIS(设为输入)
========================================================================*/
void SlotPin_ToAnalog(unsigned char idx)
{
	const SlotPinConfig_t *cfg = &s_slotPins[idx];
	*cfg->ansel_reg |= cfg->ansel_mask;   /* 使能模拟功能 */
	*cfg->tris_reg |= cfg->pin_mask;      /* 设为输入模式 */
}

/*========================================================================
  函数: SlotPin_ToDigital
  功能: 将指定槽位的引脚切换为数字输出模式(用于MOSFET栅极控制)
  参数: idx - 槽位索引(0~11)
  说明: 清除ANSEL(关闭模拟)和TRIS(设为输出), 引脚恢复为数字IO
========================================================================*/
void SlotPin_ToDigital(unsigned char idx)
{
	const SlotPinConfig_t *cfg = &s_slotPins[idx];
	*cfg->ansel_reg &= ~cfg->ansel_mask;  /* 关闭模拟功能 */
	*cfg->tris_reg &= ~cfg->pin_mask;     /* 设为输出模式 */
}

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
    7. 使能中断(GIE/PEIE/T0IE/RC1IE)
    8. 初始化控制引脚和槽位数据
========================================================================*/
void System_Init(void)
{
	unsigned char i;

	/* --- 看门狗复位 --- */
	asm("nop");
	asm("clrwdt");

	/* --- 系统时钟配置: 16MHz内部RC --- */
	OSCCON = 0x72;          /* 内部16MHz, 软件模式 */
	OPTION_REG = 0x00;      /* 关闭弱上拉, Timer0预分频=1:2(实际1:1因为TMR0+6) */
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
	   RC0=VCC_SW: 输出高(电源切换, 先切到USB供电)
	   RC1=AN17(B1AD): 模拟输入(ADC采样)
	   RC2=CD IO2: 输出低(关闭充电组2 B7-B12)
	   RC3=CD IO1: 输出低(关闭充电组1 B1-B6)
	   RC4=LED IO2/CLK: 输出低(LED关闭)
	   RC5=LED IO1/DAT/NTC: 输出低(LED关闭)
	   初始值: 0B00000001 = VCC_SW=1 */
	TRISC = 0B00000010;     /* RC1输入(B1AD), RC0/2/3/4/5输出 */
	PORTC = 0B00000001;     /* VCC_SW=1, CD1/CD2=0关闭, LED全部关闭 */
	WPUC = 0B00000000;      /* 关闭弱上拉 */
	/* SC8F096只有WPDA/WPDB, 无WPDC/WPDD */

	/* --- PORTD初始化 ---
	   RD0=B12, RD1=B7, RD2=B11, RD3=B8: 输出高(关闭充电)
	   初始值: 0B00001111 = 全部高电平 */
	TRISD = 0B00000000;     /* 全部设为输出 */
	PORTD = 0B00001111;     /* MOSFET全部关闭(高电平) */
	WPUD = 0B00000000;      /* 关闭弱上拉 */

	/* --- 关闭所有模拟功能(需要时动态切换) --- */
	ANSEL0 = 0x00;
	ANSEL1 = 0x00;
	ANSEL2 = 0x00;
	ANSEL3 = 0x00;

	/* --- 比较器关闭 --- */
	CC0CON = 0;
	CC1CON = 0;

	/* --- ADC模块配置 ---
	   ADCON0=0x41: 通道AN0, ADC使能, 时钟Fosc/8
	   ADCON1=0: 右对齐, 参考电压=VDD=5V, 时钟Fosc/8 */
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
	   周期: TMR0从6计数到256溢出 = 250个指令周期
	   250 * 4/16MHz = 62.5us? 实际: 250/16μs ≈ 250us? 
	   注: 预分频器1:1, 250个计数周期 = 250*(4/16MHz) = 62.5us
	   实际需要250us, 所以TMR0预装值 = 256-(250us*4MHz) = 256-1000 = -744
	   需要重新计算... 实际使用预分频1:2, TMR0=6 */
	TMR0 = 6;               /* 预装值, 250个计数后溢出 */
	T0IF = 0;               /* 清除Timer0中断标志 */
	T0IE = 1;               /* 使能Timer0中断 */

	/* --- 中断使能 --- */
	PEIE = 1;               /* 外设中断使能 */
	RC1IE = 1;              /* UART1接收中断使能 */
	GIE = 1;                /* 全局中断使能 */

	/* --- 控制引脚初始状态 --- */
	PIN_EN = 1;             /* 主电源使能(高电平使能Q3) */
	PIN_PWM = 0;            /* PWM关闭 */
	PIN_CD1 = 0;            /* 充电组1关闭 */
	PIN_CD2 = 0;            /* 充电组2关闭 */
	PIN_LED_IO1 = 0;        /* LED电源1关闭 */
	PIN_LED_IO2 = 0;        /* LED电源2关闭 */
	PIN_VCC_SW = 1;         /* 电源切换: 先切到USB(高电平=USB供电) */

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
	RXOK_f = 0;             /* UART接收标志清零 */
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

		/* UART接收数据回环测试(调试用) */
		if(RXOK_f == 1)
		{
#if UART_PRINT_EN
			unsigned char i;
			for(i = 0; i < 10; i++)
			{
				while(TRMT1 == 0);
				TXREG1 = RxTable[i];
			}
#endif
			RXOK_f = 0;
		}
	}
}

/*========================================================================
  函数: Interrupt_Isr (中断服务程序)
  功能: 处理Timer0定时中断和UART接收中断
  Timer0中断(250us):
    扫描12个槽位, 每中断处理一个槽位的一个阶段
    三阶段扫描: Phase0=ADC采样 -> Phase1=充电处理+LED -> Phase2=温度/充电控制
    12槽*3阶段=36次中断*250us=9ms完成一轮完整扫描
  UART中断:
    接收10字节数据放入RxTable, 完成后置RXOK_f标志
========================================================================*/
void interrupt Interrupt_Isr(void)
{
	/* Timer0中断: 250us周期, 核心扫描驱动 */
	if(T0IF)
	{
		TMR0 += 6;                  /* 重装Timer0, 保持250us周期 */
		T0IF = 0;                   /* 清除中断标志 */
		g_timerTick++;              /* 中断计数+1 */

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
			/* --- Phase 0: ADC电压采样 ---
			   1. 将当前槽位引脚切换为模拟输入
			   2. 读取ADC电压值
			   3. 恢复引脚为数字输出(MOSFET控制) */
			case 0:
				SlotPin_ToAnalog(g_scanIndex);
				GSLOT(g_scanIndex)->voltage = 
					ADC_ReadChannel(s_adcChannels[g_scanIndex]);
				SlotPin_ToDigital(g_scanIndex);
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
			   3. 充电组控制输出
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
				}

				/* 切换到下一个槽位 */
				g_scanIndex++;
				if(g_scanIndex >= BATTERY_SLOTS)
				{
					g_scanIndex = 0;        /* 12槽扫完, 回到槽位0 */
					g_systemTick++;         /* 系统秒计数器+1 */
				}
				g_scanPhase = 0;            /* 回到Phase 0开始下一槽 */

				/* 每秒任务: 12槽×3阶段=36次中断/g_systemTick, 36×250us=9ms/次
				   1000ms/9ms≈111次/秒 */
				if(g_systemTick >= 111)
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
						/* ADC采样失败, 复位ADC模块 */
						ADCON0 = 0;
						ADCON1 = 0;
						__delay_us(100);
					}

#if UART_PRINT_EN
					/* 每秒打印一次系统状态(温度/电压/各槽位状态) */
					Print_Status();
#endif
				}
				break;

			default:
				g_scanPhase = 0;
				break;
			}
		}
	}

	/* UART1接收中断 */
	if(RC1IF == 1)
	{
		static unsigned char RxNum = 0, TEMP;
		RC1IF = 0;

		/* 如果上一条数据还未处理, 则丢弃新数据 */
		if(RXOK_f == 0)
		{
			RxTable[RxNum] = RCREG1;    /* 存入接收缓冲区 */
			RxNum++;
			if(RxNum > 9)               /* 收满10字节 */
			{
				RxNum = 0;
				RXOK_f = 1;             /* 通知主循环处理 */
			}
		}
		else
		{
			TEMP = RCREG1;              /* 丢弃数据 */
		}
	}
}

/* 包含其他模块文件(编译时合并到同一个翻译单元) */
#include "adc_drv.c"
#include "charge_mgr.c"
#include "led.c"
#include "uart_dbg.c"