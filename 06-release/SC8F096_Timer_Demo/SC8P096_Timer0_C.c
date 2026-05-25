/*-------------------------------------------

�������ƣ�Timer0��ʱ�жϳ���
���ڰ汾��2024/09/14 <V1.0>

��ע��   

*�������� &Ӧ��֧�ֲ�& ��д����
-------------------------------------------*/
#include <sc.h>					//оƬͷ�ļ�������ݹ���ѡ���Զ�Ѱ�Ҷ�Ӧ�ͺ�ͷ�ļ�
#pragma warning disable 752
#pragma warning disable 373			//���ε������1������
#include <sc.h>

#ifndef _XTAL_FREQ
#define _XTAL_FREQ 16000000			//16MHz,ʹ��������ʱ�������붨����Ƶ��
									//����FCPU_DIVѡ��2T����ʱ��ֵ����
#endif

#define     POWER_RATIO  	(4096UL*1.2*1000)

volatile unsigned int adresult;
volatile unsigned int result;
volatile unsigned char test_adc;
volatile unsigned int power_ad;
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

void AD_Init() 
{
	CC0CON = 0;					//�ر� CC0��CC1 ����������
	CC1CON = 0;
	
	/*********** ADCON0 ****************************
		Bit7~Bit6  ADCS<1:0>:  ADת��ʱ��ѡ��λ��
			00=  F HSI /16
			01=  F HSI /32
			10=  F HSI /64
			11=  F HSI /128
		Bit5~Bit2  CHS<3:0>:  ģ��ͨ��ѡ��λ����ADCON1�Ĵ���CHS4���CHS<3:0>
			CHS<4:0>: 
			00000=  AN0
			00001=  AN1
			00010=  AN2
			00011=  AN3
			00100=  AN4
			00101=  AN5
			�� 
			11100=  AN28
			11101=  AN29
			11110=  OPA���
			11111=  1.2V���̶��ο���ѹ��
			����=  ����
		Bit1  GO/DONE: ADת��״̬λ��
			1=  ADת�����ڽ��С�����λ��1����ADת������ADת������Ժ󣬸�λ��Ӳ���Զ����㡣
				��GO/DONEλ��1��0��ADIF��0��1ʱ�������ٵȴ�����TADʱ�䣬�����ٴ�����ADת����
			0=  ADת�����/���ڽ����С�
		Bit0  ADON:  ADCʹ��λ��
			1=  ʹ��ADC��
			0=  ��ֹADC�������Ĺ���������
	*********************************************/
	ADCON0 = 0X41;		//ADON������AD����ʱ��ѡΪFSYS/32
	
	/*********** ADCON1 ****************************
		Bit7  ADFM:  ADת�������ʽѡ��λ��
			1=  �Ҷ��룻
			0=  ����롣
		Bit6  CHS4:  ͨ��ѡ��λ
		Bit5~Bit3  δ�� 
		Bit2  LDO_EN:  �ڲ��ο���ѹʹ��λ��
			1=  ʹ��ADC�ڲ�LDO�ο���ѹ��
				��ѡ���ڲ�LDO���ο���ѹʱ��ADC�����Ч����Ϊ8λ��
			0=  VDD��ΪADC�ο���ѹ��
		Bit1~Bit0  LDO_SEL<1:0>:  �ο���ѹѡ��λ
			0X=  2.0V
			10=  2.4V
			11=  3.0V
	*********************************************/
	ADCON1 = 0;
}

/**********************************************************
�������ƣ�AD_Sample
�������ܣ�AD���
��ڲ�����adch - ���ͨ��
���ڲ�������
��    ע������ͨ������������Ϊ�����
	      ����10��,ȡ�м�˴ε�ƽ��ֵΪ�����������adresult��

	      adch Ϊ����ADͨ�� 0-15��31
             31  ����ڲ�1.2V
	
 		  adldo =5,�����ڲ�LDO 2V ��ΪADC �ο�
 		  adldo =6,�����ڲ�LDO 2.4V ��ΪADC �ο�
		  adldo =7,�����ڲ�LDO 3V ��ΪADC �ο�
 		  adldo =0,VDD ��ΪADC �ο�
 		  ADת����������
 		  ADC�ο���ѹ��VDD�л���LDOʱ��Ҫ��ʱ100us���ϣ����ܽ���ADת��
**********************************************************/
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo) 
{
	volatile unsigned long adsum = 0;
	volatile unsigned int admin = 0, admax = 0;
	volatile unsigned int ad_temp = 0;

	if ((!LDO_EN) && (adldo & 0x04) ) 
	{
								//���AD�ο���VDD�����ڲ�LDO����Ҫ��ʱ100US����
		ADCON1 = adldo;			//�����,ADֵȡ12λ
		__delay_us(100);		//IDE������ʱ��������ʱ100us
	} 
	else
		ADCON1 = adldo;			//���ADCON1.7(ADFM)=1Ϊ�Ҷ��룬,ADֵȡ10λ

	if(adch & 0x10) 
	{
		CHS4 = 1;
		adch &= 0x0f;
	}
	else
		CHS4 = 0;
	unsigned char i = 0;
	for (i = 0; i < 10; i++) 
	{
		ADCON0 = (unsigned char)(0X41 | (adch << 2));	//16��Ƶ�������ƵΪ16M�������ѡ16��Ƶ������
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");				//ѡ��ͨ��������ʱ1uS����
		GODONE = 1;				//��ʼת��

		unsigned char j = 0;
		while (GODONE) 
		{
			__delay_us(2);		//��ʱ2us(���������ú���)

			if (0 == (--j))		//��ʱ0.5ms��û��ADת����������������
			return 0;
		}

		ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));	//����12λADֵ

		if (0 == admax) 
		{
			admax = ad_temp;
			admin = ad_temp;
		} 
		else if (ad_temp > admax)
			admax = ad_temp;				//AD�������ֵ
		else if (ad_temp < admin)
			admin = ad_temp;				//AD������Сֵ

		adsum += ad_temp;
	}
		adsum -= admax;
		if (adsum >= admin)
			adsum -= admin;
		else
			adsum = 0;

		adresult = adsum >> 3;		//8��ƽ��ֵ��Ϊ���ս��

		adsum = 0;
		admin = 0;
		admax = 0;
		return 0xA5;
		
}

void Adc_Test(void)
{
		TRISB7 = 1;							//����AN15��Ӧ��IO��Ϊ����,
		ANSEL1 |= 0X80;						//����AN15��Ӧ��IO��Ϊģ������
		test_adc = ADC_Sample(15, 7);		//����AN15�ڵ�ADֵ���ο���ѹ3V
		if (0xA5 == test_adc)				//������ɣ���������ԭ����ADת��û����ɣ��򲻴���
		{
			
		}
		else
		{
			ADCON0 = 0;						//���ת��û����ɣ����ʼ��ADCON0,1
			ADCON1 = 0;				
			__delay_us(100);				//��ʱ100us(���������ú���)
		}

		test_adc = ADC_Sample(31, 0);		//�����ڲ���׼1.2V��Ե�Դ��ADֵ
		if (0xA5 == test_adc)
		{
			volatile unsigned long power_temp;
			
			power_temp = (unsigned long)((POWER_RATIO)/adresult);		//1.2*4096/AD=VDD�������Ŵ�1000�� 
			power_ad = (unsigned int)(power_temp);		//ͨ���ڲ���׼��ѹ�Ƴ�оƬVDD��ѹ
		}	
		else
		{
			ADCON0 = 0;						//���ת��û����ɣ����ʼ��ADCON0,1
			ADCON1 = 0;				
			__delay_us(100);				//��ʱ100us(���������ú���)
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
	AD_Init();
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
		
		Adc_Test();//Justin
	}
}
/***********************************************
�������ƣ�Interrupt_Isr
�������ܣ��жϷ���(Timer0 + UART)
��ڲ�������
��ڲ�������
��ע��: SC8051架构中所有中断共享同一向量,需在此函数中统一处理
************************************************/
void uart_send_char(unsigned char c)
{
	while(TRMT1 == 0);
	TXREG1 = c;
}

void uart_send_string(unsigned char *str)
{
	while(*str != '\0')
	{
		uart_send_char(*str++);
	}
}

void uart_send_number(unsigned int num)
{
	unsigned char buf[6] = "0";
	unsigned char i = 0;
	unsigned char j;
	
	if(num == 0)
	{
		uart_send_char('0');
		return;
	}
	
	// 将数字转换为字符串（逆序）
	while(num > 0)
	{
		buf[i++] = '0' + (num % 10);
		num /= 10;
	}
	
	// 反转字符串并发送
	for(j = i; j > 0; j--)
	{
		uart_send_char(buf[j-1]);
	}
}

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

		// 打印 power_ad 的值
		uart_send_string("power_ad: ");
		uart_send_number(power_ad);
		uart_send_string("\r\n");
	}
}