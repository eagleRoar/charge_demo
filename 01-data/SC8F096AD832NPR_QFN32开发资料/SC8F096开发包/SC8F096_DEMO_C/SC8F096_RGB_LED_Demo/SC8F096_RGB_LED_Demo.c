#include <sc.h>

#pragma warning disable 751,752;

bit B_MainLoop;
volatile unsigned char led_c;
volatile unsigned char dis_buf[4];

void Set_LED_Moudle();
void Led_Moudle_Device();
void LED_B();
void LED_G();
void LED_R();
void LED_B1();
void LED_G1();
void LED_R1();

void main()
{
	asm("nop");
	asm("clrwdt");
	
	OPTION_REG = 0X0F;
	asm("clrwdt");
	OSCCON = 0x70;							//内部振荡器1分频
	INTCON = 0;
	
	PIR1 = 0;
	PIE1 = 0;
	PIR2 = 0;
	PIE2 = 0;

	Set_LED_Moudle();						//初始化LED模块

//125us中断初始化
	PR2 = 124;				//赋初值	
	TMR2IF = 0;				//清中断标志位
	TMR2IE = 1;				//允许Timer2中断
	T2CON = 0x07;			//开启Timer2，预分频值为4，后分频比为1:1
	
	INTCON = 0XC0;							//全局中断使能
	
	TRISC = 0B00000000;
	TRISB = 0B00000000;		//CONFIG配置里面选择RA5口做DAT输出
	TRISA = 0B00000000;
	
	dis_buf[0] = 0X1;			//
	dis_buf[1] = 0X0;
	dis_buf[2] = 0X0;		

	while(1)
	{
		if(B_MainLoop)
		{
			B_MainLoop = 0;
			asm("clrwdt");
			switch(led_c)
			{
				case 0x0:  LED_B();break;		
				case 0x01:	LED_G();break;	 	
				case 0x02:	LED_R();break;		
				case 0x03:	LED_B1();break;		
			
				case 0x04:  LED_G1();break;		
				case 0x05:	LED_R1();break;		
						
				default:	led_c = 0;break;
			}
			
			Led_Moudle_Device();			//将数据写入LCDDATA
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
	LEDCTR0 = 0B11000000;			//使能驱动模块和重发模式,设置码率
	/***********LEDCTR0*********************************
	Bit7  LEDSWE:	RGB彩灯驱动模块使能位
		1=	使能RGB彩灯驱动模块
		0=	关闭RGB彩灯驱动模块
	Bit6  LEDSW_RT:	重发模式使能位
		1=	使能重发模式
		0=	关闭重发模式
	Bit5  IF_15:	发码完成标志位
		1=  已完成发码15个字节（第1到15字节），需软件清零才能重发
		（第1到15字节）
		0=  未完成发码15个字节
	Bit4  IF_30:	发码完成标志位
		1=  已完成发码30个字节（第1到30字节），需软件清零才能重发
		（第16到30字节）
		0=	未完成发码30个字节
	Bit3  RESET_T:	RESET时间选择
		1=	300us
		0=	100us
	Bit2~Bit1  LEDSW_CKSEL<1:0>:	码元格式选择
		11=	T0H=500ns，T0L=2000ns；T1H=2000ns，T1L=500ns
		10=	T0H=312.5ns，T0L=875ns；T1H=875ns，T1L=875ns
		01=	T0H=250ns，T0L=1000ns；T1H=875ns，T1L=375ns
		00=	T0H=312.5ns，T0L=625ns；T1H=625ns，T1L=312.5ns
	Bit0  LEDSW_ST:	发码启动位
		1=	启动发码，发码完成后硬件自动清零
		0=禁止发码
******************************************************/
	TRISA5 =0;
	
}

/**********************************************************
函数名称：Led_Moudle_Device
函数功能：更新LED模块内部所有用到的显示LEDDATA的数据
入口参数：无
出口参数：无 
备    注：可通过判断IF_15,IF_30来写入更多的数据，实现点亮几十个灯的功能
**********************************************************/
void Led_Moudle_Device()
{
	unsigned char i=0; 
	LEDCTR0 = 0X80;
	LEDCTR1 = 0X80;
	/**************LEDCTR1******************************
	Bit7  LEDSW_ADR:RGB彩灯驱动模块读写数据缓存使能位
		1=使能读写数据缓存
		0=禁止读写数据缓存
	Bit6~Bit5  未用
	Bit4~Bit0  LEDSW_ADD<4:0>	数据缓存地址选择
		00000=  第1字节数据缓存地址
		…
		11101=	第30字节数据缓存地址
	***************************************************/
	LEDSW_RT = 1;
	for(i=0;i<10;i++)		//一次可以发送30个字节数据，点10个灯
	{
		PDSDATA = dis_buf[0];	//LEDDATA和PDSDATA共用一个地址，故用PD的时候不能用这个模块
		LEDCTR1 ++;
		PDSDATA = dis_buf[1];
		LEDCTR1 ++;
		PDSDATA = dis_buf[2];
		LEDCTR1 ++;
	}
	LEDSW_ST = 1;
	
	while(IF_15==0)			//等待发完15个字节数据，
	{
		asm("clrwdt");
	}
	IF_15 = 0;				//软件清零IF_15后可再次写入地址0~14的数据，实现点15个灯
	LEDCTR1 = 0X80;
	for(i=0;i<5;i++)		//如有中断产生，则中断处理时间加写LED数据时间需小于15个字节的数据发送时间
	{
		PDSDATA = dis_buf[0];
		LEDCTR1 ++;
		PDSDATA = dis_buf[1];
		LEDCTR1 ++;
		PDSDATA = dis_buf[2];
		LEDCTR1 ++;
	}
	
	while(IF_30==0)			//等待发完30个字节数据，如有中断产生，则中断处理数据时间加送数据时间
	{
		asm("clrwdt");
	}
	IF_30 = 0;				//软件清零IF_30后可再次写入地址15~29的数据，实现点20个灯
	for(i=0;i<5;i++)
	{
		PDSDATA = dis_buf[0];
		LEDCTR1 ++;
		PDSDATA = dis_buf[1];
		LEDCTR1 ++;
		PDSDATA = dis_buf[2];
		LEDCTR1 ++;
	}
	
	while(IF_15==0)
	{
		asm("clrwdt");
	}
	IF_15 = 0;					//实现点25个灯
	LEDCTR1 = 0X80;
	for(i=0;i<5;i++)
	{
		PDSDATA = dis_buf[0];
		LEDCTR1 ++;
		PDSDATA = dis_buf[1];
		LEDCTR1 ++;
		PDSDATA = dis_buf[2];
		LEDCTR1 ++;
	}
	while(IF_30==0)
	{
		asm("clrwdt");
	}
	IF_30 = 0;					//实现点30个灯
	for(i=0;i<5;i++)
	{
		PDSDATA = dis_buf[0];
		LEDCTR1 ++;
		PDSDATA = dis_buf[1];
		LEDCTR1 ++;
		PDSDATA = dis_buf[2];
		LEDCTR1 ++;
	}
}

void LED_B()
{
	if(dis_buf[0]==255)	
	{
		dis_buf[0] = 0;
		led_c++;
	}
	else dis_buf[0]++;
}

void LED_G()
{
	if(dis_buf[1]==250)
	{
		dis_buf[1] = 0;
		led_c++;
	}
	else dis_buf[1]++;
}

void LED_R()
{
	if(dis_buf[2]==250)
	{
		dis_buf[2] = 0;
		led_c++;
	}
	else dis_buf[2]++;
}

void LED_B1()
{
	if(dis_buf[0]==255)	
	{
		//DispData[0] = 0;
		led_c++;
	}
	else dis_buf[0]++;
}

void LED_G1()
{
	if(dis_buf[1]==255)	
	{
		//DispData[0] = 0;
		led_c++;
	}
	else dis_buf[1]++;
}

void LED_R1()
{
	if(dis_buf[2]==255)	
	{
		dis_buf[0] = 0;
		dis_buf[1] = 0;
		dis_buf[2] = 0;
		led_c = 0;
	}
	else dis_buf[2]++;
}
	
