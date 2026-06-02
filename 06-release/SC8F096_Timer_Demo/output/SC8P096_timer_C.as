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
	FNCALL	_main,_System_Init
	FNCALL	_System_Init,___bmul
	FNROOT	_main
	FNCALL	_Interrupt_Isr,_ADC_ReadChannel
	FNCALL	_Interrupt_Isr,_ADC_Sample
	FNCALL	_Interrupt_Isr,_ChargeProcess_Slot
	FNCALL	_Interrupt_Isr,_Charging_Control
	FNCALL	_Interrupt_Isr,_Led_BlinkProcess
	FNCALL	_Interrupt_Isr,_PowerOnLedSequence
	FNCALL	_Interrupt_Isr,_Print_Status
	FNCALL	_Interrupt_Isr,_Read_Temperature
	FNCALL	_Interrupt_Isr,_SlotPin_ToAnalog
	FNCALL	_Interrupt_Isr,_SlotPin_ToDigital
	FNCALL	_Interrupt_Isr,_Update_LED_Slot
	FNCALL	_Interrupt_Isr,___ftdiv
	FNCALL	_Interrupt_Isr,___fttol
	FNCALL	_Interrupt_Isr,___lwtoft
	FNCALL	_Interrupt_Isr,i1___bmul
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	_Update_LED_Slot,i1___bmul
	FNCALL	_SlotPin_ToDigital,i1___bmul
	FNCALL	_SlotPin_ToAnalog,i1___bmul
	FNCALL	_Read_Temperature,_ADC_ReadChannel
	FNCALL	_Read_Temperature,___lldiv
	FNCALL	_Read_Temperature,___lmul
	FNCALL	_ADC_ReadChannel,_ADC_Sample
	FNCALL	_Print_Status,_uart_send_number
	FNCALL	_Print_Status,_uart_send_string
	FNCALL	_Print_Status,i1___bmul
	FNCALL	_uart_send_string,_uart_send_char
	FNCALL	_uart_send_number,___lwdiv
	FNCALL	_uart_send_number,___lwmod
	FNCALL	_uart_send_number,_uart_send_char
	FNCALL	_Led_BlinkProcess,i1___bmul
	FNCALL	_Charging_Control,i1___bmul
	FNCALL	_ChargeProcess_Slot,_Detect_BatteryType
	FNCALL	_ChargeProcess_Slot,i1___bmul
	FNCALL	intlevel1,_Interrupt_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_g_temperature
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	4

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
	line	14
_s_adcChannels:
	retlw	low(0)
	retlw	01h
	retlw	0Bh
	retlw	0Ah
	retlw	03h
	retlw	02h
	retlw	017h
	retlw	019h
	retlw	08h
	retlw	09h
	retlw	018h
	retlw	016h
	global __end_of_s_adcChannels
__end_of_s_adcChannels:
	global	_s_slotPins
psect	strings
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	20
_s_slotPins:
	retlw	low(133|((0x0)<<8))
	retlw	high(133|((0x0)<<8))

	retlw	low(134|((0x0)<<8))
	retlw	high(134|((0x0)<<8))

	retlw	01h
	retlw	low(147|((0x0)<<8))
	retlw	01h
	retlw	low(133|((0x0)<<8))
	retlw	high(133|((0x0)<<8))

	retlw	low(134|((0x0)<<8))
	retlw	high(134|((0x0)<<8))

	retlw	02h
	retlw	low(147|((0x0)<<8))
	retlw	02h
	retlw	low(5|((0x0)<<8))
	retlw	high(5|((0x0)<<8))

	retlw	low(6|((0x0)<<8))
	retlw	high(6|((0x0)<<8))

	retlw	08h
	retlw	low(148|((0x0)<<8))
	retlw	08h
	retlw	low(5|((0x0)<<8))
	retlw	high(5|((0x0)<<8))

	retlw	low(6|((0x0)<<8))
	retlw	high(6|((0x0)<<8))

	retlw	04h
	retlw	low(148|((0x0)<<8))
	retlw	04h
	retlw	low(133|((0x0)<<8))
	retlw	high(133|((0x0)<<8))

	retlw	low(134|((0x0)<<8))
	retlw	high(134|((0x0)<<8))

	retlw	08h
	retlw	low(147|((0x0)<<8))
	retlw	08h
	retlw	low(133|((0x0)<<8))
	retlw	high(133|((0x0)<<8))

	retlw	low(134|((0x0)<<8))
	retlw	high(134|((0x0)<<8))

	retlw	04h
	retlw	low(147|((0x0)<<8))
	retlw	04h
	retlw	low(276|((0x1)<<8))
	retlw	high(276|((0x1)<<8))

	retlw	low(263|((0x1)<<8))
	retlw	high(263|((0x1)<<8))

	retlw	02h
	retlw	low(140|((0x0)<<8))
	retlw	02h
	retlw	low(276|((0x1)<<8))
	retlw	high(276|((0x1)<<8))

	retlw	low(263|((0x1)<<8))
	retlw	high(263|((0x1)<<8))

	retlw	08h
	retlw	low(140|((0x0)<<8))
	retlw	08h
	retlw	low(5|((0x0)<<8))
	retlw	high(5|((0x0)<<8))

	retlw	low(6|((0x0)<<8))
	retlw	high(6|((0x0)<<8))

	retlw	01h
	retlw	low(148|((0x0)<<8))
	retlw	01h
	retlw	low(5|((0x0)<<8))
	retlw	high(5|((0x0)<<8))

	retlw	low(6|((0x0)<<8))
	retlw	high(6|((0x0)<<8))

	retlw	02h
	retlw	low(148|((0x0)<<8))
	retlw	02h
	retlw	low(276|((0x1)<<8))
	retlw	high(276|((0x1)<<8))

	retlw	low(263|((0x1)<<8))
	retlw	high(263|((0x1)<<8))

	retlw	04h
	retlw	low(140|((0x0)<<8))
	retlw	04h
	retlw	low(276|((0x1)<<8))
	retlw	high(276|((0x1)<<8))

	retlw	low(263|((0x1)<<8))
	retlw	high(263|((0x1)<<8))

	retlw	01h
	retlw	low(140|((0x0)<<8))
	retlw	01h
	global __end_of_s_slotPins
__end_of_s_slotPins:
	global	_s_adcChannels
	global	_s_slotPins
	global	_RxTable
	global	_g_systemTick
	global	_power_ad
	global	Interrupt_Isr@RxNum
	global	_g_powerOnPhase
	global	_g_scanPhase
	global	_g_scanIndex
	global	_test_adc
	global	_g_tempProtect
	global	_adresult
	global	_RXOK_f
	global	_g_powerOnTimer
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
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	5
	global	_RB1
_RB1	set	0x31
	global	_RB0
_RB0	set	0x30
	global	_RB2
_RB2	set	0x32
	global	_RB3
_RB3	set	0x33
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
	global	_IOCA
_IOCA	set	137
	global	_WPUA
_WPUA	set	136
	global	_WPDA
_WPDA	set	135
	global	_TMR0
_TMR0	set	129
	global	_ANSEL1
_ANSEL1	set	148
	global	_ANSEL0
_ANSEL0	set	147
	global	_ANSEL3
_ANSEL3	set	140
	global	_PORTA
_PORTA	set	134
	global	_TRISA
_TRISA	set	133
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
	global	_RA5
_RA5	set	0x435
	global	_RA4
_RA4	set	0x434
	global	_RA6
_RA6	set	0x436
	global	_RA7
_RA7	set	0x437
	global	_WPUD
_WPUD	set	277
	global	_ANSEL2
_ANSEL2	set	265
	global	_WPUC
_WPUC	set	264
	global	_PORTC
_PORTC	set	262
	global	_TRISC
_TRISC	set	261
	global	_TRISD
_TRISD	set	276
	global	_PORTD
_PORTD	set	263
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
	global	_RC0
_RC0	set	0x830
	global	_RC4
_RC4	set	0x834
	global	_RC5
_RC5	set	0x835
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
	
STR_2:	
	retlw	67	;'C'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	68	;'D'
	retlw	68	;'D'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_9:	
	retlw	32	;' '
	retlw	70	;'F'
	retlw	85	;'U'
	retlw	76	;'L'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_3:	
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_10:	
	retlw	32	;' '
	retlw	67	;'C'
	retlw	72	;'H'
	retlw	71	;'G'
	retlw	0
psect	strings
	
STR_8:	
	retlw	32	;' '
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	82	;'R'
	retlw	0
psect	strings
	
STR_6:	
	retlw	32	;' '
	retlw	83	;'S'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_7:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_5:	
	retlw	58	;':'
	retlw	86	;'V'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_1:	
	retlw	84	;'T'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_4:	
	retlw	66	;'B'
	retlw	0
psect	strings
STR_11	equ	STR_3+2
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
_RxTable:
       ds      10

_g_systemTick:
       ds      2

_power_ad:
       ds      2

Interrupt_Isr@RxNum:
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
	line	4
_g_temperature:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_g_powerOnTimer:
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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+016h)
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
?___bmul:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	ds	1
??___bmul:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	ds	1
??_System_Init:	; 1 bytes @ 0x3
	global	_System_Init$269
_System_Init$269:	; 1 bytes @ 0x3
	ds	1
	global	_System_Init$280
_System_Init$280:	; 1 bytes @ 0x4
	ds	1
	global	_System_Init$291
_System_Init$291:	; 1 bytes @ 0x5
	ds	1
	global	_System_Init$302
_System_Init$302:	; 1 bytes @ 0x6
	ds	1
	global	_System_Init$313
_System_Init$313:	; 1 bytes @ 0x7
	ds	1
	global	_System_Init$324
_System_Init$324:	; 1 bytes @ 0x8
	ds	1
	global	_System_Init$335
_System_Init$335:	; 1 bytes @ 0x9
	ds	1
	global	_System_Init$346
_System_Init$346:	; 1 bytes @ 0xA
	ds	1
	global	_System_Init$357
_System_Init$357:	; 1 bytes @ 0xB
	ds	1
	global	System_Init@i
System_Init@i:	; 1 bytes @ 0xC
	ds	1
??_main:	; 1 bytes @ 0xD
	global	main@i
main@i:	; 1 bytes @ 0xD
	ds	1
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_PowerOnLedSequence:	; 1 bytes @ 0x0
??_PowerOnLedSequence:	; 1 bytes @ 0x0
?_ChargeProcess_Slot:	; 1 bytes @ 0x0
?_Update_LED_Slot:	; 1 bytes @ 0x0
?_Read_Temperature:	; 1 bytes @ 0x0
?_Led_BlinkProcess:	; 1 bytes @ 0x0
?_Charging_Control:	; 1 bytes @ 0x0
?_ADC_Sample:	; 1 bytes @ 0x0
?_Print_Status:	; 1 bytes @ 0x0
?_SlotPin_ToAnalog:	; 1 bytes @ 0x0
?_SlotPin_ToDigital:	; 1 bytes @ 0x0
?_System_Init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Interrupt_Isr:	; 1 bytes @ 0x0
?_Detect_BatteryType:	; 1 bytes @ 0x0
?_uart_send_char:	; 1 bytes @ 0x0
??_uart_send_char:	; 1 bytes @ 0x0
?_uart_send_string:	; 1 bytes @ 0x0
?i1___bmul:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	ADC_Sample@adldo
ADC_Sample@adldo:	; 1 bytes @ 0x0
	global	uart_send_char@c
uart_send_char@c:	; 1 bytes @ 0x0
	global	i1___bmul@multiplicand
i1___bmul@multiplicand:	; 1 bytes @ 0x0
	global	Detect_BatteryType@voltage
Detect_BatteryType@voltage:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
??_ADC_Sample:	; 1 bytes @ 0x1
??_uart_send_string:	; 1 bytes @ 0x1
??i1___bmul:	; 1 bytes @ 0x1
	global	uart_send_string@str
uart_send_string@str:	; 1 bytes @ 0x1
	global	i1___bmul@multiplier
i1___bmul@multiplier:	; 1 bytes @ 0x1
	ds	1
??_Detect_BatteryType:	; 1 bytes @ 0x2
	global	i1___bmul@product
i1___bmul@product:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
??_ChargeProcess_Slot:	; 1 bytes @ 0x3
??_Update_LED_Slot:	; 1 bytes @ 0x3
??_Led_BlinkProcess:	; 1 bytes @ 0x3
??_Charging_Control:	; 1 bytes @ 0x3
??_SlotPin_ToAnalog:	; 1 bytes @ 0x3
??_SlotPin_ToDigital:	; 1 bytes @ 0x3
	global	_Charging_Control$443
_Charging_Control$443:	; 1 bytes @ 0x3
	global	Update_LED_Slot@idx
Update_LED_Slot@idx:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
??___lwdiv:	; 1 bytes @ 0x4
??___lwmod:	; 1 bytes @ 0x4
	global	Charging_Control@chargeB1_6
Charging_Control@chargeB1_6:	; 1 bytes @ 0x4
	global	Update_LED_Slot@p
Update_LED_Slot@p:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
??___ftpack:	; 1 bytes @ 0x5
	global	?_ADC_ReadChannel
?_ADC_ReadChannel:	; 2 bytes @ 0x5
	global	ChargeProcess_Slot@idx
ChargeProcess_Slot@idx:	; 1 bytes @ 0x5
	global	Charging_Control@chargeB7_12
Charging_Control@chargeB7_12:	; 1 bytes @ 0x5
	global	_Led_BlinkProcess$469
_Led_BlinkProcess$469:	; 1 bytes @ 0x5
	ds	1
	global	SlotPin_ToAnalog@idx
SlotPin_ToAnalog@idx:	; 1 bytes @ 0x6
	global	SlotPin_ToDigital@idx
SlotPin_ToDigital@idx:	; 1 bytes @ 0x6
	global	Charging_Control@s
Charging_Control@s:	; 1 bytes @ 0x6
	global	_Led_BlinkProcess$480
_Led_BlinkProcess$480:	; 1 bytes @ 0x6
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	ds	1
??_ADC_ReadChannel:	; 1 bytes @ 0x7
?_uart_send_number:	; 1 bytes @ 0x7
	global	SlotPin_ToAnalog@cfg
SlotPin_ToAnalog@cfg:	; 1 bytes @ 0x7
	global	SlotPin_ToDigital@cfg
SlotPin_ToDigital@cfg:	; 1 bytes @ 0x7
	global	Charging_Control@i
Charging_Control@i:	; 1 bytes @ 0x7
	global	_Led_BlinkProcess$491
_Led_BlinkProcess$491:	; 1 bytes @ 0x7
	global	uart_send_number@num
uart_send_number@num:	; 2 bytes @ 0x7
	ds	1
??___lmul:	; 1 bytes @ 0x8
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x8
	global	ADC_ReadChannel@ch
ADC_ReadChannel@ch:	; 1 bytes @ 0x8
	global	_Led_BlinkProcess$502
_Led_BlinkProcess$502:	; 1 bytes @ 0x8
	global	ChargeProcess_Slot@v
ChargeProcess_Slot@v:	; 2 bytes @ 0x8
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
??_Print_Status:	; 1 bytes @ 0x9
??_uart_send_number:	; 1 bytes @ 0x9
	global	_Led_BlinkProcess$513
_Led_BlinkProcess$513:	; 1 bytes @ 0x9
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
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	global	uart_send_number@buf
uart_send_number@buf:	; 6 bytes @ 0x0
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x1
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x2
	ds	1
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x3
	global	ADC_Sample@adsum
ADC_Sample@adsum:	; 4 bytes @ 0x3
	ds	1
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	2
	global	uart_send_number@i
uart_send_number@i:	; 1 bytes @ 0x6
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x6
	ds	1
	global	uart_send_number@j
uart_send_number@j:	; 1 bytes @ 0x7
	global	ADC_Sample@admin
ADC_Sample@admin:	; 2 bytes @ 0x7
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x7
	ds	1
	global	_Print_Status$546
_Print_Status$546:	; 1 bytes @ 0x8
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	ds	1
	global	_Print_Status$558
_Print_Status$558:	; 1 bytes @ 0x9
	global	ADC_Sample@admax
ADC_Sample@admax:	; 2 bytes @ 0x9
	ds	1
	global	_Print_Status$570
_Print_Status$570:	; 1 bytes @ 0xA
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0xA
	ds	1
	global	_Print_Status$581
_Print_Status$581:	; 1 bytes @ 0xB
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0xB
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0xB
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0xC
	global	_Print_Status$593
_Print_Status$593:	; 1 bytes @ 0xC
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0xC
	ds	1
??_Read_Temperature:	; 1 bytes @ 0xD
	global	_Print_Status$615
_Print_Status$615:	; 1 bytes @ 0xD
	ds	1
	global	_Print_Status$616
_Print_Status$616:	; 1 bytes @ 0xE
	ds	1
	global	Print_Status@i
Print_Status@i:	; 1 bytes @ 0xF
	ds	1
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
	ds	5
	global	_Interrupt_Isr$382
_Interrupt_Isr$382:	; 1 bytes @ 0x1E
	ds	1
	global	Interrupt_Isr@power_temp
Interrupt_Isr@power_temp:	; 4 bytes @ 0x1F
	ds	4
;!
;!Data Sizes:
;!    Strings     45
;!    Constant    96
;!    Data        1
;!    BSS         168
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     35      59
;!    BANK1            80     14      16
;!    BANK3            80      0      72
;!    BANK2            80      0      72

;!
;!Pointer List with Targets:
;!
;!    Print_Status$616	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$615	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$593	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$581	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$570	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$558	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$546	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    uart_send_string@str	PTR const unsigned char  size(1) Largest target is 7
;!		 -> STR_11(CODE[3]), STR_10(CODE[5]), STR_9(CODE[6]), STR_8(CODE[5]), 
;!		 -> STR_7(CODE[4]), STR_6(CODE[4]), STR_5(CODE[4]), STR_4(CODE[2]), 
;!		 -> STR_3(CODE[5]), STR_2(CODE[7]), STR_1(CODE[3]), 
;!
;!    Led_BlinkProcess$513	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$502	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$491	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$480	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$469	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Update_LED_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Charging_Control$443	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    ChargeProcess_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Interrupt_Isr$382	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$357	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$346	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$335	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$324	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$313	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$302	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$291	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$280	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$269	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    SlotPin_ToDigital@cfg.ansel_reg	PTR volatile unsigned char  size(1) Largest target is 1
;!		 -> ANSEL3(SFR1[1]), ANSEL1(SFR1[1]), ANSEL0(SFR1[1]), 
;!
;!    SlotPin_ToDigital@cfg.port_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> PORTD(SFR2[1]), PORTB(SFR0[1]), PORTA(SFR1[1]), 
;!
;!    SlotPin_ToDigital@cfg.tris_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> TRISD(SFR2[1]), TRISB(SFR0[1]), TRISA(SFR1[1]), 
;!
;!    SlotPin_ToDigital@cfg	PTR const struct . size(1) Largest target is 96
;!		 -> s_slotPins(CODE[84]), 
;!
;!    SlotPin_ToAnalog@cfg.ansel_reg	PTR volatile unsigned char  size(1) Largest target is 1
;!		 -> ANSEL3(SFR1[1]), ANSEL1(SFR1[1]), ANSEL0(SFR1[1]), 
;!
;!    SlotPin_ToAnalog@cfg.port_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> PORTD(SFR2[1]), PORTB(SFR0[1]), PORTA(SFR1[1]), 
;!
;!    SlotPin_ToAnalog@cfg.tris_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> TRISD(SFR2[1]), TRISB(SFR0[1]), TRISA(SFR1[1]), 
;!
;!    SlotPin_ToAnalog@cfg	PTR const struct . size(1) Largest target is 96
;!		 -> s_slotPins(CODE[84]), 
;!
;!    S19$ansel_reg	PTR volatile unsigned char  size(1) Largest target is 1
;!		 -> ANSEL3(SFR1[1]), ANSEL1(SFR1[1]), ANSEL0(SFR1[1]), 
;!
;!    s_slotPins.ansel_reg	PTR volatile unsigned char  size(1) Largest target is 1
;!		 -> ANSEL3(SFR1[1]), ANSEL1(SFR1[1]), ANSEL0(SFR1[1]), 
;!
;!    S19$port_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> PORTD(SFR2[1]), PORTB(SFR0[1]), PORTA(SFR1[1]), 
;!
;!    s_slotPins.port_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> PORTD(SFR2[1]), PORTB(SFR0[1]), PORTA(SFR1[1]), 
;!
;!    S19$tris_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> TRISD(SFR2[1]), TRISB(SFR0[1]), TRISA(SFR1[1]), 
;!
;!    s_slotPins.tris_reg	PTR volatile unsigned char  size(2) Largest target is 1
;!		 -> TRISD(SFR2[1]), TRISB(SFR0[1]), TRISA(SFR1[1]), 
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
;!    _SlotPin_ToDigital->i1___bmul
;!    _SlotPin_ToAnalog->i1___bmul
;!    _Read_Temperature->___lmul
;!    ___lldiv->___lmul
;!    _ADC_ReadChannel->_ADC_Sample
;!    _Print_Status->_uart_send_number
;!    _uart_send_string->_uart_send_char
;!    _uart_send_number->___lwdiv
;!    _Led_BlinkProcess->i1___bmul
;!    _Charging_Control->i1___bmul
;!    _ChargeProcess_Slot->i1___bmul
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
;!    _Print_Status->_uart_send_number
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_System_Init
;!    _System_Init->___bmul
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
;! (0) _main                                                 1     1      0    2395
;!                                             13 BANK1      1     1      0
;!                        _System_Init
;! ---------------------------------------------------------------------------------
;! (1) _System_Init                                         10    10      0    2296
;!                                              3 BANK1     10    10      0
;!                             ___bmul
;! ---------------------------------------------------------------------------------
;! (2) ___bmul                                               3     2      1    1022
;!                                              0 BANK1      3     2      1
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _Interrupt_Isr                                       10    10      0   17153
;!                                             25 BANK0     10    10      0
;!                    _ADC_ReadChannel
;!                         _ADC_Sample
;!                 _ChargeProcess_Slot
;!                   _Charging_Control
;!                   _Led_BlinkProcess
;!                 _PowerOnLedSequence
;!                       _Print_Status
;!                   _Read_Temperature
;!                   _SlotPin_ToAnalog
;!                  _SlotPin_ToDigital
;!                    _Update_LED_Slot
;!                            ___ftdiv
;!                            ___fttol
;!                           ___lwtoft
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) ___lwtoft                                             3     0      3     912
;!                                              8 COMMON     3     0      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (4) ___fttol                                             13     9      4      62
;!                                             12 BANK0     13     9      4
;!                            ___ftdiv (ARG)
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (4) ___ftdiv                                             15     9      6     982
;!                                             11 COMMON     3     3      0
;!                                              0 BANK0     12     6      6
;!                           ___ftpack
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (5) ___ftpack                                             8     3      5     900
;!                                              0 COMMON     8     3      5
;! ---------------------------------------------------------------------------------
;! (4) _Update_LED_Slot                                      2     2      0     973
;!                                              3 COMMON     2     2      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) _SlotPin_ToDigital                                    5     5      0     795
;!                                              3 COMMON     5     5      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) _SlotPin_ToAnalog                                     5     5      0     795
;!                                              3 COMMON     5     5      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) _Read_Temperature                                     9     9      0    1619
;!                                             13 BANK0      9     9      0
;!                    _ADC_ReadChannel
;!                            ___lldiv
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (5) ___lmul                                              12     4      8     198
;!                                              0 COMMON    12     4      8
;! ---------------------------------------------------------------------------------
;! (5) ___lldiv                                             13     5      8     290
;!                                              0 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (5) _ADC_ReadChannel                                      4     2      2     657
;!                                              5 COMMON     4     2      2
;!                         _ADC_Sample
;! ---------------------------------------------------------------------------------
;! (6) _ADC_Sample                                          18    17      1     635
;!                                              0 COMMON     5     4      1
;!                                              0 BANK0     13    13      0
;! ---------------------------------------------------------------------------------
;! (4) _Print_Status                                         8     8      0    3230
;!                                              8 BANK0      8     8      0
;!                   _uart_send_number
;!                   _uart_send_string
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _uart_send_string                                     1     1      0     364
;!                                              1 COMMON     1     1      0
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (5) _uart_send_number                                    10     8      2    1145
;!                                              7 COMMON     2     0      2
;!                                              0 BANK0      8     8      0
;!                            ___lwdiv
;!                            ___lwmod
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (6) _uart_send_char                                       1     1      0      22
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (6) ___lwmod                                              5     1      4     265
;!                                              0 COMMON     5     1      4
;! ---------------------------------------------------------------------------------
;! (6) ___lwdiv                                              7     3      4     268
;!                                              0 COMMON     7     3      4
;! ---------------------------------------------------------------------------------
;! (4) _PowerOnLedSequence                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _Led_BlinkProcess                                     8     8      0    1422
;!                                              3 COMMON     8     8      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) _Charging_Control                                     5     5      0    1242
;!                                              3 COMMON     5     5      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) _ChargeProcess_Slot                                   8     8      0    3037
;!                                              3 COMMON     8     8      0
;!                 _Detect_BatteryType
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (4) i1___bmul                                             3     2      1     684
;!                                              0 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (5) _Detect_BatteryType                                   2     0      2     229
;!                                              0 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _System_Init
;!     ___bmul
;!
;! _Interrupt_Isr (ROOT)
;!   _ADC_ReadChannel
;!     _ADC_Sample
;!   _ADC_Sample
;!   _ChargeProcess_Slot
;!     _Detect_BatteryType
;!     i1___bmul
;!   _Charging_Control
;!     i1___bmul
;!   _Led_BlinkProcess
;!     i1___bmul
;!   _PowerOnLedSequence
;!   _Print_Status
;!     _uart_send_number
;!       ___lwdiv
;!       ___lwmod
;!       _uart_send_char
;!     _uart_send_string
;!       _uart_send_char
;!     i1___bmul
;!   _Read_Temperature
;!     _ADC_ReadChannel
;!       _ADC_Sample
;!     ___lldiv
;!       ___lmul (ARG)
;!     ___lmul
;!   _SlotPin_ToAnalog
;!     i1___bmul
;!   _SlotPin_ToDigital
;!     i1___bmul
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
;!BANK1               50      E      10       6       20.0%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     23      3B       4       73.8%
;!BITBANK0            50      0       1       3        1.3%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      E9      12        0.0%
;!ABS                  0      0      E9      11        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 133 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   13[BANK1 ] unsigned char 
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_System_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	133
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	133
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	135
	
l3743:	
;main.c: 135: System_Init();
	fcall	_System_Init
	line	137
	
l3745:	
;main.c: 137: TXREG1 = 0x55;
	movlw	low(055h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	138
;main.c: 138: while(TRMT1 == 0);
	
l380:	
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u3911
	goto	u3910
u3911:
	goto	l380
u3910:
	line	139
	
l3747:	
;main.c: 139: TXREG1 = 0xAA;
	movlw	low(0AAh)
	movwf	(391)^0180h	;volatile
	line	140
;main.c: 140: while(TRMT1 == 0);
	
l383:	
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u3921
	goto	u3920
u3921:
	goto	l383
u3920:
	line	142
;main.c: 142: while(1)
	
l386:	
	line	144
# 144 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	maintext
	line	146
;main.c: 146: if(RXOK_f == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RXOK_f/8),(_RXOK_f)&7
	goto	u3931
	goto	u3930
u3931:
	goto	l386
u3930:
	line	150
	
l3749:	
;main.c: 147: {
;main.c: 149: unsigned char i;
;main.c: 150: for(i = 0; i < 10; i++)
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@i)^080h
	line	152
	
l390:	
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u3941
	goto	u3940
u3941:
	goto	l390
u3940:
	line	153
	
l3755:	
;main.c: 153: TXREG1 = RxTable[i];
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	150
	
l3757:	
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@i)^080h,f
	
l3759:	
	movlw	low(0Ah)
	subwf	(main@i)^080h,w
	skipc
	goto	u3951
	goto	u3950
u3951:
	goto	l390
u3950:
	
l389:	
	line	156
;main.c: 154: }
;main.c: 156: RXOK_f = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RXOK_f/8),(_RXOK_f)&7
	goto	l386
	global	start
	ljmp	start
	opt stack 0
	line	159
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_System_Init

;; *************** function _System_Init *****************
;; Defined at:
;;		line 49 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
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
	line	49
global __ptext1
__ptext1:	;psect for function _System_Init
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	49
	global	__size_of_System_Init
	__size_of_System_Init	equ	__end_of_System_Init-_System_Init
	
_System_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _System_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	53
	
l3173:	
# 53 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
nop ;# 
	line	54
# 54 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	55
	
l3175:	
;main.c: 55: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	56
	
l3177:	
;main.c: 56: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	57
# 57 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	59
	
l3179:	
;main.c: 59: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	60
;main.c: 60: PORTA = 0B10001111;
	movlw	low(08Fh)
	movwf	(134)^080h	;volatile
	line	61
	
l3181:	
;main.c: 61: WPUA = 0B00000000;
	clrf	(136)^080h	;volatile
	line	62
	
l3183:	
;main.c: 62: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	63
	
l3185:	
;main.c: 63: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	65
	
l3187:	
;main.c: 65: TRISB = 0B11110000;
	movlw	low(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	66
	
l3189:	
;main.c: 66: PORTB = 0B00001111;
	movlw	low(0Fh)
	movwf	(6)	;volatile
	line	67
	
l3191:	
;main.c: 67: WPUB = 0B00000000;
	clrf	(8)	;volatile
	line	68
	
l3193:	
;main.c: 68: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	69
	
l3195:	
;main.c: 69: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	71
;main.c: 71: TRISC = 0B00001000;
	movlw	low(08h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	72
;main.c: 72: PORTC = 0B00000001;
	movlw	low(01h)
	movwf	(262)^0100h	;volatile
	line	73
	
l3197:	
;main.c: 73: WPUC = 0B00000000;
	clrf	(264)^0100h	;volatile
	line	75
	
l3199:	
;main.c: 75: TRISD = 0B00000000;
	clrf	(276)^0100h	;volatile
	line	76
;main.c: 76: PORTD = 0B00001111;
	movlw	low(0Fh)
	movwf	(263)^0100h	;volatile
	line	77
	
l3201:	
;main.c: 77: WPUD = 0B00000000;
	clrf	(277)^0100h	;volatile
	line	79
	
l3203:	
;main.c: 79: ANSEL0 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(147)^080h	;volatile
	line	80
	
l3205:	
;main.c: 80: ANSEL1 = 0x00;
	clrf	(148)^080h	;volatile
	line	81
	
l3207:	
;main.c: 81: ANSEL2 = 0x00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(265)^0100h	;volatile
	line	82
	
l3209:	
;main.c: 82: ANSEL3 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(140)^080h	;volatile
	line	84
	
l3211:	
;main.c: 84: CC0CON = 0;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(405)^0180h	;volatile
	line	85
	
l3213:	
;main.c: 85: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	86
	
l3215:	
;main.c: 86: ADCON0 = 0X41;
	movlw	low(041h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	87
;main.c: 87: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	89
	
l3217:	
;main.c: 89: TXSTA1 = 0B10100000;
	movlw	low(0A0h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(389)^0180h	;volatile
	line	90
	
l3219:	
;main.c: 90: RCSTA1 = 0B10010000;
	movlw	low(090h)
	movwf	(390)^0180h	;volatile
	line	91
	
l3221:	
;main.c: 91: SPBRG1 = 103;
	movlw	low(067h)
	movwf	(393)^0180h	;volatile
	line	93
	
l3223:	
;main.c: 93: TMR0 = 6;
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	94
	
l3225:	
;main.c: 94: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	95
	
l3227:	
;main.c: 95: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	97
	
l3229:	
;main.c: 97: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	98
	
l3231:	
;main.c: 98: RC1IE = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2176/8)^0100h,(2176)&7	;volatile
	line	99
	
l3233:	
;main.c: 99: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	101
	
l3235:	
;main.c: 101: RA7 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1079/8)^080h,(1079)&7	;volatile
	line	102
	
l3237:	
;main.c: 102: RA6 = 0;
	bcf	(1078/8)^080h,(1078)&7	;volatile
	line	103
	
l3239:	
;main.c: 103: RA4 = 0;
	bcf	(1076/8)^080h,(1076)&7	;volatile
	line	104
	
l3241:	
;main.c: 104: RA5 = 0;
	bcf	(1077/8)^080h,(1077)&7	;volatile
	line	105
	
l3243:	
;main.c: 105: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	106
	
l3245:	
;main.c: 106: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	107
	
l3247:	
;main.c: 107: RC0 = 1;
	bsf	(2096/8)^0100h,(2096)&7	;volatile
	line	109
;main.c: 109: for(i = 0; i < 12; i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(System_Init@i)^080h
	line	111
	
l3253:	
;main.c: 110: {
;main.c: 111: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3121
	goto	u3120
u3121:
	goto	l3257
u3120:
	
l3255:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$269)^080h
	goto	l3259
	
l3257:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$269)^080h
	
l3259:	
	incf	(_System_Init$269)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	112
	
l3261:	
;main.c: 112: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3131
	goto	u3130
u3131:
	goto	l3265
u3130:
	
l3263:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$280)^080h
	goto	l3267
	
l3265:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$280)^080h
	
l3267:	
	movf	(_System_Init$280)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	113
	
l3269:	
;main.c: 113: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3141
	goto	u3140
u3141:
	goto	l3273
u3140:
	
l3271:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$291)^080h
	goto	l3275
	
l3273:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$291)^080h
	
l3275:	
	movf	(_System_Init$291)^080h,w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	114
	
l3277:	
;main.c: 114: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->chargeTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l3281
u3150:
	
l3279:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$302)^080h
	goto	l3283
	
l3281:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$302)^080h
	
l3283:	
	movf	(_System_Init$302)^080h,w
	addlw	05h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	115
	
l3285:	
;main.c: 115: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l3289
u3160:
	
l3287:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$313)^080h
	goto	l3291
	
l3289:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$313)^080h
	
l3291:	
	movf	(_System_Init$313)^080h,w
	addlw	02h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	116
	
l3293:	
;main.c: 116: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l3297
u3170:
	
l3295:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$324)^080h
	goto	l3299
	
l3297:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$324)^080h
	
l3299:	
	movf	(_System_Init$324)^080h,w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	117
	
l3301:	
;main.c: 117: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3181
	goto	u3180
u3181:
	goto	l3305
u3180:
	
l3303:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$335)^080h
	goto	l3307
	
l3305:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$335)^080h
	
l3307:	
	movf	(_System_Init$335)^080h,w
	addlw	09h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	118
	
l3309:	
;main.c: 118: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->stableCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l3313
u3190:
	
l3311:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$346)^080h
	goto	l3315
	
l3313:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$346)^080h
	
l3315:	
	movf	(_System_Init$346)^080h,w
	addlw	0Ah
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	119
	
l3317:	
;main.c: 119: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->activatePulseCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l3321
u3200:
	
l3319:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$357)^080h
	goto	l3323
	
l3321:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$357)^080h
	
l3323:	
	movf	(_System_Init$357)^080h,w
	addlw	0Bh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	109
	
l3325:	
	incf	(System_Init@i)^080h,f
	
l3327:	
	movlw	low(0Ch)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u3211
	goto	u3210
u3211:
	goto	l3253
u3210:
	line	122
	
l3329:	
;main.c: 120: }
;main.c: 122: g_scanIndex = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_scanIndex)
	line	123
;main.c: 123: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	124
;main.c: 125: g_timerTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	126
;main.c: 126: g_powerOnTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	127
;main.c: 127: g_powerOnPhase = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	line	128
;main.c: 128: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	129
	
l3331:	
;main.c: 129: g_temperature = 25;
	movlw	low(019h)
	movwf	(_g_temperature)
	line	130
	
l3333:	
;main.c: 130: RXOK_f = 0;
	bcf	(_RXOK_f/8),(_RXOK_f)&7
	line	131
	
l375:	
	return
	opt stack 0
GLOBAL	__end_of_System_Init
	__end_of_System_Init:
	signat	_System_Init,89
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
;;		_Update_LED_Slot
;;		_Led_BlinkProcess
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul8.c"
	line	4
global __ptext2
__ptext2:	;psect for function ___bmul
psect	text2
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
	
l3135:	
	clrf	(___bmul@product)^080h
	line	43
	
l3137:	
	btfss	(___bmul@multiplier)^080h,(0)&7
	goto	u3021
	goto	u3020
u3021:
	goto	l3141
u3020:
	line	44
	
l3139:	
	movf	(___bmul@multiplicand)^080h,w
	addwf	(___bmul@product)^080h,f
	line	45
	
l3141:	
	clrc
	rlf	(___bmul@multiplicand)^080h,f
	line	46
	
l3143:	
	clrc
	rrf	(___bmul@multiplier)^080h,f
	line	47
	movf	((___bmul@multiplier)^080h),w
	btfss	status,2
	goto	u3031
	goto	u3030
u3031:
	goto	l3137
u3030:
	line	50
	
l3145:	
	movf	(___bmul@product)^080h,w
	line	51
	
l745:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_Interrupt_Isr

;; *************** function _Interrupt_Isr *****************
;; Defined at:
;;		line 161 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  power_temp      4   31[BANK0 ] volatile unsigned long 
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
;;      Temps:          0       5       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADC_ReadChannel
;;		_ADC_Sample
;;		_ChargeProcess_Slot
;;		_Charging_Control
;;		_Led_BlinkProcess
;;		_PowerOnLedSequence
;;		_Print_Status
;;		_Read_Temperature
;;		_SlotPin_ToAnalog
;;		_SlotPin_ToDigital
;;		_Update_LED_Slot
;;		___ftdiv
;;		___fttol
;;		___lwtoft
;;		i1___bmul
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	161
global __ptext3
__ptext3:	;psect for function _Interrupt_Isr
psect	text3
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	161
	global	__size_of_Interrupt_Isr
	__size_of_Interrupt_Isr	equ	__end_of_Interrupt_Isr-_Interrupt_Isr
	
_Interrupt_Isr:	
;incstack = 0
	opt	stack 2
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
	movwf	(??_Interrupt_Isr+1)
	movf	fsr0,w
	movwf	(??_Interrupt_Isr+2)
	movf	pclath,w
	movwf	(??_Interrupt_Isr+3)
	movf	btemp+1,w
	movwf	(??_Interrupt_Isr+4)
	ljmp	_Interrupt_Isr
psect	text3
	line	163
	
i1l3959:	
;main.c: 163: if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l400
u426_20:
	line	165
	
i1l3961:	
;main.c: 164: {
;main.c: 165: TMR0 += 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	addwf	(129)^080h,f	;volatile
	line	166
	
i1l3963:	
;main.c: 168: g_timerTick++;
	bcf	(90/8),(90)&7	;volatile
	line	170
	
i1l3965:	
;main.c: 170: if(g_powerOnPhase < 2)
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_g_powerOnPhase),w
	skipnc
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l4033
u427_20:
	line	172
	
i1l3967:	
;main.c: 171: {
;main.c: 172: PowerOnLedSequence();
	fcall	_PowerOnLedSequence
	line	173
;main.c: 173: }
	goto	i1l400
	line	179
	
i1l3969:	
;main.c: 179: SlotPin_ToAnalog(g_scanIndex);
	movf	(_g_scanIndex),w
	fcall	_SlotPin_ToAnalog
	line	181
	
i1l3971:	
;main.c: 180: (((g_scanIndex) < 6) ? &g_slot0[(g_scanIndex)] : &g_slot1[(g_scanIndex)-6])->voltage =
;main.c: 181: ADC_ReadChannel(s_adcChannels[g_scanIndex]);
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_g_scanIndex),w
	skipc
	goto	u428_21
	goto	u428_20
u428_21:
	goto	i1l3975
u428_20:
	
i1l3973:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$382)
	goto	i1l3977
	
i1l3975:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$382)
	
i1l3977:	
	movf	(_g_scanIndex),w
	addlw	low((((_s_adcChannels)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	fcall	_ADC_ReadChannel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Interrupt_Isr$382),w
	addlw	03h
	movwf	fsr0
	movf	(0+(?_ADC_ReadChannel)),w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_ADC_ReadChannel)),w
	movwf	indf
	line	182
	
i1l3979:	
;main.c: 182: SlotPin_ToDigital(g_scanIndex);
	movf	(_g_scanIndex),w
	fcall	_SlotPin_ToDigital
	line	183
	
i1l3981:	
;main.c: 183: g_scanPhase = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_g_scanPhase)
	incf	(_g_scanPhase),f
	line	184
;main.c: 184: break;
	goto	i1l400
	line	187
	
i1l3983:	
;main.c: 187: ChargeProcess_Slot(g_scanIndex);
	movf	(_g_scanIndex),w
	fcall	_ChargeProcess_Slot
	line	188
;main.c: 188: Update_LED_Slot(g_scanIndex);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_scanIndex),w
	fcall	_Update_LED_Slot
	line	189
	
i1l3985:	
;main.c: 189: g_scanPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_scanPhase)
	line	190
;main.c: 190: break;
	goto	i1l400
	line	193
	
i1l3987:	
;main.c: 193: if(g_scanIndex == 0)
	movf	((_g_scanIndex)),w
	btfss	status,2
	goto	u429_21
	goto	u429_20
u429_21:
	goto	i1l4001
u429_20:
	line	195
	
i1l3989:	
;main.c: 194: {
;main.c: 195: ANSEL2 |= 0x20;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(265)^0100h+(5/8),(5)&7	;volatile
	line	196
;main.c: 196: TRISC |= 0x20;
	bsf	(261)^0100h+(5/8),(5)&7	;volatile
	line	197
	
i1l3991:	
;main.c: 197: Read_Temperature();
	fcall	_Read_Temperature
	line	198
	
i1l3993:	
;main.c: 198: ANSEL2 &= ~0x20;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(265)^0100h+(5/8),(5)&7	;volatile
	line	199
	
i1l3995:	
;main.c: 199: TRISC &= ~0x20;
	bcf	(261)^0100h+(5/8),(5)&7	;volatile
	line	201
	
i1l3997:	
;main.c: 201: Led_BlinkProcess();
	fcall	_Led_BlinkProcess
	line	202
	
i1l3999:	
;main.c: 202: Charging_Control();
	fcall	_Charging_Control
	line	205
	
i1l4001:	
;main.c: 203: }
;main.c: 205: g_scanIndex++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_g_scanIndex),f
	line	206
	
i1l4003:	
;main.c: 206: if(g_scanIndex >= 12)
	movlw	low(0Ch)
	subwf	(_g_scanIndex),w
	skipc
	goto	u430_21
	goto	u430_20
u430_21:
	goto	i1l4009
u430_20:
	line	208
	
i1l4005:	
;main.c: 207: {
;main.c: 208: g_scanIndex = 0;
	clrf	(_g_scanIndex)
	line	209
	
i1l4007:	
;main.c: 209: g_systemTick++;
	incf	(_g_systemTick),f
	skipnz
	incf	(_g_systemTick+1),f
	line	211
	
i1l4009:	
;main.c: 210: }
;main.c: 211: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	213
	
i1l4011:	
;main.c: 213: if(g_systemTick >= 4000)
	movlw	0Fh
	subwf	(_g_systemTick+1),w
	movlw	0A0h
	skipnz
	subwf	(_g_systemTick),w
	skipc
	goto	u431_21
	goto	u431_20
u431_21:
	goto	i1l400
u431_20:
	line	215
	
i1l4013:	
;main.c: 214: {
;main.c: 215: g_systemTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	217
	
i1l4015:	
;main.c: 217: test_adc = ADC_Sample(31, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	218
	
i1l4017:	
;main.c: 218: if(0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u432_21
	goto	u432_20
u432_21:
	goto	i1l4023
u432_20:
	line	221
	
i1l4019:	
;main.c: 219: {
;main.c: 220: volatile unsigned long power_temp;
;main.c: 221: power_temp = (unsigned long)(((4096UL*1.2*1000))/adresult);
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

	line	222
	
i1l4021:	
;main.c: 222: power_ad = (unsigned int)(power_temp);
	movf	(Interrupt_Isr@power_temp+1),w	;volatile
	movwf	(_power_ad+1)	;volatile
	movf	(Interrupt_Isr@power_temp),w	;volatile
	movwf	(_power_ad)	;volatile
	line	223
;main.c: 223: }
	goto	i1l4027
	line	226
	
i1l4023:	
;main.c: 224: else
;main.c: 225: {
;main.c: 226: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	227
;main.c: 227: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	228
	
i1l4025:	
;main.c: 228: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Interrupt_Isr+0)+0),f
	u436_27:
decfsz	(??_Interrupt_Isr+0)+0,f
	goto	u436_27
	nop
opt asmopt_pop

	line	232
	
i1l4027:	
;main.c: 229: }
;main.c: 232: Print_Status();
	fcall	_Print_Status
	goto	i1l400
	line	238
	
i1l4029:	
;main.c: 238: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	239
;main.c: 239: break;
	goto	i1l400
	line	176
	
i1l4033:	
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
	goto	i1l3969
	xorlw	1^0	; case 1
	skipnz
	goto	i1l3983
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3987
	goto	i1l4029
	opt asmopt_pop

	line	242
	
i1l400:	
	line	244
;main.c: 241: }
;main.c: 242: }
;main.c: 244: if(RC1IF == 1)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2168/8)^0100h,(2168)&7	;volatile
	goto	u433_21
	goto	u433_20
u433_21:
	goto	i1l426
u433_20:
	line	247
	
i1l4035:	
;main.c: 245: {
;main.c: 246: static unsigned char RxNum = 0, TEMP;
;main.c: 247: RC1IF = 0;
	bcf	(2168/8)^0100h,(2168)&7	;volatile
	line	249
;main.c: 249: if(RXOK_f == 0)
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(_RXOK_f/8),(_RXOK_f)&7
	goto	u434_21
	goto	u434_20
u434_21:
	goto	i1l4047
u434_20:
	line	251
	
i1l4037:	
;main.c: 250: {
;main.c: 251: RxTable[RxNum] = RCREG1;
	movf	(Interrupt_Isr@RxNum),w
	addlw	low(_RxTable|((0x0)<<8))&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	252
	
i1l4039:	
;main.c: 252: RxNum++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Interrupt_Isr@RxNum),f
	line	253
	
i1l4041:	
;main.c: 253: if(RxNum > 9)
	movlw	low(0Ah)
	subwf	(Interrupt_Isr@RxNum),w
	skipc
	goto	u435_21
	goto	u435_20
u435_21:
	goto	i1l426
u435_20:
	line	255
	
i1l4043:	
;main.c: 254: {
;main.c: 255: RxNum = 0;
	clrf	(Interrupt_Isr@RxNum)
	line	256
	
i1l4045:	
;main.c: 256: RXOK_f = 1;
	bsf	(_RXOK_f/8),(_RXOK_f)&7
	goto	i1l426
	line	261
	
i1l4047:	
;main.c: 259: else
;main.c: 260: {
;main.c: 261: TEMP = RCREG1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(392)^0180h,w	;volatile
	line	264
	
i1l426:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_Interrupt_Isr+4),w
	movwf	btemp+1
	movf	(??_Interrupt_Isr+3),w
	movwf	pclath
	movf	(??_Interrupt_Isr+2),w
	movwf	fsr0
	swapf	(??_Interrupt_Isr+1)^00h,w
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
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
global __ptext4
__ptext4:	;psect for function ___lwtoft
psect	text4
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
i1l3955:	
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
	
i1l1079:	
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
psect	text5,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
global __ptext5
__ptext5:	;psect for function ___fttol
psect	text5
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
;incstack = 0
	opt	stack 4
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
i1l3915:	
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
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l3919
u418_20:
	line	50
	
i1l3917:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	i1l970
	line	51
	
i1l3919:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u419_25:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u419_20:
	addlw	-1
	skipz
	goto	u419_25
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
i1l3921:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
i1l3923:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
i1l3925:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
i1l3927:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
i1l3929:	
	btfss	(___fttol@exp1),7
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l3939
u420_20:
	line	57
	
i1l3931:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l3935
u421_20:
	goto	i1l3917
	line	60
	
i1l3935:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
i1l3937:	
	incfsz	(___fttol@exp1),f
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l3935
u422_20:
	goto	i1l3947
	line	63
	
i1l3939:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l3945
u423_20:
	goto	i1l3917
	line	66
	
i1l3943:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	65
	
i1l3945:	
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l3943
u424_20:
	line	70
	
i1l3947:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u425_21
	goto	u425_20
u425_21:
	goto	i1l3951
u425_20:
	line	71
	
i1l3949:	
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
	
i1l3951:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
i1l970:	
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
psect	text6,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
global __ptext6
__ptext6:	;psect for function ___ftdiv
psect	text6
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
i1l3875:	
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
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l3879
u414_20:
	line	64
	
i1l3877:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l934
	line	65
	
i1l3879:	
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
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l935
u415_20:
	line	66
	
i1l3881:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l934
	
i1l935:	
	line	67
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	68
	
i1l3883:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
i1l3885:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(___ftdiv@sign)
	line	70
	
i1l3887:	
	movf	0+(___ftdiv@f2)+02h,w
	xorwf	(___ftdiv@sign),f
	line	71
	
i1l3889:	
	movlw	low(080h)
	andwf	(___ftdiv@sign),f
	line	72
	
i1l3891:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
i1l3893:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
i1l3895:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
i1l3897:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
i1l3899:	
	movlw	low(018h)
	movwf	(___ftdiv@cntr)
	line	78
	
i1l3901:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u416_25
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u416_25
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u416_25:
	skipc
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l3907
u416_20:
	line	80
	
i1l3903:	
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
	
i1l3905:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
i1l3907:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	84
	
i1l3909:	
	decfsz	(___ftdiv@cntr),f
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l3901
u417_20:
	line	85
	
i1l3911:	
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
	
i1l934:	
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
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
global __ptext7
__ptext7:	;psect for function ___ftpack
psect	text7
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
;incstack = 0
	opt	stack 3
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
i1l3851:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l881
u406_20:
	
i1l3853:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l3857
u407_20:
	
i1l881:	
	line	65
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	i1l882
	line	67
	
i1l3855:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
i1l3857:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l3855
u408_20:
	goto	i1l3861
	line	71
	
i1l3859:	
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
	
i1l3861:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l3859
u409_20:
	goto	i1l3865
	line	76
	
i1l3863:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
i1l3865:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l893
u410_20:
	
i1l3867:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l3863
u411_20:
	
i1l893:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l894
u412_20:
	line	80
	
i1l3869:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
i1l894:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
i1l3871:	
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
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l895
u413_20:
	line	84
	
i1l3873:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
i1l895:	
	line	85
	line	86
	
i1l882:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_Update_LED_Slot

;; *************** function _Update_LED_Slot *****************
;; Defined at:
;;		line 3 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
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
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	3
global __ptext8
__ptext8:	;psect for function _Update_LED_Slot
psect	text8
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	3
	global	__size_of_Update_LED_Slot
	__size_of_Update_LED_Slot	equ	__end_of_Update_LED_Slot-_Update_LED_Slot
	
_Update_LED_Slot:	
;incstack = 0
	opt	stack 3
; Regs used in _Update_LED_Slot: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;Update_LED_Slot@idx stored from wreg
	movwf	(Update_LED_Slot@idx)
	line	5
	
i1l3463:	
;led.c: 5: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(Update_LED_Slot@idx),w
	skipc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l3467
u344_20:
	
i1l3465:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l3481
	
i1l3467:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l3481
	line	10
	
i1l3469:	
;led.c: 10: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	11
;led.c: 11: break;
	goto	i1l621
	line	15
	
i1l616:	
	line	17
	
i1l3471:	
;led.c: 13: case 2:
;led.c: 14: case 3:
;led.c: 15: case 4:
;led.c: 16: case 5:
;led.c: 17: p->ledState = 1;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	18
;led.c: 18: break;
	goto	i1l621
	line	20
	
i1l3473:	
;led.c: 20: p->ledState = 2;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	21
;led.c: 21: break;
	goto	i1l621
	line	23
	
i1l3475:	
;led.c: 23: p->ledState = 3;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	24
;led.c: 24: break;
	goto	i1l621
	line	26
	
i1l3477:	
;led.c: 26: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	27
;led.c: 27: break;
	goto	i1l621
	line	7
	
i1l3481:	
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
	goto	i1l3469
	xorlw	1^0	; case 1
	skipnz
	goto	i1l616
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3471
	xorlw	3^2	; case 3
	skipnz
	goto	i1l3471
	xorlw	4^3	; case 4
	skipnz
	goto	i1l3471
	xorlw	5^4	; case 5
	skipnz
	goto	i1l3471
	xorlw	6^5	; case 6
	skipnz
	goto	i1l3473
	xorlw	7^6	; case 7
	skipnz
	goto	i1l3475
	goto	i1l3477
	opt asmopt_pop

	line	29
	
i1l621:	
	return
	opt stack 0
GLOBAL	__end_of_Update_LED_Slot
	__end_of_Update_LED_Slot:
	signat	_Update_LED_Slot,4217
	global	_SlotPin_ToDigital

;; *************** function _SlotPin_ToDigital *****************
;; Defined at:
;;		line 42 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;  idx             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  idx             1    6[COMMON] unsigned char 
;;  cfg             1    7[COMMON] PTR const struct .
;;		 -> s_slotPins(84), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/800
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
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
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	42
global __ptext9
__ptext9:	;psect for function _SlotPin_ToDigital
psect	text9
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	42
	global	__size_of_SlotPin_ToDigital
	__size_of_SlotPin_ToDigital	equ	__end_of_SlotPin_ToDigital-_SlotPin_ToDigital
	
_SlotPin_ToDigital:	
;incstack = 0
	opt	stack 3
; Regs used in _SlotPin_ToDigital: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;SlotPin_ToDigital@idx stored from wreg
	movwf	(SlotPin_ToDigital@idx)
	line	44
	
i1l2439:	
;main.c: 44: const SlotPinConfig_t *cfg = &s_slotPins[idx];
	movlw	low(07h)
	movwf	(i1___bmul@multiplicand)
	movf	(SlotPin_ToDigital@idx),w
	fcall	i1___bmul
	addlw	low((((_s_slotPins)-__stringbase)|8000h))
	movwf	(SlotPin_ToDigital@cfg)
	line	45
	
i1l2441:	
;main.c: 45: *cfg->ansel_reg &= ~cfg->ansel_mask;
	movf	(SlotPin_ToDigital@cfg),w
	addlw	06h
	movwf	fsr0
	fcall	stringdir
	xorlw	0ffh
	movwf	(??_SlotPin_ToDigital+0)+0
	movf	(SlotPin_ToDigital@cfg),w
	addlw	05h
	movwf	fsr0
	fcall	stringdir
	movwf	fsr0
	movf	(??_SlotPin_ToDigital+0)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,f
	line	46
	
i1l2443:	
;main.c: 46: *cfg->tris_reg &= ~cfg->pin_mask;
	movf	(SlotPin_ToDigital@cfg),w
	addlw	04h
	movwf	fsr0
	fcall	stringdir
	xorlw	0ffh
	movwf	(??_SlotPin_ToDigital+0)+0
	movf	(SlotPin_ToDigital@cfg),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_SlotPin_ToDigital+1)+0
	fcall	stringdir
	movwf	(??_SlotPin_ToDigital+1)+0+1
	movf	0+(??_SlotPin_ToDigital+1)+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_SlotPin_ToDigital+1)+0,0
	bcf	status,7
	movf	(??_SlotPin_ToDigital+0)+0,w
	andwf	indf,f
	line	47
	
i1l334:	
	return
	opt stack 0
GLOBAL	__end_of_SlotPin_ToDigital
	__end_of_SlotPin_ToDigital:
	signat	_SlotPin_ToDigital,4217
	global	_SlotPin_ToAnalog

;; *************** function _SlotPin_ToAnalog *****************
;; Defined at:
;;		line 35 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;  idx             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  idx             1    6[COMMON] unsigned char 
;;  cfg             1    7[COMMON] PTR const struct .
;;		 -> s_slotPins(84), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
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
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	35
global __ptext10
__ptext10:	;psect for function _SlotPin_ToAnalog
psect	text10
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	35
	global	__size_of_SlotPin_ToAnalog
	__size_of_SlotPin_ToAnalog	equ	__end_of_SlotPin_ToAnalog-_SlotPin_ToAnalog
	
_SlotPin_ToAnalog:	
;incstack = 0
	opt	stack 3
; Regs used in _SlotPin_ToAnalog: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;SlotPin_ToAnalog@idx stored from wreg
	movwf	(SlotPin_ToAnalog@idx)
	line	37
	
i1l2433:	
;main.c: 37: const SlotPinConfig_t *cfg = &s_slotPins[idx];
	movlw	low(07h)
	movwf	(i1___bmul@multiplicand)
	movf	(SlotPin_ToAnalog@idx),w
	fcall	i1___bmul
	addlw	low((((_s_slotPins)-__stringbase)|8000h))
	movwf	(SlotPin_ToAnalog@cfg)
	line	38
	
i1l2435:	
;main.c: 38: *cfg->ansel_reg |= cfg->ansel_mask;
	movf	(SlotPin_ToAnalog@cfg),w
	addlw	06h
	movwf	fsr0
	fcall	stringdir
	movwf	(??_SlotPin_ToAnalog+0)+0
	movf	(SlotPin_ToAnalog@cfg),w
	addlw	05h
	movwf	fsr0
	fcall	stringdir
	movwf	fsr0
	movf	(??_SlotPin_ToAnalog+0)+0,w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	line	39
	
i1l2437:	
;main.c: 39: *cfg->tris_reg |= cfg->pin_mask;
	movf	(SlotPin_ToAnalog@cfg),w
	addlw	04h
	movwf	fsr0
	fcall	stringdir
	movwf	(??_SlotPin_ToAnalog+0)+0
	movf	(SlotPin_ToAnalog@cfg),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_SlotPin_ToAnalog+1)+0
	fcall	stringdir
	movwf	(??_SlotPin_ToAnalog+1)+0+1
	movf	0+(??_SlotPin_ToAnalog+1)+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_SlotPin_ToAnalog+1)+0,0
	bcf	status,7
	movf	(??_SlotPin_ToAnalog+0)+0,w
	iorwf	indf,f
	line	40
	
i1l331:	
	return
	opt stack 0
GLOBAL	__end_of_SlotPin_ToAnalog
	__end_of_SlotPin_ToAnalog:
	signat	_SlotPin_ToAnalog,4217
	global	_Read_Temperature

;; *************** function _Read_Temperature *****************
;; Defined at:
;;		line 7 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
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
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	7
global __ptext11
__ptext11:	;psect for function _Read_Temperature
psect	text11
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	7
	global	__size_of_Read_Temperature
	__size_of_Read_Temperature	equ	__end_of_Read_Temperature-_Read_Temperature
	
_Read_Temperature:	
;incstack = 0
	opt	stack 2
; Regs used in _Read_Temperature: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
i1l2779:	
;charge_mgr.c: 9: unsigned int ntcVal = ADC_ReadChannel(21);
	movlw	low(015h)
	fcall	_ADC_ReadChannel
	movf	(1+(?_ADC_ReadChannel)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Read_Temperature@ntcVal+1)
	movf	(0+(?_ADC_ReadChannel)),w
	movwf	(Read_Temperature@ntcVal)
	line	11
	
i1l2781:	
	line	15
	
i1l2783:	
;charge_mgr.c: 15: if(ntcVal == 0 || ntcVal >= 4095)
	movf	((Read_Temperature@ntcVal)),w
iorwf	((Read_Temperature@ntcVal+1)),w
	btfsc	status,2
	goto	u235_21
	goto	u235_20
u235_21:
	goto	i1l469
u235_20:
	
i1l2785:	
	movlw	0Fh
	subwf	(Read_Temperature@ntcVal+1),w
	movlw	0FFh
	skipnz
	subwf	(Read_Temperature@ntcVal),w
	skipc
	goto	u236_21
	goto	u236_20
u236_21:
	goto	i1l2787
u236_20:
	goto	i1l469
	line	18
	
i1l2787:	
;charge_mgr.c: 18: ntcR = (unsigned int)((unsigned long)ntcVal * 10000UL / (4096UL - ntcVal));
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
	goto	u237_25
	goto	u237_26
u237_25:
	subwf	(___lldiv@divisor+1),f
u237_26:
	movf	2+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	2+(??_Read_Temperature+0)+0,w
	goto	u237_27
	goto	u237_28
u237_27:
	subwf	(___lldiv@divisor+2),f
u237_28:
	movf	3+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	3+(??_Read_Temperature+0)+0,w
	goto	u237_29
	goto	u237_20
u237_29:
	subwf	(___lldiv@divisor+3),f
u237_20:

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
	line	20
	
i1l2789:	
;charge_mgr.c: 20: if(ntcR > 32950) temp = 10;
	movlw	080h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0B7h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l2793
u238_20:
	
i1l2791:	
	movlw	low(0Ah)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	21
	
i1l2793:	
;charge_mgr.c: 21: else if(ntcR > 27330) temp = 15;
	movlw	06Ah
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0C3h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2797
u239_20:
	
i1l2795:	
	movlw	low(0Fh)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	22
	
i1l2797:	
;charge_mgr.c: 22: else if(ntcR > 22060) temp = 20;
	movlw	056h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	02Dh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l2801
u240_20:
	
i1l2799:	
	movlw	low(014h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	23
	
i1l2801:	
;charge_mgr.c: 23: else if(ntcR > 17950) temp = 25;
	movlw	046h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	01Fh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2805
u241_20:
	
i1l2803:	
	movlw	low(019h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	24
	
i1l2805:	
;charge_mgr.c: 24: else if(ntcR > 14710) temp = 30;
	movlw	039h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	077h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l2809
u242_20:
	
i1l2807:	
	movlw	low(01Eh)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	25
	
i1l2809:	
;charge_mgr.c: 25: else if(ntcR > 12120) temp = 35;
	movlw	02Fh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	059h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l2813
u243_20:
	
i1l2811:	
	movlw	low(023h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	26
	
i1l2813:	
;charge_mgr.c: 26: else if(ntcR > 10000) temp = 40;
	movlw	027h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	011h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l2817
u244_20:
	
i1l2815:	
	movlw	low(028h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	27
	
i1l2817:	
;charge_mgr.c: 27: else if(ntcR > 8330) temp = 45;
	movlw	020h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	08Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l2821
u245_20:
	
i1l2819:	
	movlw	low(02Dh)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	28
	
i1l2821:	
;charge_mgr.c: 28: else if(ntcR > 6970) temp = 50;
	movlw	01Bh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	03Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l2825
u246_20:
	
i1l2823:	
	movlw	low(032h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	29
	
i1l2825:	
;charge_mgr.c: 29: else if(ntcR > 5860) temp = 55;
	movlw	016h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0E5h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l2829
u247_20:
	
i1l2827:	
	movlw	low(037h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	30
	
i1l2829:	
;charge_mgr.c: 30: else if(ntcR > 4950) temp = 60;
	movlw	013h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	057h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l2833
u248_20:
	
i1l2831:	
	movlw	low(03Ch)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	31
	
i1l2833:	
;charge_mgr.c: 31: else if(ntcR > 4200) temp = 65;
	movlw	010h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	069h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l2837
u249_20:
	
i1l2835:	
	movlw	low(041h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	32
	
i1l2837:	
;charge_mgr.c: 32: else if(ntcR > 3580) temp = 70;
	movlw	0Dh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0FDh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l2841
u250_20:
	
i1l2839:	
	movlw	low(046h)
	movwf	(Read_Temperature@temp)
	goto	i1l471
	line	33
	
i1l2841:	
;charge_mgr.c: 33: else temp = 75;
	movlw	low(04Bh)
	movwf	(Read_Temperature@temp)
	
i1l471:	
	line	35
;charge_mgr.c: 35: g_temperature = temp;
	movf	(Read_Temperature@temp),w
	movwf	(_g_temperature)
	line	37
;charge_mgr.c: 37: if(temp >= 60)
	movlw	low(03Ch)
	subwf	(Read_Temperature@temp),w
	skipc
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l2845
u251_20:
	line	38
	
i1l2843:	
;charge_mgr.c: 38: g_tempProtect = 1;
	clrf	(_g_tempProtect)
	incf	(_g_tempProtect),f
	goto	i1l469
	line	39
	
i1l2845:	
;charge_mgr.c: 39: else if(temp <= 50)
	movlw	low(033h)
	subwf	(Read_Temperature@temp),w
	skipnc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l469
u252_20:
	line	40
	
i1l2847:	
;charge_mgr.c: 40: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	43
	
i1l469:	
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
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
global __ptext12
__ptext12:	;psect for function ___lmul
psect	text12
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
i1l2367:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
i1l736:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u187_21
	goto	u187_20
u187_21:
	goto	i1l2371
u187_20:
	line	122
	
i1l2369:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u188_21
	addwf	(___lmul@product+1),f
u188_21:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u188_22
	addwf	(___lmul@product+2),f
u188_22:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u188_23
	addwf	(___lmul@product+3),f
u188_23:

	line	123
	
i1l2371:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
i1l2373:	
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
	goto	u189_21
	goto	u189_20
u189_21:
	goto	i1l736
u189_20:
	line	128
	
i1l2375:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
i1l739:	
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
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
global __ptext13
__ptext13:	;psect for function ___lldiv
psect	text13
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
i1l2393:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
i1l2395:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u192_21
	goto	u192_20
u192_21:
	goto	i1l2415
u192_20:
	line	16
	
i1l2397:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	i1l2401
	line	18
	
i1l2399:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
i1l2401:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u193_21
	goto	u193_20
u193_21:
	goto	i1l2399
u193_20:
	line	22
	
i1l2403:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
i1l2405:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u194_25
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u194_25
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u194_25
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u194_25:
	skipc
	goto	u194_21
	goto	u194_20
u194_21:
	goto	i1l2411
u194_20:
	line	24
	
i1l2407:	
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
	
i1l2409:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
i1l2411:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
i1l2413:	
	decfsz	(___lldiv@counter),f
	goto	u195_21
	goto	u195_20
u195_21:
	goto	i1l2403
u195_20:
	line	30
	
i1l2415:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
i1l1011:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_ADC_ReadChannel

;; *************** function _ADC_ReadChannel *****************
;; Defined at:
;;		line 83 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
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
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	83
global __ptext14
__ptext14:	;psect for function _ADC_ReadChannel
psect	text14
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	83
	global	__size_of_ADC_ReadChannel
	__size_of_ADC_ReadChannel	equ	__end_of_ADC_ReadChannel-_ADC_ReadChannel
	
_ADC_ReadChannel:	
;incstack = 0
	opt	stack 2
; Regs used in _ADC_ReadChannel: [wreg+status,2+status,0+pclath+cstack]
;ADC_ReadChannel@ch stored from wreg
	movwf	(ADC_ReadChannel@ch)
	line	85
	
i1l2275:	
;adc_drv.c: 85: test_adc = ADC_Sample(ch, 7);
	movlw	low(07h)
	movwf	(ADC_Sample@adldo)
	movf	(ADC_ReadChannel@ch),w
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	86
	
i1l2277:	
;adc_drv.c: 86: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u174_21
	goto	u174_20
u174_21:
	goto	i1l2283
u174_20:
	line	87
	
i1l2279:	
;adc_drv.c: 87: return adresult;
	movf	(_adresult+1),w	;volatile
	movwf	(?_ADC_ReadChannel+1)
	movf	(_adresult),w	;volatile
	movwf	(?_ADC_ReadChannel)
	goto	i1l457
	line	89
	
i1l2283:	
;adc_drv.c: 89: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	90
;adc_drv.c: 90: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	91
	
i1l2285:	
;adc_drv.c: 91: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_ReadChannel+0)+0),f
	u437_27:
decfsz	(??_ADC_ReadChannel+0)+0,f
	goto	u437_27
opt asmopt_pop

	line	92
	
i1l2287:	
;adc_drv.c: 92: return 0;
	clrf	(?_ADC_ReadChannel)
	clrf	(?_ADC_ReadChannel+1)
	line	93
	
i1l457:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_ReadChannel
	__end_of_ADC_ReadChannel:
	signat	_ADC_ReadChannel,4218
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 14 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
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
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	line	14
global __ptext15
__ptext15:	;psect for function _ADC_Sample
psect	text15
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
	line	14
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
;incstack = 0
	opt	stack 2
; Regs used in _ADC_Sample: [wreg+status,2+status,0]
;ADC_Sample@adch stored from wreg
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADC_Sample@adch)
	line	16
	
i1l2155:	
;adc_drv.c: 16: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	17
	
i1l2157:	
;adc_drv.c: 17: volatile unsigned int admin = 0, admax = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	18
;adc_drv.c: 18: volatile unsigned int ad_temp = 0;
	clrf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	line	20
	
i1l2159:	
;adc_drv.c: 20: if ((!LDO_EN) && (adldo & 0x04))
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l2165
u150_20:
	
i1l2161:	
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l2165
u151_20:
	line	22
	
i1l2163:	
;adc_drv.c: 21: {
;adc_drv.c: 22: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	23
;adc_drv.c: 23: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_Sample+0)+0),f
	u438_27:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u438_27
opt asmopt_pop

	line	24
;adc_drv.c: 24: }
	goto	i1l2167
	line	26
	
i1l2165:	
;adc_drv.c: 25: else
;adc_drv.c: 26: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	28
	
i1l2167:	
;adc_drv.c: 28: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l438
u152_20:
	line	30
	
i1l2169:	
;adc_drv.c: 29: {
;adc_drv.c: 30: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	31
	
i1l2171:	
;adc_drv.c: 31: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	32
;adc_drv.c: 32: }
	goto	i1l2173
	line	33
	
i1l438:	
	line	34
;adc_drv.c: 33: else
;adc_drv.c: 34: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	36
	
i1l2173:	
;adc_drv.c: 36: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	37
;adc_drv.c: 37: for (i = 0; i < 10; i++)
	clrf	(ADC_Sample@i)
	line	39
	
i1l2179:	
;adc_drv.c: 38: {
;adc_drv.c: 39: ADCON0 = (unsigned char)(0X41 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u153_25:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u153_25
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	40
# 40 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	41
# 41 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	42
# 42 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
	line	43
# 43 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\adc_drv.c"
nop ;# 
psect	text15
	line	44
	
i1l2181:	
;adc_drv.c: 44: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	46
	
i1l2183:	
;adc_drv.c: 46: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	47
;adc_drv.c: 47: while (GODONE)
	goto	i1l442
	
i1l443:	
	line	49
;adc_drv.c: 48: {
;adc_drv.c: 49: _delay((unsigned long)((2)*(16000000/4000000.0)));
		opt asmopt_push
	opt asmopt_off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	opt asmopt_pop

	line	50
;adc_drv.c: 50: if (0 == (--j))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(ADC_Sample@j),f
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l442
u154_20:
	line	51
	
i1l2185:	
;adc_drv.c: 51: return 0;
	movlw	low(0)
	goto	i1l445
	line	52
	
i1l442:	
	line	47
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l443
u155_20:
	line	54
	
i1l2189:	
;adc_drv.c: 52: }
;adc_drv.c: 54: ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));
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
	
i1l2191:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	56
	
i1l2193:	
;adc_drv.c: 56: if (0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u156_21
	goto	u156_20
u156_21:
	goto	i1l2197
u156_20:
	line	58
	
i1l2195:	
;adc_drv.c: 57: {
;adc_drv.c: 58: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	line	59
;adc_drv.c: 59: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	60
;adc_drv.c: 60: }
	goto	i1l448
	line	61
	
i1l2197:	
;adc_drv.c: 61: else if (ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u157_25
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u157_25:
	skipnc
	goto	u157_21
	goto	u157_20
u157_21:
	goto	i1l2201
u157_20:
	line	62
	
i1l2199:	
;adc_drv.c: 62: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	i1l448
	line	63
	
i1l2201:	
;adc_drv.c: 63: else if (ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u158_25
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u158_25:
	skipnc
	goto	u158_21
	goto	u158_20
u158_21:
	goto	i1l448
u158_20:
	line	64
	
i1l2203:	
;adc_drv.c: 64: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	66
	
i1l448:	
;adc_drv.c: 66: adsum += ad_temp;
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
	goto	u159_21
	addwf	(ADC_Sample@adsum+1),f	;volatile
u159_21:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u159_22
	addwf	(ADC_Sample@adsum+2),f	;volatile
u159_22:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u159_23
	addwf	(ADC_Sample@adsum+3),f	;volatile
u159_23:

	line	37
	
i1l2205:	
	incf	(ADC_Sample@i),f
	
i1l2207:	
	movlw	low(0Ah)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u160_21
	goto	u160_20
u160_21:
	goto	i1l2179
u160_20:
	line	69
	
i1l2209:	
;adc_drv.c: 67: }
;adc_drv.c: 69: adsum -= admax;
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
	goto	u161_25
	goto	u161_26
u161_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u161_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u161_27
	goto	u161_28
u161_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u161_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u161_29
	goto	u161_20
u161_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u161_20:

	line	70
;adc_drv.c: 70: if (adsum >= admin)
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+3),w	;volatile
	skipz
	goto	u162_25
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u162_25
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u162_25
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u162_25:
	skipc
	goto	u162_21
	goto	u162_20
u162_21:
	goto	i1l452
u162_20:
	line	71
	
i1l2211:	
;adc_drv.c: 71: adsum -= admin;
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
	goto	u163_25
	goto	u163_26
u163_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u163_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u163_27
	goto	u163_28
u163_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u163_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u163_29
	goto	u163_20
u163_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u163_20:

	goto	i1l2213
	line	72
	
i1l452:	
	line	73
;adc_drv.c: 72: else
;adc_drv.c: 73: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	75
	
i1l2213:	
;adc_drv.c: 75: adresult = adsum >> 3;
	movf	(ADC_Sample@adsum),w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w	;volatile
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w	;volatile
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u164_25:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u164_20:
	addlw	-1
	skipz
	goto	u164_25
	movf	1+(??_ADC_Sample+0)+0,w
	movwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)	;volatile
	line	77
	
i1l2215:	
;adc_drv.c: 77: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	78
	
i1l2217:	
;adc_drv.c: 78: admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	79
	
i1l2219:	
;adc_drv.c: 79: admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	80
	
i1l2221:	
;adc_drv.c: 80: return 0xA5;
	movlw	low(0A5h)
	line	81
	
i1l445:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,8313
	global	_Print_Status

;; *************** function _Print_Status *****************
;; Defined at:
;;		line 41 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   15[BANK0 ] unsigned char 
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
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_send_number
;;		_uart_send_string
;;		i1___bmul
;; This function is called by:
;;		_Interrupt_Isr
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	41
global __ptext16
__ptext16:	;psect for function _Print_Status
psect	text16
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	41
	global	__size_of_Print_Status
	__size_of_Print_Status	equ	__end_of_Print_Status-_Print_Status
	
_Print_Status:	
;incstack = 0
	opt	stack 2
; Regs used in _Print_Status: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	45
	
i1l3579:	
;uart_dbg.c: 43: unsigned char i;
;uart_dbg.c: 45: uart_send_string("T:");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	46
;uart_dbg.c: 46: uart_send_number(g_temperature);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_temperature),w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	47
;uart_dbg.c: 47: uart_send_string("C VDD:");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	48
;uart_dbg.c: 48: uart_send_number(power_ad);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_power_ad+1),w	;volatile
	movwf	(uart_send_number@num+1)
	movf	(_power_ad),w	;volatile
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	49
;uart_dbg.c: 49: uart_send_string("mV\r\n");
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	51
	
i1l3581:	
;uart_dbg.c: 51: for(i = 0; i < 12; i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Print_Status@i)
	line	53
	
i1l3587:	
;uart_dbg.c: 52: {
;uart_dbg.c: 53: uart_send_string("B");
	movlw	(low((((STR_4)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	54
;uart_dbg.c: 54: uart_send_number(i + 1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Print_Status@i),w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	55
;uart_dbg.c: 55: uart_send_string(":V=");
	movlw	(low((((STR_5)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	56
	
i1l3589:	
;uart_dbg.c: 56: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage);
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(Print_Status@i),w
	skipc
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l3593
u367_20:
	
i1l3591:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$546)
	goto	i1l3595
	
i1l3593:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$546)
	
i1l3595:	
	movf	(_Print_Status$546),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	57
	
i1l3597:	
;uart_dbg.c: 57: uart_send_string(" S=");
	movlw	(low((((STR_6)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	58
	
i1l3599:	
;uart_dbg.c: 58: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state);
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(Print_Status@i),w
	skipc
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l3603
u368_20:
	
i1l3601:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$558)
	goto	i1l3605
	
i1l3603:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$558)
	
i1l3605:	
	incf	(_Print_Status$558),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	59
	
i1l3607:	
;uart_dbg.c: 59: uart_send_string(" T=");
	movlw	(low((((STR_7)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	60
	
i1l3609:	
;uart_dbg.c: 60: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type);
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(Print_Status@i),w
	skipc
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l3613
u369_20:
	
i1l3611:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$570)
	goto	i1l3615
	
i1l3613:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$570)
	
i1l3615:	
	movf	(_Print_Status$570),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	62
	
i1l3617:	
;uart_dbg.c: 62: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 7)
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(Print_Status@i),w
	skipc
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l3621
u370_20:
	
i1l3619:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$581)
	goto	i1l3623
	
i1l3621:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$581)
	
i1l3623:	
	incf	(_Print_Status$581),w
	movwf	fsr0
		movlw	7
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l3627
u371_20:
	line	63
	
i1l3625:	
;uart_dbg.c: 63: uart_send_string(" ERR");
	movlw	(low((((STR_8)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	i1l703
	line	64
	
i1l3627:	
;uart_dbg.c: 64: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 6)
	movlw	low(06h)
	subwf	(Print_Status@i),w
	skipc
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l3631
u372_20:
	
i1l3629:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$593)
	goto	i1l3633
	
i1l3631:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$593)
	
i1l3633:	
	incf	(_Print_Status$593),w
	movwf	fsr0
		movlw	6
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l3637
u373_20:
	line	65
	
i1l3635:	
;uart_dbg.c: 65: uart_send_string(" FULL");
	movlw	(low((((STR_9)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	i1l703
	line	67
	
i1l3637:	
;uart_dbg.c: 66: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 4 ||
;uart_dbg.c: 67: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 5)
	movlw	low(06h)
	subwf	(Print_Status@i),w
	skipc
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l3641
u374_20:
	
i1l3639:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$615)
	goto	i1l3643
	
i1l3641:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$615)
	
i1l3643:	
	incf	(_Print_Status$615),w
	movwf	fsr0
		movlw	4
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfsc	status,2
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l3653
u375_20:
	
i1l3645:	
	movlw	low(06h)
	subwf	(Print_Status@i),w
	skipc
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l3649
u376_20:
	
i1l3647:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$616)
	goto	i1l3651
	
i1l3649:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Print_Status@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Print_Status$616)
	
i1l3651:	
	incf	(_Print_Status$616),w
	movwf	fsr0
		movlw	5
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l703
u377_20:
	line	68
	
i1l3653:	
;uart_dbg.c: 68: uart_send_string(" CHG");
	movlw	(low((((STR_10)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	70
	
i1l703:	
;uart_dbg.c: 70: uart_send_string("\r\n");
	movlw	(low((((STR_11)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	51
	
i1l3655:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Print_Status@i),f
	
i1l3657:	
	movlw	low(0Ch)
	subwf	(Print_Status@i),w
	skipc
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l3587
u378_20:
	line	72
	
i1l721:	
	return
	opt stack 0
GLOBAL	__end_of_Print_Status
	__end_of_Print_Status:
	signat	_Print_Status,89
	global	_uart_send_string

;; *************** function _uart_send_string *****************
;; Defined at:
;;		line 13 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> STR_11(3), STR_10(5), STR_9(6), STR_8(5), 
;;		 -> STR_7(4), STR_6(4), STR_5(4), STR_4(2), 
;;		 -> STR_3(5), STR_2(7), STR_1(3), 
;; Auto vars:     Size  Location     Type
;;  str             1    1[COMMON] PTR const unsigned char 
;;		 -> STR_11(3), STR_10(5), STR_9(6), STR_8(5), 
;;		 -> STR_7(4), STR_6(4), STR_5(4), STR_4(2), 
;;		 -> STR_3(5), STR_2(7), STR_1(3), 
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
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	13
global __ptext17
__ptext17:	;psect for function _uart_send_string
psect	text17
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	13
	global	__size_of_uart_send_string
	__size_of_uart_send_string	equ	__end_of_uart_send_string-_uart_send_string
	
_uart_send_string:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_send_string@str stored from wreg
	movwf	(uart_send_string@str)
	line	15
	
i1l2331:	
;uart_dbg.c: 15: while(*str != '\0')
	goto	i1l2337
	line	16
	
i1l2333:	
;uart_dbg.c: 16: uart_send_char(*str++);
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_send_char
	
i1l2335:	
	incf	(uart_send_string@str),f
	line	15
	
i1l2337:	
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0
	skipz
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l2333
u183_20:
	line	17
	
i1l672:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_string
	__end_of_uart_send_string:
	signat	_uart_send_string,4217
	global	_uart_send_number

;; *************** function _uart_send_number *****************
;; Defined at:
;;		line 19 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
;;		_Print_Status
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	19
global __ptext18
__ptext18:	;psect for function _uart_send_number
psect	text18
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	19
	global	__size_of_uart_send_number
	__size_of_uart_send_number	equ	__end_of_uart_send_number-_uart_send_number
	
_uart_send_number:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	22
	
i1l2339:	
;uart_dbg.c: 21: unsigned char buf[6];
;uart_dbg.c: 22: unsigned char i = 0;
	clrf	(uart_send_number@i)
	line	25
	
i1l2341:	
;uart_dbg.c: 23: unsigned char j;
;uart_dbg.c: 25: if(num == 0)
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l2353
u184_20:
	line	27
	
i1l2343:	
;uart_dbg.c: 26: {
;uart_dbg.c: 27: uart_send_char('0');
	movlw	low(030h)
	fcall	_uart_send_char
	goto	i1l676
	line	33
	
i1l2347:	
;uart_dbg.c: 32: {
;uart_dbg.c: 33: buf[i++] = '0' + (num % 10);
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
	
i1l2349:	
	incf	(uart_send_number@i),f
	line	34
	
i1l2351:	
;uart_dbg.c: 34: num /= 10;
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
	line	31
	
i1l2353:	
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l2347
u185_20:
	line	37
	
i1l2355:	
;uart_dbg.c: 35: }
;uart_dbg.c: 37: for(j = i; j > 0; j--)
	movf	(uart_send_number@i),w
	movwf	(uart_send_number@j)
	
i1l2357:	
	movf	((uart_send_number@j)),w
	btfss	status,2
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l2361
u186_20:
	goto	i1l676
	line	38
	
i1l2361:	
;uart_dbg.c: 38: uart_send_char(buf[j-1]);
	movf	(uart_send_number@j),w
	addlw	0FFh
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_uart_send_char
	line	37
	
i1l2363:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(uart_send_number@j),f
	goto	i1l2357
	line	39
	
i1l676:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_number
	__end_of_uart_send_number:
	signat	_uart_send_number,4217
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 7 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	7
global __ptext19
__ptext19:	;psect for function _uart_send_char
psect	text19
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	7
	global	__size_of_uart_send_char
	__size_of_uart_send_char	equ	__end_of_uart_send_char-_uart_send_char
	
_uart_send_char:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_char: [wreg]
;uart_send_char@c stored from wreg
	movwf	(uart_send_char@c)
	line	9
	
i1l2225:	
;uart_dbg.c: 9: while(TRMT1 == 0);
	
i1l663:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u165_21
	goto	u165_20
u165_21:
	goto	i1l663
u165_20:
	line	10
	
i1l2227:	
;uart_dbg.c: 10: TXREG1 = c;
	movf	(uart_send_char@c),w
	movwf	(391)^0180h	;volatile
	line	11
	
i1l666:	
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
psect	text20,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
global __ptext20
__ptext20:	;psect for function ___lwmod
psect	text20
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
i1l2255:	
	movf	((___lwmod@divisor)),w
iorwf	((___lwmod@divisor+1)),w
	btfsc	status,2
	goto	u170_21
	goto	u170_20
u170_21:
	goto	i1l2271
u170_20:
	line	14
	
i1l2257:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	i1l2261
	line	16
	
i1l2259:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	17
	incf	(___lwmod@counter),f
	line	15
	
i1l2261:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u171_21
	goto	u171_20
u171_21:
	goto	i1l2259
u171_20:
	line	20
	
i1l2263:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u172_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u172_25:
	skipc
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l2267
u172_20:
	line	21
	
i1l2265:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	22
	
i1l2267:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	23
	
i1l2269:	
	decfsz	(___lwmod@counter),f
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l2263
u173_20:
	line	25
	
i1l2271:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	26
	
i1l1074:	
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
;;  quotient        2    4[COMMON] unsigned int 
;;  counter         1    6[COMMON] unsigned char 
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
psect	text21,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
global __ptext21
__ptext21:	;psect for function ___lwdiv
psect	text21
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
i1l2229:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
i1l2231:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u166_21
	goto	u166_20
u166_21:
	goto	i1l2251
u166_20:
	line	16
	
i1l2233:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	i1l2237
	line	18
	
i1l2235:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
i1l2237:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u167_21
	goto	u167_20
u167_21:
	goto	i1l2235
u167_20:
	line	22
	
i1l2239:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
i1l2241:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u168_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u168_25:
	skipc
	goto	u168_21
	goto	u168_20
u168_21:
	goto	i1l2247
u168_20:
	line	24
	
i1l2243:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
i1l2245:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
i1l2247:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
i1l2249:	
	decfsz	(___lwdiv@counter),f
	goto	u169_21
	goto	u169_20
u169_21:
	goto	i1l2239
u169_20:
	line	30
	
i1l2251:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
i1l1064:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_PowerOnLedSequence

;; *************** function _PowerOnLedSequence *****************
;; Defined at:
;;		line 48 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
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
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	48
global __ptext22
__ptext22:	;psect for function _PowerOnLedSequence
psect	text22
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	48
	global	__size_of_PowerOnLedSequence
	__size_of_PowerOnLedSequence	equ	__end_of_PowerOnLedSequence-_PowerOnLedSequence
	
_PowerOnLedSequence:	
;incstack = 0
	opt	stack 4
; Regs used in _PowerOnLedSequence: [wreg+status,2+status,0]
	line	50
	
i1l2607:	
;led.c: 50: g_powerOnTimer++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_g_powerOnTimer)^080h,f
	skipnz
	incf	(_g_powerOnTimer+1)^080h,f
	line	52
	
i1l2609:	
;led.c: 52: if(g_powerOnPhase == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l2619
u208_20:
	line	54
	
i1l2611:	
;led.c: 53: {
;led.c: 54: RC5 = 1;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	line	55
;led.c: 55: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	56
	
i1l2613:	
;led.c: 56: if(g_powerOnTimer >= 4000)
	movlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0A0h
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l656
u209_20:
	line	58
	
i1l2615:	
;led.c: 57: {
;led.c: 58: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	59
	
i1l2617:	
;led.c: 59: g_powerOnPhase = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	incf	(_g_powerOnPhase),f
	goto	i1l656
	line	62
	
i1l2619:	
;led.c: 62: else if(g_powerOnPhase == 1)
		decf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u210_21
	goto	u210_20
u210_21:
	goto	i1l656
u210_20:
	line	64
	
i1l2621:	
;led.c: 63: {
;led.c: 64: if(g_powerOnTimer >= 4000)
	movlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0A0h
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u211_21
	goto	u211_20
u211_21:
	goto	i1l656
u211_20:
	line	66
	
i1l2623:	
;led.c: 65: {
;led.c: 66: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	67
	
i1l2625:	
;led.c: 67: g_powerOnPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_g_powerOnPhase)
	line	68
	
i1l2627:	
;led.c: 68: RC5 = 0;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	69
	
i1l2629:	
;led.c: 69: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	72
	
i1l656:	
	return
	opt stack 0
GLOBAL	__end_of_PowerOnLedSequence
	__end_of_PowerOnLedSequence:
	signat	_PowerOnLedSequence,89
	global	_Led_BlinkProcess

;; *************** function _Led_BlinkProcess *****************
;; Defined at:
;;		line 31 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
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
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	31
global __ptext23
__ptext23:	;psect for function _Led_BlinkProcess
psect	text23
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\led.c"
	line	31
	global	__size_of_Led_BlinkProcess
	__size_of_Led_BlinkProcess	equ	__end_of_Led_BlinkProcess-_Led_BlinkProcess
	
_Led_BlinkProcess:	
;incstack = 0
	opt	stack 3
; Regs used in _Led_BlinkProcess: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	34
	
i1l3483:	
;led.c: 33: unsigned char i;
;led.c: 34: for(i = 0; i < 12; i++)
	clrf	(Led_BlinkProcess@i)
	line	36
	
i1l3489:	
;led.c: 35: {
;led.c: 36: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState == 3)
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l3493
u345_20:
	
i1l3491:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$469)
	goto	i1l3495
	
i1l3493:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$469)
	
i1l3495:	
	movf	(_Led_BlinkProcess$469),w
	addlw	02h
	movwf	fsr0
		movlw	3
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l3529
u346_20:
	line	38
	
i1l3497:	
;led.c: 37: {
;led.c: 38: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer++;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l3501
u347_20:
	
i1l3499:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$480)
	goto	i1l3503
	
i1l3501:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$480)
	
i1l3503:	
	movf	(_Led_BlinkProcess$480),w
	addlw	07h
	movwf	fsr0
	movlw	01h
	bsf	status, 7	;select IRP bank2
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	39
	
i1l3505:	
;led.c: 39: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer >= (4000 / 2))
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l3509
u348_20:
	
i1l3507:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$491)
	goto	i1l3511
	
i1l3509:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$491)
	
i1l3511:	
	movf	(_Led_BlinkProcess$491),w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(??_Led_BlinkProcess+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Led_BlinkProcess+0)+0+1
	movlw	07h
	subwf	1+(??_Led_BlinkProcess+0)+0,w
	movlw	0D0h
	skipnz
	subwf	0+(??_Led_BlinkProcess+0)+0,w
	skipc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l3529
u349_20:
	line	41
	
i1l3513:	
;led.c: 40: {
;led.c: 41: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l3517
u350_20:
	
i1l3515:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$502)
	goto	i1l3519
	
i1l3517:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$502)
	
i1l3519:	
	movf	(_Led_BlinkProcess$502),w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	42
	
i1l3521:	
;led.c: 42: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase ^= 1;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l3525
u351_20:
	
i1l3523:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$513)
	goto	i1l3527
	
i1l3525:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$513)
	
i1l3527:	
	movf	(_Led_BlinkProcess$513),w
	addlw	09h
	movwf	fsr0
	movlw	low(01h)
	bsf	status, 7	;select IRP bank2
	xorwf	indf,f
	line	34
	
i1l3529:	
	incf	(Led_BlinkProcess@i),f
	
i1l3531:	
	movlw	low(0Ch)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l3489
u352_20:
	line	46
	
i1l648:	
	return
	opt stack 0
GLOBAL	__end_of_Led_BlinkProcess
	__end_of_Led_BlinkProcess:
	signat	_Led_BlinkProcess,89
	global	_Charging_Control

;; *************** function _Charging_Control *****************
;; Defined at:
;;		line 209 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1    6[COMMON] unsigned char 
;;  i               1    7[COMMON] unsigned char 
;;  chargeB7_12     1    5[COMMON] unsigned char 
;;  chargeB1_6      1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 800/A00
;;		On exit  : 300/100
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
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	209
global __ptext24
__ptext24:	;psect for function _Charging_Control
psect	text24
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	209
	global	__size_of_Charging_Control
	__size_of_Charging_Control	equ	__end_of_Charging_Control-_Charging_Control
	
_Charging_Control:	
;incstack = 0
	opt	stack 3
; Regs used in _Charging_Control: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	212
	
i1l3533:	
;charge_mgr.c: 211: unsigned char i;
;charge_mgr.c: 212: unsigned char chargeB1_6 = 0;
	clrf	(Charging_Control@chargeB1_6)
	line	213
;charge_mgr.c: 213: unsigned char chargeB7_12 = 0;
	clrf	(Charging_Control@chargeB7_12)
	line	215
	
i1l3535:	
;charge_mgr.c: 215: if(g_tempProtect)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_g_tempProtect)),w
	btfsc	status,2
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l3537
u353_20:
	line	217
;charge_mgr.c: 216: {
;charge_mgr.c: 217: do { RA0=1; RA1=1; RB3=1; RB2=1; RA3=1; RA2=1; RD1=1; RD3=1; RB0=1; RB1=1; RD2=1; RD0=1; } while(0);
	
i1l553:	
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
	
i1l554:	
	line	218
;charge_mgr.c: 218: RA4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	line	219
;charge_mgr.c: 219: RA5 = 0;
	bcf	(1077/8)^080h,(1077)&7	;volatile
	line	220
;charge_mgr.c: 220: RA6 = 0;
	bcf	(1078/8)^080h,(1078)&7	;volatile
	line	221
;charge_mgr.c: 221: return;
	goto	i1l555
	line	224
	
i1l3537:	
;charge_mgr.c: 222: }
;charge_mgr.c: 224: for(i = 0; i < 12; i++)
	clrf	(Charging_Control@i)
	line	226
	
i1l3543:	
;charge_mgr.c: 225: {
;charge_mgr.c: 226: unsigned char s = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state;
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l3547
u354_20:
	
i1l3545:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Charging_Control$443)
	goto	i1l3549
	
i1l3547:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Charging_Control$443)
	
i1l3549:	
	incf	(_Charging_Control$443),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(Charging_Control@s)
	line	229
	
i1l3551:	
;charge_mgr.c: 228: if(s == 2 || s == 3 ||
;charge_mgr.c: 229: s == 4 || s == 5)
		movlw	2
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l3561
u355_20:
	
i1l3553:	
		movlw	3
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l3561
u356_20:
	
i1l3555:	
		movlw	4
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l3561
u357_20:
	
i1l3557:	
		movlw	5
	xorwf	((Charging_Control@s)),w
	btfss	status,2
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l3569
u358_20:
	goto	i1l3561
	line	231
	
i1l567:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l3563
	
i1l569:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l3563
	
i1l570:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	goto	i1l3563
	
i1l571:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7	;volatile
	goto	i1l3563
	
i1l572:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l3563
	
i1l573:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l3563
	
i1l574:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l3563
	
i1l575:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l3563
	
i1l576:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7	;volatile
	goto	i1l3563
	
i1l577:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7	;volatile
	goto	i1l3563
	
i1l578:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l3563
	
i1l579:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l3563
	
i1l3561:	
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
	goto	i1l567
	xorlw	1^0	; case 1
	skipnz
	goto	i1l569
	xorlw	2^1	; case 2
	skipnz
	goto	i1l570
	xorlw	3^2	; case 3
	skipnz
	goto	i1l571
	xorlw	4^3	; case 4
	skipnz
	goto	i1l572
	xorlw	5^4	; case 5
	skipnz
	goto	i1l573
	xorlw	6^5	; case 6
	skipnz
	goto	i1l574
	xorlw	7^6	; case 7
	skipnz
	goto	i1l575
	xorlw	8^7	; case 8
	skipnz
	goto	i1l576
	xorlw	9^8	; case 9
	skipnz
	goto	i1l577
	xorlw	10^9	; case 10
	skipnz
	goto	i1l578
	xorlw	11^10	; case 11
	skipnz
	goto	i1l579
	goto	i1l3563
	opt asmopt_pop

	line	233
	
i1l3563:	
;charge_mgr.c: 233: if(i < 6)
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipnc
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l581
u359_20:
	line	234
	
i1l3565:	
;charge_mgr.c: 234: chargeB1_6 = 1;
	clrf	(Charging_Control@chargeB1_6)
	incf	(Charging_Control@chargeB1_6),f
	goto	i1l3571
	line	235
	
i1l581:	
	line	236
;charge_mgr.c: 235: else
;charge_mgr.c: 236: chargeB7_12 = 1;
	clrf	(Charging_Control@chargeB7_12)
	incf	(Charging_Control@chargeB7_12),f
	goto	i1l3571
	line	240
	
i1l586:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l3571
	
i1l588:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l3571
	
i1l589:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	goto	i1l3571
	
i1l590:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7	;volatile
	goto	i1l3571
	
i1l591:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l3571
	
i1l592:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l3571
	
i1l593:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l3571
	
i1l594:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l3571
	
i1l595:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7	;volatile
	goto	i1l3571
	
i1l596:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7	;volatile
	goto	i1l3571
	
i1l597:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l3571
	
i1l598:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l3571
	
i1l3569:	
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
	goto	i1l586
	xorlw	1^0	; case 1
	skipnz
	goto	i1l588
	xorlw	2^1	; case 2
	skipnz
	goto	i1l589
	xorlw	3^2	; case 3
	skipnz
	goto	i1l590
	xorlw	4^3	; case 4
	skipnz
	goto	i1l591
	xorlw	5^4	; case 5
	skipnz
	goto	i1l592
	xorlw	6^5	; case 6
	skipnz
	goto	i1l593
	xorlw	7^6	; case 7
	skipnz
	goto	i1l594
	xorlw	8^7	; case 8
	skipnz
	goto	i1l595
	xorlw	9^8	; case 9
	skipnz
	goto	i1l596
	xorlw	10^9	; case 10
	skipnz
	goto	i1l597
	xorlw	11^10	; case 11
	skipnz
	goto	i1l598
	goto	i1l3571
	opt asmopt_pop

	line	224
	
i1l3571:	
	incf	(Charging_Control@i),f
	
i1l3573:	
	movlw	low(0Ch)
	subwf	(Charging_Control@i),w
	skipc
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l3543
u360_20:
	
i1l557:	
	line	244
;charge_mgr.c: 241: }
;charge_mgr.c: 242: }
;charge_mgr.c: 244: RA4 = chargeB1_6;
	btfsc	(Charging_Control@chargeB1_6),0
	goto	u361_21
	goto	u361_20
	
u361_21:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7	;volatile
	goto	u362_24
u361_20:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
u362_24:
	line	245
;charge_mgr.c: 245: RA5 = chargeB7_12;
	btfsc	(Charging_Control@chargeB7_12),0
	goto	u363_21
	goto	u363_20
	
u363_21:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1077/8)^080h,(1077)&7	;volatile
	goto	u364_24
u363_20:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
u364_24:
	line	247
	
i1l3575:	
;charge_mgr.c: 247: if(chargeB1_6 || chargeB7_12)
	movf	((Charging_Control@chargeB1_6)),w
	btfss	status,2
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l602
u365_20:
	
i1l3577:	
	movf	((Charging_Control@chargeB7_12)),w
	btfsc	status,2
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l600
u366_20:
	
i1l602:	
	line	248
;charge_mgr.c: 248: RA6 = 1;
	bsf	(1078/8)^080h,(1078)&7	;volatile
	goto	i1l555
	line	249
	
i1l600:	
	line	250
;charge_mgr.c: 249: else
;charge_mgr.c: 250: RA6 = 0;
	bcf	(1078/8)^080h,(1078)&7	;volatile
	line	251
	
i1l555:	
	return
	opt stack 0
GLOBAL	__end_of_Charging_Control
	__end_of_Charging_Control:
	signat	_Charging_Control,89
	global	_ChargeProcess_Slot

;; *************** function _ChargeProcess_Slot *****************
;; Defined at:
;;		line 68 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
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
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	line	68
global __ptext25
__ptext25:	;psect for function _ChargeProcess_Slot
psect	text25
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	68
	global	__size_of_ChargeProcess_Slot
	__size_of_ChargeProcess_Slot	equ	__end_of_ChargeProcess_Slot-_ChargeProcess_Slot
	
_ChargeProcess_Slot:	
;incstack = 0
	opt	stack 3
; Regs used in _ChargeProcess_Slot: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ChargeProcess_Slot@idx stored from wreg
	movwf	(ChargeProcess_Slot@idx)
	line	70
	
i1l3335:	
;charge_mgr.c: 70: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(ChargeProcess_Slot@idx),w
	skipc
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l3339
u322_20:
	
i1l3337:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(ChargeProcess_Slot@p)
	goto	i1l3341
	
i1l3339:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(ChargeProcess_Slot@p)
	line	71
	
i1l3341:	
;charge_mgr.c: 71: unsigned int v = p->voltage;
	movf	(ChargeProcess_Slot@p),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(ChargeProcess_Slot@v)
	incf	fsr0,f
	movf	indf,w
	movwf	(ChargeProcess_Slot@v+1)
	line	72
	
i1l3343:	
	line	74
;charge_mgr.c: 74: switch(p->state)
	goto	i1l3461
	line	77
	
i1l3345:	
;charge_mgr.c: 77: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	78
;charge_mgr.c: 78: p->stableCnt = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	0Ah
	movwf	fsr0
	clrf	indf
	line	79
	
i1l3347:	
;charge_mgr.c: 79: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	80
;charge_mgr.c: 80: break;
	goto	i1l549
	line	83
	
i1l3349:	
;charge_mgr.c: 83: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	84
	
i1l3351:	
;charge_mgr.c: 84: if(p->chargeTimer < (2 * 4000))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	01Fh
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	040h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipnc
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l3355
u323_20:
	goto	i1l549
	line	87
	
i1l3355:	
;charge_mgr.c: 87: p->type = Detect_BatteryType(v);
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	(ChargeProcess_Slot@v+1),w
	movwf	(Detect_BatteryType@voltage+1)
	movf	(ChargeProcess_Slot@v),w
	movwf	(Detect_BatteryType@voltage)
	fcall	_Detect_BatteryType
	movwf	indf
	line	91
	
i1l3357:	
;charge_mgr.c: 89: if(p->type == 4 ||
;charge_mgr.c: 90: p->type == 2 ||
;charge_mgr.c: 91: p->type == 0)
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	4
	xorwf	(indf),w
	btfsc	status,2
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l3363
u324_20:
	
i1l3359:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	2
	xorwf	(indf),w
	btfsc	status,2
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l3363
u325_20:
	
i1l3361:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	(indf),w
	btfss	status,2
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l3365
u326_20:
	line	93
	
i1l3363:	
;charge_mgr.c: 92: {
;charge_mgr.c: 93: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	94
;charge_mgr.c: 94: break;
	goto	i1l549
	line	97
	
i1l3365:	
;charge_mgr.c: 95: }
;charge_mgr.c: 97: if(v <= 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l3373
u327_20:
	line	99
	
i1l3367:	
;charge_mgr.c: 98: {
;charge_mgr.c: 99: p->state = 2;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	100
	
i1l3369:	
;charge_mgr.c: 100: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	101
	
i1l3371:	
;charge_mgr.c: 101: p->activatePulseCnt = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	0Bh
	movwf	fsr0
	clrf	indf
	line	102
;charge_mgr.c: 102: }
	goto	i1l549
	line	103
	
i1l3373:	
;charge_mgr.c: 103: else if(v < 62)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	03Eh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l3379
u328_20:
	line	105
	
i1l3375:	
;charge_mgr.c: 104: {
;charge_mgr.c: 105: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	106
	
i1l3377:	
;charge_mgr.c: 106: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	107
;charge_mgr.c: 107: }
	goto	i1l549
	line	110
	
i1l3379:	
;charge_mgr.c: 108: else
;charge_mgr.c: 109: {
;charge_mgr.c: 110: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	111
	
i1l3381:	
;charge_mgr.c: 111: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l549
	line	116
	
i1l3383:	
;charge_mgr.c: 116: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	117
	
i1l3385:	
;charge_mgr.c: 117: if(p->chargeTimer > (60 * 4000))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	0A9h
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	081h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l3389
u329_20:
	line	119
	
i1l3387:	
;charge_mgr.c: 118: {
;charge_mgr.c: 119: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	120
;charge_mgr.c: 120: break;
	goto	i1l549
	line	122
	
i1l3389:	
;charge_mgr.c: 121: }
;charge_mgr.c: 122: if(v > 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l3395
u330_20:
	line	124
	
i1l3391:	
;charge_mgr.c: 123: {
;charge_mgr.c: 124: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	125
	
i1l3393:	
;charge_mgr.c: 125: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	126
;charge_mgr.c: 126: break;
	goto	i1l549
	line	128
	
i1l3395:	
;charge_mgr.c: 127: }
;charge_mgr.c: 128: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l549
u331_20:
	line	130
	
i1l3397:	
;charge_mgr.c: 129: {
;charge_mgr.c: 130: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	131
;charge_mgr.c: 131: break;
	goto	i1l549
	line	136
	
i1l3399:	
;charge_mgr.c: 136: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	137
	
i1l3401:	
;charge_mgr.c: 137: if(p->chargeTimer > (300 * 4000))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	04Fh
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	081h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l3405
u332_20:
	line	139
	
i1l3403:	
;charge_mgr.c: 138: {
;charge_mgr.c: 139: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	140
;charge_mgr.c: 140: break;
	goto	i1l549
	line	142
	
i1l3405:	
;charge_mgr.c: 141: }
;charge_mgr.c: 142: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l3409
u333_20:
	line	144
	
i1l3407:	
;charge_mgr.c: 143: {
;charge_mgr.c: 144: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	145
;charge_mgr.c: 145: break;
	goto	i1l549
	line	147
	
i1l3409:	
;charge_mgr.c: 146: }
;charge_mgr.c: 147: if(v >= 124)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	07Ch
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l549
u334_20:
	line	149
	
i1l3411:	
;charge_mgr.c: 148: {
;charge_mgr.c: 149: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	150
	
i1l3413:	
;charge_mgr.c: 150: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l549
	line	155
	
i1l3415:	
;charge_mgr.c: 155: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	156
	
i1l3417:	
;charge_mgr.c: 156: if(p->chargeTimer > (10800 * 4000))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	02Eh
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	01h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l3421
u335_20:
	line	158
	
i1l3419:	
;charge_mgr.c: 157: {
;charge_mgr.c: 158: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	159
;charge_mgr.c: 159: break;
	goto	i1l549
	line	161
	
i1l3421:	
;charge_mgr.c: 160: }
;charge_mgr.c: 161: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l3425
u336_20:
	line	163
	
i1l3423:	
;charge_mgr.c: 162: {
;charge_mgr.c: 163: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	164
;charge_mgr.c: 164: break;
	goto	i1l549
	line	166
	
i1l3425:	
;charge_mgr.c: 165: }
;charge_mgr.c: 166: if(v >= 188)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0BCh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l549
u337_20:
	line	168
	
i1l3427:	
;charge_mgr.c: 167: {
;charge_mgr.c: 168: p->state = 5;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(05h)
	movwf	indf
	line	169
	
i1l3429:	
;charge_mgr.c: 169: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l549
	line	174
	
i1l3431:	
;charge_mgr.c: 174: p->chargeTimer += tick;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	175
	
i1l3433:	
;charge_mgr.c: 175: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l3437
u338_20:
	line	177
	
i1l3435:	
;charge_mgr.c: 176: {
;charge_mgr.c: 177: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	178
;charge_mgr.c: 178: break;
	goto	i1l549
	line	180
	
i1l3437:	
;charge_mgr.c: 179: }
;charge_mgr.c: 180: if(p->chargeTimer > (600 * 4000))
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ChargeProcess_Slot+0)+0+1
	movlw	09Fh
	subwf	1+(??_ChargeProcess_Slot+0)+0,w
	movlw	01h
	skipnz
	subwf	0+(??_ChargeProcess_Slot+0)+0,w
	skipc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l549
u339_20:
	line	182
	
i1l3439:	
;charge_mgr.c: 181: {
;charge_mgr.c: 182: p->state = 6;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(06h)
	movwf	indf
	goto	i1l549
	line	187
	
i1l3441:	
;charge_mgr.c: 187: if(v < (188 - 10))
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0B2h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l549
u340_20:
	line	189
	
i1l3443:	
;charge_mgr.c: 188: {
;charge_mgr.c: 189: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	190
	
i1l3445:	
;charge_mgr.c: 190: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l549
	line	196
	
i1l3447:	
;charge_mgr.c: 195: if(v > 12 && v < 198 &&
;charge_mgr.c: 196: p->type == 1)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l549
u341_20:
	
i1l3449:	
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l549
u342_20:
	
i1l3451:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		decf	(indf),w
	btfss	status,2
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l549
u343_20:
	line	198
	
i1l3453:	
;charge_mgr.c: 197: {
;charge_mgr.c: 198: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	199
	
i1l3455:	
;charge_mgr.c: 199: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l549
	line	204
	
i1l3457:	
;charge_mgr.c: 204: p->state = 0;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	line	205
;charge_mgr.c: 205: break;
	goto	i1l549
	line	74
	
i1l3461:	
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
	goto	i1l3345
	xorlw	1^0	; case 1
	skipnz
	goto	i1l3349
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3383
	xorlw	3^2	; case 3
	skipnz
	goto	i1l3399
	xorlw	4^3	; case 4
	skipnz
	goto	i1l3415
	xorlw	5^4	; case 5
	skipnz
	goto	i1l3431
	xorlw	6^5	; case 6
	skipnz
	goto	i1l3441
	xorlw	7^6	; case 7
	skipnz
	goto	i1l3447
	goto	i1l3457
	opt asmopt_pop

	line	207
	
i1l549:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeProcess_Slot
	__end_of_ChargeProcess_Slot:
	signat	_ChargeProcess_Slot,4217
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
;;		_Update_LED_Slot
;;		_Led_BlinkProcess
;;		_Print_Status
;;		_SlotPin_ToAnalog
;;		_SlotPin_ToDigital
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
	opt	stack 4
; Regs used in i1___bmul: [wreg+status,2+status,0]
;i1___bmul@multiplier stored from wreg
	movwf	(i1___bmul@multiplier)
	line	6
	
i1l2419:	
	clrf	(i1___bmul@product)
	line	43
	
i1l2421:	
	btfss	(i1___bmul@multiplier),(0)&7
	goto	u196_21
	goto	u196_20
u196_21:
	goto	i1l2425
u196_20:
	line	44
	
i1l2423:	
	movf	(i1___bmul@multiplicand),w
	addwf	(i1___bmul@product),f
	line	45
	
i1l2425:	
	clrc
	rlf	(i1___bmul@multiplicand),f
	line	46
	
i1l2427:	
	clrc
	rrf	(i1___bmul@multiplier),f
	line	47
	movf	((i1___bmul@multiplier)),w
	btfss	status,2
	goto	u197_21
	goto	u197_20
u197_21:
	goto	i1l2421
u197_20:
	line	50
	
i1l2429:	
	movf	(i1___bmul@product),w
	line	51
	
i1l745:	
	return
	opt stack 0
GLOBAL	__end_ofi1___bmul
	__end_ofi1___bmul:
	signat	i1___bmul,89
	global	_Detect_BatteryType

;; *************** function _Detect_BatteryType *****************
;; Defined at:
;;		line 45 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
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
psect	text27,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	45
global __ptext27
__ptext27:	;psect for function _Detect_BatteryType
psect	text27
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c"
	line	45
	global	__size_of_Detect_BatteryType
	__size_of_Detect_BatteryType	equ	__end_of_Detect_BatteryType-_Detect_BatteryType
	
_Detect_BatteryType:	
;incstack = 0
	opt	stack 3
; Regs used in _Detect_BatteryType: [wreg]
	line	47
	
i1l2291:	
;charge_mgr.c: 47: if(voltage <= 5)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	06h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u175_21
	goto	u175_20
u175_21:
	goto	i1l2297
u175_20:
	line	48
	
i1l2293:	
;charge_mgr.c: 48: return 4;
	movlw	low(04h)
	goto	i1l502
	line	50
	
i1l2297:	
;charge_mgr.c: 50: if(voltage <= 12)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0Dh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l2303
u176_20:
	line	51
	
i1l2299:	
;charge_mgr.c: 51: return 1;
	movlw	low(01h)
	goto	i1l502
	line	53
	
i1l2303:	
;charge_mgr.c: 53: if(voltage >= 136 && voltage <= 161)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	088h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l2311
u177_20:
	
i1l2305:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0A2h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l2311
u178_20:
	line	54
	
i1l2307:	
;charge_mgr.c: 54: return 2;
	movlw	low(02h)
	goto	i1l502
	line	56
	
i1l2311:	
;charge_mgr.c: 56: if(voltage >= 62 && voltage <= 188)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	03Eh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l2319
u179_20:
	
i1l2313:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l2319
u180_20:
	goto	i1l2299
	line	59
	
i1l2319:	
;charge_mgr.c: 59: if(voltage > 188 && voltage < 198)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l2327
u181_20:
	
i1l2321:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0C6h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l2327
u182_20:
	goto	i1l2299
	line	62
	
i1l2327:	
;charge_mgr.c: 62: return 0;
	movlw	low(0)
	line	63
	
i1l502:	
	return
	opt stack 0
GLOBAL	__end_of_Detect_BatteryType
	__end_of_Detect_BatteryType:
	signat	_Detect_BatteryType,4217
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
