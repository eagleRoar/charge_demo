/*-------------------------------------------

程序名称：休眠模式及唤醒程序
日期版本：2024/09/20 <V1.0>

备注：WDT已被禁止，休眠模式下利用PORTA,PORTB电平变化唤醒 

*本程序由 &应用支持部& 编写整理
-------------------------------------------*/


#include <sc.h>

void DelayXms(unsigned char x);
void Init_System();
void Sleep_Mode();

/***********************************************************
函数名称：DelayXms
函数功能：毫秒级非精准延时
入口参数：x - 延时时间
出口参数：
备    注：
***********************************************************/
void DelayXms(unsigned char x)
{
	unsigned char i,j;
	for(i=x;i>0;i--)
	{
		asm("clrwdt");
		for(j=153;j>0;j--);
	}
}
/***********************************************************
main主函数
***********************************************************/
void main()
{
	Init_System();
	while(1)
	{
		RB6=1;
		DelayXms(100);
		RB6 = 0;
		DelayXms(100);
		RB6=1;
		DelayXms(100);
		Sleep_Mode();
	}
}


/***********************************************
函数名称：Sleep_Mode
函数功能：进入休眠模式
入口参数：无
出口参数：无
备注：
************************************************/
void Sleep_Mode()
{
	INTCON = 0;		
	
	OPTION_REG = 0;

	TRISA = 0B00000001; 		//关闭所有输出，RA0口做唤醒输入
	PORTA = 0B00000000;
	WPUA  = 0B00000001;			//RA0 开上拉电阻
	
	TRISB = 0B00001000;			//关闭所有输出，RB3口做唤醒输入
	PORTB = 0B00000000;
	WPUB  = 0B00001000;			//RB3 开上拉电阻
   		
	TRISC = 0B00000000;			//必须确保芯片的IO不能处于悬空状态
	PORTC = 0B00000000;	
	
	TRISD = 0B00000000;
	PORTD = 0B00000000;	
			
   	ADCON0 = 0;					//关闭所有模块
	ADCON1 = 0;
	CMP1CON0 = 0;
	CMP2CON0 = 0;
	PWMCON0 = 0;
	KEYCON0 = 0;
	KEYCON2 = 0;
	QCCON = 0;
	CC0CON = 0;
	CC1CON = 0;
	OPACON = 0;
		
	OSCCON = 0X70;				//配置振荡为16M,关闭WDT，需注意芯片工程选项里WDT必须选为DISABLE,否则无法软件关掉WDT
	
	IOCA = 0B00000001;			//允许RA0的IO电平变化中断
	IOCB = 0B00001000;			//允许RB3的IO口电平变化中断
	
	RAIE = 1;					//允许PORTA的IO电平变化中断
	PEIE = 1;					//要用RORTA中断唤醒，则PEIE必须设为1
	RBIE = 1;					//允许PORTB电平变化中断
	GIE = 0;					//唤醒后执行SLEEP后程序;
	
	PIE1 &= 0X08;				//关闭不需要的中断
	PIR1 = 0;					//必须清不需要的中断标志位
	PIE2 = 0;					//关闭不需要的中断
	PIR2 = 0;					//必须清不需要的中断标志位
	INTCON &= 0XC8;				//必须清不需要的中断标志位

	PORTA;						//读PORTA值并锁存,用电平变化中断必须执行这一步
	RAIF = 0;					//清PORTA中断标志位
	PORTB;						//读PORTB值并锁存	
	RBIF = 0;					//清PORTB中断标志位		
	asm("clrwdt");

	asm("sleep");				//进入休眠模式
	
	asm("nop");
	asm("clrwdt");
	if(RAIF)  RAIF = 0;			//清中断标志
	if(RBIF)  RBIF = 0;			//清中断标志
	PORTA ^= 0X08;
	Init_System();
}

/***********************************************
函数名称：Init_System
函数功能：系统初始化
入口参数：无
出口参数：无
备注：
************************************************/
void Init_System()
{
	asm("nop");
	asm("clrwdt");
	INTCON = 0;					//系统初始化
	OSCCON = 0X72;				//配置振荡为16M,开 WDT
	OPTION_REG = 0;
	
    WPUA  = 0B00000001;			//初始化上拉
    WPUB  = 0B00001000;			
	WPUC  = 0B00000000;
 
	TRISA = 0B00000001;			//初始化IO状态
	TRISB = 0B00001000;
	TRISC = 0B00000000; 
	TRISD = 0B00000000;

   //PORTA = 0B00000000;         
	PORTB = 0B00000000;			//初始化输出
	PORTC = 0B00000000;
	PORTD = 0B00000000;
}

