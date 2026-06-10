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
	FNCALL	_main,_Print_Status
	FNCALL	_main,_System_Init
	FNCALL	_main,_uart_send_string
	FNCALL	_System_Init,___bmul
	FNCALL	_Print_Status,___bmul
	FNCALL	_Print_Status,_uart_send_number
	FNCALL	_Print_Status,_uart_send_string
	FNCALL	_uart_send_string,_uart_send_char
	FNCALL	_uart_send_number,___lwdiv
	FNCALL	_uart_send_number,___lwmod
	FNCALL	_uart_send_number,_uart_send_char
	FNROOT	_main
	FNCALL	_Interrupt_Isr,_ADC_ReadChannel
	FNCALL	_Interrupt_Isr,_ADC_Sample
	FNCALL	_Interrupt_Isr,_CCCV_Control
	FNCALL	_Interrupt_Isr,_ChargeProcess_Slot
	FNCALL	_Interrupt_Isr,_Charging_Control
	FNCALL	_Interrupt_Isr,_Led_BlinkProcess
	FNCALL	_Interrupt_Isr,_PowerOnLedSequence
	FNCALL	_Interrupt_Isr,_Read_Temperature
	FNCALL	_Interrupt_Isr,_Update_LED_Slot
	FNCALL	_Interrupt_Isr,___ftdiv
	FNCALL	_Interrupt_Isr,___fttol
	FNCALL	_Interrupt_Isr,___lwtoft
	FNCALL	_Interrupt_Isr,i1___bmul
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	_Update_LED_Slot,i1___bmul
	FNCALL	_Read_Temperature,_ADC_ReadChannel
	FNCALL	_Read_Temperature,___lldiv
	FNCALL	_Read_Temperature,___lmul
	FNCALL	_ADC_ReadChannel,_ADC_Sample
	FNCALL	_Led_BlinkProcess,i1___bmul
	FNCALL	_Charging_Control,i1___bmul
	FNCALL	_ChargeProcess_Slot,_Detect_BatteryType
	FNCALL	_ChargeProcess_Slot,i1___bmul
	FNCALL	_CCCV_Control,___awdiv
	FNCALL	_CCCV_Control,i1___bmul
	FNCALL	intlevel1,_Interrupt_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_g_temperature
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	15

;initializer for _g_temperature
	retlw	019h
	global	_s_adcChannels
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
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	37
_s_adcChannels:
	retlw	011h
	retlw	010h
	retlw	0Ch
	retlw	0Dh
	retlw	05h
	retlw	04h
	retlw	01Ch
	retlw	01Dh
	retlw	01Bh
	retlw	01Ah
	retlw	07h
	retlw	06h
	global __end_of_s_adcChannels
__end_of_s_adcChannels:
	global	_s_adcChannels
	global	_RxTable
	global	_g_cvIntegral
	global	_g_systemTick
	global	Interrupt_Isr@RxNum
	global	_g_pwmCounter
	global	_g_pwmDuty
	global	_g_powerOnPhase
	global	_g_scanPhase
	global	_g_scanIndex
	global	_test_adc
	global	_g_tempProtect
	global	_adresult
	global	_g_printFlag
	global	_RXOK_f
	global	_g_powerOnTimer
	global	_power_ad
	global	_g_slot1
	global	_g_slot0
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
	global	_RB1
_RB1	set	0x31
	global	_RB0
_RB0	set	0x30
	global	_RB2
_RB2	set	0x32
	global	_RB3
_RB3	set	0x33
	global	_RB7
_RB7	set	0x37
	global	_RB6
_RB6	set	0x36
	global	_GIE
_GIE	set	0x5F
	global	_PEIE
_PEIE	set	0x5E
	global	_T0IE
_T0IE	set	0x5D
	global	_T0IF
_T0IF	set	0x5A
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
	global	_ANSEL0
_ANSEL0	set	147
	global	_ANSEL3
_ANSEL3	set	140
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
	global	_RA2
_RA2	set	0x432
	global	_RA3
_RA3	set	0x433
	global	_RA1
_RA1	set	0x431
	global	_RA0
_RA0	set	0x430
	global	_GODONE
_GODONE	set	0x4A9
	global	_CHS4
_CHS4	set	0x4B6
	global	_LDO_EN
_LDO_EN	set	0x4B2
	global	_WPUD
_WPUD	set	277
	global	_TRISD
_TRISD	set	276
	global	_ANSEL2
_ANSEL2	set	265
	global	_WPUC
_WPUC	set	264
	global	_PORTD
_PORTD	set	263
	global	_PORTC
_PORTC	set	262
	global	_TRISC
_TRISC	set	261
	global	_RD0
_RD0	set	0x838
	global	_RD2
_RD2	set	0x83A
	global	_RD3
_RD3	set	0x83B
	global	_RD1
_RD1	set	0x839
	global	_RC1IF
_RC1IF	set	0x878
	global	_RC4
_RC4	set	0x834
	global	_RC5
_RC5	set	0x835
	global	_RC2
_RC2	set	0x832
	global	_RC3
_RC3	set	0x833
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
	
STR_1:	
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_3:	
	retlw	67	;'C'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	68	;'D'
	retlw	68	;'D'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_10:	
	retlw	32	;' '
	retlw	70	;'F'
	retlw	85	;'U'
	retlw	76	;'L'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_4:	
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_11:	
	retlw	32	;' '
	retlw	67	;'C'
	retlw	72	;'H'
	retlw	71	;'G'
	retlw	0
psect	strings
	
STR_9:	
	retlw	32	;' '
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	82	;'R'
	retlw	0
psect	strings
	
STR_7:	
	retlw	32	;' '
	retlw	83	;'S'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_8:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_6:	
	retlw	58	;':'
	retlw	86	;'V'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_2:	
	retlw	84	;'T'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_5:	
	retlw	66	;'B'
	retlw	0
psect	strings
STR_12	equ	STR_1+8
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
_g_printFlag:
       ds      1

_RXOK_f:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_RxTable:
       ds      10

_g_cvIntegral:
       ds      2

_g_systemTick:
       ds      2

Interrupt_Isr@RxNum:
       ds      1

_g_pwmCounter:
       ds      1

_g_pwmDuty:
       ds      1

_g_powerOnPhase:
       ds      1

_g_scanPhase:
       ds      1

_g_scanIndex:
       ds      1

_test_adc:
       ds      1

_g_tempProtect:
       ds      1

_adresult:
       ds      2

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	15
_g_temperature:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_g_powerOnTimer:
       ds      2

_power_ad:
       ds      2

psect	bssBANK3,class=BANK3,space=1,noexec
global __pbssBANK3
__pbssBANK3:
_g_slot0:
       ds      72

psect	bssBANK2,class=BANK2,space=1,noexec
global __pbssBANK2
__pbssBANK2:
_g_slot1:
       ds      72

	file	"SC8P096_timer_C.as"
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+048h)
	fcall	clear_ram0
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK2)
	movwf	fsr
	movlw	low((__pbssBANK2)+048h)
	fcall	clear_ram0
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 5	;RP0=1, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
	clrf	((__pbssBANK1)+2)&07Fh
	clrf	((__pbssBANK1)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+018h)
	fcall	clear_ram0
; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 5	;RP0=0, select bank0
	clrf	((__pbitbssBANK0/8)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1,noexec
global __pcstackBANK1
__pcstackBANK1:
??_uart_send_char:	; 1 bytes @ 0x0
?___bmul:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	uart_send_char@c
uart_send_char@c:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
??_uart_send_string:	; 1 bytes @ 0x1
??___bmul:	; 1 bytes @ 0x1
	global	uart_send_string@str
uart_send_string@str:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
??_System_Init:	; 1 bytes @ 0x3
	global	_System_Init$253
_System_Init$253:	; 1 bytes @ 0x3
	ds	1
??___lwdiv:	; 1 bytes @ 0x4
??___lwmod:	; 1 bytes @ 0x4
	global	_System_Init$264
_System_Init$264:	; 1 bytes @ 0x4
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	_System_Init$275
_System_Init$275:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	_System_Init$286
_System_Init$286:	; 1 bytes @ 0x6
	ds	1
?_uart_send_number:	; 1 bytes @ 0x7
	global	_System_Init$297
_System_Init$297:	; 1 bytes @ 0x7
	global	uart_send_number@num
uart_send_number@num:	; 2 bytes @ 0x7
	ds	1
	global	_System_Init$308
_System_Init$308:	; 1 bytes @ 0x8
	ds	1
??_uart_send_number:	; 1 bytes @ 0x9
	global	_System_Init$319
_System_Init$319:	; 1 bytes @ 0x9
	global	uart_send_number@buf
uart_send_number@buf:	; 6 bytes @ 0x9
	ds	1
	global	_System_Init$330
_System_Init$330:	; 1 bytes @ 0xA
	ds	1
	global	_System_Init$341
_System_Init$341:	; 1 bytes @ 0xB
	ds	1
	global	System_Init@i
System_Init@i:	; 1 bytes @ 0xC
	ds	3
	global	uart_send_number@i
uart_send_number@i:	; 1 bytes @ 0xF
	ds	1
	global	uart_send_number@j
uart_send_number@j:	; 1 bytes @ 0x10
	ds	1
??_Print_Status:	; 1 bytes @ 0x11
	global	_Print_Status$570
_Print_Status$570:	; 1 bytes @ 0x11
	ds	1
	global	_Print_Status$582
_Print_Status$582:	; 1 bytes @ 0x12
	ds	1
	global	_Print_Status$594
_Print_Status$594:	; 1 bytes @ 0x13
	ds	1
	global	_Print_Status$605
_Print_Status$605:	; 1 bytes @ 0x14
	ds	1
	global	_Print_Status$617
_Print_Status$617:	; 1 bytes @ 0x15
	ds	1
	global	_Print_Status$639
_Print_Status$639:	; 1 bytes @ 0x16
	ds	1
	global	_Print_Status$640
_Print_Status$640:	; 1 bytes @ 0x17
	ds	1
	global	Print_Status@i
Print_Status@i:	; 1 bytes @ 0x18
	ds	1
??_main:	; 1 bytes @ 0x19
	global	main@i
main@i:	; 1 bytes @ 0x19
	ds	1
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_uart_send_string:	; 1 bytes @ 0x0
?_Print_Status:	; 1 bytes @ 0x0
?_PowerOnLedSequence:	; 1 bytes @ 0x0
??_PowerOnLedSequence:	; 1 bytes @ 0x0
?_ChargeProcess_Slot:	; 1 bytes @ 0x0
?_Update_LED_Slot:	; 1 bytes @ 0x0
?_Read_Temperature:	; 1 bytes @ 0x0
?_Led_BlinkProcess:	; 1 bytes @ 0x0
?_Charging_Control:	; 1 bytes @ 0x0
?_CCCV_Control:	; 1 bytes @ 0x0
?_ADC_Sample:	; 1 bytes @ 0x0
?_System_Init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Interrupt_Isr:	; 1 bytes @ 0x0
?_Detect_BatteryType:	; 1 bytes @ 0x0
?_uart_send_char:	; 1 bytes @ 0x0
?i1___bmul:	; 1 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	ADC_Sample@adldo
ADC_Sample@adldo:	; 1 bytes @ 0x0
	global	i1___bmul@multiplicand
i1___bmul@multiplicand:	; 1 bytes @ 0x0
	global	Detect_BatteryType@voltage
Detect_BatteryType@voltage:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
??_ADC_Sample:	; 1 bytes @ 0x1
??i1___bmul:	; 1 bytes @ 0x1
	global	i1___bmul@multiplier
i1___bmul@multiplier:	; 1 bytes @ 0x1
	ds	1
??_Detect_BatteryType:	; 1 bytes @ 0x2
	global	i1___bmul@product
i1___bmul@product:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
??_ChargeProcess_Slot:	; 1 bytes @ 0x3
??_Update_LED_Slot:	; 1 bytes @ 0x3
??_Led_BlinkProcess:	; 1 bytes @ 0x3
??_Charging_Control:	; 1 bytes @ 0x3
	global	Charging_Control@chargeB1_6
Charging_Control@chargeB1_6:	; 1 bytes @ 0x3
	global	Update_LED_Slot@idx
Update_LED_Slot@idx:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
??___awdiv:	; 1 bytes @ 0x4
	global	Charging_Control@chargeB7_12
Charging_Control@chargeB7_12:	; 1 bytes @ 0x4
	global	Update_LED_Slot@p
Update_LED_Slot@p:	; 1 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
??___ftpack:	; 1 bytes @ 0x5
	global	?_ADC_ReadChannel
?_ADC_ReadChannel:	; 2 bytes @ 0x5
	global	ChargeProcess_Slot@idx
ChargeProcess_Slot@idx:	; 1 bytes @ 0x5
	global	_Charging_Control$426
_Charging_Control$426:	; 1 bytes @ 0x5
	global	_Led_BlinkProcess$494
_Led_BlinkProcess$494:	; 1 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	Charging_Control@s
Charging_Control@s:	; 1 bytes @ 0x6
	global	_Led_BlinkProcess$505
_Led_BlinkProcess$505:	; 1 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
??_ADC_ReadChannel:	; 1 bytes @ 0x7
	global	Charging_Control@i
Charging_Control@i:	; 1 bytes @ 0x7
	global	_Led_BlinkProcess$516
_Led_BlinkProcess$516:	; 1 bytes @ 0x7
	ds	1
??_CCCV_Control:	; 1 bytes @ 0x8
??___lmul:	; 1 bytes @ 0x8
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x8
	global	ADC_ReadChannel@ch
ADC_ReadChannel@ch:	; 1 bytes @ 0x8
	global	_Led_BlinkProcess$527
_Led_BlinkProcess$527:	; 1 bytes @ 0x8
	global	ChargeProcess_Slot@v
ChargeProcess_Slot@v:	; 2 bytes @ 0x8
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
	global	_Led_BlinkProcess$538
_Led_BlinkProcess$538:	; 1 bytes @ 0x9
	ds	1
	global	ChargeProcess_Slot@p
ChargeProcess_Slot@p:	; 1 bytes @ 0xA
	global	Led_BlinkProcess@i
Led_BlinkProcess@i:	; 1 bytes @ 0xA
	ds	1
??___ftdiv:	; 1 bytes @ 0xB
??___lwtoft:	; 1 bytes @ 0xB
	ds	1
??___lldiv:	; 1 bytes @ 0xC
	ds	2
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	ADC_Sample@j
ADC_Sample@j:	; 1 bytes @ 0x0
	global	CCCV_Control@adjust
CCCV_Control@adjust:	; 2 bytes @ 0x0
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x1
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x2
	global	CCCV_Control@hasCharging
CCCV_Control@hasCharging:	; 1 bytes @ 0x2
	ds	1
	global	CCCV_Control@cvCount
CCCV_Control@cvCount:	; 1 bytes @ 0x3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x3
	global	ADC_Sample@adsum
ADC_Sample@adsum:	; 4 bytes @ 0x3
	ds	1
	global	_CCCV_Control$443
_CCCV_Control$443:	; 1 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	_CCCV_Control$454
_CCCV_Control$454:	; 1 bytes @ 0x5
	ds	1
	global	_CCCV_Control$465
_CCCV_Control$465:	; 1 bytes @ 0x6
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x6
	ds	1
	global	ADC_Sample@admin
ADC_Sample@admin:	; 2 bytes @ 0x7
	global	CCCV_Control@maxV
CCCV_Control@maxV:	; 2 bytes @ 0x7
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x7
	ds	1
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	ds	1
	global	ADC_Sample@admax
ADC_Sample@admax:	; 2 bytes @ 0x9
	global	CCCV_Control@error
CCCV_Control@error:	; 2 bytes @ 0x9
	ds	1
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0xA
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0xB
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0xB
	global	CCCV_Control@duty
CCCV_Control@duty:	; 2 bytes @ 0xB
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0xC
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0xC
	ds	1
??_Read_Temperature:	; 1 bytes @ 0xD
	global	CCCV_Control@s
CCCV_Control@s:	; 1 bytes @ 0xD
	ds	1
	global	CCCV_Control@i
CCCV_Control@i:	; 1 bytes @ 0xE
	ds	2
??___fttol:	; 1 bytes @ 0x10
	ds	1
	global	Read_Temperature@ntcVal
Read_Temperature@ntcVal:	; 2 bytes @ 0x11
	ds	2
	global	Read_Temperature@temp
Read_Temperature@temp:	; 1 bytes @ 0x13
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x13
	ds	1
	global	Read_Temperature@ntcR
Read_Temperature@ntcR:	; 2 bytes @ 0x14
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x14
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x18
	ds	1
??_Interrupt_Isr:	; 1 bytes @ 0x19
	ds	4
	global	_Interrupt_Isr$366
_Interrupt_Isr$366:	; 1 bytes @ 0x1D
	ds	1
	global	Interrupt_Isr@power_temp
Interrupt_Isr@power_temp:	; 4 bytes @ 0x1E
	ds	4
;!
;!Data Sizes:
;!    Strings     56
;!    Constant    12
;!    Data        1
;!    BSS         172
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     34      60
;!    BANK1            80     26      30
;!    BANK3            80      0      72
;!    BANK2            80      0      72

;!
;!Pointer List with Targets:
;!
;!    Print_Status$640	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$639	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$617	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$605	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$594	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$582	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$570	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    uart_send_string@str	PTR const unsigned char  size(1) Largest target is 11
;!		 -> STR_12(CODE[3]), STR_11(CODE[5]), STR_10(CODE[6]), STR_9(CODE[5]), 
;!		 -> STR_8(CODE[4]), STR_7(CODE[4]), STR_6(CODE[4]), STR_5(CODE[2]), 
;!		 -> STR_4(CODE[5]), STR_3(CODE[7]), STR_2(CODE[3]), STR_1(CODE[11]), 
;!
;!    Led_BlinkProcess$538	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$527	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$516	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$505	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$494	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Update_LED_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$465	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$454	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$443	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Charging_Control$426	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    ChargeProcess_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Interrupt_Isr$366	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$341	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$330	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$319	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$308	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$297	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$286	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$275	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$264	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$253	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in COMMON
;!
;!    _Interrupt_Isr->___ftdiv
;!    ___lwtoft->___ftpack
;!    ___fttol->___ftdiv
;!    ___ftdiv->___lwtoft
;!    _Update_LED_Slot->i1___bmul
;!    _Read_Temperature->___lmul
;!    ___lldiv->___lmul
;!    _ADC_ReadChannel->_ADC_Sample
;!    _Led_BlinkProcess->i1___bmul
;!    _Charging_Control->i1___bmul
;!    _ChargeProcess_Slot->i1___bmul
;!    _CCCV_Control->___awdiv
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _Interrupt_Isr in BANK0
;!
;!    _Interrupt_Isr->___fttol
;!    ___fttol->___ftdiv
;!    _Read_Temperature->___lldiv
;!    _ADC_ReadChannel->_ADC_Sample
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_Print_Status
;!    _System_Init->___bmul
;!    _Print_Status->_uart_send_number
;!    _uart_send_string->_uart_send_char
;!    _uart_send_number->___lwdiv
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
;! (0) _main                                                 1     1      0    7768
;!                                             25 BANK1      1     1      0
;!                       _Print_Status
;!                        _System_Init
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (1) _System_Init                                         10    10      0    2722
;!                                              3 BANK1     10    10      0
;!                             ___bmul
;! ---------------------------------------------------------------------------------
;! (1) _Print_Status                                         8     8      0    4491
;!                                             17 BANK1      8     8      0
;!                             ___bmul
;!                   _uart_send_number
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (1) _uart_send_string                                     1     1      0     456
;!                                              1 BANK1      1     1      0
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (2) _uart_send_number                                    10     8      2    1550
;!                                              7 BANK1     10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (2) _uart_send_char                                       1     1      0      31
;!                                              0 BANK1      1     1      0
;! ---------------------------------------------------------------------------------
;! (3) ___lwmod                                              5     1      4     362
;!                                              0 BANK1      5     1      4
;! ---------------------------------------------------------------------------------
;! (3) ___lwdiv                                              7     3      4     371
;!                                              0 BANK1      7     3      4
;! ---------------------------------------------------------------------------------
;! (2) ___bmul                                               3     2      1    1448
;!                                              0 BANK1      3     2      1
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _Interrupt_Isr                                        9     9      0   13555
;!                                             25 BANK0      9     9      0
;!                    _ADC_ReadChannel
;!                         _ADC_Sample
;!                       _CCCV_Control
;!                 _ChargeProcess_Slot
;!                   _Charging_Control
;!                   _Led_BlinkProcess
;!                 _PowerOnLedSequence
;!                   _Read_Temperature
;!                    _Update_LED_Slot
;!                            ___ftdiv
;!                            ___fttol
;!                           ___lwtoft
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) ___lwtoft                                             3     0      3     912
;!                                              8 COMMON     3     0      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (5) ___fttol                                             13     9      4      62
;!                                             12 BANK0     13     9      4
;!                            ___ftdiv (ARG)
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (5) ___ftdiv                                             15     9      6     982
;!                                             11 COMMON     3     3      0
;!                                              0 BANK0     12     6      6
;!                           ___ftpack
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (6) ___ftpack                                             8     3      5     900
;!                                              0 COMMON     8     3      5
;! ---------------------------------------------------------------------------------
;! (5) _Update_LED_Slot                                      2     2      0     813
;!                                              3 COMMON     2     2      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _Read_Temperature                                     9     9      0    1619
;!                                             13 BANK0      9     9      0
;!                    _ADC_ReadChannel
;!                            ___lldiv
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (6) ___lmul                                              12     4      8     198
;!                                              0 COMMON    12     4      8
;! ---------------------------------------------------------------------------------
;! (6) ___lldiv                                             13     5      8     290
;!                                              0 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (6) _ADC_ReadChannel                                      4     2      2     657
;!                                              5 COMMON     4     2      2
;!                         _ADC_Sample
;! ---------------------------------------------------------------------------------
;! (7) _ADC_Sample                                          18    17      1     635
;!                                              0 COMMON     5     4      1
;!                                              0 BANK0     13    13      0
;! ---------------------------------------------------------------------------------
;! (5) _PowerOnLedSequence                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (5) _Led_BlinkProcess                                     8     8      0    1262
;!                                              3 COMMON     8     8      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _Charging_Control                                     5     5      0    1082
;!                                              3 COMMON     5     5      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _ChargeProcess_Slot                                   8     8      0    2939
;!                                              3 COMMON     8     8      0
;!                 _Detect_BatteryType
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (6) _Detect_BatteryType                                   2     0      2     229
;!                                              0 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! (5) _CCCV_Control                                        17    17      0    1960
;!                                              8 COMMON     2     2      0
;!                                              0 BANK0     15    15      0
;!                            ___awdiv
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) i1___bmul                                             3     2      1     524
;!                                              0 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (6) ___awdiv                                              8     4      4     428
;!                                              0 COMMON     8     4      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 7
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Print_Status
;!     ___bmul
;!     _uart_send_number
;!       ___lwdiv
;!       ___lwmod
;!       _uart_send_char
;!     _uart_send_string
;!       _uart_send_char
;!   _System_Init
;!     ___bmul
;!   _uart_send_string
;!     _uart_send_char
;!
;! _Interrupt_Isr (ROOT)
;!   _ADC_ReadChannel
;!     _ADC_Sample
;!   _ADC_Sample
;!   _CCCV_Control
;!     ___awdiv
;!     i1___bmul
;!   _ChargeProcess_Slot
;!     _Detect_BatteryType
;!     i1___bmul
;!   _Charging_Control
;!     i1___bmul
;!   _Led_BlinkProcess
;!     i1___bmul
;!   _PowerOnLedSequence
;!   _Read_Temperature
;!     _ADC_ReadChannel
;!       _ADC_Sample
;!     ___lldiv
;!       ___lmul (ARG)
;!     ___lmul
;!   _Update_LED_Slot
;!     i1___bmul
;!   ___ftdiv
;!     ___ftpack
;!     ___lwtoft (ARG)
;!       ___ftpack
;!   ___fttol
;!     ___ftdiv (ARG)
;!       ___ftpack
;!       ___lwtoft (ARG)
;!         ___ftpack
;!     ___lwtoft (ARG)
;!       ___ftpack
;!   ___lwtoft
;!     ___ftpack
;!   i1___bmul
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               50      0      48       8       90.0%
;!BITBANK3            50      0       0       7        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               50      0      48      10       90.0%
;!BITBANK2            50      0       0       9        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50     1A      1E       6       37.5%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     22      3C       4       75.0%
;!BITBANK0            50      0       1       3        1.3%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      F8      12        0.0%
;!ABS                  0      0      F8      11        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 218 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   25[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Print_Status
;;		_System_Init
;;		_uart_send_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	218
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	218
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	220
	
l4260:	
;main.c: 220: System_Init();
	fcall	_System_Init
	line	227
;main.c: 227: uart_send_string("start...\r\n");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	229
;main.c: 229: while(1)
	
l382:	
	line	231
# 231 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	maintext
	line	235
	
l4262:	
;main.c: 235: if(g_printFlag)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	goto	u4791
	goto	u4790
u4791:
	goto	l4268
u4790:
	line	237
	
l4264:	
;main.c: 236: {
;main.c: 237: g_printFlag = 0;
	bcf	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	line	238
	
l4266:	
;main.c: 238: Print_Status();
	fcall	_Print_Status
	line	243
	
l4268:	
;main.c: 239: }
;main.c: 243: if(RXOK_f == 1)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_RXOK_f/8),(_RXOK_f)&7
	goto	u4801
	goto	u4800
u4801:
	goto	l382
u4800:
	line	247
	
l4270:	
;main.c: 244: {
;main.c: 246: unsigned char i;
;main.c: 247: for(i = 0; i < 10; i++)
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@i)^080h
	line	249
	
l387:	
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u4811
	goto	u4810
u4811:
	goto	l387
u4810:
	line	250
	
l4276:	
;main.c: 250: TXREG1 = RxTable[i];
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	247
	
l4278:	
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@i)^080h,f
	
l4280:	
	movlw	low(0Ah)
	subwf	(main@i)^080h,w
	skipc
	goto	u4821
	goto	u4820
u4821:
	goto	l387
u4820:
	
l386:	
	line	253
;main.c: 251: }
;main.c: 253: RXOK_f = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RXOK_f/8),(_RXOK_f)&7
	goto	l382
	global	start
	ljmp	start
	opt stack 0
	line	256
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_System_Init

;; *************** function _System_Init *****************
;; Defined at:
;;		line 65 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   12[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/800
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0      10       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0      10       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___bmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	65
global __ptext1
__ptext1:	;psect for function _System_Init
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	65
	global	__size_of_System_Init
	__size_of_System_Init	equ	__end_of_System_Init-_System_Init
	
_System_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _System_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	70
	
l3592:	
# 70 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
nop ;# 
	line	71
# 71 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	74
	
l3594:	
;main.c: 74: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	75
	
l3596:	
;main.c: 75: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	76
# 76 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	85
	
l3598:	
;main.c: 85: TRISA = 0B11110000;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	86
	
l3600:	
;main.c: 86: PORTA = 0B00001111;
	movlw	low(0Fh)
	movwf	(134)^080h	;volatile
	line	87
	
l3602:	
;main.c: 87: WPUA = 0B00000000;
	clrf	(136)^080h	;volatile
	line	88
	
l3604:	
;main.c: 88: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	89
	
l3606:	
;main.c: 89: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	98
;main.c: 98: TRISB = 0B00110000;
	movlw	low(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	99
;main.c: 99: PORTB = 0B01001111;
	movlw	low(04Fh)
	movwf	(6)	;volatile
	line	100
	
l3608:	
;main.c: 100: WPUB = 0B00000000;
	clrf	(8)	;volatile
	line	101
	
l3610:	
;main.c: 101: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	102
	
l3612:	
;main.c: 102: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	112
	
l3614:	
;main.c: 112: TRISC = 0B00000011;
	movlw	low(03h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	113
;main.c: 113: PORTC = 0B00000000;
	clrf	(262)^0100h	;volatile
	line	114
;main.c: 114: WPUC = 0B00000000;
	clrf	(264)^0100h	;volatile
	line	122
	
l3616:	
;main.c: 122: TRISD = 0B11110000;
	movlw	low(0F0h)
	movwf	(276)^0100h	;volatile
	line	123
	
l3618:	
;main.c: 123: PORTD = 0B00001111;
	movlw	low(0Fh)
	movwf	(263)^0100h	;volatile
	line	124
;main.c: 124: WPUD = 0B00000000;
	clrf	(277)^0100h	;volatile
	line	131
	
l3620:	
;main.c: 131: ANSEL0 = 0xF0;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	133
	
l3622:	
;main.c: 133: ANSEL1 = 0x20;
	movlw	low(020h)
	movwf	(148)^080h	;volatile
	line	137
	
l3624:	
;main.c: 137: ANSEL2 = 0x03;
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	line	138
	
l3626:	
;main.c: 138: ANSEL3 = 0xF0;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(140)^080h	;volatile
	line	141
;main.c: 141: CC0CON = 0;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(405)^0180h	;volatile
	line	142
;main.c: 142: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	147
	
l3628:	
;main.c: 147: ADCON0 = 0X41;
	movlw	low(041h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	148
	
l3630:	
;main.c: 148: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	154
;main.c: 154: TXSTA1 = 0B10100000;
	movlw	low(0A0h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(389)^0180h	;volatile
	line	155
;main.c: 155: RCSTA1 = 0B10010000;
	movlw	low(090h)
	movwf	(390)^0180h	;volatile
	line	156
;main.c: 156: SPBRG1 = 103;
	movlw	low(067h)
	movwf	(393)^0180h	;volatile
	line	166
;main.c: 166: TMR0 = 6;
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	167
	
l3632:	
;main.c: 167: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	168
	
l3634:	
;main.c: 168: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	171
	
l3636:	
;main.c: 171: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	172
	
l3638:	
;main.c: 172: RC1IE = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2176/8)^0100h,(2176)&7	;volatile
	line	173
	
l3640:	
;main.c: 173: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	176
	
l3642:	
;main.c: 176: RB6 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7	;volatile
	line	177
	
l3644:	
;main.c: 177: RB7 = 0;
	bcf	(55/8),(55)&7	;volatile
	line	178
	
l3646:	
;main.c: 178: RC3 = 0;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2099/8)^0100h,(2099)&7	;volatile
	line	179
	
l3648:	
;main.c: 179: RC2 = 0;
	bcf	(2098/8)^0100h,(2098)&7	;volatile
	line	180
	
l3650:	
;main.c: 180: RC5 = 0;
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	181
	
l3652:	
;main.c: 181: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	184
	
l3654:	
;main.c: 184: for(i = 0; i < 12; i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(System_Init@i)^080h
	line	186
	
l3660:	
;main.c: 185: {
;main.c: 186: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l3664
u3810:
	
l3662:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$253)^080h
	goto	l3666
	
l3664:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$253)^080h
	
l3666:	
	incf	(_System_Init$253)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	187
	
l3668:	
;main.c: 187: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3821
	goto	u3820
u3821:
	goto	l3672
u3820:
	
l3670:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$264)^080h
	goto	l3674
	
l3672:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$264)^080h
	
l3674:	
	movf	(_System_Init$264)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	188
	
l3676:	
;main.c: 188: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l3680
u3830:
	
l3678:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$275)^080h
	goto	l3682
	
l3680:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$275)^080h
	
l3682:	
	movf	(_System_Init$275)^080h,w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	189
	
l3684:	
;main.c: 189: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->chargeTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l3688
u3840:
	
l3686:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$286)^080h
	goto	l3690
	
l3688:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$286)^080h
	
l3690:	
	movf	(_System_Init$286)^080h,w
	addlw	05h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	190
	
l3692:	
;main.c: 190: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3851
	goto	u3850
u3851:
	goto	l3696
u3850:
	
l3694:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$297)^080h
	goto	l3698
	
l3696:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$297)^080h
	
l3698:	
	movf	(_System_Init$297)^080h,w
	addlw	02h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	191
	
l3700:	
;main.c: 191: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3861
	goto	u3860
u3861:
	goto	l3704
u3860:
	
l3702:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$308)^080h
	goto	l3706
	
l3704:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$308)^080h
	
l3706:	
	movf	(_System_Init$308)^080h,w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	192
	
l3708:	
;main.c: 192: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l3712
u3870:
	
l3710:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$319)^080h
	goto	l3714
	
l3712:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$319)^080h
	
l3714:	
	movf	(_System_Init$319)^080h,w
	addlw	09h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	193
	
l3716:	
;main.c: 193: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->stableCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3881
	goto	u3880
u3881:
	goto	l3720
u3880:
	
l3718:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$330)^080h
	goto	l3722
	
l3720:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$330)^080h
	
l3722:	
	movf	(_System_Init$330)^080h,w
	addlw	0Ah
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	194
	
l3724:	
;main.c: 194: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->activatePulseCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3891
	goto	u3890
u3891:
	goto	l3728
u3890:
	
l3726:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$341)^080h
	goto	l3730
	
l3728:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$341)^080h
	
l3730:	
	movf	(_System_Init$341)^080h,w
	addlw	0Bh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	184
	
l3732:	
	incf	(System_Init@i)^080h,f
	
l3734:	
	movlw	low(0Ch)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3901
	goto	u3900
u3901:
	goto	l3660
u3900:
	line	198
	
l3736:	
;main.c: 195: }
;main.c: 198: g_scanIndex = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_scanIndex)
	line	199
;main.c: 199: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	200
;main.c: 201: g_timerTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	202
;main.c: 202: g_powerOnTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	203
;main.c: 203: g_powerOnPhase = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	line	204
;main.c: 204: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	205
	
l3738:	
;main.c: 205: g_temperature = 25;
	movlw	low(019h)
	movwf	(_g_temperature)
	line	206
	
l3740:	
;main.c: 206: RXOK_f = 0;
	bcf	(_RXOK_f/8),(_RXOK_f)&7
	line	207
	
l377:	
	return
	opt stack 0
GLOBAL	__end_of_System_Init
	__end_of_System_Init:
	signat	_System_Init,89
	global	_Print_Status

;; *************** function _Print_Status *****************
;; Defined at:
;;		line 92 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   24[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       8       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___bmul
;;		_uart_send_number
;;		_uart_send_string
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	92
global __ptext2
__ptext2:	;psect for function _Print_Status
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	92
	global	__size_of_Print_Status
	__size_of_Print_Status	equ	__end_of_Print_Status-_Print_Status
	
_Print_Status:	
;incstack = 0
	opt	stack 1
; Regs used in _Print_Status: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	97
	
l3742:	
;uart_dbg.c: 94: unsigned char i;
;uart_dbg.c: 97: uart_send_string("T:");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	98
;uart_dbg.c: 98: uart_send_number(g_temperature);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_g_temperature),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	99
;uart_dbg.c: 99: uart_send_string("C VDD:");
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	100
;uart_dbg.c: 100: uart_send_number(power_ad);
	movf	(_power_ad+1)^080h,w	;volatile
	movwf	(uart_send_number@num+1)^080h
	movf	(_power_ad)^080h,w	;volatile
	movwf	(uart_send_number@num)^080h
	fcall	_uart_send_number
	line	101
;uart_dbg.c: 101: uart_send_string("mV\r\n");
	movlw	(low((((STR_4)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	104
	
l3744:	
;uart_dbg.c: 104: for(i = 0; i < 12; i++)
	clrf	(Print_Status@i)^080h
	line	106
	
l3750:	
;uart_dbg.c: 105: {
;uart_dbg.c: 106: uart_send_string("B");
	movlw	(low((((STR_5)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	107
;uart_dbg.c: 107: uart_send_number(i + 1);
	movf	(Print_Status@i)^080h,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	incf	(uart_send_number@num)^080h,f
	skipnz
	incf	(uart_send_number@num+1)^080h,f
	fcall	_uart_send_number
	line	108
;uart_dbg.c: 108: uart_send_string(":V=");
	movlw	(low((((STR_6)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	109
	
l3752:	
;uart_dbg.c: 109: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3911
	goto	u3910
u3911:
	goto	l3756
u3910:
	
l3754:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$570)^080h
	goto	l3758
	
l3756:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$570)^080h
	
l3758:	
	movf	(_Print_Status$570)^080h,w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	110
	
l3760:	
;uart_dbg.c: 110: uart_send_string(" S=");
	movlw	(low((((STR_7)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	111
	
l3762:	
;uart_dbg.c: 111: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3921
	goto	u3920
u3921:
	goto	l3766
u3920:
	
l3764:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$582)^080h
	goto	l3768
	
l3766:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$582)^080h
	
l3768:	
	incf	(_Print_Status$582)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	112
	
l3770:	
;uart_dbg.c: 112: uart_send_string(" T=");
	movlw	(low((((STR_8)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	113
	
l3772:	
;uart_dbg.c: 113: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3931
	goto	u3930
u3931:
	goto	l3776
u3930:
	
l3774:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$594)^080h
	goto	l3778
	
l3776:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$594)^080h
	
l3778:	
	movf	(_Print_Status$594)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	116
	
l3780:	
;uart_dbg.c: 116: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 7)
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3941
	goto	u3940
u3941:
	goto	l3784
u3940:
	
l3782:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$605)^080h
	goto	l3786
	
l3784:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$605)^080h
	
l3786:	
	incf	(_Print_Status$605)^080h,w
	movwf	fsr0
		movlw	7
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u3951
	goto	u3950
u3951:
	goto	l3790
u3950:
	line	117
	
l3788:	
;uart_dbg.c: 117: uart_send_string(" ERR");
	movlw	(low((((STR_9)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	l752
	line	118
	
l3790:	
;uart_dbg.c: 118: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 6)
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3961
	goto	u3960
u3961:
	goto	l3794
u3960:
	
l3792:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$617)^080h
	goto	l3796
	
l3794:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$617)^080h
	
l3796:	
	incf	(_Print_Status$617)^080h,w
	movwf	fsr0
		movlw	6
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u3971
	goto	u3970
u3971:
	goto	l3800
u3970:
	line	119
	
l3798:	
;uart_dbg.c: 119: uart_send_string(" FULL");
	movlw	(low((((STR_10)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	l752
	line	121
	
l3800:	
;uart_dbg.c: 120: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 4 ||
;uart_dbg.c: 121: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 5)
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u3981
	goto	u3980
u3981:
	goto	l3804
u3980:
	
l3802:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$639)^080h
	goto	l3806
	
l3804:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$639)^080h
	
l3806:	
	incf	(_Print_Status$639)^080h,w
	movwf	fsr0
		movlw	4
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfsc	status,2
	goto	u3991
	goto	u3990
u3991:
	goto	l3816
u3990:
	
l3808:	
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u4001
	goto	u4000
u4001:
	goto	l3812
u4000:
	
l3810:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$640)^080h
	goto	l3814
	
l3812:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$640)^080h
	
l3814:	
	incf	(_Print_Status$640)^080h,w
	movwf	fsr0
		movlw	5
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u4011
	goto	u4010
u4011:
	goto	l752
u4010:
	line	122
	
l3816:	
;uart_dbg.c: 122: uart_send_string(" CHG");
	movlw	(low((((STR_11)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	124
	
l752:	
;uart_dbg.c: 124: uart_send_string("\r\n");
	movlw	(low((((STR_12)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	104
	
l3818:	
	incf	(Print_Status@i)^080h,f
	
l3820:	
	movlw	low(0Ch)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u4021
	goto	u4020
u4021:
	goto	l3750
u4020:
	line	126
	
l770:	
	return
	opt stack 0
GLOBAL	__end_of_Print_Status
	__end_of_Print_Status:
	signat	_Print_Status,89
	global	_uart_send_string

;; *************** function _uart_send_string *****************
;; Defined at:
;;		line 40 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> STR_12(3), STR_11(5), STR_10(6), STR_9(5), 
;;		 -> STR_8(4), STR_7(4), STR_6(4), STR_5(2), 
;;		 -> STR_4(5), STR_3(7), STR_2(3), STR_1(11), 
;; Auto vars:     Size  Location     Type
;;  str             1    1[BANK1 ] PTR const unsigned char 
;;		 -> STR_12(3), STR_11(5), STR_10(6), STR_9(5), 
;;		 -> STR_8(4), STR_7(4), STR_6(4), STR_5(2), 
;;		 -> STR_4(5), STR_3(7), STR_2(3), STR_1(11), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/800
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_uart_send_char
;; This function is called by:
;;		_main
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	40
global __ptext3
__ptext3:	;psect for function _uart_send_string
psect	text3
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	40
	global	__size_of_uart_send_string
	__size_of_uart_send_string	equ	__end_of_uart_send_string-_uart_send_string
	
_uart_send_string:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_send_string@str stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(uart_send_string@str)^080h
	line	42
	
l3518:	
;uart_dbg.c: 42: while(*str != '\0')
	goto	l3524
	line	43
	
l3520:	
;uart_dbg.c: 43: uart_send_char(*str++);
	movf	(uart_send_string@str)^080h,w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_send_char
	
l3522:	
	bcf	status, 6	;RP1=0, select bank1
	incf	(uart_send_string@str)^080h,f
	line	42
	
l3524:	
	movf	(uart_send_string@str)^080h,w
	movwf	fsr0
	fcall	stringdir
	xorlw	0
	skipz
	goto	u3671
	goto	u3670
u3671:
	goto	l3520
u3670:
	line	44
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_string
	__end_of_uart_send_string:
	signat	_uart_send_string,4217
	global	_uart_send_number

;; *************** function _uart_send_number *****************
;; Defined at:
;;		line 53 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;  num             2    7[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  buf             6    9[BANK1 ] unsigned char [6]
;;  j               1   16[BANK1 ] unsigned char 
;;  i               1   15[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       8       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0      10       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_uart_send_char
;; This function is called by:
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	53
global __ptext4
__ptext4:	;psect for function _uart_send_number
psect	text4
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	53
	global	__size_of_uart_send_number
	__size_of_uart_send_number	equ	__end_of_uart_send_number-_uart_send_number
	
_uart_send_number:	
;incstack = 0
	opt	stack 1
; Regs used in _uart_send_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	56
	
l3526:	
;uart_dbg.c: 55: unsigned char buf[6];
;uart_dbg.c: 56: unsigned char i = 0;
	clrf	(uart_send_number@i)^080h
	line	60
	
l3528:	
;uart_dbg.c: 57: unsigned char j;
;uart_dbg.c: 60: if(num == 0)
	movf	((uart_send_number@num)^080h),w
iorwf	((uart_send_number@num+1)^080h),w
	btfss	status,2
	goto	u3681
	goto	u3680
u3681:
	goto	l3540
u3680:
	line	62
	
l3530:	
;uart_dbg.c: 61: {
;uart_dbg.c: 62: uart_send_char('0');
	movlw	low(030h)
	fcall	_uart_send_char
	goto	l725
	line	69
	
l3534:	
;uart_dbg.c: 68: {
;uart_dbg.c: 69: buf[i++] = '0' + (num % 10);
	movf	(uart_send_number@i)^080h,w
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	movlw	0Ah
	movwf	(___lwmod@divisor)^080h
	clrf	(___lwmod@divisor+1)^080h
	movf	(uart_send_number@num+1)^080h,w
	movwf	(___lwmod@dividend+1)^080h
	movf	(uart_send_number@num)^080h,w
	movwf	(___lwmod@dividend)^080h
	fcall	___lwmod
	movf	(0+(?___lwmod))^080h,w
	addlw	030h
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l3536:	
	incf	(uart_send_number@i)^080h,f
	line	70
	
l3538:	
;uart_dbg.c: 70: num /= 10;
	movlw	0Ah
	movwf	(___lwdiv@divisor)^080h
	clrf	(___lwdiv@divisor+1)^080h
	movf	(uart_send_number@num+1)^080h,w
	movwf	(___lwdiv@dividend+1)^080h
	movf	(uart_send_number@num)^080h,w
	movwf	(___lwdiv@dividend)^080h
	fcall	___lwdiv
	movf	(1+(?___lwdiv))^080h,w
	movwf	(uart_send_number@num+1)^080h
	movf	(0+(?___lwdiv))^080h,w
	movwf	(uart_send_number@num)^080h
	line	67
	
l3540:	
	movf	((uart_send_number@num)^080h),w
iorwf	((uart_send_number@num+1)^080h),w
	btfss	status,2
	goto	u3691
	goto	u3690
u3691:
	goto	l3534
u3690:
	line	74
	
l3542:	
;uart_dbg.c: 71: }
;uart_dbg.c: 74: for(j = i; j > 0; j--)
	movf	(uart_send_number@i)^080h,w
	movwf	(uart_send_number@j)^080h
	
l3544:	
	movf	((uart_send_number@j)^080h),w
	btfss	status,2
	goto	u3701
	goto	u3700
u3701:
	goto	l3548
u3700:
	goto	l725
	line	75
	
l3548:	
;uart_dbg.c: 75: uart_send_char(buf[j-1]);
	movf	(uart_send_number@j)^080h,w
	addlw	0FFh
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_uart_send_char
	line	74
	
l3550:	
	bcf	status, 6	;RP1=0, select bank1
	decf	(uart_send_number@j)^080h,f
	goto	l3544
	line	76
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_number
	__end_of_uart_send_number:
	signat	_uart_send_number,4217
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 28 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/900
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_string
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	28
global __ptext5
__ptext5:	;psect for function _uart_send_char
psect	text5
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	28
	global	__size_of_uart_send_char
	__size_of_uart_send_char	equ	__end_of_uart_send_char-_uart_send_char
	
_uart_send_char:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_char: [wreg]
;uart_send_char@c stored from wreg
	movwf	(uart_send_char@c)^080h
	line	30
	
l3468:	
;uart_dbg.c: 30: while(TRMT1 == 0);
	
l712:	
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u3581
	goto	u3580
u3581:
	goto	l712
u3580:
	line	31
	
l3470:	
;uart_dbg.c: 31: TXREG1 = c;
	bcf	status, 6	;RP1=0, select bank1
	movf	(uart_send_char@c)^080h,w
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	32
	
l715:	
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
;;  divisor         2    0[BANK1 ] unsigned int 
;;  dividend        2    2[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
global __ptext6
__ptext6:	;psect for function ___lwmod
psect	text6
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
l3498:	
	movf	((___lwmod@divisor)^080h),w
iorwf	((___lwmod@divisor+1)^080h),w
	btfsc	status,2
	goto	u3631
	goto	u3630
u3631:
	goto	l3514
u3630:
	line	14
	
l3500:	
	clrf	(___lwmod@counter)^080h
	incf	(___lwmod@counter)^080h,f
	line	15
	goto	l3504
	line	16
	
l3502:	
	clrc
	rlf	(___lwmod@divisor)^080h,f
	rlf	(___lwmod@divisor+1)^080h,f
	line	17
	incf	(___lwmod@counter)^080h,f
	line	15
	
l3504:	
	btfss	(___lwmod@divisor+1)^080h,(15)&7
	goto	u3641
	goto	u3640
u3641:
	goto	l3502
u3640:
	line	20
	
l3506:	
	movf	(___lwmod@divisor+1)^080h,w
	subwf	(___lwmod@dividend+1)^080h,w
	skipz
	goto	u3655
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,w
u3655:
	skipc
	goto	u3651
	goto	u3650
u3651:
	goto	l3510
u3650:
	line	21
	
l3508:	
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,f
	movf	(___lwmod@divisor+1)^080h,w
	skipc
	decf	(___lwmod@dividend+1)^080h,f
	subwf	(___lwmod@dividend+1)^080h,f
	line	22
	
l3510:	
	clrc
	rrf	(___lwmod@divisor+1)^080h,f
	rrf	(___lwmod@divisor)^080h,f
	line	23
	
l3512:	
	decfsz	(___lwmod@counter)^080h,f
	goto	u3661
	goto	u3660
u3661:
	goto	l3506
u3660:
	line	25
	
l3514:	
	movf	(___lwmod@dividend+1)^080h,w
	movwf	(?___lwmod+1)^080h
	movf	(___lwmod@dividend)^080h,w
	movwf	(?___lwmod)^080h
	line	26
	
l1123:	
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
;;  divisor         2    0[BANK1 ] unsigned int 
;;  dividend        2    2[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK1 ] unsigned int 
;;  counter         1    4[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/100
;;		On exit  : B00/100
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
global __ptext7
__ptext7:	;psect for function ___lwdiv
psect	text7
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l3472:	
	clrf	(___lwdiv@quotient)^080h
	clrf	(___lwdiv@quotient+1)^080h
	line	15
	
l3474:	
	movf	((___lwdiv@divisor)^080h),w
iorwf	((___lwdiv@divisor+1)^080h),w
	btfsc	status,2
	goto	u3591
	goto	u3590
u3591:
	goto	l3494
u3590:
	line	16
	
l3476:	
	clrf	(___lwdiv@counter)^080h
	incf	(___lwdiv@counter)^080h,f
	line	17
	goto	l3480
	line	18
	
l3478:	
	clrc
	rlf	(___lwdiv@divisor)^080h,f
	rlf	(___lwdiv@divisor+1)^080h,f
	line	19
	incf	(___lwdiv@counter)^080h,f
	line	17
	
l3480:	
	btfss	(___lwdiv@divisor+1)^080h,(15)&7
	goto	u3601
	goto	u3600
u3601:
	goto	l3478
u3600:
	line	22
	
l3482:	
	clrc
	rlf	(___lwdiv@quotient)^080h,f
	rlf	(___lwdiv@quotient+1)^080h,f
	line	23
	
l3484:	
	movf	(___lwdiv@divisor+1)^080h,w
	subwf	(___lwdiv@dividend+1)^080h,w
	skipz
	goto	u3615
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,w
u3615:
	skipc
	goto	u3611
	goto	u3610
u3611:
	goto	l3490
u3610:
	line	24
	
l3486:	
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,f
	movf	(___lwdiv@divisor+1)^080h,w
	skipc
	decf	(___lwdiv@dividend+1)^080h,f
	subwf	(___lwdiv@dividend+1)^080h,f
	line	25
	
l3488:	
	bsf	(___lwdiv@quotient)^080h+(0/8),(0)&7
	line	27
	
l3490:	
	clrc
	rrf	(___lwdiv@divisor+1)^080h,f
	rrf	(___lwdiv@divisor)^080h,f
	line	28
	
l3492:	
	decfsz	(___lwdiv@counter)^080h,f
	goto	u3621
	goto	u3620
u3621:
	goto	l3482
u3620:
	line	30
	
l3494:	
	movf	(___lwdiv@quotient+1)^080h,w
	movwf	(?___lwdiv+1)^080h
	movf	(___lwdiv@quotient)^080h,w
	movwf	(?___lwdiv)^080h
	line	31
	
l1113:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	___bmul

;; *************** function ___bmul *****************
;; Defined at:
;;		line 4 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    2[BANK1 ] unsigned char 
;;  product         1    1[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_System_Init
;;		_Interrupt_Isr
;;		_ChargeProcess_Slot
;;		_Charging_Control
;;		_CCCV_Control
;;		_Update_LED_Slot
;;		_Led_BlinkProcess
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
	line	4
global __ptext8
__ptext8:	;psect for function ___bmul
psect	text8
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
	line	4
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
;incstack = 0
	opt	stack 2
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)^080h
	line	6
	
l3554:	
	clrf	(___bmul@product)^080h
	line	43
	
l3556:	
	btfss	(___bmul@multiplier)^080h,(0)&7
	goto	u3711
	goto	u3710
u3711:
	goto	l3560
u3710:
	line	44
	
l3558:	
	movf	(___bmul@multiplicand)^080h,w
	addwf	(___bmul@product)^080h,f
	line	45
	
l3560:	
	clrc
	rlf	(___bmul@multiplicand)^080h,f
	line	46
	
l3562:	
	clrc
	rrf	(___bmul@multiplier)^080h,f
	line	47
	movf	((___bmul@multiplier)^080h),w
	btfss	status,2
	goto	u3721
	goto	u3720
u3721:
	goto	l3556
u3720:
	line	50
	
l3564:	
	movf	(___bmul@product)^080h,w
	line	51
	
l794:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_Interrupt_Isr

;; *************** function _Interrupt_Isr *****************
;; Defined at:
;;		line 268 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  power_temp      4   30[BANK0 ] volatile unsigned long 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADC_ReadChannel
;;		_ADC_Sample
;;		_CCCV_Control
;;		_ChargeProcess_Slot
;;		_Charging_Control
;;		_Led_BlinkProcess
;;		_PowerOnLedSequence
;;		_Read_Temperature
;;		_Update_LED_Slot
;;		___ftdiv
;;		___fttol
;;		___lwtoft
;;		i1___bmul
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	268
global __ptext9
__ptext9:	;psect for function _Interrupt_Isr
psect	text9
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	268
	global	__size_of_Interrupt_Isr
	__size_of_Interrupt_Isr	equ	__end_of_Interrupt_Isr-_Interrupt_Isr
	
_Interrupt_Isr:	
;incstack = 0
	opt	stack 1
; Regs used in _Interrupt_Isr: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_Interrupt_Isr+0)
	movf	fsr0,w
	movwf	(??_Interrupt_Isr+1)
	movf	pclath,w
	movwf	(??_Interrupt_Isr+2)
	movf	btemp+1,w
	movwf	(??_Interrupt_Isr+3)
	ljmp	_Interrupt_Isr
psect	text9
	line	273
	
i1l4482:	
;main.c: 273: if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u516_21
	goto	u516_20
u516_21:
	goto	i1l397
u516_20:
	line	275
	
i1l4484:	
;main.c: 274: {
;main.c: 275: TMR0 += 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	addwf	(129)^080h,f	;volatile
	line	276
	
i1l4486:	
;main.c: 277: g_timerTick++;
	bcf	(90/8),(90)&7	;volatile
	line	278
# 278 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text9
	line	284
	
i1l4488:	
;main.c: 284: g_pwmCounter++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(_g_pwmCounter),f	;volatile
	line	285
;main.c: 285: if(g_pwmCounter >= 32)
	movlw	low(020h)
	subwf	(_g_pwmCounter),w	;volatile
	skipc
	goto	u517_21
	goto	u517_20
u517_21:
	goto	i1l4492
u517_20:
	line	286
	
i1l4490:	
;main.c: 286: g_pwmCounter = 0;
	clrf	(_g_pwmCounter)	;volatile
	line	287
	
i1l4492:	
;main.c: 287: RB7 = (g_pwmCounter < g_pwmDuty) ? 1 : 0;
	movf	(_g_pwmDuty),w	;volatile
	subwf	(_g_pwmCounter),w	;volatile
	skipc
	goto	u518_21
	goto	u518_20
	
u518_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7	;volatile
	goto	u519_24
u518_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7	;volatile
u519_24:
	line	290
	
i1l4494:	
;main.c: 290: if(g_powerOnPhase < 2)
	movlw	low(02h)
	subwf	(_g_powerOnPhase),w
	skipnc
	goto	u520_21
	goto	u520_20
u520_21:
	goto	i1l4558
u520_20:
	line	292
	
i1l4496:	
;main.c: 291: {
;main.c: 292: PowerOnLedSequence();
	fcall	_PowerOnLedSequence
	line	293
;main.c: 293: }
	goto	i1l397
	line	302
	
i1l4498:	
;main.c: 301: (((g_scanIndex) < 6) ? &g_slot0[(g_scanIndex)] : &g_slot1[(g_scanIndex)-6])->voltage =
;main.c: 302: ADC_ReadChannel(s_adcChannels[g_scanIndex]);
	movlw	low(06h)
	subwf	(_g_scanIndex),w
	skipc
	goto	u521_21
	goto	u521_20
u521_21:
	goto	i1l4502
u521_20:
	
i1l4500:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$366)
	goto	i1l4504
	
i1l4502:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$366)
	
i1l4504:	
	movf	(_g_scanIndex),w
	addlw	low((((_s_adcChannels)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	fcall	_ADC_ReadChannel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Interrupt_Isr$366),w
	addlw	03h
	movwf	fsr0
	movf	(0+(?_ADC_ReadChannel)),w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_ADC_ReadChannel)),w
	movwf	indf
	line	303
	
i1l4506:	
;main.c: 303: g_scanPhase = 1;
	clrf	(_g_scanPhase)
	incf	(_g_scanPhase),f
	line	304
;main.c: 304: break;
	goto	i1l397
	line	310
	
i1l4508:	
;main.c: 310: ChargeProcess_Slot(g_scanIndex);
	movf	(_g_scanIndex),w
	fcall	_ChargeProcess_Slot
	line	311
;main.c: 311: Update_LED_Slot(g_scanIndex);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_scanIndex),w
	fcall	_Update_LED_Slot
	line	312
	
i1l4510:	
;main.c: 312: g_scanPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_scanPhase)
	line	313
;main.c: 313: break;
	goto	i1l397
	line	323
	
i1l4512:	
;main.c: 323: if(g_scanIndex == 0)
	movf	((_g_scanIndex)),w
	btfss	status,2
	goto	u522_21
	goto	u522_20
u522_21:
	goto	i1l4528
u522_20:
	line	326
	
i1l4514:	
;main.c: 324: {
;main.c: 326: ANSEL2 |= 0x20;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(265)^0100h+(5/8),(5)&7	;volatile
	line	327
;main.c: 327: TRISC |= 0x20;
	bsf	(261)^0100h+(5/8),(5)&7	;volatile
	line	328
	
i1l4516:	
;main.c: 328: Read_Temperature();
	fcall	_Read_Temperature
	line	330
	
i1l4518:	
;main.c: 330: ANSEL2 &= ~0x20;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(265)^0100h+(5/8),(5)&7	;volatile
	line	331
	
i1l4520:	
;main.c: 331: TRISC &= ~0x20;
	bcf	(261)^0100h+(5/8),(5)&7	;volatile
	line	334
	
i1l4522:	
;main.c: 334: Led_BlinkProcess();
	fcall	_Led_BlinkProcess
	line	336
	
i1l4524:	
;main.c: 336: Charging_Control();
	fcall	_Charging_Control
	line	338
	
i1l4526:	
;main.c: 338: CCCV_Control();
	fcall	_CCCV_Control
	line	342
	
i1l4528:	
;main.c: 339: }
;main.c: 342: g_scanIndex++;
	incf	(_g_scanIndex),f
	line	343
	
i1l4530:	
;main.c: 343: if(g_scanIndex >= 12)
	movlw	low(0Ch)
	subwf	(_g_scanIndex),w
	skipc
	goto	u523_21
	goto	u523_20
u523_21:
	goto	i1l4536
u523_20:
	line	345
	
i1l4532:	
;main.c: 344: {
;main.c: 345: g_scanIndex = 0;
	clrf	(_g_scanIndex)
	line	346
	
i1l4534:	
;main.c: 346: g_systemTick++;
	incf	(_g_systemTick),f
	skipnz
	incf	(_g_systemTick+1),f
	line	348
	
i1l4536:	
;main.c: 347: }
;main.c: 348: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	352
	
i1l4538:	
;main.c: 352: if(g_systemTick >= 222)
	movlw	0
	subwf	(_g_systemTick+1),w
	movlw	0DEh
	skipnz
	subwf	(_g_systemTick),w
	skipc
	goto	u524_21
	goto	u524_20
u524_21:
	goto	i1l397
u524_20:
	line	354
	
i1l4540:	
;main.c: 353: {
;main.c: 354: g_systemTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	357
	
i1l4542:	
;main.c: 357: test_adc = ADC_Sample(31, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	358
	
i1l4544:	
;main.c: 358: if(0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u525_21
	goto	u525_20
u525_21:
	goto	i1l4550
u525_20:
	line	362
	
i1l4546:	
;main.c: 359: {
;main.c: 360: volatile unsigned long power_temp;
;main.c: 362: power_temp = (unsigned long)(((4096UL*1.2*1000))/adresult);
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
	movwf	(Interrupt_Isr@power_temp+3)	;volatile
	movf	(2+(?___fttol)),w
	movwf	(Interrupt_Isr@power_temp+2)	;volatile
	movf	(1+(?___fttol)),w
	movwf	(Interrupt_Isr@power_temp+1)	;volatile
	movf	(0+(?___fttol)),w
	movwf	(Interrupt_Isr@power_temp)	;volatile

	line	363
	
i1l4548:	
;main.c: 363: power_ad = (unsigned int)(power_temp);
	movf	(Interrupt_Isr@power_temp+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_power_ad+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(Interrupt_Isr@power_temp),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_power_ad)^080h	;volatile
	line	364
;main.c: 364: }
	goto	i1l4552
	line	368
	
i1l4550:	
;main.c: 365: else
;main.c: 366: {
;main.c: 368: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	369
;main.c: 369: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	374
	
i1l4552:	
;main.c: 370: }
;main.c: 374: g_printFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	goto	i1l397
	line	380
	
i1l4554:	
;main.c: 380: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	381
;main.c: 381: break;
	goto	i1l397
	line	297
	
i1l4558:	
	movf	(_g_scanPhase),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l4498
	xorlw	1^0	; case 1
	skipnz
	goto	i1l4508
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4512
	goto	i1l4554
	opt asmopt_pop

	line	384
	
i1l397:	
	line	387
;main.c: 383: }
;main.c: 384: }
;main.c: 387: if(RC1IF == 1)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2168/8)^0100h,(2168)&7	;volatile
	goto	u526_21
	goto	u526_20
u526_21:
	goto	i1l424
u526_20:
	line	390
	
i1l4560:	
;main.c: 388: {
;main.c: 389: static unsigned char RxNum = 0, TEMP;
;main.c: 390: RC1IF = 0;
	bcf	(2168/8)^0100h,(2168)&7	;volatile
	line	393
;main.c: 393: if(RXOK_f == 0)
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(_RXOK_f/8),(_RXOK_f)&7
	goto	u527_21
	goto	u527_20
u527_21:
	goto	i1l4572
u527_20:
	line	395
	
i1l4562:	
;main.c: 394: {
;main.c: 395: RxTable[RxNum] = RCREG1;
	movf	(Interrupt_Isr@RxNum),w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	396
	
i1l4564:	
;main.c: 396: RxNum++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Interrupt_Isr@RxNum),f
	line	397
	
i1l4566:	
;main.c: 397: if(RxNum > 9)
	movlw	low(0Ah)
	subwf	(Interrupt_Isr@RxNum),w
	skipc
	goto	u528_21
	goto	u528_20
u528_21:
	goto	i1l424
u528_20:
	line	399
	
i1l4568:	
;main.c: 398: {
;main.c: 399: RxNum = 0;
	clrf	(Interrupt_Isr@RxNum)
	line	400
	
i1l4570:	
;main.c: 400: RXOK_f = 1;
	bsf	(_RXOK_f/8),(_RXOK_f)&7
	goto	i1l424
	line	405
	
i1l4572:	
;main.c: 403: else
;main.c: 404: {
;main.c: 405: TEMP = RCREG1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	line	408
	
i1l424:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_Interrupt_Isr+3),w
	movwf	btemp+1
	movf	(??_Interrupt_Isr+2),w
	movwf	pclath
	movf	(??_Interrupt_Isr+1),w
	movwf	fsr0
	swapf	(??_Interrupt_Isr+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Interrupt_Isr
	__end_of_Interrupt_Isr:
	signat	_Interrupt_Isr,89
	global	___lwtoft

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 28 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
global __ptext10
__ptext10:	;psect for function ___lwtoft
psect	text10
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
i1l4478:	
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
	
i1l1128:	
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
;;  f1              3   12[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   20[BANK0 ] unsigned long 
;;  exp1            1   24[BANK0 ] unsigned char 
;;  sign1           1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   12[BANK0 ] long 
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
global __ptext11
__ptext11:	;psect for function ___fttol
psect	text11
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
;incstack = 0
	opt	stack 3
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
i1l4438:	
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
	goto	u508_21
	goto	u508_20
u508_21:
	goto	i1l4442
u508_20:
	line	50
	
i1l4440:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	i1l1019
	line	51
	
i1l4442:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u509_25:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u509_20:
	addlw	-1
	skipz
	goto	u509_25
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
i1l4444:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
i1l4446:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
i1l4448:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
i1l4450:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
i1l4452:	
	btfss	(___fttol@exp1),7
	goto	u510_21
	goto	u510_20
u510_21:
	goto	i1l4462
u510_20:
	line	57
	
i1l4454:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u511_21
	goto	u511_20
u511_21:
	goto	i1l4458
u511_20:
	goto	i1l4440
	line	60
	
i1l4458:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
i1l4460:	
	incfsz	(___fttol@exp1),f
	goto	u512_21
	goto	u512_20
u512_21:
	goto	i1l4458
u512_20:
	goto	i1l4470
	line	63
	
i1l4462:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u513_21
	goto	u513_20
u513_21:
	goto	i1l4468
u513_20:
	goto	i1l4440
	line	66
	
i1l4466:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	65
	
i1l4468:	
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u514_21
	goto	u514_20
u514_21:
	goto	i1l4466
u514_20:
	line	70
	
i1l4470:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u515_21
	goto	u515_20
u515_21:
	goto	i1l4474
u515_20:
	line	71
	
i1l4472:	
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
	
i1l4474:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
i1l1019:	
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
;;  f2              3    0[BANK0 ] float 
;;  f1              3    3[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3    7[BANK0 ] float 
;;  sign            1   11[BANK0 ] unsigned char 
;;  exp             1   10[BANK0 ] unsigned char 
;;  cntr            1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3      12       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
global __ptext12
__ptext12:	;psect for function ___ftdiv
psect	text12
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
i1l4398:	
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
	goto	u504_21
	goto	u504_20
u504_21:
	goto	i1l4402
u504_20:
	line	64
	
i1l4400:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l983
	line	65
	
i1l4402:	
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
	goto	u505_21
	goto	u505_20
u505_21:
	goto	i1l984
u505_20:
	line	66
	
i1l4404:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l983
	
i1l984:	
	line	67
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	68
	
i1l4406:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
i1l4408:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(___ftdiv@sign)
	line	70
	
i1l4410:	
	movf	0+(___ftdiv@f2)+02h,w
	xorwf	(___ftdiv@sign),f
	line	71
	
i1l4412:	
	movlw	low(080h)
	andwf	(___ftdiv@sign),f
	line	72
	
i1l4414:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
i1l4416:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
i1l4418:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
i1l4420:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
i1l4422:	
	movlw	low(018h)
	movwf	(___ftdiv@cntr)
	line	78
	
i1l4424:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u506_25
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u506_25
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u506_25:
	skipc
	goto	u506_21
	goto	u506_20
u506_21:
	goto	i1l4430
u506_20:
	line	80
	
i1l4426:	
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
	
i1l4428:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
i1l4430:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	84
	
i1l4432:	
	decfsz	(___ftdiv@cntr),f
	goto	u507_21
	goto	u507_20
u507_21:
	goto	i1l4424
u507_20:
	line	85
	
i1l4434:	
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
	
i1l983:	
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
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___lwtoft
;;		___ftdiv
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
global __ptext13
__ptext13:	;psect for function ___ftpack
psect	text13
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
;incstack = 0
	opt	stack 2
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
i1l4374:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u496_21
	goto	u496_20
u496_21:
	goto	i1l930
u496_20:
	
i1l4376:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u497_21
	goto	u497_20
u497_21:
	goto	i1l4380
u497_20:
	
i1l930:	
	line	65
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	i1l931
	line	67
	
i1l4378:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
i1l4380:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u498_21
	goto	u498_20
u498_21:
	goto	i1l4378
u498_20:
	goto	i1l4384
	line	71
	
i1l4382:	
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
	
i1l4384:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u499_21
	goto	u499_20
u499_21:
	goto	i1l4382
u499_20:
	goto	i1l4388
	line	76
	
i1l4386:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
i1l4388:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u500_21
	goto	u500_20
u500_21:
	goto	i1l942
u500_20:
	
i1l4390:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u501_21
	goto	u501_20
u501_21:
	goto	i1l4386
u501_20:
	
i1l942:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u502_21
	goto	u502_20
u502_21:
	goto	i1l943
u502_20:
	line	80
	
i1l4392:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
i1l943:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
i1l4394:	
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
	goto	u503_21
	goto	u503_20
u503_21:
	goto	i1l944
u503_20:
	line	84
	
i1l4396:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
i1l944:	
	line	85
	line	86
	
i1l931:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_Update_LED_Slot

;; *************** function _Update_LED_Slot *****************
;; Defined at:
;;		line 30 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
;; Parameters:    Size  Location     Type
;;  idx             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  idx             1    3[COMMON] unsigned char 
;;  p               1    4[COMMON] PTR struct .
;;		 -> g_slot1(72), g_slot0(72), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/800
;;		On exit  : 800/800
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	30
global __ptext14
__ptext14:	;psect for function _Update_LED_Slot
psect	text14
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	30
	global	__size_of_Update_LED_Slot
	__size_of_Update_LED_Slot	equ	__end_of_Update_LED_Slot-_Update_LED_Slot
	
_Update_LED_Slot:	
;incstack = 0
	opt	stack 2
; Regs used in _Update_LED_Slot: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;Update_LED_Slot@idx stored from wreg
	movwf	(Update_LED_Slot@idx)
	line	32
	
i1l3956:	
;led.c: 32: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(Update_LED_Slot@idx),w
	skipc
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l3960
u426_20:
	
i1l3958:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l3974
	
i1l3960:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l3974
	line	37
	
i1l3962:	
;led.c: 37: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	38
;led.c: 38: break;
	goto	i1l670
	line	42
	
i1l665:	
	line	44
	
i1l3964:	
;led.c: 40: case 2:
;led.c: 41: case 3:
;led.c: 42: case 4:
;led.c: 43: case 5:
;led.c: 44: p->ledState = 1;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	45
;led.c: 45: break;
	goto	i1l670
	line	47
	
i1l3966:	
;led.c: 47: p->ledState = 2;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	48
;led.c: 48: break;
	goto	i1l670
	line	50
	
i1l3968:	
;led.c: 50: p->ledState = 3;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	51
;led.c: 51: break;
	goto	i1l670
	line	53
	
i1l3970:	
;led.c: 53: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	54
;led.c: 54: break;
	goto	i1l670
	line	34
	
i1l3974:	
	incf	(Update_LED_Slot@p),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           32     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l3962
	xorlw	1^0	; case 1
	skipnz
	goto	i1l665
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3964
	xorlw	3^2	; case 3
	skipnz
	goto	i1l3964
	xorlw	4^3	; case 4
	skipnz
	goto	i1l3964
	xorlw	5^4	; case 5
	skipnz
	goto	i1l3964
	xorlw	6^5	; case 6
	skipnz
	goto	i1l3966
	xorlw	7^6	; case 7
	skipnz
	goto	i1l3968
	goto	i1l3970
	opt asmopt_pop

	line	56
	
i1l670:	
	return
	opt stack 0
GLOBAL	__end_of_Update_LED_Slot
	__end_of_Update_LED_Slot:
	signat	_Update_LED_Slot,4217
	global	_Read_Temperature

;; *************** function _Read_Temperature *****************
;; Defined at:
;;		line 29 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ntcR            2   20[BANK0 ] unsigned int 
;;  ntcVal          2   17[BANK0 ] unsigned int 
;;  temp            1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ADC_ReadChannel
;;		___lldiv
;;		___lmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	29
global __ptext15
__ptext15:	;psect for function _Read_Temperature
psect	text15
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	29
	global	__size_of_Read_Temperature
	__size_of_Read_Temperature	equ	__end_of_Read_Temperature-_Read_Temperature
	
_Read_Temperature:	
;incstack = 0
	opt	stack 1
; Regs used in _Read_Temperature: [wreg+status,2+status,0+pclath+cstack]
	line	31
	
i1l3082:	
;charge_mgr.c: 31: unsigned int ntcVal = ADC_ReadChannel(21);
	movlw	low(015h)
	fcall	_ADC_ReadChannel
	movf	(1+(?_ADC_ReadChannel)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Read_Temperature@ntcVal+1)
	movf	(0+(?_ADC_ReadChannel)),w
	movwf	(Read_Temperature@ntcVal)
	line	33
	
i1l3084:	
	line	38
	
i1l3086:	
;charge_mgr.c: 38: if(ntcVal == 0 || ntcVal >= 4095)
	movf	((Read_Temperature@ntcVal)),w
iorwf	((Read_Temperature@ntcVal+1)),w
	btfsc	status,2
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l467
u283_20:
	
i1l3088:	
	movlw	0Fh
	subwf	(Read_Temperature@ntcVal+1),w
	movlw	0FFh
	skipnz
	subwf	(Read_Temperature@ntcVal),w
	skipc
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l3090
u284_20:
	goto	i1l467
	line	42
	
i1l3090:	
;charge_mgr.c: 42: ntcR = (unsigned int)((unsigned long)ntcVal * 10000UL / (4096UL - ntcVal));
	movlw	0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	010h
	movwf	(___lldiv@divisor+1)
	movlw	0
	movwf	(___lldiv@divisor)

	movf	(Read_Temperature@ntcVal),w
	movwf	((??_Read_Temperature+0)+0)
	movf	(Read_Temperature@ntcVal+1),w
	movwf	((??_Read_Temperature+0)+0+1)
	clrf	((??_Read_Temperature+0)+0+2)
	clrf	((??_Read_Temperature+0)+0+3)
	movf	0+(??_Read_Temperature+0)+0,w
	subwf	(___lldiv@divisor),f
	movf	1+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	1+(??_Read_Temperature+0)+0,w
	goto	u285_25
	goto	u285_26
u285_25:
	subwf	(___lldiv@divisor+1),f
u285_26:
	movf	2+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	2+(??_Read_Temperature+0)+0,w
	goto	u285_27
	goto	u285_28
u285_27:
	subwf	(___lldiv@divisor+2),f
u285_28:
	movf	3+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	3+(??_Read_Temperature+0)+0,w
	goto	u285_29
	goto	u285_20
u285_29:
	subwf	(___lldiv@divisor+3),f
u285_20:

	movf	(Read_Temperature@ntcVal),w
	movwf	(___lmul@multiplier)
	movf	(Read_Temperature@ntcVal+1),w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	027h
	movwf	(___lmul@multiplicand+1)
	movlw	010h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(1+(?___lldiv)),w
	movwf	(Read_Temperature@ntcR+1)
	movf	(0+(?___lldiv)),w
	movwf	(Read_Temperature@ntcR)
	line	47
	
i1l3092:	
;charge_mgr.c: 47: if(ntcR > 32950) temp = 10;
	movlw	080h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0B7h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u286_21
	goto	u286_20
u286_21:
	goto	i1l3096
u286_20:
	
i1l3094:	
	movlw	low(0Ah)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	48
	
i1l3096:	
;charge_mgr.c: 48: else if(ntcR > 27330) temp = 15;
	movlw	06Ah
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0C3h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u287_21
	goto	u287_20
u287_21:
	goto	i1l3100
u287_20:
	
i1l3098:	
	movlw	low(0Fh)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	49
	
i1l3100:	
;charge_mgr.c: 49: else if(ntcR > 22060) temp = 20;
	movlw	056h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	02Dh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l3104
u288_20:
	
i1l3102:	
	movlw	low(014h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	50
	
i1l3104:	
;charge_mgr.c: 50: else if(ntcR > 17950) temp = 25;
	movlw	046h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	01Fh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u289_21
	goto	u289_20
u289_21:
	goto	i1l3108
u289_20:
	
i1l3106:	
	movlw	low(019h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	51
	
i1l3108:	
;charge_mgr.c: 51: else if(ntcR > 14710) temp = 30;
	movlw	039h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	077h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l3112
u290_20:
	
i1l3110:	
	movlw	low(01Eh)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	52
	
i1l3112:	
;charge_mgr.c: 52: else if(ntcR > 12120) temp = 35;
	movlw	02Fh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	059h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l3116
u291_20:
	
i1l3114:	
	movlw	low(023h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	53
	
i1l3116:	
;charge_mgr.c: 53: else if(ntcR > 10000) temp = 40;
	movlw	027h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	011h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l3120
u292_20:
	
i1l3118:	
	movlw	low(028h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	54
	
i1l3120:	
;charge_mgr.c: 54: else if(ntcR > 8330) temp = 45;
	movlw	020h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	08Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l3124
u293_20:
	
i1l3122:	
	movlw	low(02Dh)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	55
	
i1l3124:	
;charge_mgr.c: 55: else if(ntcR > 6970) temp = 50;
	movlw	01Bh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	03Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l3128
u294_20:
	
i1l3126:	
	movlw	low(032h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	56
	
i1l3128:	
;charge_mgr.c: 56: else if(ntcR > 5860) temp = 55;
	movlw	016h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0E5h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u295_21
	goto	u295_20
u295_21:
	goto	i1l3132
u295_20:
	
i1l3130:	
	movlw	low(037h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	57
	
i1l3132:	
;charge_mgr.c: 57: else if(ntcR > 4950) temp = 60;
	movlw	013h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	057h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u296_21
	goto	u296_20
u296_21:
	goto	i1l3136
u296_20:
	
i1l3134:	
	movlw	low(03Ch)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	58
	
i1l3136:	
;charge_mgr.c: 58: else if(ntcR > 4200) temp = 65;
	movlw	010h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	069h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u297_21
	goto	u297_20
u297_21:
	goto	i1l3140
u297_20:
	
i1l3138:	
	movlw	low(041h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	59
	
i1l3140:	
;charge_mgr.c: 59: else if(ntcR > 3580) temp = 70;
	movlw	0Dh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0FDh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u298_21
	goto	u298_20
u298_21:
	goto	i1l3144
u298_20:
	
i1l3142:	
	movlw	low(046h)
	movwf	(Read_Temperature@temp)
	goto	i1l469
	line	60
	
i1l3144:	
;charge_mgr.c: 60: else temp = 75;
	movlw	low(04Bh)
	movwf	(Read_Temperature@temp)
	
i1l469:	
	line	62
;charge_mgr.c: 62: g_temperature = temp;
	movf	(Read_Temperature@temp),w
	movwf	(_g_temperature)
	line	65
;charge_mgr.c: 65: if(temp >= 60)
	movlw	low(03Ch)
	subwf	(Read_Temperature@temp),w
	skipc
	goto	u299_21
	goto	u299_20
u299_21:
	goto	i1l3148
u299_20:
	line	66
	
i1l3146:	
;charge_mgr.c: 66: g_tempProtect = 1;
	clrf	(_g_tempProtect)
	incf	(_g_tempProtect),f
	goto	i1l467
	line	67
	
i1l3148:	
;charge_mgr.c: 67: else if(temp <= 50)
	movlw	low(033h)
	subwf	(Read_Temperature@temp),w
	skipnc
	goto	u300_21
	goto	u300_20
u300_21:
	goto	i1l467
u300_20:
	line	68
	
i1l3150:	
;charge_mgr.c: 68: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	71
	
i1l467:	
	return
	opt stack 0
GLOBAL	__end_of_Read_Temperature
	__end_of_Read_Temperature:
	signat	_Read_Temperature,89
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:        12       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Read_Temperature
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
global __ptext16
__ptext16:	;psect for function ___lmul
psect	text16
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 2
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
i1l2564:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
i1l785:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u215_21
	goto	u215_20
u215_21:
	goto	i1l2568
u215_20:
	line	122
	
i1l2566:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u216_21
	addwf	(___lmul@product+1),f
u216_21:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u216_22
	addwf	(___lmul@product+2),f
u216_22:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u216_23
	addwf	(___lmul@product+3),f
u216_23:

	line	123
	
i1l2568:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
i1l2570:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	125
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l785
u217_20:
	line	128
	
i1l2572:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
i1l788:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] unsigned long 
;;  dividend        4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    8[BANK0 ] unsigned long 
;;  counter         1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Read_Temperature
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
global __ptext17
__ptext17:	;psect for function ___lldiv
psect	text17
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
i1l2634:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
i1l2636:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u227_21
	goto	u227_20
u227_21:
	goto	i1l2656
u227_20:
	line	16
	
i1l2638:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	i1l2642
	line	18
	
i1l2640:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
i1l2642:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u228_21
	goto	u228_20
u228_21:
	goto	i1l2640
u228_20:
	line	22
	
i1l2644:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
i1l2646:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u229_25
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u229_25
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u229_25
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u229_25:
	skipc
	goto	u229_21
	goto	u229_20
u229_21:
	goto	i1l2652
u229_20:
	line	24
	
i1l2648:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	25
	
i1l2650:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
i1l2652:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
i1l2654:	
	decfsz	(___lldiv@counter),f
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l2644
u230_20:
	line	30
	
i1l2656:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
i1l1060:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_ADC_ReadChannel

;; *************** function _ADC_ReadChannel *****************
;; Defined at:
;;		line 131 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    5[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_ADC_Sample
;; This function is called by:
;;		_Interrupt_Isr
;;		_Read_Temperature
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	131
global __ptext18
__ptext18:	;psect for function _ADC_ReadChannel
psect	text18
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	131
	global	__size_of_ADC_ReadChannel
	__size_of_ADC_ReadChannel	equ	__end_of_ADC_ReadChannel-_ADC_ReadChannel
	
_ADC_ReadChannel:	
;incstack = 0
	opt	stack 1
; Regs used in _ADC_ReadChannel: [wreg+status,2+status,0+pclath+cstack]
;ADC_ReadChannel@ch stored from wreg
	movwf	(ADC_ReadChannel@ch)
	line	133
	
i1l2480:	
;adc_drv.c: 133: test_adc = ADC_Sample(ch, 7);
	movlw	low(07h)
	movwf	(ADC_Sample@adldo)
	movf	(ADC_ReadChannel@ch),w
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	134
	
i1l2482:	
;adc_drv.c: 134: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l2488
u203_20:
	line	135
	
i1l2484:	
;adc_drv.c: 135: return adresult;
	movf	(_adresult+1),w	;volatile
	movwf	(?_ADC_ReadChannel+1)
	movf	(_adresult),w	;volatile
	movwf	(?_ADC_ReadChannel)
	goto	i1l455
	line	138
	
i1l2488:	
;adc_drv.c: 138: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	139
;adc_drv.c: 139: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	140
	
i1l2490:	
;adc_drv.c: 140: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_ReadChannel+0)+0),f
	u529_27:
decfsz	(??_ADC_ReadChannel+0)+0,f
	goto	u529_27
opt asmopt_pop

	line	141
	
i1l2492:	
;adc_drv.c: 141: return 0;
	clrf	(?_ADC_ReadChannel)
	clrf	(?_ADC_ReadChannel+1)
	line	142
	
i1l455:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_ReadChannel
	__end_of_ADC_ReadChannel:
	signat	_ADC_ReadChannel,4218
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 43 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;;  adldo           1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    1[BANK0 ] unsigned char 
;;  j               1    0[BANK0 ] unsigned char 
;;  adsum           4    3[BANK0 ] volatile unsigned long 
;;  ad_temp         2   11[BANK0 ] volatile unsigned int 
;;  admax           2    9[BANK0 ] volatile unsigned int 
;;  admin           2    7[BANK0 ] volatile unsigned int 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         0      13       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         5      13       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt_Isr
;;		_ADC_ReadChannel
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	43
global __ptext19
__ptext19:	;psect for function _ADC_Sample
psect	text19
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	43
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
;incstack = 0
	opt	stack 1
; Regs used in _ADC_Sample: [wreg+status,2+status,0]
;ADC_Sample@adch stored from wreg
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADC_Sample@adch)
	line	45
	
i1l2352:	
;adc_drv.c: 45: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	46
	
i1l2354:	
;adc_drv.c: 46: volatile unsigned int admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	47
;adc_drv.c: 47: volatile unsigned int admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	48
;adc_drv.c: 48: volatile unsigned int ad_temp = 0;
	clrf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	line	51
	
i1l2356:	
;adc_drv.c: 51: if ((!LDO_EN) && (adldo & 0x04))
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l2362
u178_20:
	
i1l2358:	
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l2362
u179_20:
	line	53
	
i1l2360:	
;adc_drv.c: 52: {
;adc_drv.c: 53: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	54
;adc_drv.c: 54: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_Sample+0)+0),f
	u530_27:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u530_27
opt asmopt_pop

	line	55
;adc_drv.c: 55: }
	goto	i1l2364
	line	57
	
i1l2362:	
;adc_drv.c: 56: else
;adc_drv.c: 57: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	60
	
i1l2364:	
;adc_drv.c: 60: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l436
u180_20:
	line	62
	
i1l2366:	
;adc_drv.c: 61: {
;adc_drv.c: 62: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	63
	
i1l2368:	
;adc_drv.c: 63: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	64
;adc_drv.c: 64: }
	goto	i1l2370
	line	65
	
i1l436:	
	line	66
;adc_drv.c: 65: else
;adc_drv.c: 66: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	68
	
i1l2370:	
;adc_drv.c: 68: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	70
;adc_drv.c: 70: for (i = 0; i < 10; i++)
	clrf	(ADC_Sample@i)
	line	73
	
i1l2376:	
;adc_drv.c: 71: {
;adc_drv.c: 73: ADCON0 = (unsigned char)(0X41 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u181_25:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u181_25
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	74
# 74 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	75
# 75 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	76
# 76 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	77
# 77 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
psect	text19
	line	78
	
i1l2378:	
;adc_drv.c: 78: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	81
	
i1l2380:	
;adc_drv.c: 81: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	82
;adc_drv.c: 82: while (GODONE)
	goto	i1l440
	
i1l441:	
	line	84
;adc_drv.c: 83: {
;adc_drv.c: 84: _delay((unsigned long)((2)*(16000000/4000000.0)));
		opt asmopt_push
	opt asmopt_off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	opt asmopt_pop

	line	85
;adc_drv.c: 85: if (0 == (--j))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(ADC_Sample@j),f
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l440
u182_20:
	line	86
	
i1l2382:	
;adc_drv.c: 86: return 0;
	movlw	low(0)
	goto	i1l443
	line	87
	
i1l440:	
	line	82
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l441
u183_20:
	line	90
	
i1l2386:	
;adc_drv.c: 87: }
;adc_drv.c: 90: ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));
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
	
i1l2388:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	93
	
i1l2390:	
;adc_drv.c: 93: if (0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l2394
u184_20:
	line	95
	
i1l2392:	
;adc_drv.c: 94: {
;adc_drv.c: 95: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	line	96
;adc_drv.c: 96: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	97
;adc_drv.c: 97: }
	goto	i1l446
	line	99
	
i1l2394:	
;adc_drv.c: 99: else if (ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u185_25
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u185_25:
	skipnc
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l2398
u185_20:
	line	100
	
i1l2396:	
;adc_drv.c: 100: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	i1l446
	line	102
	
i1l2398:	
;adc_drv.c: 102: else if (ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u186_25
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u186_25:
	skipnc
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l446
u186_20:
	line	103
	
i1l2400:	
;adc_drv.c: 103: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	105
	
i1l446:	
;adc_drv.c: 105: adsum += ad_temp;
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
	goto	u187_21
	addwf	(ADC_Sample@adsum+1),f	;volatile
u187_21:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u187_22
	addwf	(ADC_Sample@adsum+2),f	;volatile
u187_22:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u187_23
	addwf	(ADC_Sample@adsum+3),f	;volatile
u187_23:

	line	70
	
i1l2402:	
	incf	(ADC_Sample@i),f
	
i1l2404:	
	movlw	low(0Ah)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u188_21
	goto	u188_20
u188_21:
	goto	i1l2376
u188_20:
	line	109
	
i1l2406:	
;adc_drv.c: 106: }
;adc_drv.c: 109: adsum -= admax;
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
	goto	u189_25
	goto	u189_26
u189_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u189_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u189_27
	goto	u189_28
u189_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u189_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u189_29
	goto	u189_20
u189_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u189_20:

	line	110
;adc_drv.c: 110: if (adsum >= admin)
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+3),w	;volatile
	skipz
	goto	u190_25
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u190_25
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u190_25
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u190_25:
	skipc
	goto	u190_21
	goto	u190_20
u190_21:
	goto	i1l450
u190_20:
	line	111
	
i1l2408:	
;adc_drv.c: 111: adsum -= admin;
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
	goto	u191_25
	goto	u191_26
u191_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u191_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u191_27
	goto	u191_28
u191_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u191_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u191_29
	goto	u191_20
u191_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u191_20:

	goto	i1l2410
	line	112
	
i1l450:	
	line	113
;adc_drv.c: 112: else
;adc_drv.c: 113: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	115
	
i1l2410:	
;adc_drv.c: 115: adresult = adsum >> 3;
	movf	(ADC_Sample@adsum),w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w	;volatile
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w	;volatile
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u192_25:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u192_20:
	addlw	-1
	skipz
	goto	u192_25
	movf	1+(??_ADC_Sample+0)+0,w
	movwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)	;volatile
	line	118
	
i1l2412:	
;adc_drv.c: 118: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	119
	
i1l2414:	
;adc_drv.c: 119: admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	120
	
i1l2416:	
;adc_drv.c: 120: admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	121
	
i1l2418:	
;adc_drv.c: 121: return 0xA5;
	movlw	low(0A5h)
	line	122
	
i1l443:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,8313
	global	_PowerOnLedSequence

;; *************** function _PowerOnLedSequence *****************
;; Defined at:
;;		line 95 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
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
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	95
global __ptext20
__ptext20:	;psect for function _PowerOnLedSequence
psect	text20
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	95
	global	__size_of_PowerOnLedSequence
	__size_of_PowerOnLedSequence	equ	__end_of_PowerOnLedSequence-_PowerOnLedSequence
	
_PowerOnLedSequence:	
;incstack = 0
	opt	stack 3
; Regs used in _PowerOnLedSequence: [wreg+status,2+status,0]
	line	97
	
i1l2904:	
;led.c: 97: g_powerOnTimer++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_g_powerOnTimer)^080h,f
	skipnz
	incf	(_g_powerOnTimer+1)^080h,f
	line	99
	
i1l2906:	
;led.c: 99: if(g_powerOnPhase == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l2916
u255_20:
	line	102
	
i1l2908:	
;led.c: 100: {
;led.c: 102: RC5 = 1;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	line	103
;led.c: 103: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	104
	
i1l2910:	
;led.c: 104: if(g_powerOnTimer >= 222)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0DEh
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l705
u256_20:
	line	106
	
i1l2912:	
;led.c: 105: {
;led.c: 106: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	107
	
i1l2914:	
;led.c: 107: g_powerOnPhase = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	incf	(_g_powerOnPhase),f
	goto	i1l705
	line	110
	
i1l2916:	
;led.c: 110: else if(g_powerOnPhase == 1)
		decf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u257_21
	goto	u257_20
u257_21:
	goto	i1l705
u257_20:
	line	113
	
i1l2918:	
;led.c: 111: {
;led.c: 113: if(g_powerOnTimer >= 222)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0DEh
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u258_21
	goto	u258_20
u258_21:
	goto	i1l705
u258_20:
	line	115
	
i1l2920:	
;led.c: 114: {
;led.c: 115: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	116
	
i1l2922:	
;led.c: 116: g_powerOnPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_g_powerOnPhase)
	line	117
	
i1l2924:	
;led.c: 117: RC5 = 0;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	118
	
i1l2926:	
;led.c: 118: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	122
	
i1l705:	
	return
	opt stack 0
GLOBAL	__end_of_PowerOnLedSequence
	__end_of_PowerOnLedSequence:
	signat	_PowerOnLedSequence,89
	global	_Led_BlinkProcess

;; *************** function _Led_BlinkProcess *****************
;; Defined at:
;;		line 66 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 800/800
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         6       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	66
global __ptext21
__ptext21:	;psect for function _Led_BlinkProcess
psect	text21
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	66
	global	__size_of_Led_BlinkProcess
	__size_of_Led_BlinkProcess	equ	__end_of_Led_BlinkProcess-_Led_BlinkProcess
	
_Led_BlinkProcess:	
;incstack = 0
	opt	stack 2
; Regs used in _Led_BlinkProcess: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	69
	
i1l3976:	
;led.c: 68: unsigned char i;
;led.c: 69: for(i = 0; i < 12; i++)
	clrf	(Led_BlinkProcess@i)
	line	72
	
i1l3982:	
;led.c: 70: {
;led.c: 72: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState == 3)
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l3986
u427_20:
	
i1l3984:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$494)
	goto	i1l3988
	
i1l3986:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$494)
	
i1l3988:	
	movf	(_Led_BlinkProcess$494),w
	addlw	02h
	movwf	fsr0
		movlw	3
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u428_21
	goto	u428_20
u428_21:
	goto	i1l4022
u428_20:
	line	74
	
i1l3990:	
;led.c: 73: {
;led.c: 74: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer++;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u429_21
	goto	u429_20
u429_21:
	goto	i1l3994
u429_20:
	
i1l3992:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$505)
	goto	i1l3996
	
i1l3994:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$505)
	
i1l3996:	
	movf	(_Led_BlinkProcess$505),w
	addlw	07h
	movwf	fsr0
	movlw	01h
	bsf	status, 7	;select IRP bank2
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	76
	
i1l3998:	
;led.c: 76: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer >= (222 / 2))
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u430_21
	goto	u430_20
u430_21:
	goto	i1l4002
u430_20:
	
i1l4000:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$516)
	goto	i1l4004
	
i1l4002:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$516)
	
i1l4004:	
	movf	(_Led_BlinkProcess$516),w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(??_Led_BlinkProcess+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Led_BlinkProcess+0)+0+1
	movlw	0
	subwf	1+(??_Led_BlinkProcess+0)+0,w
	movlw	06Fh
	skipnz
	subwf	0+(??_Led_BlinkProcess+0)+0,w
	skipc
	goto	u431_21
	goto	u431_20
u431_21:
	goto	i1l4022
u431_20:
	line	78
	
i1l4006:	
;led.c: 77: {
;led.c: 78: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u432_21
	goto	u432_20
u432_21:
	goto	i1l4010
u432_20:
	
i1l4008:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$527)
	goto	i1l4012
	
i1l4010:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$527)
	
i1l4012:	
	movf	(_Led_BlinkProcess$527),w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	79
	
i1l4014:	
;led.c: 79: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase ^= 1;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u433_21
	goto	u433_20
u433_21:
	goto	i1l4018
u433_20:
	
i1l4016:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$538)
	goto	i1l4020
	
i1l4018:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$538)
	
i1l4020:	
	movf	(_Led_BlinkProcess$538),w
	addlw	09h
	movwf	fsr0
	movlw	low(01h)
	bsf	status, 7	;select IRP bank2
	xorwf	indf,f
	line	69
	
i1l4022:	
	incf	(Led_BlinkProcess@i),f
	
i1l4024:	
	movlw	low(0Ch)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u434_21
	goto	u434_20
u434_21:
	goto	i1l3982
u434_20:
	line	83
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_Led_BlinkProcess
	__end_of_Led_BlinkProcess:
	signat	_Led_BlinkProcess,89
	global	_Charging_Control

;; *************** function _Charging_Control *****************
;; Defined at:
;;		line 332 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;;  chargeB7_12     1    4[COMMON] unsigned char 
;;  chargeB1_6      1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 800/A00
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	332
global __ptext22
__ptext22:	;psect for function _Charging_Control
psect	text22
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	332
	global	__size_of_Charging_Control
	__size_of_Charging_Control	equ	__end_of_Charging_Control-_Charging_Control
	
_Charging_Control:	
;incstack = 0
	opt	stack 2
; Regs used in _Charging_Control: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	335
	
i1l4026:	
;charge_mgr.c: 334: unsigned char i;
;charge_mgr.c: 335: unsigned char chargeB1_6 = 0;
	clrf	(Charging_Control@chargeB1_6)
	line	336
;charge_mgr.c: 336: unsigned char chargeB7_12 = 0;
	clrf	(Charging_Control@chargeB7_12)
	line	339
	
i1l4028:	
;charge_mgr.c: 339: if(g_tempProtect)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_g_tempProtect)),w
	btfsc	status,2
	goto	u435_21
	goto	u435_20
u435_21:
	goto	i1l4034
u435_20:
	line	341
;charge_mgr.c: 340: {
;charge_mgr.c: 341: do { RA0=1; RA1=1; RB3=1; RB2=1; RA3=1; RA2=1; RD1=1; RD3=1; RB0=1; RB1=1; RD2=1; RD0=1; } while(0);
	
i1l552:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7	;volatile
	bsf	(1073/8)^080h,(1073)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	bsf	(50/8),(50)&7	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7	;volatile
	bsf	(1074/8)^080h,(1074)&7	;volatile
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2105/8)^0100h,(2105)&7	;volatile
	bsf	(2107/8)^0100h,(2107)&7	;volatile
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7	;volatile
	bsf	(49/8),(49)&7	;volatile
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2106/8)^0100h,(2106)&7	;volatile
	bsf	(2104/8)^0100h,(2104)&7	;volatile
	
i1l553:	
	line	342
;charge_mgr.c: 342: RC3 = 0;
	bcf	(2099/8)^0100h,(2099)&7	;volatile
	line	343
;charge_mgr.c: 343: RC2 = 0;
	bcf	(2098/8)^0100h,(2098)&7	;volatile
	line	344
	
i1l4030:	
;charge_mgr.c: 344: g_pwmDuty = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_g_pwmDuty)	;volatile
	goto	i1l554
	line	349
	
i1l4034:	
;charge_mgr.c: 346: }
;charge_mgr.c: 349: for(i = 0; i < 12; i++)
	clrf	(Charging_Control@i)
	line	351
	
i1l4040:	
;charge_mgr.c: 350: {
;charge_mgr.c: 351: unsigned char s = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state;
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipc
	goto	u436_21
	goto	u436_20
u436_21:
	goto	i1l4044
u436_20:
	
i1l4042:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Charging_Control$426)
	goto	i1l4046
	
i1l4044:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Charging_Control$426)
	
i1l4046:	
	incf	(_Charging_Control$426),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(Charging_Control@s)
	line	355
	
i1l4048:	
;charge_mgr.c: 355: if(i == 2)
		movlw	2
	xorwf	((Charging_Control@i)),w
	btfss	status,2
	goto	u437_21
	goto	u437_20
u437_21:
	goto	i1l4054
u437_20:
	goto	i1l4052
	line	357
	
i1l564:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l4074
	
i1l566:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l4074
	
i1l567:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	goto	i1l4074
	
i1l568:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7	;volatile
	goto	i1l4074
	
i1l569:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l4074
	
i1l570:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l4074
	
i1l571:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l4074
	
i1l572:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l4074
	
i1l573:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7	;volatile
	goto	i1l4074
	
i1l574:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7	;volatile
	goto	i1l4074
	
i1l575:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l4074
	
i1l576:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l4074
	
i1l4052:	
	movf	(Charging_Control@i),w
	; Switch size 1, requested type "space"
; Number of cases is 12, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           37    19 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l564
	xorlw	1^0	; case 1
	skipnz
	goto	i1l566
	xorlw	2^1	; case 2
	skipnz
	goto	i1l567
	xorlw	3^2	; case 3
	skipnz
	goto	i1l568
	xorlw	4^3	; case 4
	skipnz
	goto	i1l569
	xorlw	5^4	; case 5
	skipnz
	goto	i1l570
	xorlw	6^5	; case 6
	skipnz
	goto	i1l571
	xorlw	7^6	; case 7
	skipnz
	goto	i1l572
	xorlw	8^7	; case 8
	skipnz
	goto	i1l573
	xorlw	9^8	; case 9
	skipnz
	goto	i1l574
	xorlw	10^9	; case 10
	skipnz
	goto	i1l575
	xorlw	11^10	; case 11
	skipnz
	goto	i1l576
	goto	i1l4074
	opt asmopt_pop

	line	364
	
i1l4054:	
;charge_mgr.c: 359: }
;charge_mgr.c: 363: if(s == 2 || s == 3 ||
;charge_mgr.c: 364: s == 4 || s == 5)
		movlw	2
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u438_21
	goto	u438_20
u438_21:
	goto	i1l4064
u438_20:
	
i1l4056:	
		movlw	3
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u439_21
	goto	u439_20
u439_21:
	goto	i1l4064
u439_20:
	
i1l4058:	
		movlw	4
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u440_21
	goto	u440_20
u440_21:
	goto	i1l4064
u440_20:
	
i1l4060:	
		movlw	5
	xorwf	((Charging_Control@s)),w
	btfss	status,2
	goto	u441_21
	goto	u441_20
u441_21:
	goto	i1l4072
u441_20:
	goto	i1l4064
	line	366
	
i1l584:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l4066
	
i1l586:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l4066
	
i1l587:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	goto	i1l4066
	
i1l588:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7	;volatile
	goto	i1l4066
	
i1l589:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l4066
	
i1l590:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l4066
	
i1l591:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l4066
	
i1l592:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l4066
	
i1l593:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7	;volatile
	goto	i1l4066
	
i1l594:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7	;volatile
	goto	i1l4066
	
i1l595:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l4066
	
i1l596:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l4066
	
i1l4064:	
	movf	(Charging_Control@i),w
	; Switch size 1, requested type "space"
; Number of cases is 12, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           37    19 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l584
	xorlw	1^0	; case 1
	skipnz
	goto	i1l586
	xorlw	2^1	; case 2
	skipnz
	goto	i1l587
	xorlw	3^2	; case 3
	skipnz
	goto	i1l588
	xorlw	4^3	; case 4
	skipnz
	goto	i1l589
	xorlw	5^4	; case 5
	skipnz
	goto	i1l590
	xorlw	6^5	; case 6
	skipnz
	goto	i1l591
	xorlw	7^6	; case 7
	skipnz
	goto	i1l592
	xorlw	8^7	; case 8
	skipnz
	goto	i1l593
	xorlw	9^8	; case 9
	skipnz
	goto	i1l594
	xorlw	10^9	; case 10
	skipnz
	goto	i1l595
	xorlw	11^10	; case 11
	skipnz
	goto	i1l596
	goto	i1l4066
	opt asmopt_pop

	line	369
	
i1l4066:	
;charge_mgr.c: 369: if(i < 6)
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipnc
	goto	u442_21
	goto	u442_20
u442_21:
	goto	i1l598
u442_20:
	line	370
	
i1l4068:	
;charge_mgr.c: 370: chargeB1_6 = 1;
	clrf	(Charging_Control@chargeB1_6)
	incf	(Charging_Control@chargeB1_6),f
	goto	i1l4074
	line	371
	
i1l598:	
	line	372
;charge_mgr.c: 371: else
;charge_mgr.c: 372: chargeB7_12 = 1;
	clrf	(Charging_Control@chargeB7_12)
	incf	(Charging_Control@chargeB7_12),f
	goto	i1l4074
	line	376
	
i1l4072:	
	movf	(Charging_Control@i),w
	; Switch size 1, requested type "space"
; Number of cases is 12, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           37    19 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l564
	xorlw	1^0	; case 1
	skipnz
	goto	i1l566
	xorlw	2^1	; case 2
	skipnz
	goto	i1l567
	xorlw	3^2	; case 3
	skipnz
	goto	i1l568
	xorlw	4^3	; case 4
	skipnz
	goto	i1l569
	xorlw	5^4	; case 5
	skipnz
	goto	i1l570
	xorlw	6^5	; case 6
	skipnz
	goto	i1l571
	xorlw	7^6	; case 7
	skipnz
	goto	i1l572
	xorlw	8^7	; case 8
	skipnz
	goto	i1l573
	xorlw	9^8	; case 9
	skipnz
	goto	i1l574
	xorlw	10^9	; case 10
	skipnz
	goto	i1l575
	xorlw	11^10	; case 11
	skipnz
	goto	i1l576
	goto	i1l4074
	opt asmopt_pop

	line	349
	
i1l4074:	
	incf	(Charging_Control@i),f
	
i1l4076:	
	movlw	low(0Ch)
	subwf	(Charging_Control@i),w
	skipc
	goto	u443_21
	goto	u443_20
u443_21:
	goto	i1l4040
u443_20:
	
i1l556:	
	line	381
;charge_mgr.c: 377: }
;charge_mgr.c: 378: }
;charge_mgr.c: 381: RC3 = chargeB1_6;
	btfsc	(Charging_Control@chargeB1_6),0
	goto	u444_21
	goto	u444_20
	
u444_21:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2099/8)^0100h,(2099)&7	;volatile
	goto	u445_24
u444_20:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2099/8)^0100h,(2099)&7	;volatile
u445_24:
	line	382
;charge_mgr.c: 382: RC2 = chargeB7_12;
	btfsc	(Charging_Control@chargeB7_12),0
	goto	u446_21
	goto	u446_20
	
u446_21:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2098/8)^0100h,(2098)&7	;volatile
	goto	u447_24
u446_20:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2098/8)^0100h,(2098)&7	;volatile
u447_24:
	line	385
	
i1l554:	
	return
	opt stack 0
GLOBAL	__end_of_Charging_Control
	__end_of_Charging_Control:
	signat	_Charging_Control,89
	global	_ChargeProcess_Slot

;; *************** function _ChargeProcess_Slot *****************
;; Defined at:
;;		line 142 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;  idx             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  idx             1    5[COMMON] unsigned char 
;;  v               2    8[COMMON] unsigned int 
;;  tick            2    0        unsigned int 
;;  p               1   10[COMMON] PTR struct .
;;		 -> g_slot1(72), g_slot0(72), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 800/800
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         6       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Detect_BatteryType
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	142
global __ptext23
__ptext23:	;psect for function _ChargeProcess_Slot
psect	text23
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	142
	global	__size_of_ChargeProcess_Slot
	__size_of_ChargeProcess_Slot	equ	__end_of_ChargeProcess_Slot-_ChargeProcess_Slot
	
_ChargeProcess_Slot:	
;incstack = 0
	opt	stack 2
; Regs used in _ChargeProcess_Slot: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ChargeProcess_Slot@idx stored from wreg
	movwf	(ChargeProcess_Slot@idx)
	line	144
	
i1l3822:	
;charge_mgr.c: 144: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(ChargeProcess_Slot@idx),w
	skipc
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l3826
u403_20:
	
i1l3824:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(ChargeProcess_Slot@p)
	goto	i1l3828
	
i1l3826:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(ChargeProcess_Slot@p)
	line	148
	
i1l3828:	
;charge_mgr.c: 148: if(idx == 2)
		movlw	2
	xorwf	((ChargeProcess_Slot@idx)),w
	btfss	status,2
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l3834
u404_20:
	line	150
	
i1l3830:	
;charge_mgr.c: 149: {
;charge_mgr.c: 150: p->state = 0;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	goto	i1l516
	line	155
	
i1l3834:	
;charge_mgr.c: 152: }
;charge_mgr.c: 155: unsigned int v = p->voltage;
	movf	(ChargeProcess_Slot@p),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(ChargeProcess_Slot@v)
	incf	fsr0,f
	movf	indf,w
	movwf	(ChargeProcess_Slot@v+1)
	line	156
	
i1l3836:	
	line	158
;charge_mgr.c: 158: switch(p->state)
	goto	i1l3954
	line	162
	
i1l3838:	
;charge_mgr.c: 162: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	163
;charge_mgr.c: 163: p->stableCnt = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	0Ah
	movwf	fsr0
	clrf	indf
	line	164
	
i1l3840:	
;charge_mgr.c: 164: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	165
;charge_mgr.c: 165: break;
	goto	i1l516
	line	169
	
i1l3842:	
;charge_mgr.c: 169: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	170
	
i1l3844:	
;charge_mgr.c: 170: if(p->chargeTimer < (2 * 222))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	01h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	0BCh
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipnc
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l3848
u405_20:
	goto	i1l516
	line	174
	
i1l3848:	
;charge_mgr.c: 174: p->type = Detect_BatteryType(v);
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	(ChargeProcess_Slot@v+1),w
	movwf	(Detect_BatteryType@voltage+1)
	movf	(ChargeProcess_Slot@v),w
	movwf	(Detect_BatteryType@voltage)
	fcall	_Detect_BatteryType
	movwf	indf
	line	179
	
i1l3850:	
;charge_mgr.c: 177: if(p->type == 4 ||
;charge_mgr.c: 178: p->type == 2 ||
;charge_mgr.c: 179: p->type == 0)
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	4
	xorwf	(indf),w
	btfsc	status,2
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l3856
u406_20:
	
i1l3852:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	2
	xorwf	(indf),w
	btfsc	status,2
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l3856
u407_20:
	
i1l3854:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	(indf),w
	btfss	status,2
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l3858
u408_20:
	line	181
	
i1l3856:	
;charge_mgr.c: 180: {
;charge_mgr.c: 181: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	182
;charge_mgr.c: 182: break;
	goto	i1l516
	line	186
	
i1l3858:	
;charge_mgr.c: 183: }
;charge_mgr.c: 186: if(v <= 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l3866
u409_20:
	line	188
	
i1l3860:	
;charge_mgr.c: 187: {
;charge_mgr.c: 188: p->state = 2;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	189
	
i1l3862:	
;charge_mgr.c: 189: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	190
	
i1l3864:	
;charge_mgr.c: 190: p->activatePulseCnt = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	0Bh
	movwf	fsr0
	clrf	indf
	line	191
;charge_mgr.c: 191: }
	goto	i1l516
	line	193
	
i1l3866:	
;charge_mgr.c: 193: else if(v < 62)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	03Eh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l3872
u410_20:
	line	195
	
i1l3868:	
;charge_mgr.c: 194: {
;charge_mgr.c: 195: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	196
	
i1l3870:	
;charge_mgr.c: 196: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	197
;charge_mgr.c: 197: }
	goto	i1l516
	line	201
	
i1l3872:	
;charge_mgr.c: 199: else
;charge_mgr.c: 200: {
;charge_mgr.c: 201: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	202
	
i1l3874:	
;charge_mgr.c: 202: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l516
	line	209
	
i1l3876:	
;charge_mgr.c: 209: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	211
	
i1l3878:	
;charge_mgr.c: 211: if(p->chargeTimer > (60 * 222))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	034h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	09h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l3882
u411_20:
	line	213
	
i1l3880:	
;charge_mgr.c: 212: {
;charge_mgr.c: 213: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	214
;charge_mgr.c: 214: break;
	goto	i1l516
	line	217
	
i1l3882:	
;charge_mgr.c: 215: }
;charge_mgr.c: 217: if(v > 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l3888
u412_20:
	line	219
	
i1l3884:	
;charge_mgr.c: 218: {
;charge_mgr.c: 219: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	220
	
i1l3886:	
;charge_mgr.c: 220: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	221
;charge_mgr.c: 221: break;
	goto	i1l516
	line	224
	
i1l3888:	
;charge_mgr.c: 222: }
;charge_mgr.c: 224: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l516
u413_20:
	line	226
	
i1l3890:	
;charge_mgr.c: 225: {
;charge_mgr.c: 226: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	227
;charge_mgr.c: 227: break;
	goto	i1l516
	line	233
	
i1l3892:	
;charge_mgr.c: 233: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	235
	
i1l3894:	
;charge_mgr.c: 235: if(p->chargeTimer > (300 * 222))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	04h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	029h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l3898
u414_20:
	line	237
	
i1l3896:	
;charge_mgr.c: 236: {
;charge_mgr.c: 237: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	238
;charge_mgr.c: 238: break;
	goto	i1l516
	line	241
	
i1l3898:	
;charge_mgr.c: 239: }
;charge_mgr.c: 241: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l3902
u415_20:
	line	243
	
i1l3900:	
;charge_mgr.c: 242: {
;charge_mgr.c: 243: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	244
;charge_mgr.c: 244: break;
	goto	i1l516
	line	247
	
i1l3902:	
;charge_mgr.c: 245: }
;charge_mgr.c: 247: if(v >= 124)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	07Ch
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l516
u416_20:
	line	249
	
i1l3904:	
;charge_mgr.c: 248: {
;charge_mgr.c: 249: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	250
	
i1l3906:	
;charge_mgr.c: 250: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l516
	line	256
	
i1l3908:	
;charge_mgr.c: 256: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	258
	
i1l3910:	
;charge_mgr.c: 258: if(p->chargeTimer > (10800 * 222))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	095h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	0A1h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l3914
u417_20:
	line	260
	
i1l3912:	
;charge_mgr.c: 259: {
;charge_mgr.c: 260: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	261
;charge_mgr.c: 261: break;
	goto	i1l516
	line	264
	
i1l3914:	
;charge_mgr.c: 262: }
;charge_mgr.c: 264: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l3918
u418_20:
	line	266
	
i1l3916:	
;charge_mgr.c: 265: {
;charge_mgr.c: 266: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	267
;charge_mgr.c: 267: break;
	goto	i1l516
	line	270
	
i1l3918:	
;charge_mgr.c: 268: }
;charge_mgr.c: 270: if(v >= 188)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0BCh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l516
u419_20:
	line	272
	
i1l3920:	
;charge_mgr.c: 271: {
;charge_mgr.c: 272: p->state = 5;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(05h)
	movwf	indf
	line	273
	
i1l3922:	
;charge_mgr.c: 273: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l516
	line	279
	
i1l3924:	
;charge_mgr.c: 279: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	281
	
i1l3926:	
;charge_mgr.c: 281: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l3930
u420_20:
	line	283
	
i1l3928:	
;charge_mgr.c: 282: {
;charge_mgr.c: 283: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	284
;charge_mgr.c: 284: break;
	goto	i1l516
	line	287
	
i1l3930:	
;charge_mgr.c: 285: }
;charge_mgr.c: 287: if(p->chargeTimer > (600 * 222))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	08h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	051h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l516
u421_20:
	line	289
	
i1l3932:	
;charge_mgr.c: 288: {
;charge_mgr.c: 289: p->state = 6;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(06h)
	movwf	indf
	goto	i1l516
	line	296
	
i1l3934:	
;charge_mgr.c: 296: if(v < (188 - 10))
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0B2h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l516
u422_20:
	line	298
	
i1l3936:	
;charge_mgr.c: 297: {
;charge_mgr.c: 298: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	299
	
i1l3938:	
;charge_mgr.c: 299: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l516
	line	307
	
i1l3940:	
;charge_mgr.c: 306: if(v > 12 && v < 198 &&
;charge_mgr.c: 307: p->type == 1)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l516
u423_20:
	
i1l3942:	
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l516
u424_20:
	
i1l3944:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		decf	(indf),w
	btfss	status,2
	goto	u425_21
	goto	u425_20
u425_21:
	goto	i1l516
u425_20:
	line	309
	
i1l3946:	
;charge_mgr.c: 308: {
;charge_mgr.c: 309: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	310
	
i1l3948:	
;charge_mgr.c: 310: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l516
	line	315
	
i1l3950:	
;charge_mgr.c: 315: p->state = 0;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	line	316
;charge_mgr.c: 316: break;
	goto	i1l516
	line	158
	
i1l3954:	
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	indf,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           32     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l3838
	xorlw	1^0	; case 1
	skipnz
	goto	i1l3842
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3876
	xorlw	3^2	; case 3
	skipnz
	goto	i1l3892
	xorlw	4^3	; case 4
	skipnz
	goto	i1l3908
	xorlw	5^4	; case 5
	skipnz
	goto	i1l3924
	xorlw	6^5	; case 6
	skipnz
	goto	i1l3934
	xorlw	7^6	; case 7
	skipnz
	goto	i1l3940
	goto	i1l3950
	opt asmopt_pop

	line	318
	
i1l516:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeProcess_Slot
	__end_of_ChargeProcess_Slot:
	signat	_ChargeProcess_Slot,4217
	global	_Detect_BatteryType

;; *************** function _Detect_BatteryType *****************
;; Defined at:
;;		line 87 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;  voltage         2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 800/800
;;		On exit  : 800/800
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ChargeProcess_Slot
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	87
global __ptext24
__ptext24:	;psect for function _Detect_BatteryType
psect	text24
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	87
	global	__size_of_Detect_BatteryType
	__size_of_Detect_BatteryType	equ	__end_of_Detect_BatteryType-_Detect_BatteryType
	
_Detect_BatteryType:	
;incstack = 0
	opt	stack 2
; Regs used in _Detect_BatteryType: [wreg]
	line	90
	
i1l2496:	
;charge_mgr.c: 90: if(voltage <= 5)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	06h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l2502
u204_20:
	line	91
	
i1l2498:	
;charge_mgr.c: 91: return 4;
	movlw	low(04h)
	goto	i1l500
	line	94
	
i1l2502:	
;charge_mgr.c: 94: if(voltage <= 12)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0Dh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l2508
u205_20:
	line	95
	
i1l2504:	
;charge_mgr.c: 95: return 1;
	movlw	low(01h)
	goto	i1l500
	line	98
	
i1l2508:	
;charge_mgr.c: 98: if(voltage >= 136 && voltage <= 161)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	088h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u206_21
	goto	u206_20
u206_21:
	goto	i1l2516
u206_20:
	
i1l2510:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0A2h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u207_21
	goto	u207_20
u207_21:
	goto	i1l2516
u207_20:
	line	99
	
i1l2512:	
;charge_mgr.c: 99: return 2;
	movlw	low(02h)
	goto	i1l500
	line	102
	
i1l2516:	
;charge_mgr.c: 102: if(voltage >= 62 && voltage <= 188)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	03Eh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l2524
u208_20:
	
i1l2518:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l2524
u209_20:
	goto	i1l2504
	line	106
	
i1l2524:	
;charge_mgr.c: 106: if(voltage > 188 && voltage < 198)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u210_21
	goto	u210_20
u210_21:
	goto	i1l2532
u210_20:
	
i1l2526:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0C6h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u211_21
	goto	u211_20
u211_21:
	goto	i1l2532
u211_20:
	goto	i1l2504
	line	110
	
i1l2532:	
;charge_mgr.c: 110: return 0;
	movlw	low(0)
	line	111
	
i1l500:	
	return
	opt stack 0
GLOBAL	__end_of_Detect_BatteryType
	__end_of_Detect_BatteryType:
	signat	_Detect_BatteryType,4217
	global	_CCCV_Control

;; *************** function _CCCV_Control *****************
;; Defined at:
;;		line 403 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1   13[BANK0 ] unsigned char 
;;  duty            2   11[BANK0 ] int 
;;  error           2    9[BANK0 ] int 
;;  adjust          2    0[BANK0 ] int 
;;  maxV            2    7[BANK0 ] unsigned int 
;;  i               1   14[BANK0 ] unsigned char 
;;  cvCount         1    3[BANK0 ] unsigned char 
;;  hasCharging     1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 100/A00
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      15       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2      15       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	line	403
global __ptext25
__ptext25:	;psect for function _CCCV_Control
psect	text25
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	403
	global	__size_of_CCCV_Control
	__size_of_CCCV_Control	equ	__end_of_CCCV_Control-_CCCV_Control
	
_CCCV_Control:	
;incstack = 0
	opt	stack 2
; Regs used in _CCCV_Control: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	406
	
i1l4078:	
;charge_mgr.c: 405: unsigned char i;
;charge_mgr.c: 406: unsigned char hasCharging = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(CCCV_Control@hasCharging)
	line	407
;charge_mgr.c: 407: unsigned int maxV = 0;
	clrf	(CCCV_Control@maxV)
	clrf	(CCCV_Control@maxV+1)
	line	408
;charge_mgr.c: 408: unsigned char cvCount = 0;
	clrf	(CCCV_Control@cvCount)
	line	411
;charge_mgr.c: 411: for(i = 0; i < 12; i++)
	clrf	(CCCV_Control@i)
	line	413
	
i1l4084:	
;charge_mgr.c: 412: {
;charge_mgr.c: 413: unsigned char s = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state;
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u448_21
	goto	u448_20
u448_21:
	goto	i1l4088
u448_20:
	
i1l4086:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$443)
	goto	i1l4090
	
i1l4088:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$443)
	
i1l4090:	
	incf	(_CCCV_Control$443),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CCCV_Control@s)
	line	417
	
i1l4092:	
;charge_mgr.c: 417: if(i == 2) continue;
		movlw	2
	xorwf	((CCCV_Control@i)),w
	btfss	status,2
	goto	u449_21
	goto	u449_20
u449_21:
	goto	i1l4096
u449_20:
	goto	i1l626
	line	421
	
i1l4096:	
;charge_mgr.c: 420: if(s == 2 || s == 3 ||
;charge_mgr.c: 421: s == 4 || s == 5)
		movlw	2
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u450_21
	goto	u450_20
u450_21:
	goto	i1l629
u450_20:
	
i1l4098:	
		movlw	3
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u451_21
	goto	u451_20
u451_21:
	goto	i1l629
u451_20:
	
i1l4100:	
		movlw	4
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u452_21
	goto	u452_20
u452_21:
	goto	i1l629
u452_20:
	
i1l4102:	
		movlw	5
	xorwf	((CCCV_Control@s)),w
	btfss	status,2
	goto	u453_21
	goto	u453_20
u453_21:
	goto	i1l626
u453_20:
	
i1l629:	
	line	423
;charge_mgr.c: 422: {
;charge_mgr.c: 423: hasCharging = 1;
	clrf	(CCCV_Control@hasCharging)
	incf	(CCCV_Control@hasCharging),f
	line	424
	
i1l4104:	
;charge_mgr.c: 424: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage > maxV)
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u454_21
	goto	u454_20
u454_21:
	goto	i1l4108
u454_20:
	
i1l4106:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$454)
	goto	i1l4110
	
i1l4108:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$454)
	
i1l4110:	
	movf	(_CCCV_Control$454),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(??_CCCV_Control+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CCCV_Control+0)+0+1
	movf	1+(??_CCCV_Control+0)+0,w
	subwf	(CCCV_Control@maxV+1),w
	skipz
	goto	u455_25
	movf	0+(??_CCCV_Control+0)+0,w
	subwf	(CCCV_Control@maxV),w
u455_25:
	skipnc
	goto	u455_21
	goto	u455_20
u455_21:
	goto	i1l4120
u455_20:
	line	425
	
i1l4112:	
;charge_mgr.c: 425: maxV = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage;
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u456_21
	goto	u456_20
u456_21:
	goto	i1l4116
u456_20:
	
i1l4114:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$465)
	goto	i1l4118
	
i1l4116:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$465)
	
i1l4118:	
	movf	(_CCCV_Control$465),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CCCV_Control@maxV)
	incf	fsr0,f
	movf	indf,w
	movwf	(CCCV_Control@maxV+1)
	line	426
	
i1l4120:	
;charge_mgr.c: 426: if(s == 5)
		movlw	5
	xorwf	((CCCV_Control@s)),w
	btfss	status,2
	goto	u457_21
	goto	u457_20
u457_21:
	goto	i1l626
u457_20:
	line	427
	
i1l4122:	
;charge_mgr.c: 427: cvCount++;
	incf	(CCCV_Control@cvCount),f
	line	411
	
i1l626:	
	incf	(CCCV_Control@i),f
	
i1l4124:	
	movlw	low(0Ch)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u458_21
	goto	u458_20
u458_21:
	goto	i1l4084
u458_20:
	line	432
	
i1l4126:	
;charge_mgr.c: 428: }
;charge_mgr.c: 429: }
;charge_mgr.c: 432: if(!hasCharging)
	movf	((CCCV_Control@hasCharging)),w
	btfss	status,2
	goto	u459_21
	goto	u459_20
u459_21:
	goto	i1l4132
u459_20:
	line	434
	
i1l4128:	
;charge_mgr.c: 433: {
;charge_mgr.c: 434: g_pwmDuty = 0;
	clrf	(_g_pwmDuty)	;volatile
	line	435
;charge_mgr.c: 435: g_cvIntegral = 0;
	clrf	(_g_cvIntegral)
	clrf	(_g_cvIntegral+1)
	goto	i1l641
	line	442
	
i1l4132:	
;charge_mgr.c: 437: }
;charge_mgr.c: 442: if(cvCount == 0)
	movf	((CCCV_Control@cvCount)),w
	btfss	status,2
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l4150
u460_20:
	line	444
	
i1l4134:	
;charge_mgr.c: 443: {
;charge_mgr.c: 444: if(g_pwmDuty < 25)
	movlw	low(019h)
	subwf	(_g_pwmDuty),w	;volatile
	skipnc
	goto	u461_21
	goto	u461_20
u461_21:
	goto	i1l4142
u461_20:
	line	447
	
i1l4136:	
;charge_mgr.c: 445: {
;charge_mgr.c: 447: g_pwmDuty += 3;
	movlw	low(03h)
	addwf	(_g_pwmDuty),f	;volatile
	line	448
	
i1l4138:	
;charge_mgr.c: 448: if(g_pwmDuty > 25)
	movlw	low(01Ah)
	subwf	(_g_pwmDuty),w	;volatile
	skipc
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l641
u462_20:
	line	449
	
i1l4140:	
;charge_mgr.c: 449: g_pwmDuty = 25;
	movlw	low(019h)
	movwf	(_g_pwmDuty)	;volatile
	goto	i1l641
	line	451
	
i1l4142:	
	goto	i1l4140
	line	470
	
i1l4150:	
;charge_mgr.c: 462: }
;charge_mgr.c: 469: {
;charge_mgr.c: 470: int error = (int)(188) - (int)(maxV);
	movlw	0BCh
	movwf	(CCCV_Control@error)
	clrf	(CCCV_Control@error+1)
	movf	(CCCV_Control@maxV),w
	subwf	(CCCV_Control@error),f
	movf	(CCCV_Control@maxV+1),w
	skipc
	decf	(CCCV_Control@error+1),f
	subwf	(CCCV_Control@error+1),f
	line	473
;charge_mgr.c: 473: g_cvIntegral += error * 1;
	movf	(CCCV_Control@error),w
	addwf	(_g_cvIntegral),f
	skipnc
	incf	(_g_cvIntegral+1),f
	movf	(CCCV_Control@error+1),w
	addwf	(_g_cvIntegral+1),f
	line	474
	
i1l4152:	
;charge_mgr.c: 474: if(g_cvIntegral > 200)
	movf	(_g_cvIntegral+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u463_25
	movlw	0C9h
	subwf	(_g_cvIntegral),w
u463_25:

	skipc
	goto	u463_21
	goto	u463_20
u463_21:
	goto	i1l4156
u463_20:
	line	475
	
i1l4154:	
;charge_mgr.c: 475: g_cvIntegral = 200;
	movlw	0C8h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_cvIntegral)
	clrf	(_g_cvIntegral+1)
	goto	i1l4160
	line	476
	
i1l4156:	
;charge_mgr.c: 476: else if(g_cvIntegral < -200)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_cvIntegral+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0FFh)^80h
	subwf	btemp+1,w
	skipz
	goto	u464_25
	movlw	038h
	subwf	(_g_cvIntegral),w
u464_25:

	skipnc
	goto	u464_21
	goto	u464_20
u464_21:
	goto	i1l4160
u464_20:
	line	477
	
i1l4158:	
;charge_mgr.c: 477: g_cvIntegral = -200;
	movlw	038h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_cvIntegral)
	movlw	0FFh
	movwf	((_g_cvIntegral))+1
	line	480
	
i1l4160:	
;charge_mgr.c: 480: int adjust = (error * 4 + g_cvIntegral) / 8;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(CCCV_Control@error+1),w
	movwf	(??_CCCV_Control+0)+0+1
	movf	(CCCV_Control@error),w
	movwf	(??_CCCV_Control+0)+0
	clrc
	rlf	(??_CCCV_Control+0)+0,f
	rlf	(??_CCCV_Control+0)+1,f
	clrc
	rlf	(??_CCCV_Control+0)+0,f
	rlf	(??_CCCV_Control+0)+1,f
	movf	0+(??_CCCV_Control+0)+0,w
	movwf	(___awdiv@dividend)
	movf	1+(??_CCCV_Control+0)+0,w
	movwf	(___awdiv@dividend+1)
	movf	(_g_cvIntegral),w
	addwf	(___awdiv@dividend),f
	skipnc
	incf	(___awdiv@dividend+1),f
	movf	(_g_cvIntegral+1),w
	addwf	(___awdiv@dividend+1),f
	movlw	08h
	movwf	(___awdiv@divisor)
	clrf	(___awdiv@divisor+1)
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(CCCV_Control@adjust+1)
	movf	(0+(?___awdiv)),w
	movwf	(CCCV_Control@adjust)
	line	481
	
i1l4162:	
;charge_mgr.c: 481: int duty = (int)g_pwmDuty + adjust;
	movf	(_g_pwmDuty),w	;volatile
	movwf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	
i1l4164:	
	movf	(CCCV_Control@adjust),w
	addwf	(CCCV_Control@duty),f
	skipnc
	incf	(CCCV_Control@duty+1),f
	movf	(CCCV_Control@adjust+1),w
	addwf	(CCCV_Control@duty+1),f
	line	484
	
i1l4166:	
;charge_mgr.c: 484: if(duty > 32) duty = 32;
	movf	(CCCV_Control@duty+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u465_25
	movlw	021h
	subwf	(CCCV_Control@duty),w
u465_25:

	skipc
	goto	u465_21
	goto	u465_20
u465_21:
	goto	i1l4170
u465_20:
	
i1l4168:	
	movlw	020h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	line	485
	
i1l4170:	
;charge_mgr.c: 485: if(duty < 0) duty = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(CCCV_Control@duty+1),7
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l4174
u466_20:
	
i1l4172:	
	clrf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	line	487
	
i1l4174:	
;charge_mgr.c: 487: g_pwmDuty = (unsigned char)duty;
	movf	(CCCV_Control@duty),w
	movwf	(_g_pwmDuty)	;volatile
	line	489
	
i1l641:	
	return
	opt stack 0
GLOBAL	__end_of_CCCV_Control
	__end_of_CCCV_Control:
	signat	_CCCV_Control,89
	global	i1___bmul

;; *************** function i1___bmul *****************
;; Defined at:
;;		line 4 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    1[COMMON] unsigned char 
;;  __bmul          1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt_Isr
;;		_ChargeProcess_Slot
;;		_Charging_Control
;;		_CCCV_Control
;;		_Update_LED_Slot
;;		_Led_BlinkProcess
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
	line	4
global __ptext26
__ptext26:	;psect for function i1___bmul
psect	text26
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
	line	4
	global	__size_ofi1___bmul
	__size_ofi1___bmul	equ	__end_ofi1___bmul-i1___bmul
	
i1___bmul:	
;incstack = 0
	opt	stack 3
; Regs used in i1___bmul: [wreg+status,2+status,0]
;i1___bmul@multiplier stored from wreg
	movwf	(i1___bmul@multiplier)
	line	6
	
i1l2660:	
	clrf	(i1___bmul@product)
	line	43
	
i1l2662:	
	btfss	(i1___bmul@multiplier),(0)&7
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l2666
u231_20:
	line	44
	
i1l2664:	
	movf	(i1___bmul@multiplicand),w
	addwf	(i1___bmul@product),f
	line	45
	
i1l2666:	
	clrc
	rlf	(i1___bmul@multiplicand),f
	line	46
	
i1l2668:	
	clrc
	rrf	(i1___bmul@multiplier),f
	line	47
	movf	((i1___bmul@multiplier)),w
	btfss	status,2
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l2662
u232_20:
	line	50
	
i1l2670:	
	movf	(i1___bmul@product),w
	line	51
	
i1l794:	
	return
	opt stack 0
GLOBAL	__end_ofi1___bmul
	__end_ofi1___bmul:
	signat	i1___bmul,89
	global	___awdiv

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 6 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] int 
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/800
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CCCV_Control
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\awdiv.c"
	line	6
global __ptext27
__ptext27:	;psect for function ___awdiv
psect	text27
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\awdiv.c"
	line	6
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	14
	
i1l2590:	
	clrf	(___awdiv@sign)
	line	15
	
i1l2592:	
	btfss	(___awdiv@divisor+1),7
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l2598
u220_20:
	line	16
	
i1l2594:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	17
	
i1l2596:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	19
	
i1l2598:	
	btfss	(___awdiv@dividend+1),7
	goto	u221_21
	goto	u221_20
u221_21:
	goto	i1l2604
u221_20:
	line	20
	
i1l2600:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	21
	
i1l2602:	
	movlw	low(01h)
	xorwf	(___awdiv@sign),f
	line	23
	
i1l2604:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	24
	
i1l2606:	
	movf	((___awdiv@divisor)),w
iorwf	((___awdiv@divisor+1)),w
	btfsc	status,2
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l2626
u222_20:
	line	25
	
i1l2608:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	26
	goto	i1l2612
	line	27
	
i1l2610:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	28
	incf	(___awdiv@counter),f
	line	26
	
i1l2612:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l2610
u223_20:
	line	31
	
i1l2614:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	32
	
i1l2616:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u224_25
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u224_25:
	skipc
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l2622
u224_20:
	line	33
	
i1l2618:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	34
	
i1l2620:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	36
	
i1l2622:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	37
	
i1l2624:	
	decfsz	(___awdiv@counter),f
	goto	u225_21
	goto	u225_20
u225_21:
	goto	i1l2614
u225_20:
	line	39
	
i1l2626:	
	movf	((___awdiv@sign)),w
	btfsc	status,2
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l2630
u226_20:
	line	40
	
i1l2628:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	41
	
i1l2630:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	42
	
i1l906:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
	signat	___awdiv,8314
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
