/*-------------------------------------------

�������ƣ�Timer0��ʱ�жϳ���
���ڰ汾��2024/09/14 <V1.0>

��ע��   

*�������� &Ӧ��֧�ֲ�& ��д����
-------------------------------------------*/
#include <sc.h>					//оƬͷ�ļ�������ݹ���ѡ���Զ�Ѱ�Ҷ�Ӧ�ͺ�ͷ�ļ�
static unsigned int timer_cnt = 0;
static unsigned int level = 0;

unsigned char RxTable[10];
bit RXOK_f;

void gpio_init(void)
{
	//RA0����ߵ�ƽ
	TRISA = 0B11111110;//RA0 ����:���
	PORTA = 0B0000001;//RA0 ��ƽ:��
}

void test_io_high()
{
	PORTA |= 0B00000001;//RA0 ��ƽ:��
}

void test_io_low()
{
	PORTA &= 0B11111110;//RA0 ��ƽ:��
}

void control_test_io(unsigned int flag)
{
	if(flag)
	{
		test_io_high();
	}
	else
	{
		test_io_low();
	}
}

void main(void)
{
	unsigned char i =0 ;
	
	asm("nop");
	asm("clrwdt");
	OSCCON = 0x72;				//16MHZ,�ڲ���������ϵͳʱ��,CONFIG�ر�WDTʱ�������Կ���WDT����
	OPTION_REG = 0x00;			//����TIMER0ʱ�䣬00Ϊ2��Ƶ
	asm("clrwdt");
	/*********************************************************************
	Ԥ��Ƶ�����ƼĴ��� OPTION_REG��01H��
	Bit7  δ�� 
	Bit6  INTEDG:  �����жϵı���ѡ��λ
		1=  INT ���������ش����ж�
		0=  INT �����½��ش����ж�
	Bit5  T0CS:  TIMER0 ʱ��Դѡ��λ
		0=  �ڲ�ָ������ʱ�ӣ�FSYS /4��
		1=	T0CKI �����ϵ�������
	Bit4  T0SE:	TIMER0 ʱ��Դ����ѡ��λ��
		0=	�� T0CKI �����źŴӵ͵�ƽ���䵽�ߵ�ƽʱ����
		1=	�� T0CKI �����źŴӸߵ�ƽ���䵽�͵�ƽʱ����
	Bit3  PSA: Ԥ��Ƶ������λ
		0=	Ԥ��Ƶ������� TIMER0 ģ��
		1=	Ԥ��Ƶ������� WDT
	Bit2~Bit0  PS2~PS0:  Ԥ�����������λ
		PS2  PS1  PS0  TMR0��Ƶ��  WDT ��Ƶ�� 
		0    0    0  	1:2  		1:1 
		0  	 0	  1		1:4			1:2 
		0	 1	  0		1:8			1:4 
		0	 1	  1		1:16		1:8 
		1  	 0	  0		1:32		1:16 
		1	 0	  1		1:64		1:32 
		1	 1	  0		1:128		1:64 
		1	 1	  1		1:256		1:128 
	*********************************************************************/
	
	
	WPUA = 0B00000000;
	WPDA = 0B00000000;
	
	IOCA = 0B00000000;
	TRISA = 0B00000000;
	
	WPUB = 0B00001000;
	WPDB = 0B00000000;

	IOCB = 0B00000000;
	
	// UART1引脚配置: TX=RB3, RX=RB4
	TRISB = 0B00011000;	// RB4(RX1)=1(输入), RB3(TX1)=0(输出), RB2=1(输入)
	
	TXSTA1 =  0B10100000;		// UART1发送使能,8位数据,异步模式,BRGH=1(高速)
	
	TMR0 = 6;					// 定时器初始值
	T0IF = 0;
	T0IE = 1;					// 使能Timer0中断
	
	RCSTA1 =  0B10010000;		// UART1使能串口,使能接收
	SPBRG1 =  103;        		// UART1 9600bps @ 16MHz, BRGH=1
	
	PEIE =1;
	RC1IE =1;					// 使能UART1接收中断
	GIE =1;
	
	GIE = 1;					//�������ж�
	gpio_init();
	
	// 发送测试消息（只发送一次，简短）
	TXREG1 = 0x55;

	while(TRMT1==0);
	 TXREG1 =0xaa;

	while(TRMT1 == 0);
	
	while(1)
	{
		asm("clrwdt");
		
		if(RXOK_f==1)
		{
			// 回显接收到的数据（简短处理）
			for(i=0;i<10;i++)
			{
				while(TRMT1 == 0);
				TXREG1 = RxTable[i];
			}
			RXOK_f = 0;
		}
	}
}
/***********************************************
�������ƣ�Interrupt_Isr
�������ܣ��жϷ���(Timer0 + UART)
��ڲ�������
��ڲ�������
��ע��: SC8051架构中所有中断共享同一向量,需在此函数中统一处理
************************************************/
void interrupt Interrupt_Isr(void)
{
	// Timer0中断处理
	if(T0IF)
	{
		TMR0 += 6;			//TMR0�����Զ���ֵ������TMR0��ʱ��,TIME�ǲ�������
		T0IF = 0;
		
		PORTB ^= 0XFF;
		timer_cnt ++;
	}
	
	// UART1接收中断处理
	if(RC1IF==1)
	{
		static unsigned char RxNum=0,TEMP;
		
		RC1IF = 0;
	    
		if(RXOK_f==0)	
		{
			RxTable[RxNum] = RCREG1;
			RxNum++;
			if(RxNum > 9)
			{
				RxNum =0;
				RXOK_f =1;
			}
		}
		else
		{
			TEMP =  RCREG1;
		}
	}
	
	// 定时器计数处理(放在所有中断标志清除之后)
	if(timer_cnt > 8000)
	{
		timer_cnt = 0;
		control_test_io((level++)%2);

		TXREG1 = 'A';
		while(TRMT1 == 0);
	}
}