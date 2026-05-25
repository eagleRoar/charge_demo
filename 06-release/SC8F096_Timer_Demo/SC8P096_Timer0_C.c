/*-------------------------------------------

ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ£ï¿½Timer0ï¿½ï¿½Ê±ï¿½Ð¶Ï³ï¿½ï¿½ï¿½
ï¿½ï¿½ï¿½Ú°æ±¾ï¿½ï¿½2024/09/14 <V1.0>

ï¿½ï¿½×¢ï¿½ï¿½   

*ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ &Ó¦ï¿½ï¿½Ö§ï¿½Ö²ï¿½& ï¿½ï¿½Ð´ï¿½ï¿½ï¿½ï¿½
-------------------------------------------*/
#include <sc.h>					//Ð¾Æ¬Í·ï¿½Ä¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý¹ï¿½ï¿½ï¿½Ñ¡ï¿½ï¿½ï¿½Ô¶ï¿½Ñ°ï¿½Ò¶ï¿½Ó¦ï¿½Íºï¿½Í·ï¿½Ä¼ï¿½
static unsigned int timer_cnt = 0;
static unsigned int level = 0;

unsigned char RxTable[10];
bit RXOK_f;

void gpio_init(void)
{
	//RA0ï¿½ï¿½ï¿½ï¿½ßµï¿½Æ½
	TRISA = 0B11111110;//RA0 ï¿½ï¿½ï¿½ï¿½:ï¿½ï¿½ï¿½
	PORTA = 0B0000001;//RA0 ï¿½ï¿½Æ½:ï¿½ï¿½
}

void test_io_high()
{
	PORTA |= 0B00000001;//RA0 ï¿½ï¿½Æ½:ï¿½ï¿½
}

void test_io_low()
{
	PORTA &= 0B11111110;//RA0 ï¿½ï¿½Æ½:ï¿½ï¿½
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
	CC0CON = 0;					//¹Ø±Õ CC0¡¢CC1 µÄÏÂÀ­µç×è
	CC1CON = 0;
	
	/*********** ADCON0 ****************************
		Bit7~Bit6  ADCS<1:0>:  AD×ª»»Ê±ÖÓÑ¡ÔñÎ»¡£
			00=  F HSI /16
			01=  F HSI /32
			10=  F HSI /64
			11=  F HSI /128
		Bit5~Bit2  CHS<3:0>:  Ä£ÄâÍ¨µÀÑ¡ÔñÎ»¡£ÓëADCON1¼Ä´æÆ÷CHS4×éºÏCHS<3:0>
			CHS<4:0>: 
			00000=  AN0
			00001=  AN1
			00010=  AN2
			00011=  AN3
			00100=  AN4
			00101=  AN5
			¡­ 
			11100=  AN28
			11101=  AN29
			11110=  OPAÊä³ö
			11111=  1.2V£¨¹Ì¶¨²Î¿¼µçÑ¹£©
			ÆäËû=  ±£Áô
		Bit1  GO/DONE: AD×ª»»×´Ì¬Î»¡£
			1=  AD×ª»»ÕýÔÚ½øÐÐ¡£½«¸ÃÎ»ÖÃ1Æô¶¯AD×ª»»¡£µ±AD×ª»»Íê³ÉÒÔºó£¬¸ÃÎ»ÓÉÓ²¼þ×Ô¶¯ÇåÁã¡£
				µ±GO/DONEÎ»´Ó1±ä0»òADIF´Ó0±ä1Ê±£¬ÐèÖÁÉÙµÈ´ýÁ½¸öTADÊ±¼ä£¬²ÅÄÜÔÙ´ÎÆô¶¯AD×ª»»¡£
			0=  AD×ª»»Íê³É/»ò²»ÔÚ½øÐÐÖÐ¡£
		Bit0  ADON:  ADCÊ¹ÄÜÎ»¡£
			1=  Ê¹ÄÜADC£»
			0=  ½ûÖ¹ADC£¬²»ÏûºÄ¹¤×÷µçÁ÷¡£
	*********************************************/
	ADCON0 = 0X41;		//ADON¿ªÆô£¬AD²ÉÑùÊ±¼äÑ¡ÎªFSYS/32
	
	/*********** ADCON1 ****************************
		Bit7  ADFM:  AD×ª»»½á¹û¸ñÊ½Ñ¡ÔñÎ»£»
			1=  ÓÒ¶ÔÆë£»
			0=  ×ó¶ÔÆë¡£
		Bit6  CHS4:  Í¨µÀÑ¡ÔñÎ»
		Bit5~Bit3  Î´ÓÃ 
		Bit2  LDO_EN:  ÄÚ²¿²Î¿¼µçÑ¹Ê¹ÄÜÎ»¡£
			1=  Ê¹ÄÜADCÄÚ²¿LDO²Î¿¼µçÑ¹£»
				µ±Ñ¡ÔñÄÚ²¿LDO×÷²Î¿¼µçÑ¹Ê±£¬ADC×î´óÓÐÐ§¾«¶ÈÎª8Î»¡£
			0=  VDD×÷ÎªADC²Î¿¼µçÑ¹¡£
		Bit1~Bit0  LDO_SEL<1:0>:  ²Î¿¼µçÑ¹Ñ¡ÔñÎ»
			0X=  2.0V
			10=  2.4V
			11=  3.0V
	*********************************************/
	ADCON1 = 0;
}

/**********************************************************
º¯ÊýÃû³Æ£ºAD_Sample
º¯Êý¹¦ÄÜ£ºAD¼ì²â
Èë¿Ú²ÎÊý£ºadch - ¼ì²âÍ¨µÀ
³ö¿Ú²ÎÊý£ºÎÞ
±¸    ×¢£º²ÉÑùÍ¨µÀÐè×ÔÐÐÉèÖÃÎªÊäÈë¿Ú
	      ²ÉÑù10´Î,È¡ÖÐ¼ä°Ë´ÎµÄÆ½¾ùÖµÎª²ÉÑù½á¹û´æÓÚadresultÖÐ

	      adch ÎªÊäÈëADÍ¨µÀ 0-15£¬31
             31  ¼ì²âÄÚ²¿1.2V
	
 		  adldo =5,¿ªÆôÄÚ²¿LDO 2V ×÷ÎªADC ²Î¿¼
 		  adldo =6,¿ªÆôÄÚ²¿LDO 2.4V ×÷ÎªADC ²Î¿¼
		  adldo =7,¿ªÆôÄÚ²¿LDO 3V ×÷ÎªADC ²Î¿¼
 		  adldo =0,VDD ×÷ÎªADC ²Î¿¼
 		  AD×ª»»½á¹û×ó¶ÔÆë
 		  ADC²Î¿¼µçÑ¹´ÓVDDÇÐ»»µ½LDOÊ±ÐèÒªÑÓÊ±100usÒÔÉÏ£¬²ÅÄÜ½øÐÐAD×ª»»
**********************************************************/
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo) 
{
	volatile unsigned long adsum = 0;
	volatile unsigned int admin = 0, admax = 0;
	volatile unsigned int ad_temp = 0;

	if ((!LDO_EN) && (adldo & 0x04) ) 
	{
								//Èç¹ûAD²Î¿¼´ÓVDD»»µ½ÄÚ²¿LDO£¬ÐèÒªÑÓÊ±100USÒÔÉÏ
		ADCON1 = adldo;			//×ó¶ÔÆë,ADÖµÈ¡12Î»
		__delay_us(100);		//IDEÄÚÖÃÑÓÊ±º¯Êý£¬ÑÓÊ±100us
	} 
	else
		ADCON1 = adldo;			//Èç¹ûADCON1.7(ADFM)=1ÎªÓÒ¶ÔÆë£¬,ADÖµÈ¡10Î»

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
		ADCON0 = (unsigned char)(0X41 | (adch << 2));	//16·ÖÆµ£¬Èç¹ûÖ÷ÆµÎª16M£¬Ôò±ØÐëÑ¡16·ÖÆµ»òÒÔÉÏ
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");				//Ñ¡ÔñÍ¨µÀºóÐèÑÓÊ±1uSÒÔÉÏ
		GODONE = 1;				//¿ªÊ¼×ª»»

		unsigned char j = 0;
		while (GODONE) 
		{
			__delay_us(2);		//ÑÓÊ±2us(±àÒëÆ÷ÄÚÖÃº¯Êý)

			if (0 == (--j))		//ÑÓÊ±0.5msÈÔÃ»ÓÐAD×ª»»½áÊø£¬Ìø³ö³ÌÐò
			return 0;
		}

		ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));	//¼ÆËã12Î»ADÖµ

		if (0 == admax) 
		{
			admax = ad_temp;
			admin = ad_temp;
		} 
		else if (ad_temp > admax)
			admax = ad_temp;				//AD²ÉÑù×î´óÖµ
		else if (ad_temp < admin)
			admin = ad_temp;				//AD²ÉÑù×îÐ¡Öµ

		adsum += ad_temp;
	}
		adsum -= admax;
		if (adsum >= admin)
			adsum -= admin;
		else
			adsum = 0;

		adresult = adsum >> 3;		//8´ÎÆ½¾ùÖµ×÷Îª×îÖÕ½á¹û

		adsum = 0;
		admin = 0;
		admax = 0;
		return 0xA5;
		
}


void main(void)
{
	unsigned char i =0 ;
	
	asm("nop");
	asm("clrwdt");
	OSCCON = 0x72;				//16MHZ,ï¿½Ú²ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÏµÍ³Ê±ï¿½ï¿½,CONFIGï¿½Ø±ï¿½WDTÊ±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ô¿ï¿½ï¿½ï¿½WDTï¿½ï¿½ï¿½ï¿½
	OPTION_REG = 0x00;			//ï¿½ï¿½ï¿½ï¿½TIMER0Ê±ï¿½ä£¬00Îª2ï¿½ï¿½Æµ
	asm("clrwdt");

	
	WPUA = 0B00000000;
	WPDA = 0B00000000;
	
	IOCA = 0B00000000;
	TRISA = 0B00000000;
	
	WPUB = 0B00001000;
	WPDB = 0B00000000;

	IOCB = 0B00000000;
	
	// UART1å¼•è„šé…ç½®: TX=RB3, RX=RB4
	TRISB = 0B00011000;	// RB4(RX1)=1(è¾“å…¥), RB3(TX1)=0(è¾“å‡º), RB2=1(è¾“å…¥)
	
	TXSTA1 =  0B10100000;		// UART1å‘é€ä½¿èƒ½,8ä½æ•°æ®,å¼‚æ­¥æ¨¡å¼,BRGH=1(é«˜é€Ÿ)
	
	TMR0 = 6;					// å®šæ—¶å™¨åˆå§‹å€¼
	T0IF = 0;
	T0IE = 1;					// ä½¿èƒ½Timer0ä¸­æ–­
	
	RCSTA1 =  0B10010000;		// UART1ä½¿èƒ½ä¸²å£,ä½¿èƒ½æŽ¥æ”¶
	SPBRG1 =  103;        		// UART1 9600bps @ 16MHz, BRGH=1
	
	PEIE =1;
	RC1IE =1;					// ä½¿èƒ½UART1æŽ¥æ”¶ä¸­æ–­
	GIE =1;
	
	GIE = 1;					//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ð¶ï¿½
	gpio_init();
	AD_Init();
	// å‘é€æµ‹è¯•æ¶ˆæ¯ï¼ˆåªå‘é€ä¸€æ¬¡ï¼Œç®€çŸ­ï¼‰
	TXREG1 = 0x55;

	while(TRMT1==0);
	 TXREG1 =0xaa;

	while(TRMT1 == 0);
	
	while(1)
	{
		asm("clrwdt");
		
		if(RXOK_f==1)
		{
			// å›žæ˜¾æŽ¥æ”¶åˆ°çš„æ•°æ®ï¼ˆç®€çŸ­å¤„ç†ï¼‰
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
ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ£ï¿½Interrupt_Isr
ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü£ï¿½ï¿½Ð¶Ï·ï¿½ï¿½ï¿½(Timer0 + UART)
ï¿½ï¿½Ú²ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
ï¿½ï¿½Ú²ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
ï¿½ï¿½×¢ï¿½ï¿½: SC8051æž¶æž„ä¸­æ‰€æœ‰ä¸­æ–­å…±äº«åŒä¸€å‘é‡,éœ€åœ¨æ­¤å‡½æ•°ä¸­ç»Ÿä¸€å¤„ç†
************************************************/
void interrupt Interrupt_Isr(void)
{
	// Timer0ä¸­æ–­å¤„ç†
	if(T0IF)
	{
		TMR0 += 6;			//TMR0ï¿½ï¿½ï¿½ï¿½ï¿½Ô¶ï¿½ï¿½ï¿½Öµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½TMR0ï¿½ï¿½Ê±ï¿½ï¿½,TIMEï¿½Ç²ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		T0IF = 0;
		
		PORTB ^= 0XFF;
		timer_cnt ++;
	}
	
	// UART1æŽ¥æ”¶ä¸­æ–­å¤„ç†
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
	
	// å®šæ—¶å™¨è®¡æ•°å¤„ç†(æ”¾åœ¨æ‰€æœ‰ä¸­æ–­æ ‡å¿—æ¸…é™¤ä¹‹åŽ)
	if(timer_cnt > 8000)
	{
		timer_cnt = 0;
		control_test_io((level++)%2);

		TXREG1 = 'A';
		while(TRMT1 == 0);
	}
}