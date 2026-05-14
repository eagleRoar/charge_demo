/**********************************************************

**********************************************************/

#include <sc.h>



volatile unsigned int   result,result1,result2;


void DelayXms(unsigned char x);


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
		for(j=153;j>0;j--);
}

/***********************************************************
main主函数
***********************************************************/

#define  SLAVE_ADRSS   0xa0

 
void Init_System();

/******************************************
  Adress  从机地址
  data    待发数据
********************************************/
void Write_IIC(unsigned char Adress,unsigned char data)
{
	/************ IICCON2 *********************************
	Bit7  GCEN:  广播呼叫使能位（仅限I 2 C从动模式）。
		1=  允许在IICSR中接收到广播呼叫地址（0000h）时产生中断。
		0=  禁止广播呼叫地址。
	Bit6  ACKSTAT:  应答状态位（仅限于I 2 C主控模式）。
		在主控发送模式下: 
		1 = 未接收到来自从动器件的应答。
		0 = 已接收到来自从动器件的应答。
	Bit5  ACKDT:  应答数据位（仅限于I 2 C主控模式）。
		在主控接收模式下:  用户在接收完成后发送的应答序列的值。
		1 = 不应答。
		0 = 应答。
	Bit4  ACKEN:  应答序列使能位（仅限I 2 C主控模式）。
		在主控接收模式下: 
		1 = 在SDA和SCL引脚启动应答序列，发送ACKDT数据位。由硬件自动清零。
		0 = 应答序列空闲。
	Bit3  RCEN:  接收使能位（仅限I 2 C主控模式）。
		1=  使能I 2 C接收模式。
		0=  接收空闲。
	Bit2  PEN:  停止条件使能位（仅限于I 2 C主控模式）。
		1 = 在SDA和SCL引脚启动停止条件。由硬件自动清零。
		0 = 停止条件空闲。
	Bit1  RSEN:  重复启动条件使能位（仅限I 2 C主控模式）。
		1=  在SDA和SCL引脚启动重复启动条件。由硬件自动清零。
		0=  重复启动条件空闲。
	Bit0  SEN:  启动条件使能位。
		在主控模式下: 
		1 = 在SDA和SCL引脚启动启动条件。由硬件自动清零。
		0 = 启动条件空闲。
	在从动模式下: 
		1 = 从发送和接收都会使能时钟延长（使能时钟延长）。
		0 = 禁止时钟延长。
	*********************************************************/
	SEN =1;  		  //起始信号
	while(IICIF==0);  //等待发送完成
	IICIF = 0;
	IICBUF = Adress;   //发送地址
	while(IICIF==0);
	IICIF = 0;
	IICBUF = data;    //发送数据
	while(IICIF==0);
	IICIF = 0;
	PEN =1;           //发送停止
    while(IICIF==0);
	IICIF = 0;
	
}

/******************************************
   Adress   从机地址
   data     待发数据
   返回 ReadData
  
********************************************/
unsigned char  Read_IIC(unsigned char Adress,unsigned char data)
{
	unsigned char ReadData;

	SEN =1;           //起始信号
	while(IICIF==0); //等待发送完成
	IICIF = 0;
	IICBUF = Adress;  
	while(IICIF==0);

	IICIF = 0;
	IICBUF = data;
	while(IICIF==0);
	IICIF = 0;
	
	RSEN =1; 		 //重复起始信号
	while(IICIF==0);

	IICIF = 0;
	
	IICBUF = Adress+1;  //发送地址+1 读取数据
	while(IICIF==0);
	IICIF = 0;    
	RCEN = 1;           //开始接收数据
	while(IICIF==0);
	IICIF = 0;
	ReadData = IICBUF;  //读取接收的数据
	
	ACKDT = 0;			//产生主机应答
	ACKEN = 1;			//发送应答位
	
	while(IICIF==0);
	IICIF = 0;
	
	RCEN = 1;           //开始接收第二个数据
	while(IICIF==0);
	IICIF = 0;
	ReadData = IICBUF;  //读取接收的数据
	
	ACKDT = 1;			//产生主机应答
	ACKEN = 1;			//发送应答位
	
	while(IICIF==0);
	IICIF = 0;
	
	PEN = 1;                //发送停止
    while(IICIF==0); 
	IICIF = 0;
	
	return ReadData;
	

}
volatile unsigned char IICReadData;
void main()
{
	Init_System();
	TRISA |=  0B00000011;  //RA0 RA1输入态，做IIC 引脚时为开漏，需要外接上拉电阻
	
	/********** IICCON ***********************************
	Bit7  IICWCOL:  写冲突检测位。
		主控模式:  
			1= 在IIC不满足开始发送数据的条件下，试图对IICBUF寄存器进行写操作。
			0= 未发生冲突。
		从动模式: 
			1= 正在发送前一个字时，又对IICBUF寄存器进行写操作（必须由软件清零）。
			0= 未发生冲突。
	Bit6  IICOV:  接收溢出指示位。(仅在从动接收模式下有限)
			1=  IICBUF寄存器仍保持前一数据时，又接收到一个新的字节。在发送模式下IICOV
				位可为任意值（该位必须由软件清零）。
			0=  没有溢出。
	Bit5  IICEN:  IIC使能位（必须正确配置这些引脚为输入）。
			1=  使能IIC并将SDA和SCL引脚配置为串行端口引脚。
			0=  禁止IIC并将这些引脚配置为I/O端口引脚。
	Bit4  IICCKP:  时钟极性选择位。
		在IIC从动模式下:  SCK释放控制。
			1 = 使能时钟。
			0 = 保持时钟线为低电平（时钟延长）（用于确保数据建立时间）。
		在IIC主控模式下:  在此模式下未使用。
	Bit3~Bit2  IICTOS[1:0]:  IIC从动模式超时选择
		00=  禁止IIC从动超时功能；
		01=  使能IIC从动超时功能，超时时间为16ms，超时后复位IIC模块；
		10=  使能IIC从动超时功能，超时时间为32ms，超时后复位IIC模块；
		11=  使能IIC从动超时功能，超时时间为64ms，超时后复位IIC模块；
	Bit1~Bit0  IICM<1:0>:  IIC模式选择位。
		00=  IIC主控模式，时钟=  FCPU / (IICADD+4)；
		01=  IIC从动模式，7位地址，不响应起始位和停止位中断；
		10=  IIC从动模式，7位地址，并允许起始位和停止位中断；
		11=  允许操作IICMSK寄存器
	*************************************************/
	IICCON =  0B00100000;  // IIC 使能  主动模式
    IICADD = 36;          // 100K 频率 = 16M /4/36+4
	
	while(1)
	{
         DelayXms(200);
		 Write_IIC(0xa0,0x80);
			
		 IICReadData =  Read_IIC(0xa0,0x80);
		 RB5 = ~RB5;
	}
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
	OSCCON = 0X70;				//配置振荡为8M,开 WDT
	OPTION_REG = 0;
	
    WPUA  = 0B00000000;			//初始化上拉
    WPUB  = 0B00001000;			
  
 
	TRISA = 0B00000011;			//初始化IO状态
	TRISB = 0B00001000;

	PORTA = 0B00000011;
	PORTB = 0B00000000;			//初始化输出

}
