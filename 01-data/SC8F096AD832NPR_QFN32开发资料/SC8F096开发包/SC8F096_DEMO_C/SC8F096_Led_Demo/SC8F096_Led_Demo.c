#include <sc.h>

#pragma warning disable 751,752;

void Set_LED_Moudle();

bit B_MainLoop;
volatile unsigned char sec;

void main()
{
	asm("nop");
	asm("clrwdt");
	
	OSCCON = 0x70;							//内部振荡器1分频
	INTCON = 0;
	
	PIR1 = 0;
	PIE1 = 0;
	PIR2 = 0;
	PIE2 = 0;

	PR2 = 124;				//赋初值	
	TMR2IF = 0;				//清中断标志位
	TMR2IE = 1;				//允许Timer2中断
	T2CON = 0x05;			//开启Timer2，预分频值为4，后分频比为1:1
	
	INTCON = 0XC0;							//全局中断使能
	
	TRISC = 0B00000011;		//设置LED驱动对应管脚为输入态
	TRISB = 0B11111111;
	TRISA = 0B00000001;
	
	Set_LED_Moudle();		//初始化LED寄存器

	while(1)
	{
		if(B_MainLoop)
		{
			B_MainLoop = 0;
			asm("clrwdt");
			++sec;
			if(sec >= 250)
			{
				sec = 0;
				LCDADD = 0B10000000;		//允许读写LED数据
				/***************LCDADD*******************
				Bit7  LCDCS:  LCD/LED 数据读写使能
					0:  禁止读写 LCD/LED 数据
					1:  允许读写 LCD/LED 数据
				Bit6~Bit5  B2RES<1:0>:  LCD 模式内部分压电阻选择
					00=  R=10K
					01=  R=50K
					10=  R=200K(自动使能快速充电模式，在一个 COM 周期开始时 50K、200K 分压电阻同
						时有效，经设定时间后 50K 分压电阻关闭，200K 分压电阻保持有效)
					11=  R=900K(自动使能快速充电模式，在一个 COM 周期开始时 50K、900K 分压电阻同
						时有效，经设定时间后 50K 分压电阻关闭，900K 分压电阻保持有效)
					Bit4~Bit0  LCDADD<4:0>:  LCD/LED 地址选择
											LCD/LED 地址范围 00H-017H
				***********************************************************/
				LCDDATA = 0x01;			//LED0对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x02;			//LED1对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x04;			//LED2对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x08;			//LED3对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x10;			//LED4对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x20;			//LED5对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x40;			//LED6对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x80;			//LED7对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0x01F;			//LED8对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				LCDADD++;
				
				LCDDATA = 0xFF;			//LED9对应的LED
				LCDDATA8 = 1;			//第9位数据在SEGEN3的Bit0
				
				LCDCS = 0;		

				LEDEN = 1;
			}
			
		}
	}

}

void interrupt Timer_Isr()
{
	static unsigned char tcount = 0;
	
	if(TMR2IF)
	{
		TMR2IF = 0;
		if(++tcount >= 40)					//主循环定时设置为40*125us=5ms
		{
			tcount = 0;
			B_MainLoop = 1;
		}
	}
}

/**********************************************************
函数名称：Set_LED_Moudle
函数功能：初始化LED/LCD模块设置
入口参数：无
出口参数：无 
备    注：
**********************************************************/
void Set_LED_Moudle()
{
	
	LCDCON0 = 0B00111011;					//使能LED,设置为10个COM,设置频率为FHSI/8192	
	/******* LEDCON0*****************************
	Bit7  LCDEN:  LCD 模块使能
		0:  禁止 LCD 模块
		1:  使能 LCD 模块
	Bit6  LEDEN:  LED 模块使能
		0:  禁止 LED 模块
		1:  使能 LED 模块。
	Bit5~Bit3  COMSEL[2:0]:  LCD/LED 模块 COM 口个数选择
			LCD 扫描模式  LED 扫描模式
		000:  2COM 		 3COM
		001:  3COM  	 4COM
		010:  4COM  	 5COM
		011:  5COM		 6COM
		100:  6COM		 7COM
		101:  6COM		 8COM
		110:  6COM 		 9COM
		111:  6COM		 10COM
	Bit2~Bit0  LCDCLK[2:0]:  LCD/LED 扫描频率（根据 LCDCON1 的 LCDF<1:0>选择时钟源）
				LED 扫描模式
		000：  F HSI /1024||F LSI /2||F LSE /2
		001：  F HSI /2048||F LSI /4||F LSE /4
		010：  F HSI /4096||F LSI /8||F LSE /8
		011：  F HSI /8192||F LSI /16||F LSE /16
		100：  F HSI /16384||F LSI /32||F LSE /32
		101：  F HSI /32768||F LSI /64||F LSE /64
		110：  F HSI /65536||F LSI /128||F LSE /128
		111：  F HSI /131072||F LSI /256||F LSE /256
	**************************************************************************/
	LCDCON1 = 0;					//时钟源为FHSI
	/***************LCDCON1************************************************
	Bit1~Bit0  LCDF<1:0>:  LCD/LED 时钟源选择
		0x:  FHSI
		10:  FLSI
		11:  FLSE
	************************************************************************/
	COMEN  = 0B00000011;			//COMEN的Bit0~1对应LED8~9
	SEGEN1 = 0xff;					//SEGEN1对应LED0~7
	SEGEN3 = 0B01000000;			//SEG驱动电流选择为8mA
	/******************SEGEN3*******************************************
	Bit7~Bit3  SEGDRI[4:0]:  SEG 口驱动电流设置
		00000:  SEG 口驱动电流为 0mA
		00001:  SEG 口驱动电流为 1mA
		00010:  SEG 口驱动电流为 2mA
		00011:  SEG 口驱动电流为 3mA
		00100:  SEG 口驱动电流为 4mA
		00101:  SEG 口驱动电流为 5mA
		00110:  SEG 口驱动电流为 6mA
		00111:  SEG 口驱动电流为 7mA
		01000:  SEG 口驱动电流为 8mA
		… 
		11101:  SEG 口驱动电流为 29mA
		11110:  SEG 口驱动电流为 30mA
		11111:  SEG 口驱动电流为 45mA
	Bit2~Bit1  未用 
	Bit0  LCDDATA<8>:  LED 模式下，LED 数据的第 8 位
	*******************************************************************/
	
}

