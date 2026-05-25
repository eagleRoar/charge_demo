opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096
opt include "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\sc8f096.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 13 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
INDF EQU 00H ;# 
# 20 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
OPTION_REG EQU 01H ;# 
# 27 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PCL EQU 02H ;# 
# 34 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
STATUS EQU 03H ;# 
# 41 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
FSR EQU 04H ;# 
# 48 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TRISB EQU 05H ;# 
# 55 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PORTB EQU 06H ;# 
# 62 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPDB EQU 07H ;# 
# 69 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPUB EQU 08H ;# 
# 76 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IOCB EQU 09H ;# 
# 83 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PCLATH EQU 0AH ;# 
# 90 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
INTCON EQU 0BH ;# 
# 97 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
QCCON EQU 0CH ;# 
# 104 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PIR1 EQU 0DH ;# 
# 111 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PIE1 EQU 0EH ;# 
# 118 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CMP1CON0 EQU 0FH ;# 
# 125 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CMP1CON1 EQU 10H ;# 
# 132 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PR2 EQU 11H ;# 
# 139 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TMR2 EQU 12H ;# 
# 146 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
T2CON EQU 13H ;# 
# 153 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
OSCCON EQU 14H ;# 
# 160 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMCON0 EQU 15H ;# 
# 167 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMCON1 EQU 16H ;# 
# 174 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMTL EQU 17H ;# 
# 181 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMTH EQU 18H ;# 
# 188 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMD0L EQU 19H ;# 
# 195 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMD1L EQU 1AH ;# 
# 202 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMD4L EQU 1BH ;# 
# 209 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMT4L EQU 1CH ;# 
# 216 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMCON2 EQU 1DH ;# 
# 223 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMDH EQU 1EH ;# 
# 230 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWM01DT EQU 1FH ;# 
# 237 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TMR0 EQU 81H ;# 
# 244 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TRISA EQU 85H ;# 
# 251 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PORTA EQU 86H ;# 
# 258 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPDA EQU 87H ;# 
# 265 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPUA EQU 88H ;# 
# 272 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IOCA EQU 89H ;# 
# 279 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ANSEL3 EQU 8CH ;# 
# 286 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EECON1 EQU 8DH ;# 
# 293 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EECON2 EQU 8EH ;# 
# 300 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EEDAT EQU 8FH ;# 
# 307 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EEDATH EQU 90H ;# 
# 314 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EEADR EQU 91H ;# 
# 321 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
EEADRH EQU 92H ;# 
# 328 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ANSEL0 EQU 93H ;# 
# 335 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ANSEL1 EQU 94H ;# 
# 342 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ADCON0 EQU 95H ;# 
# 349 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ADCON1 EQU 96H ;# 
# 356 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ADRESL EQU 98H ;# 
# 363 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ADRESH EQU 99H ;# 
# 370 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CMP2CON0 EQU 9AH ;# 
# 377 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMD2L EQU 9BH ;# 
# 384 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWMD3L EQU 9CH ;# 
# 391 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PWM23DT EQU 9DH ;# 
# 398 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SEGEN0 EQU 9EH ;# 
# 405 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CMP2CON1 EQU 9FH ;# 
# 412 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TRISC EQU 105H ;# 
# 419 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PORTC EQU 106H ;# 
# 426 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PORTD EQU 107H ;# 
# 433 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPUC EQU 108H ;# 
# 440 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
ANSEL2 EQU 109H ;# 
# 447 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TMR1L EQU 10CH ;# 
# 454 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TMR1H EQU 10DH ;# 
# 461 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
T1CON EQU 10EH ;# 
# 468 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PIR2 EQU 10FH ;# 
# 475 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PIE2 EQU 110H ;# 
# 482 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
KEYCON0 EQU 111H ;# 
# 489 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
KEYCON1 EQU 112H ;# 
# 496 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
KEYCON2 EQU 113H ;# 
# 503 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TRISD EQU 114H ;# 
# 510 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
WPUD EQU 115H ;# 
# 517 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
KEYDATAL EQU 116H ;# 
# 524 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
KEYDATAH EQU 117H ;# 
# 531 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TXSTA0 EQU 118H ;# 
# 538 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
RCSTA0 EQU 119H ;# 
# 545 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SPBRG0 EQU 11AH ;# 
# 552 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TXREG0 EQU 11BH ;# 
# 559 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
RCREG0 EQU 11CH ;# 
# 566 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LCDCON0 EQU 11DH ;# 
# 573 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LCDCON1 EQU 11EH ;# 
# 580 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SEGEN1 EQU 11FH ;# 
# 587 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SEGEN2 EQU 181H ;# 
# 594 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TXSTA1 EQU 185H ;# 
# 601 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
RCSTA1 EQU 186H ;# 
# 608 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
TXREG1 EQU 187H ;# 
# 615 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
RCREG1 EQU 188H ;# 
# 622 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SPBRG1 EQU 189H ;# 
# 629 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
OPACON EQU 18CH ;# 
# 636 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
OPAADJ EQU 18DH ;# 
# 643 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LEDCTR0 EQU 18EH ;# 
# 650 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LEDCTR1 EQU 18FH ;# 
# 657 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IICCON EQU 190H ;# 
# 664 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IICCON2 EQU 191H ;# 
# 671 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IICSTAT EQU 192H ;# 
# 678 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IICBUF EQU 193H ;# 
# 685 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
IICADD EQU 194H ;# 
# 692 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CC0CON EQU 195H ;# 
# 699 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
CC1CON EQU 196H ;# 
# 706 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PDCON0 EQU 197H ;# 
# 713 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PDCON1 EQU 198H ;# 
# 720 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PDADD EQU 199H ;# 
# 727 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PDRDATA EQU 19AH ;# 
# 734 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
PDSDATA EQU 19BH ;# 
# 741 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LCDADD EQU 19CH ;# 
# 748 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
LCDDATA EQU 19DH ;# 
# 755 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
COMEN EQU 19EH ;# 
# 762 "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\include\SC8F096.h"
SEGEN3 EQU 19FH ;# 
	FNCALL	_main,_AD_Init
	FNCALL	_main,_Adc_Test
	FNCALL	_main,_gpio_init
	FNCALL	_Adc_Test,_ADC_Sample
	FNCALL	_Adc_Test,___ftdiv
	FNCALL	_Adc_Test,___fttol
	FNCALL	_Adc_Test,___lwtoft
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNROOT	_main
	FNCALL	_Interrupt_Isr,_control_test_io
	FNCALL	_Interrupt_Isr,_uart_send_number
	FNCALL	_Interrupt_Isr,_uart_send_string
	FNCALL	_uart_send_string,_uart_send_char
	FNCALL	_uart_send_number,___lwdiv
	FNCALL	_uart_send_number,___lwmod
	FNCALL	_uart_send_number,_uart_send_char
	FNCALL	_control_test_io,_test_io_high
	FNCALL	_control_test_io,_test_io_low
	FNCALL	intlevel1,_Interrupt_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	uart_send_number@F1331
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	323

;initializer for uart_send_number@F1331
	retlw	030h
	retlw	low(0)
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_level
	global	_timer_cnt
	global	_power_ad
	global	_result
	global	Interrupt_Isr@RxNum
	global	_test_adc
	global	_adresult
	global	_RXOK_f
	global	_RxTable
	global	_OSCCON
_OSCCON	set	20
	global	_IOCB
_IOCB	set	9
	global	_WPUB
_WPUB	set	8
	global	_WPDB
_WPDB	set	7
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	5
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_GIE
_GIE	set	0x5F
	global	_PEIE
_PEIE	set	0x5E
	global	_T0IE
_T0IE	set	0x5D
	global	_T0IF
_T0IF	set	0x5A
	global	_TRISB7
_TRISB7	set	0x2F
	global	_ADRESH
_ADRESH	set	153
	global	_ADRESL
_ADRESL	set	152
	global	_ADCON1
_ADCON1	set	150
	global	_ADCON0
_ADCON0	set	149
	global	_ANSEL1
_ANSEL1	set	148
	global	_IOCA
_IOCA	set	137
	global	_WPUA
_WPUA	set	136
	global	_WPDA
_WPDA	set	135
	global	_PORTA
_PORTA	set	134
	global	_TRISA
_TRISA	set	133
	global	_TMR0
_TMR0	set	129
	global	_GODONE
_GODONE	set	0x4A9
	global	_CHS4
_CHS4	set	0x4B6
	global	_LDO_EN
_LDO_EN	set	0x4B2
	global	_RC1IF
_RC1IF	set	0x878
	global	_RC1IE
_RC1IE	set	0x880
	global	_CC1CON
_CC1CON	set	406
	global	_CC0CON
_CC0CON	set	405
	global	_SPBRG1
_SPBRG1	set	393
	global	_RCREG1
_RCREG1	set	392
	global	_TXREG1
_TXREG1	set	391
	global	_RCSTA1
_RCSTA1	set	390
	global	_TXSTA1
_TXSTA1	set	389
	global	_TRMT1
_TRMT1	set	0xC29
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	
STR_1:	
	retlw	112	;'p'
	retlw	111	;'o'
	retlw	119	;'w'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	95	;'_'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_2:	
	retlw	13
	retlw	10
	retlw	0
psect	strings
; #config settings
	file	"SC8P096_timer_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssBANK0,class=BANK0,bit,space=1,noexec
global __pbitbssBANK0
__pbitbssBANK0:
_RXOK_f:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_level:
       ds      2

_timer_cnt:
       ds      2

_power_ad:
       ds      2

_result:
       ds      2

Interrupt_Isr@RxNum:
       ds      1

_test_adc:
       ds      1

_adresult:
       ds      2

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	323
uart_send_number@F1331:
       ds      6

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_RxTable:
       ds      10

	file	"SC8P096_timer_C.as"
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	line	#
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 5	;RP0=1, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
	clrf	((__pbssBANK1)+2)&07Fh
	clrf	((__pbssBANK1)+3)&07Fh
	clrf	((__pbssBANK1)+4)&07Fh
	clrf	((__pbssBANK1)+5)&07Fh
	clrf	((__pbssBANK1)+6)&07Fh
	clrf	((__pbssBANK1)+7)&07Fh
	clrf	((__pbssBANK1)+8)&07Fh
	clrf	((__pbssBANK1)+9)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 5	;RP0=0, select bank0
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssBANK0/8)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_gpio_init:	; 1 bytes @ 0x0
?_test_io_high:	; 1 bytes @ 0x0
??_test_io_high:	; 1 bytes @ 0x0
?_test_io_low:	; 1 bytes @ 0x0
??_test_io_low:	; 1 bytes @ 0x0
?_control_test_io:	; 1 bytes @ 0x0
?_AD_Init:	; 1 bytes @ 0x0
?_Adc_Test:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_uart_send_char:	; 1 bytes @ 0x0
??_uart_send_char:	; 1 bytes @ 0x0
?_uart_send_string:	; 1 bytes @ 0x0
?_Interrupt_Isr:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	uart_send_char@c
uart_send_char@c:	; 1 bytes @ 0x0
	global	control_test_io@flag
control_test_io@flag:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
??_uart_send_string:	; 1 bytes @ 0x1
	global	uart_send_string@str
uart_send_string@str:	; 1 bytes @ 0x1
	ds	1
??_control_test_io:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
??___lwdiv:	; 1 bytes @ 0x4
??___lwmod:	; 1 bytes @ 0x4
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
?_uart_send_number:	; 1 bytes @ 0x7
	global	uart_send_number@num
uart_send_number@num:	; 2 bytes @ 0x7
	ds	2
??_uart_send_number:	; 1 bytes @ 0x9
??_Interrupt_Isr:	; 1 bytes @ 0x9
	ds	4
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	uart_send_number@buf
uart_send_number@buf:	; 6 bytes @ 0x0
	ds	6
	global	uart_send_number@i
uart_send_number@i:	; 1 bytes @ 0x6
	ds	1
	global	uart_send_number@j
uart_send_number@j:	; 1 bytes @ 0x7
	ds	1
??_gpio_init:	; 1 bytes @ 0x8
??_AD_Init:	; 1 bytes @ 0x8
?_ADC_Sample:	; 1 bytes @ 0x8
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x8
	global	ADC_Sample@adldo
ADC_Sample@adldo:	; 1 bytes @ 0x8
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x8
	ds	1
??_ADC_Sample:	; 1 bytes @ 0x9
	ds	2
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0xB
	ds	1
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0xC
	ds	1
??___ftpack:	; 1 bytes @ 0xD
	global	ADC_Sample@j
ADC_Sample@j:	; 1 bytes @ 0xD
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0xE
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0xF
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x10
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x10
	global	ADC_Sample@adsum
ADC_Sample@adsum:	; 4 bytes @ 0x10
	ds	3
??___lwtoft:	; 1 bytes @ 0x13
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x13
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x13
	ds	1
	global	ADC_Sample@admin
ADC_Sample@admin:	; 2 bytes @ 0x14
	ds	2
	global	ADC_Sample@admax
ADC_Sample@admax:	; 2 bytes @ 0x16
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x16
	ds	2
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0x18
	ds	1
??___ftdiv:	; 1 bytes @ 0x19
	ds	3
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x1C
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x1D
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x20
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x21
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x22
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x22
	ds	4
??___fttol:	; 1 bytes @ 0x26
	ds	3
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x29
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x2A
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x2E
	ds	1
??_Adc_Test:	; 1 bytes @ 0x2F
	ds	1
	global	Adc_Test@power_temp
Adc_Test@power_temp:	; 4 bytes @ 0x30
	ds	4
??_main:	; 1 bytes @ 0x34
	global	main@i
main@i:	; 1 bytes @ 0x34
	ds	1
;!
;!Data Sizes:
;!    Strings     14
;!    Constant    0
;!    Data        6
;!    BSS         22
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     13      13
;!    BANK0            80     53      72
;!    BANK1            80      0      10
;!    BANK3            80      0       0
;!    BANK2            80      0       0

;!
;!Pointer List with Targets:
;!
;!    uart_send_string@str	PTR unsigned char  size(1) Largest target is 11
;!		 -> STR_2(CODE[3]), STR_1(CODE[11]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in COMMON
;!
;!    _Interrupt_Isr->_uart_send_number
;!    _uart_send_string->_uart_send_char
;!    _uart_send_number->___lwdiv
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_Adc_Test
;!    _Adc_Test->___fttol
;!    ___lwtoft->___ftpack
;!    ___fttol->___ftdiv
;!    ___ftdiv->___lwtoft
;!
;!Critical Paths under _Interrupt_Isr in BANK0
;!
;!    _Interrupt_Isr->_uart_send_number
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 1     1      0    6032
;!                                             52 BANK0      1     1      0
;!                            _AD_Init
;!                           _Adc_Test
;!                          _gpio_init
;! ---------------------------------------------------------------------------------
;! (1) _gpio_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Adc_Test                                             5     5      0    5930
;!                                             47 BANK0      5     5      0
;!                         _ADC_Sample
;!                            ___ftdiv
;!                            ___fttol
;!                           ___lwtoft
;! ---------------------------------------------------------------------------------
;! (2) ___lwtoft                                             3     0      3    2044
;!                                             16 BANK0      3     0      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             13     9      4     436
;!                                             34 BANK0     13     9      4
;!                            ___ftdiv (ARG)
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___ftdiv                                             15     9      6    2504
;!                                             19 BANK0     15     9      6
;!                           ___ftpack
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___ftpack                                             8     3      5    1948
;!                                              8 BANK0      8     3      5
;! ---------------------------------------------------------------------------------
;! (2) _ADC_Sample                                          18    17      1     912
;!                                              8 BANK0     18    17      1
;! ---------------------------------------------------------------------------------
;! (1) _AD_Init                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _Interrupt_Isr                                        4     4      0    1480
;!                                              9 COMMON     4     4      0
;!                    _control_test_io
;!                   _uart_send_number
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (5) _uart_send_string                                     1     1      0     156
;!                                              1 COMMON     1     1      0
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (5) _uart_send_number                                    10     8      2    1197
;!                                              7 COMMON     2     0      2
;!                                              0 BANK0      8     8      0
;!                            ___lwdiv
;!                            ___lwmod
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (6) _uart_send_char                                       1     1      0      31
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (6) ___lwmod                                              5     1      4     362
;!                                              0 COMMON     5     1      4
;! ---------------------------------------------------------------------------------
;! (6) ___lwdiv                                              7     3      4     371
;!                                              0 COMMON     7     3      4
;! ---------------------------------------------------------------------------------
;! (5) _control_test_io                                      2     0      2     127
;!                                              0 COMMON     2     0      2
;!                       _test_io_high
;!                        _test_io_low
;! ---------------------------------------------------------------------------------
;! (6) _test_io_low                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (6) _test_io_high                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _AD_Init
;!   _Adc_Test
;!     _ADC_Sample
;!     ___ftdiv
;!       ___ftpack
;!       ___lwtoft (ARG)
;!         ___ftpack
;!     ___fttol
;!       ___ftdiv (ARG)
;!         ___ftpack
;!         ___lwtoft (ARG)
;!           ___ftpack
;!       ___lwtoft (ARG)
;!         ___ftpack
;!     ___lwtoft
;!       ___ftpack
;!   _gpio_init
;!
;! _Interrupt_Isr (ROOT)
;!   _control_test_io
;!     _test_io_high
;!     _test_io_low
;!   _uart_send_number
;!     ___lwdiv
;!     ___lwmod
;!     _uart_send_char
;!   _uart_send_string
;!     _uart_send_char
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               50      0       0       8        0.0%
;!BITBANK3            50      0       0       7        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               50      0       0      10        0.0%
;!BITBANK2            50      0       0       9        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      0       A       6       12.5%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     35      48       4       90.0%
;!BITBANK0            50      0       1       3        1.3%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      D       D       1       92.9%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      5F      12        0.0%
;!ABS                  0      0      5F      11        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 234 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   52[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AD_Init
;;		_Adc_Test
;;		_gpio_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	234
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	234
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	236
	
l1834:	
	line	238
# 238 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
	line	239
# 239 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	line	240
	
l1836:	
;SC8P096_Timer0_C.c: 240: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	241
	
l1838:	
;SC8P096_Timer0_C.c: 241: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	242
# 242 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	line	245
	
l1840:	
;SC8P096_Timer0_C.c: 245: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	246
	
l1842:	
;SC8P096_Timer0_C.c: 246: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	248
	
l1844:	
;SC8P096_Timer0_C.c: 248: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	249
	
l1846:	
;SC8P096_Timer0_C.c: 249: TRISA = 0B00000000;
	clrf	(133)^080h	;volatile
	line	251
;SC8P096_Timer0_C.c: 251: WPUB = 0B00001000;
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	252
	
l1848:	
;SC8P096_Timer0_C.c: 252: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	254
	
l1850:	
;SC8P096_Timer0_C.c: 254: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	257
;SC8P096_Timer0_C.c: 257: TRISB = 0B00011000;
	movlw	low(018h)
	movwf	(5)	;volatile
	line	259
;SC8P096_Timer0_C.c: 259: TXSTA1 = 0B10100000;
	movlw	low(0A0h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(389)^0180h	;volatile
	line	261
;SC8P096_Timer0_C.c: 261: TMR0 = 6;
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	262
	
l1852:	
;SC8P096_Timer0_C.c: 262: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	263
	
l1854:	
;SC8P096_Timer0_C.c: 263: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	265
;SC8P096_Timer0_C.c: 265: RCSTA1 = 0B10010000;
	movlw	low(090h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(390)^0180h	;volatile
	line	266
;SC8P096_Timer0_C.c: 266: SPBRG1 = 103;
	movlw	low(067h)
	movwf	(393)^0180h	;volatile
	line	268
	
l1856:	
;SC8P096_Timer0_C.c: 268: PEIE =1;
	bsf	(94/8),(94)&7	;volatile
	line	269
	
l1858:	
;SC8P096_Timer0_C.c: 269: RC1IE =1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	(2176/8)^0100h,(2176)&7	;volatile
	line	270
	
l1860:	
;SC8P096_Timer0_C.c: 270: GIE =1;
	bsf	(95/8),(95)&7	;volatile
	line	272
	
l1862:	
;SC8P096_Timer0_C.c: 272: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	273
	
l1864:	
;SC8P096_Timer0_C.c: 273: gpio_init();
	fcall	_gpio_init
	line	274
	
l1866:	
;SC8P096_Timer0_C.c: 274: AD_Init();
	fcall	_AD_Init
	line	276
;SC8P096_Timer0_C.c: 276: TXREG1 = 0x55;
	movlw	low(055h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	278
;SC8P096_Timer0_C.c: 278: while(TRMT1==0);
	
l305:	
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u1741
	goto	u1740
u1741:
	goto	l305
u1740:
	line	279
	
l1868:	
;SC8P096_Timer0_C.c: 279: TXREG1 =0xaa;
	movlw	low(0AAh)
	movwf	(391)^0180h	;volatile
	line	281
;SC8P096_Timer0_C.c: 281: while(TRMT1 == 0);
	
l308:	
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u1751
	goto	u1750
u1751:
	goto	l308
u1750:
	line	283
;SC8P096_Timer0_C.c: 283: while(1)
	
l311:	
	line	285
# 285 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	line	287
;SC8P096_Timer0_C.c: 287: if(RXOK_f==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RXOK_f/8),(_RXOK_f)&7
	goto	u1761
	goto	u1760
u1761:
	goto	l1882
u1760:
	line	290
	
l1870:	
;SC8P096_Timer0_C.c: 288: {
;SC8P096_Timer0_C.c: 290: for(i=0;i<10;i++)
	clrf	(main@i)
	line	292
	
l315:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u1771
	goto	u1770
u1771:
	goto	l315
u1770:
	line	293
	
l1876:	
;SC8P096_Timer0_C.c: 293: TXREG1 = RxTable[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	290
	
l1878:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@i),f
	
l1880:	
	movlw	low(0Ah)
	subwf	(main@i),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l315
u1780:
	
l314:	
	line	295
;SC8P096_Timer0_C.c: 294: }
;SC8P096_Timer0_C.c: 295: RXOK_f = 0;
	bcf	(_RXOK_f/8),(_RXOK_f)&7
	line	298
	
l1882:	
;SC8P096_Timer0_C.c: 296: }
;SC8P096_Timer0_C.c: 298: Adc_Test();
	fcall	_Adc_Test
	goto	l311
	global	start
	ljmp	start
	opt stack 0
	line	300
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_gpio_init

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	32
global __ptext1
__ptext1:	;psect for function _gpio_init
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
;incstack = 0
	opt	stack 4
; Regs used in _gpio_init: [wreg]
	line	35
	
l1758:	
;SC8P096_Timer0_C.c: 35: TRISA = 0B11111110;
	movlw	low(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	36
;SC8P096_Timer0_C.c: 36: PORTA = 0B0000001;
	movlw	low(01h)
	movwf	(134)^080h	;volatile
	line	37
	
l259:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
	signat	_gpio_init,89
	global	_Adc_Test

;; *************** function _Adc_Test *****************
;; Defined at:
;;		line 202 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  power_temp      4   48[BANK0 ] volatile unsigned long 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ADC_Sample
;;		___ftdiv
;;		___fttol
;;		___lwtoft
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	202
global __ptext2
__ptext2:	;psect for function _Adc_Test
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	202
	global	__size_of_Adc_Test
	__size_of_Adc_Test	equ	__end_of_Adc_Test-_Adc_Test
	
_Adc_Test:	
;incstack = 0
	opt	stack 2
; Regs used in _Adc_Test: [wreg+status,2+status,0+pclath+cstack]
	line	204
	
l1772:	
;SC8P096_Timer0_C.c: 204: TRISB7 = 1;
	bsf	(47/8),(47)&7	;volatile
	line	205
;SC8P096_Timer0_C.c: 205: ANSEL1 |= 0X80;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(148)^080h+(7/8),(7)&7	;volatile
	line	206
	
l1774:	
;SC8P096_Timer0_C.c: 206: test_adc = ADC_Sample(15, 7);
	movlw	low(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(ADC_Sample@adldo)
	movlw	low(0Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	207
	
l1776:	
;SC8P096_Timer0_C.c: 207: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u1681
	goto	u1680
u1681:
	goto	l1780
u1680:
	goto	l1784
	line	213
	
l1780:	
;SC8P096_Timer0_C.c: 211: else
;SC8P096_Timer0_C.c: 212: {
;SC8P096_Timer0_C.c: 213: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	214
;SC8P096_Timer0_C.c: 214: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	215
	
l1782:	
;SC8P096_Timer0_C.c: 215: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Adc_Test+0)+0),f
	u1847:
decfsz	(??_Adc_Test+0)+0,f
	goto	u1847
	nop
opt asmopt_pop

	line	218
	
l1784:	
;SC8P096_Timer0_C.c: 216: }
;SC8P096_Timer0_C.c: 218: test_adc = ADC_Sample(31, 0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	219
	
l1786:	
;SC8P096_Timer0_C.c: 219: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u1691
	goto	u1690
u1691:
	goto	l1792
u1690:
	line	223
	
l1788:	
;SC8P096_Timer0_C.c: 220: {
;SC8P096_Timer0_C.c: 221: volatile unsigned long power_temp;
;SC8P096_Timer0_C.c: 223: power_temp = (unsigned long)(((4096UL*1.2*1000))/adresult);
	movlw	0x0
	movwf	(___ftdiv@f1)
	movlw	0x96
	movwf	(___ftdiv@f1+1)
	movlw	0x4a
	movwf	(___ftdiv@f1+2)
	movf	(_adresult+1),w	;volatile
	movwf	(___lwtoft@c+1)
	movf	(_adresult),w	;volatile
	movwf	(___lwtoft@c)
	fcall	___lwtoft
	movf	(0+(?___lwtoft)),w
	movwf	(___ftdiv@f2)
	movf	(1+(?___lwtoft)),w
	movwf	(___ftdiv@f2+1)
	movf	(2+(?___lwtoft)),w
	movwf	(___ftdiv@f2+2)
	fcall	___ftdiv
	movf	(0+(?___ftdiv)),w
	movwf	(___fttol@f1)
	movf	(1+(?___ftdiv)),w
	movwf	(___fttol@f1+1)
	movf	(2+(?___ftdiv)),w
	movwf	(___fttol@f1+2)
	fcall	___fttol
	movf	(3+(?___fttol)),w
	movwf	(Adc_Test@power_temp+3)	;volatile
	movf	(2+(?___fttol)),w
	movwf	(Adc_Test@power_temp+2)	;volatile
	movf	(1+(?___fttol)),w
	movwf	(Adc_Test@power_temp+1)	;volatile
	movf	(0+(?___fttol)),w
	movwf	(Adc_Test@power_temp)	;volatile

	line	224
	
l1790:	
;SC8P096_Timer0_C.c: 224: power_ad = (unsigned int)(power_temp);
	movf	(Adc_Test@power_temp+1),w	;volatile
	movwf	(_power_ad+1)	;volatile
	movf	(Adc_Test@power_temp),w	;volatile
	movwf	(_power_ad)	;volatile
	line	225
;SC8P096_Timer0_C.c: 225: }
	goto	l300
	line	228
	
l1792:	
;SC8P096_Timer0_C.c: 226: else
;SC8P096_Timer0_C.c: 227: {
;SC8P096_Timer0_C.c: 228: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	229
;SC8P096_Timer0_C.c: 229: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	230
	
l1794:	
;SC8P096_Timer0_C.c: 230: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Adc_Test+0)+0),f
	u1857:
decfsz	(??_Adc_Test+0)+0,f
	goto	u1857
	nop
opt asmopt_pop

	line	232
	
l300:	
	return
	opt stack 0
GLOBAL	__end_of_Adc_Test
	__end_of_Adc_Test:
	signat	_Adc_Test,89
	global	___lwtoft

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 28 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   16[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   16[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_Adc_Test
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
global __ptext3
__ptext3:	;psect for function ___lwtoft
psect	text3
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l1754:	
	movf	(___lwtoft@c),w
	movwf	(___ftpack@arg)
	movf	(___lwtoft@c+1),w
	movwf	(___ftpack@arg+1)
	clrf	(___ftpack@arg+2)
	movlw	low(08Eh)
	movwf	(___ftpack@exp)
	clrf	(___ftpack@sign)
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	line	31
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
	signat	___lwtoft,4219
	global	___fttol

;; *************** function ___fttol *****************
;; Defined at:
;;		line 44 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3   34[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   42[BANK0 ] unsigned long 
;;  exp1            1   46[BANK0 ] unsigned char 
;;  sign1           1   41[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   34[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Adc_Test
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
global __ptext4
__ptext4:	;psect for function ___fttol
psect	text4
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
;incstack = 0
	opt	stack 3
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l1668:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(___fttol@exp1)
	movf	(((___fttol@exp1))),w
	btfss	status,2
	goto	u1511
	goto	u1510
u1511:
	goto	l1672
u1510:
	line	50
	
l1670:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l607
	line	51
	
l1672:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u1525:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u1520:
	addlw	-1
	skipz
	goto	u1525
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l1674:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l1676:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l1678:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l1680:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
l1682:	
	btfss	(___fttol@exp1),7
	goto	u1531
	goto	u1530
u1531:
	goto	l1692
u1530:
	line	57
	
l1684:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u1541
	goto	u1540
u1541:
	goto	l1688
u1540:
	goto	l1670
	line	60
	
l1688:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l1690:	
	incfsz	(___fttol@exp1),f
	goto	u1551
	goto	u1550
u1551:
	goto	l1688
u1550:
	goto	l1700
	line	63
	
l1692:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l1698
u1560:
	goto	l1670
	line	66
	
l1696:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	65
	
l1698:	
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u1571
	goto	u1570
u1571:
	goto	l1696
u1570:
	line	70
	
l1700:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u1581
	goto	u1580
u1581:
	goto	l1704
u1580:
	line	71
	
l1702:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l1704:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l607:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	___ftdiv

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 56 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   19[BANK0 ] float 
;;  f1              3   22[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   29[BANK0 ] float 
;;  sign            1   33[BANK0 ] unsigned char 
;;  exp             1   32[BANK0 ] unsigned char 
;;  cntr            1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   19[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_Adc_Test
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
global __ptext5
__ptext5:	;psect for function ___ftdiv
psect	text5
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l1628:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@exp)
	movf	(((___ftdiv@exp))),w
	btfss	status,2
	goto	u1471
	goto	u1470
u1471:
	goto	l1632
u1470:
	line	64
	
l1630:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l571
	line	65
	
l1632:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@sign)
	movf	(((___ftdiv@sign))),w
	btfss	status,2
	goto	u1481
	goto	u1480
u1481:
	goto	l572
u1480:
	line	66
	
l1634:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l571
	
l572:	
	line	67
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	68
	
l1636:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
l1638:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(___ftdiv@sign)
	line	70
	
l1640:	
	movf	0+(___ftdiv@f2)+02h,w
	xorwf	(___ftdiv@sign),f
	line	71
	
l1642:	
	movlw	low(080h)
	andwf	(___ftdiv@sign),f
	line	72
	
l1644:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
l1646:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
l1648:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
l1650:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
l1652:	
	movlw	low(018h)
	movwf	(___ftdiv@cntr)
	line	78
	
l1654:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u1495
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u1495
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u1495:
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l1660
u1490:
	line	80
	
l1656:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	81
	
l1658:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
l1660:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	84
	
l1662:	
	decfsz	(___ftdiv@cntr),f
	goto	u1501
	goto	u1500
u1501:
	goto	l1654
u1500:
	line	85
	
l1664:	
	movf	(___ftdiv@f3),w
	movwf	(___ftpack@arg)
	movf	(___ftdiv@f3+1),w
	movwf	(___ftpack@arg+1)
	movf	(___ftdiv@f3+2),w
	movwf	(___ftpack@arg+2)
	movf	(___ftdiv@exp),w
	movwf	(___ftpack@exp)
	movf	(___ftdiv@sign),w
	movwf	(___ftpack@sign)
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	line	86
	
l571:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
	signat	___ftdiv,8315
	global	___ftpack

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 62 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    8[BANK0 ] unsigned um
;;  exp             1   11[BANK0 ] unsigned char 
;;  sign            1   12[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___lwtoft
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
global __ptext6
__ptext6:	;psect for function ___ftpack
psect	text6
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
;incstack = 0
	opt	stack 2
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l1526:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u1231
	goto	u1230
u1231:
	goto	l518
u1230:
	
l1528:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l1532
u1240:
	
l518:	
	line	65
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l519
	line	67
	
l1530:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l1532:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u1251
	goto	u1250
u1251:
	goto	l1530
u1250:
	goto	l1536
	line	71
	
l1534:	
	incf	(___ftpack@exp),f
	line	72
	incf	(___ftpack@arg),f
	skipnz
	incf	(___ftpack@arg+1),f
	skipnz
	incf	(___ftpack@arg+2),f
	line	73
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	70
	
l1536:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u1261
	goto	u1260
u1261:
	goto	l1534
u1260:
	goto	l1540
	line	76
	
l1538:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l1540:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l530
u1270:
	
l1542:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u1281
	goto	u1280
u1281:
	goto	l1538
u1280:
	
l530:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u1291
	goto	u1290
u1291:
	goto	l531
u1290:
	line	80
	
l1544:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l531:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l1546:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0+2)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+0)
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	movf	((___ftpack@sign)),w
	btfsc	status,2
	goto	u1301
	goto	u1300
u1301:
	goto	l532
u1300:
	line	84
	
l1548:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l532:	
	line	85
	line	86
	
l519:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 132 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;;  adldo           1    8[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1   14[BANK0 ] unsigned char 
;;  j               1   13[BANK0 ] unsigned char 
;;  adsum           4   16[BANK0 ] volatile unsigned long 
;;  ad_temp         2   24[BANK0 ] volatile unsigned int 
;;  admax           2   22[BANK0 ] volatile unsigned int 
;;  admin           2   20[BANK0 ] volatile unsigned int 
;;  i               1   15[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0      13       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      18       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Adc_Test
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	132
global __ptext7
__ptext7:	;psect for function _ADC_Sample
psect	text7
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	132
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
;incstack = 0
	opt	stack 3
; Regs used in _ADC_Sample: [wreg+status,2+status,0]
;ADC_Sample@adch stored from wreg
	movwf	(ADC_Sample@adch)
	line	134
	
l1554:	
;SC8P096_Timer0_C.c: 134: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	135
	
l1556:	
;SC8P096_Timer0_C.c: 135: volatile unsigned int admin = 0, admax = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	136
;SC8P096_Timer0_C.c: 136: volatile unsigned int ad_temp = 0;
	clrf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	line	138
	
l1558:	
;SC8P096_Timer0_C.c: 138: if ((!LDO_EN) && (adldo & 0x04) )
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u1311
	goto	u1310
u1311:
	goto	l1564
u1310:
	
l1560:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u1321
	goto	u1320
u1321:
	goto	l1564
u1320:
	line	141
	
l1562:	
;SC8P096_Timer0_C.c: 139: {
;SC8P096_Timer0_C.c: 141: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	142
;SC8P096_Timer0_C.c: 142: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_ADC_Sample+0)+0),f
	u1867:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u1867
	nop
opt asmopt_pop

	line	143
;SC8P096_Timer0_C.c: 143: }
	goto	l1566
	line	145
	
l1564:	
;SC8P096_Timer0_C.c: 144: else
;SC8P096_Timer0_C.c: 145: ADCON1 = adldo;
	bcf	status, 5	;RP0=0, select bank0
	movf	(ADC_Sample@adldo),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	147
	
l1566:	
;SC8P096_Timer0_C.c: 147: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u1331
	goto	u1330
u1331:
	goto	l278
u1330:
	line	149
	
l1568:	
;SC8P096_Timer0_C.c: 148: {
;SC8P096_Timer0_C.c: 149: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	150
	
l1570:	
;SC8P096_Timer0_C.c: 150: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	151
;SC8P096_Timer0_C.c: 151: }
	goto	l1572
	line	152
	
l278:	
	line	153
;SC8P096_Timer0_C.c: 152: else
;SC8P096_Timer0_C.c: 153: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	154
	
l1572:	
;SC8P096_Timer0_C.c: 154: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	155
;SC8P096_Timer0_C.c: 155: for (i = 0; i < 10; i++)
	clrf	(ADC_Sample@i)
	line	157
	
l1578:	
;SC8P096_Timer0_C.c: 156: {
;SC8P096_Timer0_C.c: 157: ADCON0 = (unsigned char)(0X41 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u1345:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u1345
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	158
# 158 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
	line	159
# 159 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
	line	160
# 160 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
	line	161
# 161 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
psect	text7
	line	162
	
l1580:	
;SC8P096_Timer0_C.c: 162: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	164
	
l1582:	
;SC8P096_Timer0_C.c: 164: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	165
;SC8P096_Timer0_C.c: 165: while (GODONE)
	goto	l282
	
l283:	
	line	167
;SC8P096_Timer0_C.c: 166: {
;SC8P096_Timer0_C.c: 167: _delay((unsigned long)((2)*(16000000/4000000.0)));
		opt asmopt_push
	opt asmopt_off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	opt asmopt_pop

	line	169
;SC8P096_Timer0_C.c: 169: if (0 == (--j))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(ADC_Sample@j),f
	goto	u1351
	goto	u1350
u1351:
	goto	l282
u1350:
	line	170
	
l1584:	
;SC8P096_Timer0_C.c: 170: return 0;
	movlw	low(0)
	goto	l285
	line	171
	
l282:	
	line	165
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u1361
	goto	u1360
u1361:
	goto	l283
u1360:
	line	173
	
l1588:	
;SC8P096_Timer0_C.c: 171: }
;SC8P096_Timer0_C.c: 173: ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));
	movf	(153)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	swapf	(ADC_Sample@ad_temp),f	;volatile
	swapf	(ADC_Sample@ad_temp+1),f	;volatile
	movlw	0f0h
	andwf	(ADC_Sample@ad_temp+1),f	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	andlw	0fh
	iorwf	(ADC_Sample@ad_temp+1),f	;volatile
	movlw	0f0h
	andwf	(ADC_Sample@ad_temp),f	;volatile
	
l1590:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	175
	
l1592:	
;SC8P096_Timer0_C.c: 175: if (0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u1371
	goto	u1370
u1371:
	goto	l1596
u1370:
	line	177
	
l1594:	
;SC8P096_Timer0_C.c: 176: {
;SC8P096_Timer0_C.c: 177: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	line	178
;SC8P096_Timer0_C.c: 178: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	179
;SC8P096_Timer0_C.c: 179: }
	goto	l288
	line	180
	
l1596:	
;SC8P096_Timer0_C.c: 180: else if (ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u1385
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u1385:
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l1600
u1380:
	line	181
	
l1598:	
;SC8P096_Timer0_C.c: 181: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	l288
	line	182
	
l1600:	
;SC8P096_Timer0_C.c: 182: else if (ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u1395
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u1395:
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l288
u1390:
	line	183
	
l1602:	
;SC8P096_Timer0_C.c: 183: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	185
	
l288:	
;SC8P096_Timer0_C.c: 185: adsum += ad_temp;
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	addwf	(ADC_Sample@adsum),f	;volatile
	movf	1+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1401
	addwf	(ADC_Sample@adsum+1),f	;volatile
u1401:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1402
	addwf	(ADC_Sample@adsum+2),f	;volatile
u1402:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1403
	addwf	(ADC_Sample@adsum+3),f	;volatile
u1403:

	line	155
	
l1604:	
	incf	(ADC_Sample@i),f
	
l1606:	
	movlw	low(0Ah)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l1578
u1410:
	line	187
	
l1608:	
;SC8P096_Timer0_C.c: 186: }
;SC8P096_Timer0_C.c: 187: adsum -= admax;
	movf	(ADC_Sample@admax),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admax+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),f	;volatile
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u1425
	goto	u1426
u1425:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u1426:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u1427
	goto	u1428
u1427:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u1428:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u1429
	goto	u1420
u1429:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u1420:

	line	188
;SC8P096_Timer0_C.c: 188: if (adsum >= admin)
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+3),w	;volatile
	skipz
	goto	u1435
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u1435
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u1435
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u1435:
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l292
u1430:
	line	189
	
l1610:	
;SC8P096_Timer0_C.c: 189: adsum -= admin;
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),f	;volatile
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u1445
	goto	u1446
u1445:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u1446:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u1447
	goto	u1448
u1447:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u1448:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u1449
	goto	u1440
u1449:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u1440:

	goto	l1612
	line	190
	
l292:	
	line	191
;SC8P096_Timer0_C.c: 190: else
;SC8P096_Timer0_C.c: 191: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	193
	
l1612:	
;SC8P096_Timer0_C.c: 193: adresult = adsum >> 3;
	movf	(ADC_Sample@adsum),w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w	;volatile
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w	;volatile
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u1455:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u1450:
	addlw	-1
	skipz
	goto	u1455
	movf	1+(??_ADC_Sample+0)+0,w
	movwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)	;volatile
	line	195
	
l1614:	
;SC8P096_Timer0_C.c: 195: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	196
	
l1616:	
;SC8P096_Timer0_C.c: 196: admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	197
	
l1618:	
;SC8P096_Timer0_C.c: 197: admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	198
	
l1620:	
;SC8P096_Timer0_C.c: 198: return 0xA5;
	movlw	low(0A5h)
	line	200
	
l285:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,8313
	global	_AD_Init

;; *************** function _AD_Init *****************
;; Defined at:
;;		line 61 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	61
global __ptext8
__ptext8:	;psect for function _AD_Init
psect	text8
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	61
	global	__size_of_AD_Init
	__size_of_AD_Init	equ	__end_of_AD_Init-_AD_Init
	
_AD_Init:	
;incstack = 0
	opt	stack 4
; Regs used in _AD_Init: [wreg+status,2]
	line	63
	
l1766:	
;SC8P096_Timer0_C.c: 63: CC0CON = 0;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(405)^0180h	;volatile
	line	64
;SC8P096_Timer0_C.c: 64: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	94
	
l1768:	
;SC8P096_Timer0_C.c: 94: ADCON0 = 0X41;
	movlw	low(041h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	111
	
l1770:	
;SC8P096_Timer0_C.c: 111: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	112
	
l273:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Init
	__end_of_AD_Init:
	signat	_AD_Init,89
	global	_Interrupt_Isr

;; *************** function _Interrupt_Isr *****************
;; Defined at:
;;		line 348 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_control_test_io
;;		_uart_send_number
;;		_uart_send_string
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	348
global __ptext9
__ptext9:	;psect for function _Interrupt_Isr
psect	text9
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	348
	global	__size_of_Interrupt_Isr
	__size_of_Interrupt_Isr	equ	__end_of_Interrupt_Isr-_Interrupt_Isr
	
_Interrupt_Isr:	
;incstack = 0
	opt	stack 2
; Regs used in _Interrupt_Isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Interrupt_Isr+0)
	movf	fsr0,w
	movwf	(??_Interrupt_Isr+1)
	movf	pclath,w
	movwf	(??_Interrupt_Isr+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_Interrupt_Isr+3)
	ljmp	_Interrupt_Isr
psect	text9
	line	351
	
i1l1884:	
;SC8P096_Timer0_C.c: 351: if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l1892
u179_20:
	line	353
	
i1l1886:	
;SC8P096_Timer0_C.c: 352: {
;SC8P096_Timer0_C.c: 353: TMR0 += 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	addwf	(129)^080h,f	;volatile
	line	354
	
i1l1888:	
;SC8P096_Timer0_C.c: 354: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	356
;SC8P096_Timer0_C.c: 356: PORTB ^= 0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(6),f	;volatile
	line	357
	
i1l1890:	
;SC8P096_Timer0_C.c: 357: timer_cnt ++;
	incf	(_timer_cnt),f
	skipnz
	incf	(_timer_cnt+1),f
	line	361
	
i1l1892:	
;SC8P096_Timer0_C.c: 358: }
;SC8P096_Timer0_C.c: 361: if(RC1IF==1)
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2168/8)^0100h,(2168)&7	;volatile
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l349
u180_20:
	line	365
	
i1l1894:	
;SC8P096_Timer0_C.c: 362: {
;SC8P096_Timer0_C.c: 363: static unsigned char RxNum=0,TEMP;
;SC8P096_Timer0_C.c: 365: RC1IF = 0;
	bcf	(2168/8)^0100h,(2168)&7	;volatile
	line	367
;SC8P096_Timer0_C.c: 367: if(RXOK_f==0)
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(_RXOK_f/8),(_RXOK_f)&7
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l1906
u181_20:
	line	369
	
i1l1896:	
;SC8P096_Timer0_C.c: 368: {
;SC8P096_Timer0_C.c: 369: RxTable[RxNum] = RCREG1;
	movf	(Interrupt_Isr@RxNum),w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	370
	
i1l1898:	
;SC8P096_Timer0_C.c: 370: RxNum++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Interrupt_Isr@RxNum),f
	line	371
	
i1l1900:	
;SC8P096_Timer0_C.c: 371: if(RxNum > 9)
	movlw	low(0Ah)
	subwf	(Interrupt_Isr@RxNum),w
	skipc
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l349
u182_20:
	line	373
	
i1l1902:	
;SC8P096_Timer0_C.c: 372: {
;SC8P096_Timer0_C.c: 373: RxNum =0;
	clrf	(Interrupt_Isr@RxNum)
	line	374
	
i1l1904:	
;SC8P096_Timer0_C.c: 374: RXOK_f =1;
	bsf	(_RXOK_f/8),(_RXOK_f)&7
	goto	i1l349
	line	379
	
i1l1906:	
;SC8P096_Timer0_C.c: 377: else
;SC8P096_Timer0_C.c: 378: {
;SC8P096_Timer0_C.c: 379: TEMP = RCREG1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	line	381
	
i1l349:	
	line	384
;SC8P096_Timer0_C.c: 380: }
;SC8P096_Timer0_C.c: 381: }
;SC8P096_Timer0_C.c: 384: if(timer_cnt > 8000)
	movlw	01Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_timer_cnt+1),w
	movlw	041h
	skipnz
	subwf	(_timer_cnt),w
	skipc
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l358
u183_20:
	line	386
	
i1l1908:	
;SC8P096_Timer0_C.c: 385: {
;SC8P096_Timer0_C.c: 386: timer_cnt = 0;
	clrf	(_timer_cnt)
	clrf	(_timer_cnt+1)
	line	387
	
i1l1910:	
;SC8P096_Timer0_C.c: 387: control_test_io((level++)%2);
	movf	(_level+1),w
	movwf	(control_test_io@flag+1)
	movf	(_level),w
	movwf	(control_test_io@flag)
	movlw	01h
	andwf	(control_test_io@flag),f
	clrf	(control_test_io@flag+1)
	fcall	_control_test_io
	
i1l1912:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(_level),f
	skipnz
	incf	(_level+1),f
	line	390
	
i1l1914:	
;SC8P096_Timer0_C.c: 390: uart_send_string("power_ad: ");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	391
	
i1l1916:	
;SC8P096_Timer0_C.c: 391: uart_send_number(power_ad);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_power_ad+1),w	;volatile
	movwf	(uart_send_number@num+1)
	movf	(_power_ad),w	;volatile
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	392
	
i1l1918:	
;SC8P096_Timer0_C.c: 392: uart_send_string("\r\n");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	394
	
i1l358:	
	movf	(??_Interrupt_Isr+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_Interrupt_Isr+2),w
	movwf	pclath
	movf	(??_Interrupt_Isr+1),w
	movwf	fsr0
	swapf	(??_Interrupt_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Interrupt_Isr
	__end_of_Interrupt_Isr:
	signat	_Interrupt_Isr,89
	global	_uart_send_string

;; *************** function _uart_send_string *****************
;; Defined at:
;;		line 314 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_2(3), STR_1(11), 
;; Auto vars:     Size  Location     Type
;;  str             1    1[COMMON] PTR unsigned char 
;;		 -> STR_2(3), STR_1(11), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_uart_send_char
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	314
global __ptext10
__ptext10:	;psect for function _uart_send_string
psect	text10
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	314
	global	__size_of_uart_send_string
	__size_of_uart_send_string	equ	__end_of_uart_send_string-_uart_send_string
	
_uart_send_string:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_send_string@str stored from wreg
	movwf	(uart_send_string@str)
	line	316
	
i1l1796:	
;SC8P096_Timer0_C.c: 316: while(*str != '\0')
	goto	i1l1802
	line	318
	
i1l1798:	
;SC8P096_Timer0_C.c: 317: {
;SC8P096_Timer0_C.c: 318: uart_send_char(*str++);
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_send_char
	
i1l1800:	
	incf	(uart_send_string@str),f
	line	316
	
i1l1802:	
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0
	skipz
	goto	u170_21
	goto	u170_20
u170_21:
	goto	i1l1798
u170_20:
	line	320
	
i1l332:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_string
	__end_of_uart_send_string:
	signat	_uart_send_string,4217
	global	_uart_send_number

;; *************** function _uart_send_number *****************
;; Defined at:
;;		line 322 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;  num             2    7[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  buf             6    0[BANK0 ] unsigned char [6]
;;  j               1    7[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       8       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_uart_send_char
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	322
global __ptext11
__ptext11:	;psect for function _uart_send_number
psect	text11
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	322
	global	__size_of_uart_send_number
	__size_of_uart_send_number	equ	__end_of_uart_send_number-_uart_send_number
	
_uart_send_number:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	324
	
i1l1804:	
;SC8P096_Timer0_C.c: 324: unsigned char buf[6] = "0";
	movlw	(uart_send_number@buf)&0ffh
	movwf	fsr0
	movf	(uart_send_number@F1331),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(uart_send_number@F1331)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(uart_send_number@F1331)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(uart_send_number@F1331)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(uart_send_number@F1331)+4,w
	movwf	indf
	incf	fsr0,f
	movf	(uart_send_number@F1331)+5,w
	movwf	indf
	line	325
	
i1l1806:	
;SC8P096_Timer0_C.c: 325: unsigned char i = 0;
	clrf	(uart_send_number@i)
	line	328
	
i1l1808:	
;SC8P096_Timer0_C.c: 326: unsigned char j;
;SC8P096_Timer0_C.c: 328: if(num == 0)
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u171_21
	goto	u171_20
u171_21:
	goto	i1l1820
u171_20:
	line	330
	
i1l1810:	
;SC8P096_Timer0_C.c: 329: {
;SC8P096_Timer0_C.c: 330: uart_send_char('0');
	movlw	low(030h)
	fcall	_uart_send_char
	goto	i1l338
	line	337
	
i1l1814:	
;SC8P096_Timer0_C.c: 336: {
;SC8P096_Timer0_C.c: 337: buf[i++] = '0' + (num % 10);
	movf	(uart_send_number@i),w
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	movlw	0Ah
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(uart_send_number@num+1),w
	movwf	(___lwmod@dividend+1)
	movf	(uart_send_number@num),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l1816:	
	incf	(uart_send_number@i),f
	line	338
	
i1l1818:	
;SC8P096_Timer0_C.c: 338: num /= 10;
	movlw	0Ah
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(uart_send_number@num+1),w
	movwf	(___lwdiv@dividend+1)
	movf	(uart_send_number@num),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(uart_send_number@num+1)
	movf	(0+(?___lwdiv)),w
	movwf	(uart_send_number@num)
	line	335
	
i1l1820:	
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l1814
u172_20:
	line	342
	
i1l1822:	
;SC8P096_Timer0_C.c: 339: }
;SC8P096_Timer0_C.c: 342: for(j = i; j > 0; j--)
	movf	(uart_send_number@i),w
	movwf	(uart_send_number@j)
	
i1l1824:	
	movf	((uart_send_number@j)),w
	btfss	status,2
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l1828
u173_20:
	goto	i1l338
	line	344
	
i1l1828:	
;SC8P096_Timer0_C.c: 343: {
;SC8P096_Timer0_C.c: 344: uart_send_char(buf[j-1]);
	movf	(uart_send_number@j),w
	addlw	0FFh
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_uart_send_char
	line	342
	
i1l1830:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(uart_send_number@j),f
	goto	i1l1824
	line	346
	
i1l338:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_number
	__end_of_uart_send_number:
	signat	_uart_send_number,4217
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 308 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_string
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	308
global __ptext12
__ptext12:	;psect for function _uart_send_char
psect	text12
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	308
	global	__size_of_uart_send_char
	__size_of_uart_send_char	equ	__end_of_uart_send_char-_uart_send_char
	
_uart_send_char:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_char: [wreg]
;uart_send_char@c stored from wreg
	movwf	(uart_send_char@c)
	line	310
	
i1l1624:	
;SC8P096_Timer0_C.c: 310: while(TRMT1 == 0);
	
i1l323:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l323
u146_20:
	line	311
	
i1l1626:	
;SC8P096_Timer0_C.c: 311: TXREG1 = c;
	movf	(uart_send_char@c),w
	movwf	(391)^0180h	;volatile
	line	312
	
i1l326:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_char
	__end_of_uart_send_char:
	signat	_uart_send_char,4217
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 6 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
global __ptext13
__ptext13:	;psect for function ___lwmod
psect	text13
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
i1l1734:	
	movf	((___lwmod@divisor)),w
iorwf	((___lwmod@divisor+1)),w
	btfsc	status,2
	goto	u163_21
	goto	u163_20
u163_21:
	goto	i1l1750
u163_20:
	line	14
	
i1l1736:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	i1l1740
	line	16
	
i1l1738:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	17
	incf	(___lwmod@counter),f
	line	15
	
i1l1740:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u164_21
	goto	u164_20
u164_21:
	goto	i1l1738
u164_20:
	line	20
	
i1l1742:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u165_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u165_25:
	skipc
	goto	u165_21
	goto	u165_20
u165_21:
	goto	i1l1746
u165_20:
	line	21
	
i1l1744:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	22
	
i1l1746:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	23
	
i1l1748:	
	decfsz	(___lwmod@counter),f
	goto	u166_21
	goto	u166_20
u166_21:
	goto	i1l1742
u166_20:
	line	25
	
i1l1750:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	26
	
i1l711:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: B00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
global __ptext14
__ptext14:	;psect for function ___lwdiv
psect	text14
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
i1l1708:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
i1l1710:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u159_21
	goto	u159_20
u159_21:
	goto	i1l1730
u159_20:
	line	16
	
i1l1712:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	i1l1716
	line	18
	
i1l1714:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
i1l1716:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u160_21
	goto	u160_20
u160_21:
	goto	i1l1714
u160_20:
	line	22
	
i1l1718:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
i1l1720:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u161_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u161_25:
	skipc
	goto	u161_21
	goto	u161_20
u161_21:
	goto	i1l1726
u161_20:
	line	24
	
i1l1722:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
i1l1724:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
i1l1726:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
i1l1728:	
	decfsz	(___lwdiv@counter),f
	goto	u162_21
	goto	u162_20
u162_21:
	goto	i1l1718
u162_20:
	line	30
	
i1l1730:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
i1l701:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_control_test_io

;; *************** function _control_test_io *****************
;; Defined at:
;;		line 49 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;  flag            2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_test_io_high
;;		_test_io_low
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	49
global __ptext15
__ptext15:	;psect for function _control_test_io
psect	text15
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	49
	global	__size_of_control_test_io
	__size_of_control_test_io	equ	__end_of_control_test_io-_control_test_io
	
_control_test_io:	
;incstack = 0
	opt	stack 2
; Regs used in _control_test_io: [wreg+status,2+status,0+pclath+cstack]
	line	51
	
i1l1760:	
;SC8P096_Timer0_C.c: 51: if(flag)
	movf	((control_test_io@flag)),w
iorwf	((control_test_io@flag+1)),w
	btfsc	status,2
	goto	u167_21
	goto	u167_20
u167_21:
	goto	i1l1764
u167_20:
	line	53
	
i1l1762:	
;SC8P096_Timer0_C.c: 52: {
;SC8P096_Timer0_C.c: 53: test_io_high();
	fcall	_test_io_high
	line	54
;SC8P096_Timer0_C.c: 54: }
	goto	i1l270
	line	57
	
i1l1764:	
;SC8P096_Timer0_C.c: 55: else
;SC8P096_Timer0_C.c: 56: {
;SC8P096_Timer0_C.c: 57: test_io_low();
	fcall	_test_io_low
	line	59
	
i1l270:	
	return
	opt stack 0
GLOBAL	__end_of_control_test_io
	__end_of_control_test_io:
	signat	_control_test_io,4217
	global	_test_io_low

;; *************** function _test_io_low *****************
;; Defined at:
;;		line 44 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_control_test_io
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	line	44
global __ptext16
__ptext16:	;psect for function _test_io_low
psect	text16
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	44
	global	__size_of_test_io_low
	__size_of_test_io_low	equ	__end_of_test_io_low-_test_io_low
	
_test_io_low:	
;incstack = 0
	opt	stack 2
; Regs used in _test_io_low: []
	line	46
	
i1l1552:	
;SC8P096_Timer0_C.c: 46: PORTA &= 0B11111110;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(134)^080h+(0/8),(0)&7	;volatile
	line	47
	
i1l265:	
	return
	opt stack 0
GLOBAL	__end_of_test_io_low
	__end_of_test_io_low:
	signat	_test_io_low,89
	global	_test_io_high

;; *************** function _test_io_high *****************
;; Defined at:
;;		line 39 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_control_test_io
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	39
global __ptext17
__ptext17:	;psect for function _test_io_high
psect	text17
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	39
	global	__size_of_test_io_high
	__size_of_test_io_high	equ	__end_of_test_io_high-_test_io_high
	
_test_io_high:	
;incstack = 0
	opt	stack 2
; Regs used in _test_io_high: []
	line	41
	
i1l1550:	
;SC8P096_Timer0_C.c: 41: PORTA |= 0B00000001;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(134)^080h+(0/8),(0)&7	;volatile
	line	42
	
i1l262:	
	return
	opt stack 0
GLOBAL	__end_of_test_io_high
	__end_of_test_io_high:
	signat	_test_io_high,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
