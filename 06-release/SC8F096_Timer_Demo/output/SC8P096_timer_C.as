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
	global	_g_cvIntegral
	global	_g_systemTick
	global	_g_pwmCounter
	global	_g_pwmDuty
	global	_g_powerOnPhase
	global	_g_scanPhase
	global	_g_scanIndex
	global	_test_adc
	global	_g_tempProtect
	global	_adresult
	global	_g_printFlag
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
	global	_RC4
_RC4	set	0x834
	global	_RC5
_RC5	set	0x835
	global	_RC2
_RC2	set	0x832
	global	_RC3
_RC3	set	0x833
	global	_CC1CON
_CC1CON	set	406
	global	_CC0CON
_CC0CON	set	405
	global	_SPBRG1
_SPBRG1	set	393
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

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_g_cvIntegral:
       ds      2

_g_systemTick:
       ds      2

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
	movlw	low((__pbssBANK0)+0Dh)
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
	ds	1
??___lwdiv:	; 1 bytes @ 0x4
??___lwmod:	; 1 bytes @ 0x4
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	_System_Init$249
_System_Init$249:	; 1 bytes @ 0x6
	ds	1
?_uart_send_number:	; 1 bytes @ 0x7
	global	_System_Init$260
_System_Init$260:	; 1 bytes @ 0x7
	global	uart_send_number@num
uart_send_number@num:	; 2 bytes @ 0x7
	ds	1
	global	_System_Init$271
_System_Init$271:	; 1 bytes @ 0x8
	ds	1
??_uart_send_number:	; 1 bytes @ 0x9
	global	_System_Init$282
_System_Init$282:	; 1 bytes @ 0x9
	global	uart_send_number@buf
uart_send_number@buf:	; 6 bytes @ 0x9
	ds	1
	global	_System_Init$293
_System_Init$293:	; 1 bytes @ 0xA
	ds	1
	global	_System_Init$304
_System_Init$304:	; 1 bytes @ 0xB
	ds	1
	global	_System_Init$315
_System_Init$315:	; 1 bytes @ 0xC
	ds	1
	global	_System_Init$326
_System_Init$326:	; 1 bytes @ 0xD
	ds	1
	global	_System_Init$337
_System_Init$337:	; 1 bytes @ 0xE
	ds	1
	global	System_Init@i
System_Init@i:	; 1 bytes @ 0xF
	global	uart_send_number@i
uart_send_number@i:	; 1 bytes @ 0xF
	ds	1
	global	uart_send_number@j
uart_send_number@j:	; 1 bytes @ 0x10
	ds	1
??_Print_Status:	; 1 bytes @ 0x11
	global	_Print_Status$561
_Print_Status$561:	; 1 bytes @ 0x11
	ds	1
	global	_Print_Status$573
_Print_Status$573:	; 1 bytes @ 0x12
	ds	1
	global	_Print_Status$585
_Print_Status$585:	; 1 bytes @ 0x13
	ds	1
	global	_Print_Status$596
_Print_Status$596:	; 1 bytes @ 0x14
	ds	1
	global	_Print_Status$608
_Print_Status$608:	; 1 bytes @ 0x15
	ds	1
	global	_Print_Status$630
_Print_Status$630:	; 1 bytes @ 0x16
	ds	1
	global	_Print_Status$631
_Print_Status$631:	; 1 bytes @ 0x17
	ds	1
	global	Print_Status@i
Print_Status@i:	; 1 bytes @ 0x18
	ds	1
??_main:	; 1 bytes @ 0x19
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
	global	_Charging_Control$419
_Charging_Control$419:	; 1 bytes @ 0x5
	global	_Led_BlinkProcess$487
_Led_BlinkProcess$487:	; 1 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	Charging_Control@s
Charging_Control@s:	; 1 bytes @ 0x6
	global	_Led_BlinkProcess$498
_Led_BlinkProcess$498:	; 1 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
??_ADC_ReadChannel:	; 1 bytes @ 0x7
	global	Charging_Control@i
Charging_Control@i:	; 1 bytes @ 0x7
	global	_Led_BlinkProcess$509
_Led_BlinkProcess$509:	; 1 bytes @ 0x7
	ds	1
??_CCCV_Control:	; 1 bytes @ 0x8
??___lmul:	; 1 bytes @ 0x8
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x8
	global	ADC_ReadChannel@ch
ADC_ReadChannel@ch:	; 1 bytes @ 0x8
	global	_Led_BlinkProcess$520
_Led_BlinkProcess$520:	; 1 bytes @ 0x8
	global	ChargeProcess_Slot@v
ChargeProcess_Slot@v:	; 2 bytes @ 0x8
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
	global	_Led_BlinkProcess$531
_Led_BlinkProcess$531:	; 1 bytes @ 0x9
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
	global	_CCCV_Control$436
_CCCV_Control$436:	; 1 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	_CCCV_Control$447
_CCCV_Control$447:	; 1 bytes @ 0x5
	ds	1
	global	_CCCV_Control$458
_CCCV_Control$458:	; 1 bytes @ 0x6
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
	global	_Interrupt_Isr$361
_Interrupt_Isr$361:	; 1 bytes @ 0x1D
	ds	1
	global	Interrupt_Isr@power_temp
Interrupt_Isr@power_temp:	; 4 bytes @ 0x1E
	ds	4
;!
;!Data Sizes:
;!    Strings     56
;!    Constant    12
;!    Data        1
;!    BSS         161
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     34      49
;!    BANK1            80     25      29
;!    BANK3            80      0      72
;!    BANK2            80      0      72

;!
;!Pointer List with Targets:
;!
;!    Print_Status$631	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$630	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$608	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$596	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$585	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$573	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Print_Status$561	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    uart_send_string@str	PTR const unsigned char  size(1) Largest target is 11
;!		 -> STR_12(CODE[3]), STR_11(CODE[5]), STR_10(CODE[6]), STR_9(CODE[5]), 
;!		 -> STR_8(CODE[4]), STR_7(CODE[4]), STR_6(CODE[4]), STR_5(CODE[2]), 
;!		 -> STR_4(CODE[5]), STR_3(CODE[7]), STR_2(CODE[3]), STR_1(CODE[11]), 
;!
;!    Led_BlinkProcess$531	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$520	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$509	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$498	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Led_BlinkProcess$487	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Update_LED_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$458	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$447	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    CCCV_Control$436	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Charging_Control$419	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    ChargeProcess_Slot@p	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    Interrupt_Isr$361	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$337	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$326	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$315	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$304	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$293	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$282	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$271	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$260	PTR struct . size(1) Largest target is 72
;!		 -> g_slot1(BANK2[72]), g_slot0(BANK3[72]), 
;!
;!    System_Init$249	PTR struct . size(1) Largest target is 72
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
;! (0) _main                                                 0     0      0    9921
;!                       _Print_Status
;!                        _System_Init
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (1) _System_Init                                         13    13      0    3650
;!                                              3 BANK1     13    13      0
;!                             ___bmul
;! ---------------------------------------------------------------------------------
;! (1) _Print_Status                                         8     8      0    5815
;!                                             17 BANK1      8     8      0
;!                             ___bmul
;!                   _uart_send_number
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (1) _uart_send_string                                     1     1      0     456
;!                                              1 BANK1      1     1      0
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (2) _uart_send_number                                    10     8      2    2039
;!                                              7 BANK1     10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (2) _uart_send_char                                       1     1      0      31
;!                                              0 BANK1      1     1      0
;! ---------------------------------------------------------------------------------
;! (3) ___lwmod                                              5     1      4     482
;!                                              0 BANK1      5     1      4
;! ---------------------------------------------------------------------------------
;! (3) ___lwdiv                                              7     3      4     500
;!                                              0 BANK1      7     3      4
;! ---------------------------------------------------------------------------------
;! (2) ___bmul                                               3     2      1    1880
;!                                              0 BANK1      3     2      1
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _Interrupt_Isr                                        9     9      0   15352
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
;! (5) _Update_LED_Slot                                      2     2      0     920
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
;! (5) _Led_BlinkProcess                                     8     8      0    1550
;!                                              3 COMMON     8     8      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _Charging_Control                                     5     5      0    1298
;!                                              3 COMMON     5     5      0
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (5) _ChargeProcess_Slot                                   8     8      0    3723
;!                                              3 COMMON     8     8      0
;!                 _Detect_BatteryType
;!                           i1___bmul
;! ---------------------------------------------------------------------------------
;! (6) _Detect_BatteryType                                   2     0      2     229
;!                                              0 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! (5) _CCCV_Control                                        17    17      0    2362
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
;!BANK1               50     19      1D       6       36.3%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     22      31       4       61.3%
;!BITBANK0            50      0       1       3        1.3%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      EC      12        0.0%
;!ABS                  0      0      EC      11        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 223 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
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
	line	223
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	223
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	225
	
l5020:	
;main.c: 225: System_Init();
	fcall	_System_Init
	line	232
;main.c: 232: uart_send_string("start...\r\n");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	234
;main.c: 234: while(1)
	
l374:	
	line	236
# 236 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	maintext
	line	240
	
l5022:	
;main.c: 240: if(g_printFlag)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	goto	u5971
	goto	u5970
u5971:
	goto	l374
u5970:
	line	242
	
l5024:	
;main.c: 241: {
;main.c: 242: g_printFlag = 0;
	bcf	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	line	243
	
l5026:	
;main.c: 243: Print_Status();
	fcall	_Print_Status
	goto	l374
	global	start
	ljmp	start
	opt stack 0
	line	248
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
;;  i               1   15[BANK1 ] unsigned char 
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
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0      13       0       0
;;Total ram usage:       13 bytes
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
	line	73
	
l4358:	
;main.c: 67: unsigned char i;
;main.c: 73: _delay((unsigned long)((100)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_System_Init+0)^080h+0+2),f
movlw	8
movwf	((??_System_Init+0)^080h+0+1),f
	movlw	118
movwf	((??_System_Init+0)^080h+0),f
	u6087:
decfsz	((??_System_Init+0)^080h+0),f
	goto	u6087
	decfsz	((??_System_Init+0)^080h+0+1),f
	goto	u6087
	decfsz	((??_System_Init+0)^080h+0+2),f
	goto	u6087
	nop
opt asmopt_pop

	line	76
# 76 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
nop ;# 
	line	77
# 77 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	80
;main.c: 80: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	81
	
l4360:	
;main.c: 81: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	82
# 82 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text1
	line	91
	
l4362:	
;main.c: 91: TRISA = 0B11110000;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	92
	
l4364:	
;main.c: 92: PORTA = 0B00001111;
	movlw	low(0Fh)
	movwf	(134)^080h	;volatile
	line	93
	
l4366:	
;main.c: 93: WPUA = 0B00000000;
	clrf	(136)^080h	;volatile
	line	94
	
l4368:	
;main.c: 94: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	95
	
l4370:	
;main.c: 95: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	104
;main.c: 104: TRISB = 0B00110000;
	movlw	low(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	105
;main.c: 105: PORTB = 0B01001111;
	movlw	low(04Fh)
	movwf	(6)	;volatile
	line	106
	
l4372:	
;main.c: 106: WPUB = 0B00000000;
	clrf	(8)	;volatile
	line	107
	
l4374:	
;main.c: 107: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	108
	
l4376:	
;main.c: 108: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	118
	
l4378:	
;main.c: 118: TRISC = 0B00000011;
	movlw	low(03h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	119
;main.c: 119: PORTC = 0B00000000;
	clrf	(262)^0100h	;volatile
	line	120
;main.c: 120: WPUC = 0B00000000;
	clrf	(264)^0100h	;volatile
	line	128
	
l4380:	
;main.c: 128: TRISD = 0B11110000;
	movlw	low(0F0h)
	movwf	(276)^0100h	;volatile
	line	129
	
l4382:	
;main.c: 129: PORTD = 0B00001111;
	movlw	low(0Fh)
	movwf	(263)^0100h	;volatile
	line	130
;main.c: 130: WPUD = 0B00000000;
	clrf	(277)^0100h	;volatile
	line	137
	
l4384:	
;main.c: 137: ANSEL0 = 0xF0;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	139
	
l4386:	
;main.c: 139: ANSEL1 = 0x20;
	movlw	low(020h)
	movwf	(148)^080h	;volatile
	line	143
	
l4388:	
;main.c: 143: ANSEL2 = 0x03;
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	line	144
	
l4390:	
;main.c: 144: ANSEL3 = 0xF0;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(140)^080h	;volatile
	line	147
;main.c: 147: CC0CON = 0;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(405)^0180h	;volatile
	line	148
;main.c: 148: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	153
	
l4392:	
;main.c: 153: ADCON0 = 0X41;
	movlw	low(041h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	154
	
l4394:	
;main.c: 154: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	160
;main.c: 160: TXSTA1 = 0B10100000;
	movlw	low(0A0h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(389)^0180h	;volatile
	line	161
;main.c: 161: RCSTA1 = 0B10010000;
	movlw	low(090h)
	movwf	(390)^0180h	;volatile
	line	162
;main.c: 162: SPBRG1 = 103;
	movlw	low(067h)
	movwf	(393)^0180h	;volatile
	line	172
;main.c: 172: TMR0 = 6;
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	173
	
l4396:	
;main.c: 173: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	174
	
l4398:	
;main.c: 174: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	177
	
l4400:	
;main.c: 177: PEIE = 1;
	bsf	(94/8),(94)&7	;volatile
	line	179
	
l4402:	
;main.c: 179: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	182
	
l4404:	
;main.c: 182: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7	;volatile
	line	183
	
l4406:	
;main.c: 183: RB7 = 0;
	bcf	(55/8),(55)&7	;volatile
	line	184
	
l4408:	
;main.c: 184: RC3 = 0;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2099/8)^0100h,(2099)&7	;volatile
	line	185
	
l4410:	
;main.c: 185: RC2 = 0;
	bcf	(2098/8)^0100h,(2098)&7	;volatile
	line	186
	
l4412:	
;main.c: 186: RC5 = 0;
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	187
	
l4414:	
;main.c: 187: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	190
	
l4416:	
;main.c: 190: for(i = 0; i < 12; i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(System_Init@i)^080h
	line	192
	
l4422:	
;main.c: 191: {
;main.c: 192: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u4991
	goto	u4990
u4991:
	goto	l4426
u4990:
	
l4424:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$249)^080h
	goto	l4428
	
l4426:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$249)^080h
	
l4428:	
	incf	(_System_Init$249)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	193
	
l4430:	
;main.c: 193: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5001
	goto	u5000
u5001:
	goto	l4434
u5000:
	
l4432:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$260)^080h
	goto	l4436
	
l4434:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$260)^080h
	
l4436:	
	movf	(_System_Init$260)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	194
	
l4438:	
;main.c: 194: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5011
	goto	u5010
u5011:
	goto	l4442
u5010:
	
l4440:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$271)^080h
	goto	l4444
	
l4442:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$271)^080h
	
l4444:	
	movf	(_System_Init$271)^080h,w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	195
	
l4446:	
;main.c: 195: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->chargeTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5021
	goto	u5020
u5021:
	goto	l4450
u5020:
	
l4448:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$282)^080h
	goto	l4452
	
l4450:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$282)^080h
	
l4452:	
	movf	(_System_Init$282)^080h,w
	addlw	05h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	196
	
l4454:	
;main.c: 196: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5031
	goto	u5030
u5031:
	goto	l4458
u5030:
	
l4456:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$293)^080h
	goto	l4460
	
l4458:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$293)^080h
	
l4460:	
	movf	(_System_Init$293)^080h,w
	addlw	02h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	197
	
l4462:	
;main.c: 197: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5041
	goto	u5040
u5041:
	goto	l4466
u5040:
	
l4464:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$304)^080h
	goto	l4468
	
l4466:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$304)^080h
	
l4468:	
	movf	(_System_Init$304)^080h,w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	198
	
l4470:	
;main.c: 198: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5051
	goto	u5050
u5051:
	goto	l4474
u5050:
	
l4472:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$315)^080h
	goto	l4476
	
l4474:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$315)^080h
	
l4476:	
	movf	(_System_Init$315)^080h,w
	addlw	09h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	199
	
l4478:	
;main.c: 199: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->stableCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5061
	goto	u5060
u5061:
	goto	l4482
u5060:
	
l4480:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$326)^080h
	goto	l4484
	
l4482:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$326)^080h
	
l4484:	
	movf	(_System_Init$326)^080h,w
	addlw	0Ah
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	200
	
l4486:	
;main.c: 200: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->activatePulseCnt = 0;
	movlw	low(06h)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l4490
u5070:
	
l4488:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_System_Init$337)^080h
	goto	l4492
	
l4490:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(System_Init@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_System_Init$337)^080h
	
l4492:	
	movf	(_System_Init$337)^080h,w
	addlw	0Bh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	190
	
l4494:	
	incf	(System_Init@i)^080h,f
	
l4496:	
	movlw	low(0Ch)
	subwf	(System_Init@i)^080h,w
	skipc
	goto	u5081
	goto	u5080
u5081:
	goto	l4422
u5080:
	line	204
	
l4498:	
;main.c: 201: }
;main.c: 204: g_scanIndex = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_scanIndex)
	line	205
;main.c: 205: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	206
;main.c: 207: g_timerTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	208
;main.c: 208: g_powerOnTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	209
;main.c: 209: g_powerOnPhase = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	line	210
;main.c: 210: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	211
	
l4500:	
;main.c: 211: g_temperature = 25;
	movlw	low(019h)
	movwf	(_g_temperature)
	line	212
	
l369:	
	return
	opt stack 0
GLOBAL	__end_of_System_Init
	__end_of_System_Init:
	signat	_System_Init,89
	global	_Print_Status

;; *************** function _Print_Status *****************
;; Defined at:
;;		line 86 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
	line	86
global __ptext2
__ptext2:	;psect for function _Print_Status
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	86
	global	__size_of_Print_Status
	__size_of_Print_Status	equ	__end_of_Print_Status-_Print_Status
	
_Print_Status:	
;incstack = 0
	opt	stack 1
; Regs used in _Print_Status: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	91
	
l4502:	
;uart_dbg.c: 88: unsigned char i;
;uart_dbg.c: 91: uart_send_string("T:");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	92
;uart_dbg.c: 92: uart_send_number(g_temperature);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_g_temperature),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	93
;uart_dbg.c: 93: uart_send_string("C VDD:");
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	94
;uart_dbg.c: 94: uart_send_number(power_ad);
	movf	(_power_ad+1)^080h,w	;volatile
	movwf	(uart_send_number@num+1)^080h
	movf	(_power_ad)^080h,w	;volatile
	movwf	(uart_send_number@num)^080h
	fcall	_uart_send_number
	line	95
;uart_dbg.c: 95: uart_send_string("mV\r\n");
	movlw	(low((((STR_4)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	98
	
l4504:	
;uart_dbg.c: 98: for(i = 0; i < 12; i++)
	clrf	(Print_Status@i)^080h
	line	100
	
l4510:	
;uart_dbg.c: 99: {
;uart_dbg.c: 100: uart_send_string("B");
	movlw	(low((((STR_5)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	101
;uart_dbg.c: 101: uart_send_number(i + 1);
	movf	(Print_Status@i)^080h,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	incf	(uart_send_number@num)^080h,f
	skipnz
	incf	(uart_send_number@num+1)^080h,f
	fcall	_uart_send_number
	line	102
;uart_dbg.c: 102: uart_send_string(":V=");
	movlw	(low((((STR_6)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	103
	
l4512:	
;uart_dbg.c: 103: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5091
	goto	u5090
u5091:
	goto	l4516
u5090:
	
l4514:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$561)^080h
	goto	l4518
	
l4516:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$561)^080h
	
l4518:	
	movf	(_Print_Status$561)^080h,w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	104
	
l4520:	
;uart_dbg.c: 104: uart_send_string(" S=");
	movlw	(low((((STR_7)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	105
	
l4522:	
;uart_dbg.c: 105: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5101
	goto	u5100
u5101:
	goto	l4526
u5100:
	
l4524:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$573)^080h
	goto	l4528
	
l4526:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$573)^080h
	
l4528:	
	incf	(_Print_Status$573)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	106
	
l4530:	
;uart_dbg.c: 106: uart_send_string(" T=");
	movlw	(low((((STR_8)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	107
	
l4532:	
;uart_dbg.c: 107: uart_send_number((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->type);
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5111
	goto	u5110
u5111:
	goto	l4536
u5110:
	
l4534:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$585)^080h
	goto	l4538
	
l4536:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$585)^080h
	
l4538:	
	movf	(_Print_Status$585)^080h,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(uart_send_number@num)^080h
	clrf	(uart_send_number@num+1)^080h
	fcall	_uart_send_number
	line	110
	
l4540:	
;uart_dbg.c: 110: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 7)
	movlw	low(06h)
	bcf	status, 6	;RP1=0, select bank1
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5121
	goto	u5120
u5121:
	goto	l4544
u5120:
	
l4542:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$596)^080h
	goto	l4546
	
l4544:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$596)^080h
	
l4546:	
	incf	(_Print_Status$596)^080h,w
	movwf	fsr0
		movlw	7
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u5131
	goto	u5130
u5131:
	goto	l4550
u5130:
	line	111
	
l4548:	
;uart_dbg.c: 111: uart_send_string(" ERR");
	movlw	(low((((STR_9)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	l726
	line	112
	
l4550:	
;uart_dbg.c: 112: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 6)
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5141
	goto	u5140
u5141:
	goto	l4554
u5140:
	
l4552:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$608)^080h
	goto	l4556
	
l4554:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$608)^080h
	
l4556:	
	incf	(_Print_Status$608)^080h,w
	movwf	fsr0
		movlw	6
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u5151
	goto	u5150
u5151:
	goto	l4560
u5150:
	line	113
	
l4558:	
;uart_dbg.c: 113: uart_send_string(" FULL");
	movlw	(low((((STR_10)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	goto	l726
	line	115
	
l4560:	
;uart_dbg.c: 114: else if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 4 ||
;uart_dbg.c: 115: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state == 5)
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5161
	goto	u5160
u5161:
	goto	l4564
u5160:
	
l4562:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$630)^080h
	goto	l4566
	
l4564:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$630)^080h
	
l4566:	
	incf	(_Print_Status$630)^080h,w
	movwf	fsr0
		movlw	4
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfsc	status,2
	goto	u5171
	goto	u5170
u5171:
	goto	l4576
u5170:
	
l4568:	
	movlw	low(06h)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5181
	goto	u5180
u5181:
	goto	l4572
u5180:
	
l4570:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Print_Status$631)^080h
	goto	l4574
	
l4572:	
	movlw	low(0Ch)
	movwf	(___bmul@multiplicand)^080h
	movf	(Print_Status@i)^080h,w
	fcall	___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Print_Status$631)^080h
	
l4574:	
	incf	(_Print_Status$631)^080h,w
	movwf	fsr0
		movlw	5
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u5191
	goto	u5190
u5191:
	goto	l726
u5190:
	line	116
	
l4576:	
;uart_dbg.c: 116: uart_send_string(" CHG");
	movlw	(low((((STR_11)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	118
	
l726:	
;uart_dbg.c: 118: uart_send_string("\r\n");
	movlw	(low((((STR_12)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	98
	
l4578:	
	incf	(Print_Status@i)^080h,f
	
l4580:	
	movlw	low(0Ch)
	subwf	(Print_Status@i)^080h,w
	skipc
	goto	u5201
	goto	u5200
u5201:
	goto	l4510
u5200:
	line	120
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_Print_Status
	__end_of_Print_Status:
	signat	_Print_Status,89
	global	_uart_send_string

;; *************** function _uart_send_string *****************
;; Defined at:
;;		line 34 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
	line	34
global __ptext3
__ptext3:	;psect for function _uart_send_string
psect	text3
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	34
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
	line	36
	
l4284:	
;uart_dbg.c: 36: while(*str != '\0')
	goto	l4290
	line	37
	
l4286:	
;uart_dbg.c: 37: uart_send_char(*str++);
	movf	(uart_send_string@str)^080h,w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_send_char
	
l4288:	
	bcf	status, 6	;RP1=0, select bank1
	incf	(uart_send_string@str)^080h,f
	line	36
	
l4290:	
	movf	(uart_send_string@str)^080h,w
	movwf	fsr0
	fcall	stringdir
	xorlw	0
	skipz
	goto	u4851
	goto	u4850
u4851:
	goto	l4286
u4850:
	line	38
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_string
	__end_of_uart_send_string:
	signat	_uart_send_string,4217
	global	_uart_send_number

;; *************** function _uart_send_number *****************
;; Defined at:
;;		line 47 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
	line	47
global __ptext4
__ptext4:	;psect for function _uart_send_number
psect	text4
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	47
	global	__size_of_uart_send_number
	__size_of_uart_send_number	equ	__end_of_uart_send_number-_uart_send_number
	
_uart_send_number:	
;incstack = 0
	opt	stack 1
; Regs used in _uart_send_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	50
	
l4292:	
;uart_dbg.c: 49: unsigned char buf[6];
;uart_dbg.c: 50: unsigned char i = 0;
	clrf	(uart_send_number@i)^080h
	line	54
	
l4294:	
;uart_dbg.c: 51: unsigned char j;
;uart_dbg.c: 54: if(num == 0)
	movf	((uart_send_number@num)^080h),w
iorwf	((uart_send_number@num+1)^080h),w
	btfss	status,2
	goto	u4861
	goto	u4860
u4861:
	goto	l4306
u4860:
	line	56
	
l4296:	
;uart_dbg.c: 55: {
;uart_dbg.c: 56: uart_send_char('0');
	movlw	low(030h)
	fcall	_uart_send_char
	goto	l699
	line	63
	
l4300:	
;uart_dbg.c: 62: {
;uart_dbg.c: 63: buf[i++] = '0' + (num % 10);
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
	
l4302:	
	incf	(uart_send_number@i)^080h,f
	line	64
	
l4304:	
;uart_dbg.c: 64: num /= 10;
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
	line	61
	
l4306:	
	movf	((uart_send_number@num)^080h),w
iorwf	((uart_send_number@num+1)^080h),w
	btfss	status,2
	goto	u4871
	goto	u4870
u4871:
	goto	l4300
u4870:
	line	68
	
l4308:	
;uart_dbg.c: 65: }
;uart_dbg.c: 68: for(j = i; j > 0; j--)
	movf	(uart_send_number@i)^080h,w
	movwf	(uart_send_number@j)^080h
	
l4310:	
	movf	((uart_send_number@j)^080h),w
	btfss	status,2
	goto	u4881
	goto	u4880
u4881:
	goto	l4314
u4880:
	goto	l699
	line	69
	
l4314:	
;uart_dbg.c: 69: uart_send_char(buf[j-1]);
	movf	(uart_send_number@j)^080h,w
	addlw	0FFh
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_uart_send_char
	line	68
	
l4316:	
	bcf	status, 6	;RP1=0, select bank1
	decf	(uart_send_number@j)^080h,f
	goto	l4310
	line	70
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_number
	__end_of_uart_send_number:
	signat	_uart_send_number,4217
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 22 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
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
	line	22
global __ptext5
__ptext5:	;psect for function _uart_send_char
psect	text5
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\uart_dbg.c"
	line	22
	global	__size_of_uart_send_char
	__size_of_uart_send_char	equ	__end_of_uart_send_char-_uart_send_char
	
_uart_send_char:	
;incstack = 0
	opt	stack 2
; Regs used in _uart_send_char: [wreg]
;uart_send_char@c stored from wreg
	movwf	(uart_send_char@c)^080h
	line	24
	
l4234:	
;uart_dbg.c: 24: while(TRMT1 == 0);
	
l686:	
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3113/8)^0180h,(3113)&7	;volatile
	goto	u4761
	goto	u4760
u4761:
	goto	l686
u4760:
	line	25
	
l4236:	
;uart_dbg.c: 25: TXREG1 = c;
	bcf	status, 6	;RP1=0, select bank1
	movf	(uart_send_char@c)^080h,w
	bsf	status, 6	;RP1=1, select bank3
	movwf	(391)^0180h	;volatile
	line	26
	
l689:	
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
	
l4264:	
	movf	((___lwmod@divisor)^080h),w
iorwf	((___lwmod@divisor+1)^080h),w
	btfsc	status,2
	goto	u4811
	goto	u4810
u4811:
	goto	l4280
u4810:
	line	14
	
l4266:	
	clrf	(___lwmod@counter)^080h
	incf	(___lwmod@counter)^080h,f
	line	15
	goto	l4270
	line	16
	
l4268:	
	clrc
	rlf	(___lwmod@divisor)^080h,f
	rlf	(___lwmod@divisor+1)^080h,f
	line	17
	incf	(___lwmod@counter)^080h,f
	line	15
	
l4270:	
	btfss	(___lwmod@divisor+1)^080h,(15)&7
	goto	u4821
	goto	u4820
u4821:
	goto	l4268
u4820:
	line	20
	
l4272:	
	movf	(___lwmod@divisor+1)^080h,w
	subwf	(___lwmod@dividend+1)^080h,w
	skipz
	goto	u4835
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,w
u4835:
	skipc
	goto	u4831
	goto	u4830
u4831:
	goto	l4276
u4830:
	line	21
	
l4274:	
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,f
	movf	(___lwmod@divisor+1)^080h,w
	skipc
	decf	(___lwmod@dividend+1)^080h,f
	subwf	(___lwmod@dividend+1)^080h,f
	line	22
	
l4276:	
	clrc
	rrf	(___lwmod@divisor+1)^080h,f
	rrf	(___lwmod@divisor)^080h,f
	line	23
	
l4278:	
	decfsz	(___lwmod@counter)^080h,f
	goto	u4841
	goto	u4840
u4841:
	goto	l4272
u4840:
	line	25
	
l4280:	
	movf	(___lwmod@dividend+1)^080h,w
	movwf	(?___lwmod+1)^080h
	movf	(___lwmod@dividend)^080h,w
	movwf	(?___lwmod)^080h
	line	26
	
l1097:	
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
	
l4238:	
	clrf	(___lwdiv@quotient)^080h
	clrf	(___lwdiv@quotient+1)^080h
	line	15
	
l4240:	
	movf	((___lwdiv@divisor)^080h),w
iorwf	((___lwdiv@divisor+1)^080h),w
	btfsc	status,2
	goto	u4771
	goto	u4770
u4771:
	goto	l4260
u4770:
	line	16
	
l4242:	
	clrf	(___lwdiv@counter)^080h
	incf	(___lwdiv@counter)^080h,f
	line	17
	goto	l4246
	line	18
	
l4244:	
	clrc
	rlf	(___lwdiv@divisor)^080h,f
	rlf	(___lwdiv@divisor+1)^080h,f
	line	19
	incf	(___lwdiv@counter)^080h,f
	line	17
	
l4246:	
	btfss	(___lwdiv@divisor+1)^080h,(15)&7
	goto	u4781
	goto	u4780
u4781:
	goto	l4244
u4780:
	line	22
	
l4248:	
	clrc
	rlf	(___lwdiv@quotient)^080h,f
	rlf	(___lwdiv@quotient+1)^080h,f
	line	23
	
l4250:	
	movf	(___lwdiv@divisor+1)^080h,w
	subwf	(___lwdiv@dividend+1)^080h,w
	skipz
	goto	u4795
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,w
u4795:
	skipc
	goto	u4791
	goto	u4790
u4791:
	goto	l4256
u4790:
	line	24
	
l4252:	
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,f
	movf	(___lwdiv@divisor+1)^080h,w
	skipc
	decf	(___lwdiv@dividend+1)^080h,f
	subwf	(___lwdiv@dividend+1)^080h,f
	line	25
	
l4254:	
	bsf	(___lwdiv@quotient)^080h+(0/8),(0)&7
	line	27
	
l4256:	
	clrc
	rrf	(___lwdiv@divisor+1)^080h,f
	rrf	(___lwdiv@divisor)^080h,f
	line	28
	
l4258:	
	decfsz	(___lwdiv@counter)^080h,f
	goto	u4801
	goto	u4800
u4801:
	goto	l4248
u4800:
	line	30
	
l4260:	
	movf	(___lwdiv@quotient+1)^080h,w
	movwf	(?___lwdiv+1)^080h
	movf	(___lwdiv@quotient)^080h,w
	movwf	(?___lwdiv)^080h
	line	31
	
l1087:	
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
	
l4320:	
	clrf	(___bmul@product)^080h
	line	43
	
l4322:	
	btfss	(___bmul@multiplier)^080h,(0)&7
	goto	u4891
	goto	u4890
u4891:
	goto	l4326
u4890:
	line	44
	
l4324:	
	movf	(___bmul@multiplicand)^080h,w
	addwf	(___bmul@product)^080h,f
	line	45
	
l4326:	
	clrc
	rlf	(___bmul@multiplicand)^080h,f
	line	46
	
l4328:	
	clrc
	rrf	(___bmul@multiplier)^080h,f
	line	47
	movf	((___bmul@multiplier)^080h),w
	btfss	status,2
	goto	u4901
	goto	u4900
u4901:
	goto	l4322
u4900:
	line	50
	
l4330:	
	movf	(___bmul@product)^080h,w
	line	51
	
l768:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_Interrupt_Isr

;; *************** function _Interrupt_Isr *****************
;; Defined at:
;;		line 258 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
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
	line	258
global __ptext9
__ptext9:	;psect for function _Interrupt_Isr
psect	text9
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
	line	258
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
	line	263
	
i1l5028:	
;main.c: 263: if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u598_21
	goto	u598_20
u598_21:
	goto	i1l402
u598_20:
	line	265
	
i1l5030:	
;main.c: 264: {
;main.c: 265: TMR0 += 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	addwf	(129)^080h,f	;volatile
	line	266
	
i1l5032:	
;main.c: 267: g_timerTick++;
	bcf	(90/8),(90)&7	;volatile
	line	268
# 268 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\main.c"
clrwdt ;# 
psect	text9
	line	274
	
i1l5034:	
;main.c: 274: g_pwmCounter++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(_g_pwmCounter),f	;volatile
	line	275
;main.c: 275: if(g_pwmCounter >= 32)
	movlw	low(020h)
	subwf	(_g_pwmCounter),w	;volatile
	skipc
	goto	u599_21
	goto	u599_20
u599_21:
	goto	i1l5038
u599_20:
	line	276
	
i1l5036:	
;main.c: 276: g_pwmCounter = 0;
	clrf	(_g_pwmCounter)	;volatile
	line	277
	
i1l5038:	
;main.c: 277: RB7 = (g_pwmCounter < g_pwmDuty) ? 1 : 0;
	movf	(_g_pwmDuty),w	;volatile
	subwf	(_g_pwmCounter),w	;volatile
	skipc
	goto	u600_21
	goto	u600_20
	
u600_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7	;volatile
	goto	u601_24
u600_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7	;volatile
u601_24:
	line	280
	
i1l5040:	
;main.c: 280: if(g_powerOnPhase < 2)
	movlw	low(02h)
	subwf	(_g_powerOnPhase),w
	skipnc
	goto	u602_21
	goto	u602_20
u602_21:
	goto	i1l5104
u602_20:
	line	282
	
i1l5042:	
;main.c: 281: {
;main.c: 282: PowerOnLedSequence();
	fcall	_PowerOnLedSequence
	line	283
;main.c: 283: }
	goto	i1l402
	line	292
	
i1l5044:	
;main.c: 291: (((g_scanIndex) < 6) ? &g_slot0[(g_scanIndex)] : &g_slot1[(g_scanIndex)-6])->voltage =
;main.c: 292: ADC_ReadChannel(s_adcChannels[g_scanIndex]);
	movlw	low(06h)
	subwf	(_g_scanIndex),w
	skipc
	goto	u603_21
	goto	u603_20
u603_21:
	goto	i1l5048
u603_20:
	
i1l5046:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$361)
	goto	i1l5050
	
i1l5048:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(_g_scanIndex),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Interrupt_Isr$361)
	
i1l5050:	
	movf	(_g_scanIndex),w
	addlw	low((((_s_adcChannels)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	fcall	_ADC_ReadChannel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Interrupt_Isr$361),w
	addlw	03h
	movwf	fsr0
	movf	(0+(?_ADC_ReadChannel)),w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_ADC_ReadChannel)),w
	movwf	indf
	line	293
	
i1l5052:	
;main.c: 293: g_scanPhase = 1;
	clrf	(_g_scanPhase)
	incf	(_g_scanPhase),f
	line	294
;main.c: 294: break;
	goto	i1l402
	line	300
	
i1l5054:	
;main.c: 300: ChargeProcess_Slot(g_scanIndex);
	movf	(_g_scanIndex),w
	fcall	_ChargeProcess_Slot
	line	301
;main.c: 301: Update_LED_Slot(g_scanIndex);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_scanIndex),w
	fcall	_Update_LED_Slot
	line	302
	
i1l5056:	
;main.c: 302: g_scanPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_scanPhase)
	line	303
;main.c: 303: break;
	goto	i1l402
	line	313
	
i1l5058:	
;main.c: 313: if(g_scanIndex == 0)
	movf	((_g_scanIndex)),w
	btfss	status,2
	goto	u604_21
	goto	u604_20
u604_21:
	goto	i1l5074
u604_20:
	line	316
	
i1l5060:	
;main.c: 314: {
;main.c: 316: ANSEL2 |= 0x20;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(265)^0100h+(5/8),(5)&7	;volatile
	line	317
;main.c: 317: TRISC |= 0x20;
	bsf	(261)^0100h+(5/8),(5)&7	;volatile
	line	318
	
i1l5062:	
;main.c: 318: Read_Temperature();
	fcall	_Read_Temperature
	line	320
	
i1l5064:	
;main.c: 320: ANSEL2 &= ~0x20;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(265)^0100h+(5/8),(5)&7	;volatile
	line	321
	
i1l5066:	
;main.c: 321: TRISC &= ~0x20;
	bcf	(261)^0100h+(5/8),(5)&7	;volatile
	line	324
	
i1l5068:	
;main.c: 324: Led_BlinkProcess();
	fcall	_Led_BlinkProcess
	line	326
	
i1l5070:	
;main.c: 326: Charging_Control();
	fcall	_Charging_Control
	line	328
	
i1l5072:	
;main.c: 328: CCCV_Control();
	fcall	_CCCV_Control
	line	332
	
i1l5074:	
;main.c: 329: }
;main.c: 332: g_scanIndex++;
	incf	(_g_scanIndex),f
	line	333
	
i1l5076:	
;main.c: 333: if(g_scanIndex >= 12)
	movlw	low(0Ch)
	subwf	(_g_scanIndex),w
	skipc
	goto	u605_21
	goto	u605_20
u605_21:
	goto	i1l5082
u605_20:
	line	335
	
i1l5078:	
;main.c: 334: {
;main.c: 335: g_scanIndex = 0;
	clrf	(_g_scanIndex)
	line	336
	
i1l5080:	
;main.c: 336: g_systemTick++;
	incf	(_g_systemTick),f
	skipnz
	incf	(_g_systemTick+1),f
	line	338
	
i1l5082:	
;main.c: 337: }
;main.c: 338: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	342
	
i1l5084:	
;main.c: 342: if(g_systemTick >= 222)
	movlw	0
	subwf	(_g_systemTick+1),w
	movlw	0DEh
	skipnz
	subwf	(_g_systemTick),w
	skipc
	goto	u606_21
	goto	u606_20
u606_21:
	goto	i1l386
u606_20:
	line	344
	
i1l5086:	
;main.c: 343: {
;main.c: 344: g_systemTick = 0;
	clrf	(_g_systemTick)
	clrf	(_g_systemTick+1)
	line	347
	
i1l5088:	
;main.c: 347: test_adc = ADC_Sample(31, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	348
	
i1l5090:	
;main.c: 348: if(0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u607_21
	goto	u607_20
u607_21:
	goto	i1l5096
u607_20:
	line	352
	
i1l5092:	
;main.c: 349: {
;main.c: 350: volatile unsigned long power_temp;
;main.c: 352: power_temp = (unsigned long)(((4096UL*1.2*1000))/adresult);
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

	line	353
	
i1l5094:	
;main.c: 353: power_ad = (unsigned int)(power_temp);
	movf	(Interrupt_Isr@power_temp+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_power_ad+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(Interrupt_Isr@power_temp),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_power_ad)^080h	;volatile
	line	354
;main.c: 354: }
	goto	i1l5098
	line	358
	
i1l5096:	
;main.c: 355: else
;main.c: 356: {
;main.c: 358: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	359
;main.c: 359: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	364
	
i1l5098:	
;main.c: 360: }
;main.c: 364: g_printFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_g_printFlag/8),(_g_printFlag)&7	;volatile
	goto	i1l402
	line	370
	
i1l5100:	
;main.c: 370: g_scanPhase = 0;
	clrf	(_g_scanPhase)
	line	371
;main.c: 371: break;
	goto	i1l402
	line	287
	
i1l5104:	
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
	goto	i1l5044
	xorlw	1^0	; case 1
	skipnz
	goto	i1l5054
	xorlw	2^1	; case 2
	skipnz
	goto	i1l5058
	goto	i1l5100
	opt asmopt_pop

	line	373
	
i1l386:	
	line	377
	
i1l402:	
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
	
i1l5016:	
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
	
i1l1102:	
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
	
i1l4976:	
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
	goto	u589_21
	goto	u589_20
u589_21:
	goto	i1l4980
u589_20:
	line	50
	
i1l4978:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	i1l993
	line	51
	
i1l4980:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u590_25:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u590_20:
	addlw	-1
	skipz
	goto	u590_25
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
i1l4982:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
i1l4984:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
i1l4986:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
i1l4988:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
i1l4990:	
	btfss	(___fttol@exp1),7
	goto	u591_21
	goto	u591_20
u591_21:
	goto	i1l5000
u591_20:
	line	57
	
i1l4992:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u592_21
	goto	u592_20
u592_21:
	goto	i1l4996
u592_20:
	goto	i1l4978
	line	60
	
i1l4996:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
i1l4998:	
	incfsz	(___fttol@exp1),f
	goto	u593_21
	goto	u593_20
u593_21:
	goto	i1l4996
u593_20:
	goto	i1l5008
	line	63
	
i1l5000:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u594_21
	goto	u594_20
u594_21:
	goto	i1l5006
u594_20:
	goto	i1l4978
	line	66
	
i1l5004:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	65
	
i1l5006:	
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u595_21
	goto	u595_20
u595_21:
	goto	i1l5004
u595_20:
	line	70
	
i1l5008:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u596_21
	goto	u596_20
u596_21:
	goto	i1l5012
u596_20:
	line	71
	
i1l5010:	
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
	
i1l5012:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
i1l993:	
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
	
i1l4936:	
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
	goto	u585_21
	goto	u585_20
u585_21:
	goto	i1l4940
u585_20:
	line	64
	
i1l4938:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l957
	line	65
	
i1l4940:	
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
	goto	u586_21
	goto	u586_20
u586_21:
	goto	i1l958
u586_20:
	line	66
	
i1l4942:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	i1l957
	
i1l958:	
	line	67
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	68
	
i1l4944:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
i1l4946:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(___ftdiv@sign)
	line	70
	
i1l4948:	
	movf	0+(___ftdiv@f2)+02h,w
	xorwf	(___ftdiv@sign),f
	line	71
	
i1l4950:	
	movlw	low(080h)
	andwf	(___ftdiv@sign),f
	line	72
	
i1l4952:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
i1l4954:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
i1l4956:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
i1l4958:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
i1l4960:	
	movlw	low(018h)
	movwf	(___ftdiv@cntr)
	line	78
	
i1l4962:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u587_25
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u587_25
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u587_25:
	skipc
	goto	u587_21
	goto	u587_20
u587_21:
	goto	i1l4968
u587_20:
	line	80
	
i1l4964:	
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
	
i1l4966:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
i1l4968:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	84
	
i1l4970:	
	decfsz	(___ftdiv@cntr),f
	goto	u588_21
	goto	u588_20
u588_21:
	goto	i1l4962
u588_20:
	line	85
	
i1l4972:	
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
	
i1l957:	
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
	
i1l4334:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u491_21
	goto	u491_20
u491_21:
	goto	i1l904
u491_20:
	
i1l4336:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u492_21
	goto	u492_20
u492_21:
	goto	i1l4340
u492_20:
	
i1l904:	
	line	65
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	i1l905
	line	67
	
i1l4338:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
i1l4340:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u493_21
	goto	u493_20
u493_21:
	goto	i1l4338
u493_20:
	goto	i1l4344
	line	71
	
i1l4342:	
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
	
i1l4344:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u494_21
	goto	u494_20
u494_21:
	goto	i1l4342
u494_20:
	goto	i1l4348
	line	76
	
i1l4346:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
i1l4348:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u495_21
	goto	u495_20
u495_21:
	goto	i1l916
u495_20:
	
i1l4350:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u496_21
	goto	u496_20
u496_21:
	goto	i1l4346
u496_20:
	
i1l916:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u497_21
	goto	u497_20
u497_21:
	goto	i1l917
u497_20:
	line	80
	
i1l4352:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
i1l917:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
i1l4354:	
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
	goto	u498_21
	goto	u498_20
u498_21:
	goto	i1l918
u498_20:
	line	84
	
i1l4356:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
i1l918:	
	line	85
	line	86
	
i1l905:	
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
	
i1l4716:	
;led.c: 32: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(Update_LED_Slot@idx),w
	skipc
	goto	u544_21
	goto	u544_20
u544_21:
	goto	i1l4720
u544_20:
	
i1l4718:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l4734
	
i1l4720:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Update_LED_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(Update_LED_Slot@p)
	goto	i1l4734
	line	37
	
i1l4722:	
;led.c: 37: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	38
;led.c: 38: break;
	goto	i1l648
	line	42
	
i1l643:	
	line	44
	
i1l4724:	
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
	goto	i1l648
	line	47
	
i1l4726:	
;led.c: 47: p->ledState = 2;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	48
;led.c: 48: break;
	goto	i1l648
	line	50
	
i1l4728:	
;led.c: 50: p->ledState = 3;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	51
;led.c: 51: break;
	goto	i1l648
	line	53
	
i1l4730:	
;led.c: 53: p->ledState = 0;
	movf	(Update_LED_Slot@p),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	line	54
;led.c: 54: break;
	goto	i1l648
	line	34
	
i1l4734:	
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
	goto	i1l4722
	xorlw	1^0	; case 1
	skipnz
	goto	i1l643
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4724
	xorlw	3^2	; case 3
	skipnz
	goto	i1l4724
	xorlw	4^3	; case 4
	skipnz
	goto	i1l4724
	xorlw	5^4	; case 5
	skipnz
	goto	i1l4724
	xorlw	6^5	; case 6
	skipnz
	goto	i1l4726
	xorlw	7^6	; case 7
	skipnz
	goto	i1l4728
	goto	i1l4730
	opt asmopt_pop

	line	56
	
i1l648:	
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
	
i1l3016:	
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
	
i1l3018:	
	line	38
	
i1l3020:	
;charge_mgr.c: 38: if(ntcVal == 0 || ntcVal >= 4095)
	movf	((Read_Temperature@ntcVal)),w
iorwf	((Read_Temperature@ntcVal+1)),w
	btfsc	status,2
	goto	u277_21
	goto	u277_20
u277_21:
	goto	i1l445
u277_20:
	
i1l3022:	
	movlw	0Fh
	subwf	(Read_Temperature@ntcVal+1),w
	movlw	0FFh
	skipnz
	subwf	(Read_Temperature@ntcVal),w
	skipc
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l3024
u278_20:
	goto	i1l445
	line	42
	
i1l3024:	
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
	goto	u279_25
	goto	u279_26
u279_25:
	subwf	(___lldiv@divisor+1),f
u279_26:
	movf	2+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	2+(??_Read_Temperature+0)+0,w
	goto	u279_27
	goto	u279_28
u279_27:
	subwf	(___lldiv@divisor+2),f
u279_28:
	movf	3+(??_Read_Temperature+0)+0,w
	skipc
	incfsz	3+(??_Read_Temperature+0)+0,w
	goto	u279_29
	goto	u279_20
u279_29:
	subwf	(___lldiv@divisor+3),f
u279_20:

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
	
i1l3026:	
;charge_mgr.c: 47: if(ntcR > 32950) temp = 10;
	movlw	080h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0B7h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l3030
u280_20:
	
i1l3028:	
	movlw	low(0Ah)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	48
	
i1l3030:	
;charge_mgr.c: 48: else if(ntcR > 27330) temp = 15;
	movlw	06Ah
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0C3h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l3034
u281_20:
	
i1l3032:	
	movlw	low(0Fh)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	49
	
i1l3034:	
;charge_mgr.c: 49: else if(ntcR > 22060) temp = 20;
	movlw	056h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	02Dh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l3038
u282_20:
	
i1l3036:	
	movlw	low(014h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	50
	
i1l3038:	
;charge_mgr.c: 50: else if(ntcR > 17950) temp = 25;
	movlw	046h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	01Fh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l3042
u283_20:
	
i1l3040:	
	movlw	low(019h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	51
	
i1l3042:	
;charge_mgr.c: 51: else if(ntcR > 14710) temp = 30;
	movlw	039h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	077h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l3046
u284_20:
	
i1l3044:	
	movlw	low(01Eh)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	52
	
i1l3046:	
;charge_mgr.c: 52: else if(ntcR > 12120) temp = 35;
	movlw	02Fh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	059h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l3050
u285_20:
	
i1l3048:	
	movlw	low(023h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	53
	
i1l3050:	
;charge_mgr.c: 53: else if(ntcR > 10000) temp = 40;
	movlw	027h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	011h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u286_21
	goto	u286_20
u286_21:
	goto	i1l3054
u286_20:
	
i1l3052:	
	movlw	low(028h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	54
	
i1l3054:	
;charge_mgr.c: 54: else if(ntcR > 8330) temp = 45;
	movlw	020h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	08Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u287_21
	goto	u287_20
u287_21:
	goto	i1l3058
u287_20:
	
i1l3056:	
	movlw	low(02Dh)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	55
	
i1l3058:	
;charge_mgr.c: 55: else if(ntcR > 6970) temp = 50;
	movlw	01Bh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	03Bh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l3062
u288_20:
	
i1l3060:	
	movlw	low(032h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	56
	
i1l3062:	
;charge_mgr.c: 56: else if(ntcR > 5860) temp = 55;
	movlw	016h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0E5h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u289_21
	goto	u289_20
u289_21:
	goto	i1l3066
u289_20:
	
i1l3064:	
	movlw	low(037h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	57
	
i1l3066:	
;charge_mgr.c: 57: else if(ntcR > 4950) temp = 60;
	movlw	013h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	057h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l3070
u290_20:
	
i1l3068:	
	movlw	low(03Ch)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	58
	
i1l3070:	
;charge_mgr.c: 58: else if(ntcR > 4200) temp = 65;
	movlw	010h
	subwf	(Read_Temperature@ntcR+1),w
	movlw	069h
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l3074
u291_20:
	
i1l3072:	
	movlw	low(041h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	59
	
i1l3074:	
;charge_mgr.c: 59: else if(ntcR > 3580) temp = 70;
	movlw	0Dh
	subwf	(Read_Temperature@ntcR+1),w
	movlw	0FDh
	skipnz
	subwf	(Read_Temperature@ntcR),w
	skipc
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l3078
u292_20:
	
i1l3076:	
	movlw	low(046h)
	movwf	(Read_Temperature@temp)
	goto	i1l447
	line	60
	
i1l3078:	
;charge_mgr.c: 60: else temp = 75;
	movlw	low(04Bh)
	movwf	(Read_Temperature@temp)
	
i1l447:	
	line	62
;charge_mgr.c: 62: g_temperature = temp;
	movf	(Read_Temperature@temp),w
	movwf	(_g_temperature)
	line	65
;charge_mgr.c: 65: if(temp >= 60)
	movlw	low(03Ch)
	subwf	(Read_Temperature@temp),w
	skipc
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l3082
u293_20:
	line	66
	
i1l3080:	
;charge_mgr.c: 66: g_tempProtect = 1;
	clrf	(_g_tempProtect)
	incf	(_g_tempProtect),f
	goto	i1l445
	line	67
	
i1l3082:	
;charge_mgr.c: 67: else if(temp <= 50)
	movlw	low(033h)
	subwf	(Read_Temperature@temp),w
	skipnc
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l445
u294_20:
	line	68
	
i1l3084:	
;charge_mgr.c: 68: g_tempProtect = 0;
	clrf	(_g_tempProtect)
	line	71
	
i1l445:	
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
	
i1l2504:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
i1l759:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l2508
u209_20:
	line	122
	
i1l2506:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u210_21
	addwf	(___lmul@product+1),f
u210_21:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u210_22
	addwf	(___lmul@product+2),f
u210_22:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u210_23
	addwf	(___lmul@product+3),f
u210_23:

	line	123
	
i1l2508:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
i1l2510:	
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
	goto	u211_21
	goto	u211_20
u211_21:
	goto	i1l759
u211_20:
	line	128
	
i1l2512:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
i1l762:	
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
	
i1l2574:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
i1l2576:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u221_21
	goto	u221_20
u221_21:
	goto	i1l2596
u221_20:
	line	16
	
i1l2578:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	i1l2582
	line	18
	
i1l2580:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
i1l2582:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l2580
u222_20:
	line	22
	
i1l2584:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
i1l2586:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u223_25
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u223_25
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u223_25
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u223_25:
	skipc
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l2592
u223_20:
	line	24
	
i1l2588:	
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
	
i1l2590:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
i1l2592:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
i1l2594:	
	decfsz	(___lldiv@counter),f
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l2584
u224_20:
	line	30
	
i1l2596:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
i1l1034:	
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
	
i1l2420:	
;adc_drv.c: 133: test_adc = ADC_Sample(ch, 7);
	movlw	low(07h)
	movwf	(ADC_Sample@adldo)
	movf	(ADC_ReadChannel@ch),w
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	134
	
i1l2422:	
;adc_drv.c: 134: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u197_21
	goto	u197_20
u197_21:
	goto	i1l2428
u197_20:
	line	135
	
i1l2424:	
;adc_drv.c: 135: return adresult;
	movf	(_adresult+1),w	;volatile
	movwf	(?_ADC_ReadChannel+1)
	movf	(_adresult),w	;volatile
	movwf	(?_ADC_ReadChannel)
	goto	i1l433
	line	138
	
i1l2428:	
;adc_drv.c: 138: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	139
;adc_drv.c: 139: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	140
	
i1l2430:	
;adc_drv.c: 140: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_ReadChannel+0)+0),f
	u609_27:
decfsz	(??_ADC_ReadChannel+0)+0,f
	goto	u609_27
opt asmopt_pop

	line	141
	
i1l2432:	
;adc_drv.c: 141: return 0;
	clrf	(?_ADC_ReadChannel)
	clrf	(?_ADC_ReadChannel+1)
	line	142
	
i1l433:	
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
	
i1l2292:	
;adc_drv.c: 45: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	46
	
i1l2294:	
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
	
i1l2296:	
;adc_drv.c: 51: if ((!LDO_EN) && (adldo & 0x04))
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l2302
u172_20:
	
i1l2298:	
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l2302
u173_20:
	line	53
	
i1l2300:	
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
	u610_27:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u610_27
opt asmopt_pop

	line	55
;adc_drv.c: 55: }
	goto	i1l2304
	line	57
	
i1l2302:	
;adc_drv.c: 56: else
;adc_drv.c: 57: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	60
	
i1l2304:	
;adc_drv.c: 60: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u174_21
	goto	u174_20
u174_21:
	goto	i1l414
u174_20:
	line	62
	
i1l2306:	
;adc_drv.c: 61: {
;adc_drv.c: 62: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	63
	
i1l2308:	
;adc_drv.c: 63: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	64
;adc_drv.c: 64: }
	goto	i1l2310
	line	65
	
i1l414:	
	line	66
;adc_drv.c: 65: else
;adc_drv.c: 66: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	68
	
i1l2310:	
;adc_drv.c: 68: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	70
;adc_drv.c: 70: for (i = 0; i < 10; i++)
	clrf	(ADC_Sample@i)
	line	73
	
i1l2316:	
;adc_drv.c: 71: {
;adc_drv.c: 73: ADCON0 = (unsigned char)(0X41 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u175_25:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u175_25
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
	
i1l2318:	
;adc_drv.c: 78: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	81
	
i1l2320:	
;adc_drv.c: 81: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	82
;adc_drv.c: 82: while (GODONE)
	goto	i1l418
	
i1l419:	
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
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l418
u176_20:
	line	86
	
i1l2322:	
;adc_drv.c: 86: return 0;
	movlw	low(0)
	goto	i1l421
	line	87
	
i1l418:	
	line	82
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l419
u177_20:
	line	90
	
i1l2326:	
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
	
i1l2328:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	93
	
i1l2330:	
;adc_drv.c: 93: if (0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l2334
u178_20:
	line	95
	
i1l2332:	
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
	goto	i1l424
	line	99
	
i1l2334:	
;adc_drv.c: 99: else if (ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u179_25
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u179_25:
	skipnc
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l2338
u179_20:
	line	100
	
i1l2336:	
;adc_drv.c: 100: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	i1l424
	line	102
	
i1l2338:	
;adc_drv.c: 102: else if (ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u180_25
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u180_25:
	skipnc
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l424
u180_20:
	line	103
	
i1l2340:	
;adc_drv.c: 103: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	105
	
i1l424:	
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
	goto	u181_21
	addwf	(ADC_Sample@adsum+1),f	;volatile
u181_21:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u181_22
	addwf	(ADC_Sample@adsum+2),f	;volatile
u181_22:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u181_23
	addwf	(ADC_Sample@adsum+3),f	;volatile
u181_23:

	line	70
	
i1l2342:	
	incf	(ADC_Sample@i),f
	
i1l2344:	
	movlw	low(0Ah)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l2316
u182_20:
	line	109
	
i1l2346:	
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
	goto	u183_25
	goto	u183_26
u183_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u183_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u183_27
	goto	u183_28
u183_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u183_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u183_29
	goto	u183_20
u183_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u183_20:

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
	goto	u184_25
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u184_25
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u184_25
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u184_25:
	skipc
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l428
u184_20:
	line	111
	
i1l2348:	
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
	goto	u185_25
	goto	u185_26
u185_25:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u185_26:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u185_27
	goto	u185_28
u185_27:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u185_28:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u185_29
	goto	u185_20
u185_29:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u185_20:

	goto	i1l2350
	line	112
	
i1l428:	
	line	113
;adc_drv.c: 112: else
;adc_drv.c: 113: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	115
	
i1l2350:	
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
u186_25:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u186_20:
	addlw	-1
	skipz
	goto	u186_25
	movf	1+(??_ADC_Sample+0)+0,w
	movwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)	;volatile
	line	118
	
i1l2352:	
;adc_drv.c: 118: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	119
	
i1l2354:	
;adc_drv.c: 119: admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	120
	
i1l2356:	
;adc_drv.c: 120: admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	121
	
i1l2358:	
;adc_drv.c: 121: return 0xA5;
	movlw	low(0A5h)
	line	122
	
i1l421:	
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
	
i1l2838:	
;led.c: 97: g_powerOnTimer++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_g_powerOnTimer)^080h,f
	skipnz
	incf	(_g_powerOnTimer+1)^080h,f
	line	99
	
i1l2840:	
;led.c: 99: if(g_powerOnPhase == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l2850
u249_20:
	line	102
	
i1l2842:	
;led.c: 100: {
;led.c: 102: RC5 = 1;
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	line	103
;led.c: 103: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	104
	
i1l2844:	
;led.c: 104: if(g_powerOnTimer >= 222)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0DEh
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l683
u250_20:
	line	106
	
i1l2846:	
;led.c: 105: {
;led.c: 106: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	107
	
i1l2848:	
;led.c: 107: g_powerOnPhase = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_g_powerOnPhase)
	incf	(_g_powerOnPhase),f
	goto	i1l683
	line	110
	
i1l2850:	
;led.c: 110: else if(g_powerOnPhase == 1)
		decf	((_g_powerOnPhase)),w
	btfss	status,2
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l683
u251_20:
	line	113
	
i1l2852:	
;led.c: 111: {
;led.c: 113: if(g_powerOnTimer >= 222)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_g_powerOnTimer+1)^080h,w
	movlw	0DEh
	skipnz
	subwf	(_g_powerOnTimer)^080h,w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l683
u252_20:
	line	115
	
i1l2854:	
;led.c: 114: {
;led.c: 115: g_powerOnTimer = 0;
	clrf	(_g_powerOnTimer)^080h
	clrf	(_g_powerOnTimer+1)^080h
	line	116
	
i1l2856:	
;led.c: 116: g_powerOnPhase = 2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_g_powerOnPhase)
	line	117
	
i1l2858:	
;led.c: 117: RC5 = 0;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	118
	
i1l2860:	
;led.c: 118: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	122
	
i1l683:	
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
	
i1l4736:	
;led.c: 68: unsigned char i;
;led.c: 69: for(i = 0; i < 12; i++)
	clrf	(Led_BlinkProcess@i)
	line	72
	
i1l4742:	
;led.c: 70: {
;led.c: 72: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->ledState == 3)
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u545_21
	goto	u545_20
u545_21:
	goto	i1l4746
u545_20:
	
i1l4744:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$487)
	goto	i1l4748
	
i1l4746:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$487)
	
i1l4748:	
	movf	(_Led_BlinkProcess$487),w
	addlw	02h
	movwf	fsr0
		movlw	3
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfss	status,2
	goto	u546_21
	goto	u546_20
u546_21:
	goto	i1l4782
u546_20:
	line	74
	
i1l4750:	
;led.c: 73: {
;led.c: 74: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer++;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u547_21
	goto	u547_20
u547_21:
	goto	i1l4754
u547_20:
	
i1l4752:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$498)
	goto	i1l4756
	
i1l4754:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$498)
	
i1l4756:	
	movf	(_Led_BlinkProcess$498),w
	addlw	07h
	movwf	fsr0
	movlw	01h
	bsf	status, 7	;select IRP bank2
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	76
	
i1l4758:	
;led.c: 76: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer >= (222 / 2))
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u548_21
	goto	u548_20
u548_21:
	goto	i1l4762
u548_20:
	
i1l4760:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$509)
	goto	i1l4764
	
i1l4762:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$509)
	
i1l4764:	
	movf	(_Led_BlinkProcess$509),w
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
	goto	u549_21
	goto	u549_20
u549_21:
	goto	i1l4782
u549_20:
	line	78
	
i1l4766:	
;led.c: 77: {
;led.c: 78: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkTimer = 0;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u550_21
	goto	u550_20
u550_21:
	goto	i1l4770
u550_20:
	
i1l4768:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$520)
	goto	i1l4772
	
i1l4770:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$520)
	
i1l4772:	
	movf	(_Led_BlinkProcess$520),w
	addlw	07h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	79
	
i1l4774:	
;led.c: 79: (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->blinkPhase ^= 1;
	movlw	low(06h)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u551_21
	goto	u551_20
u551_21:
	goto	i1l4778
u551_20:
	
i1l4776:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Led_BlinkProcess$531)
	goto	i1l4780
	
i1l4778:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Led_BlinkProcess@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Led_BlinkProcess$531)
	
i1l4780:	
	movf	(_Led_BlinkProcess$531),w
	addlw	09h
	movwf	fsr0
	movlw	low(01h)
	bsf	status, 7	;select IRP bank2
	xorwf	indf,f
	line	69
	
i1l4782:	
	incf	(Led_BlinkProcess@i),f
	
i1l4784:	
	movlw	low(0Ch)
	subwf	(Led_BlinkProcess@i),w
	skipc
	goto	u552_21
	goto	u552_20
u552_21:
	goto	i1l4742
u552_20:
	line	83
	
i1l675:	
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
	
i1l4786:	
;charge_mgr.c: 334: unsigned char i;
;charge_mgr.c: 335: unsigned char chargeB1_6 = 0;
	clrf	(Charging_Control@chargeB1_6)
	line	336
;charge_mgr.c: 336: unsigned char chargeB7_12 = 0;
	clrf	(Charging_Control@chargeB7_12)
	line	339
	
i1l4788:	
;charge_mgr.c: 339: if(g_tempProtect)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_g_tempProtect)),w
	btfsc	status,2
	goto	u553_21
	goto	u553_20
u553_21:
	goto	i1l4794
u553_20:
	line	341
;charge_mgr.c: 340: {
;charge_mgr.c: 341: do { RA0=1; RA1=1; RB3=1; RB2=1; RA3=1; RA2=1; RD1=1; RD3=1; RB0=1; RB1=1; RD2=1; RD0=1; } while(0);
	
i1l530:	
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
	
i1l531:	
	line	342
;charge_mgr.c: 342: RC3 = 0;
	bcf	(2099/8)^0100h,(2099)&7	;volatile
	line	343
;charge_mgr.c: 343: RC2 = 0;
	bcf	(2098/8)^0100h,(2098)&7	;volatile
	line	344
	
i1l4790:	
;charge_mgr.c: 344: g_pwmDuty = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_g_pwmDuty)	;volatile
	goto	i1l532
	line	349
	
i1l4794:	
;charge_mgr.c: 346: }
;charge_mgr.c: 349: for(i = 0; i < 12; i++)
	clrf	(Charging_Control@i)
	line	351
	
i1l4800:	
;charge_mgr.c: 350: {
;charge_mgr.c: 351: unsigned char s = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state;
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipc
	goto	u554_21
	goto	u554_20
u554_21:
	goto	i1l4804
u554_20:
	
i1l4802:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(_Charging_Control$419)
	goto	i1l4806
	
i1l4804:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(Charging_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(_Charging_Control$419)
	
i1l4806:	
	incf	(_Charging_Control$419),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(Charging_Control@s)
	line	355
	
i1l4808:	
;charge_mgr.c: 355: if(i == 2)
		movlw	2
	xorwf	((Charging_Control@i)),w
	btfss	status,2
	goto	u555_21
	goto	u555_20
u555_21:
	goto	i1l4814
u555_20:
	goto	i1l4812
	line	357
	
i1l542:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l4834
	
i1l544:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l4834
	
i1l545:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	goto	i1l4834
	
i1l546:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7	;volatile
	goto	i1l4834
	
i1l547:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l4834
	
i1l548:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l4834
	
i1l549:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l4834
	
i1l550:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l4834
	
i1l551:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7	;volatile
	goto	i1l4834
	
i1l552:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7	;volatile
	goto	i1l4834
	
i1l553:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l4834
	
i1l554:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l4834
	
i1l4812:	
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
	goto	i1l542
	xorlw	1^0	; case 1
	skipnz
	goto	i1l544
	xorlw	2^1	; case 2
	skipnz
	goto	i1l545
	xorlw	3^2	; case 3
	skipnz
	goto	i1l546
	xorlw	4^3	; case 4
	skipnz
	goto	i1l547
	xorlw	5^4	; case 5
	skipnz
	goto	i1l548
	xorlw	6^5	; case 6
	skipnz
	goto	i1l549
	xorlw	7^6	; case 7
	skipnz
	goto	i1l550
	xorlw	8^7	; case 8
	skipnz
	goto	i1l551
	xorlw	9^8	; case 9
	skipnz
	goto	i1l552
	xorlw	10^9	; case 10
	skipnz
	goto	i1l553
	xorlw	11^10	; case 11
	skipnz
	goto	i1l554
	goto	i1l4834
	opt asmopt_pop

	line	364
	
i1l4814:	
;charge_mgr.c: 359: }
;charge_mgr.c: 363: if(s == 2 || s == 3 ||
;charge_mgr.c: 364: s == 4 || s == 5)
		movlw	2
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u556_21
	goto	u556_20
u556_21:
	goto	i1l4824
u556_20:
	
i1l4816:	
		movlw	3
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u557_21
	goto	u557_20
u557_21:
	goto	i1l4824
u557_20:
	
i1l4818:	
		movlw	4
	xorwf	((Charging_Control@s)),w
	btfsc	status,2
	goto	u558_21
	goto	u558_20
u558_21:
	goto	i1l4824
u558_20:
	
i1l4820:	
		movlw	5
	xorwf	((Charging_Control@s)),w
	btfss	status,2
	goto	u559_21
	goto	u559_20
u559_21:
	goto	i1l4832
u559_20:
	goto	i1l4824
	line	366
	
i1l562:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7	;volatile
	goto	i1l4826
	
i1l564:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7	;volatile
	goto	i1l4826
	
i1l565:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	goto	i1l4826
	
i1l566:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7	;volatile
	goto	i1l4826
	
i1l567:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	goto	i1l4826
	
i1l568:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1074/8)^080h,(1074)&7	;volatile
	goto	i1l4826
	
i1l569:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2105/8)^0100h,(2105)&7	;volatile
	goto	i1l4826
	
i1l570:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2107/8)^0100h,(2107)&7	;volatile
	goto	i1l4826
	
i1l571:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7	;volatile
	goto	i1l4826
	
i1l572:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7	;volatile
	goto	i1l4826
	
i1l573:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2106/8)^0100h,(2106)&7	;volatile
	goto	i1l4826
	
i1l574:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2104/8)^0100h,(2104)&7	;volatile
	goto	i1l4826
	
i1l4824:	
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
	goto	i1l562
	xorlw	1^0	; case 1
	skipnz
	goto	i1l564
	xorlw	2^1	; case 2
	skipnz
	goto	i1l565
	xorlw	3^2	; case 3
	skipnz
	goto	i1l566
	xorlw	4^3	; case 4
	skipnz
	goto	i1l567
	xorlw	5^4	; case 5
	skipnz
	goto	i1l568
	xorlw	6^5	; case 6
	skipnz
	goto	i1l569
	xorlw	7^6	; case 7
	skipnz
	goto	i1l570
	xorlw	8^7	; case 8
	skipnz
	goto	i1l571
	xorlw	9^8	; case 9
	skipnz
	goto	i1l572
	xorlw	10^9	; case 10
	skipnz
	goto	i1l573
	xorlw	11^10	; case 11
	skipnz
	goto	i1l574
	goto	i1l4826
	opt asmopt_pop

	line	369
	
i1l4826:	
;charge_mgr.c: 369: if(i < 6)
	movlw	low(06h)
	subwf	(Charging_Control@i),w
	skipnc
	goto	u560_21
	goto	u560_20
u560_21:
	goto	i1l576
u560_20:
	line	370
	
i1l4828:	
;charge_mgr.c: 370: chargeB1_6 = 1;
	clrf	(Charging_Control@chargeB1_6)
	incf	(Charging_Control@chargeB1_6),f
	goto	i1l4834
	line	371
	
i1l576:	
	line	372
;charge_mgr.c: 371: else
;charge_mgr.c: 372: chargeB7_12 = 1;
	clrf	(Charging_Control@chargeB7_12)
	incf	(Charging_Control@chargeB7_12),f
	goto	i1l4834
	line	376
	
i1l4832:	
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
	goto	i1l542
	xorlw	1^0	; case 1
	skipnz
	goto	i1l544
	xorlw	2^1	; case 2
	skipnz
	goto	i1l545
	xorlw	3^2	; case 3
	skipnz
	goto	i1l546
	xorlw	4^3	; case 4
	skipnz
	goto	i1l547
	xorlw	5^4	; case 5
	skipnz
	goto	i1l548
	xorlw	6^5	; case 6
	skipnz
	goto	i1l549
	xorlw	7^6	; case 7
	skipnz
	goto	i1l550
	xorlw	8^7	; case 8
	skipnz
	goto	i1l551
	xorlw	9^8	; case 9
	skipnz
	goto	i1l552
	xorlw	10^9	; case 10
	skipnz
	goto	i1l553
	xorlw	11^10	; case 11
	skipnz
	goto	i1l554
	goto	i1l4834
	opt asmopt_pop

	line	349
	
i1l4834:	
	incf	(Charging_Control@i),f
	
i1l4836:	
	movlw	low(0Ch)
	subwf	(Charging_Control@i),w
	skipc
	goto	u561_21
	goto	u561_20
u561_21:
	goto	i1l4800
u561_20:
	
i1l534:	
	line	381
;charge_mgr.c: 377: }
;charge_mgr.c: 378: }
;charge_mgr.c: 381: RC3 = chargeB1_6;
	btfsc	(Charging_Control@chargeB1_6),0
	goto	u562_21
	goto	u562_20
	
u562_21:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2099/8)^0100h,(2099)&7	;volatile
	goto	u563_24
u562_20:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2099/8)^0100h,(2099)&7	;volatile
u563_24:
	line	382
;charge_mgr.c: 382: RC2 = chargeB7_12;
	btfsc	(Charging_Control@chargeB7_12),0
	goto	u564_21
	goto	u564_20
	
u564_21:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2098/8)^0100h,(2098)&7	;volatile
	goto	u565_24
u564_20:
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2098/8)^0100h,(2098)&7	;volatile
u565_24:
	line	385
	
i1l532:	
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
	
i1l4582:	
;charge_mgr.c: 144: BatterySlot_t *p = (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6]);
	movlw	low(06h)
	subwf	(ChargeProcess_Slot@idx),w
	skipc
	goto	u521_21
	goto	u521_20
u521_21:
	goto	i1l4586
u521_20:
	
i1l4584:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	movwf	(ChargeProcess_Slot@p)
	goto	i1l4588
	
i1l4586:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(ChargeProcess_Slot@idx),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	movwf	(ChargeProcess_Slot@p)
	line	148
	
i1l4588:	
;charge_mgr.c: 148: if(idx == 2)
		movlw	2
	xorwf	((ChargeProcess_Slot@idx)),w
	btfss	status,2
	goto	u522_21
	goto	u522_20
u522_21:
	goto	i1l4594
u522_20:
	line	150
	
i1l4590:	
;charge_mgr.c: 149: {
;charge_mgr.c: 150: p->state = 0;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	goto	i1l494
	line	155
	
i1l4594:	
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
	
i1l4596:	
	line	158
;charge_mgr.c: 158: switch(p->state)
	goto	i1l4714
	line	162
	
i1l4598:	
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
	
i1l4600:	
;charge_mgr.c: 164: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	165
;charge_mgr.c: 165: break;
	goto	i1l494
	line	169
	
i1l4602:	
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
	
i1l4604:	
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
	goto	u523_21
	goto	u523_20
u523_21:
	goto	i1l4608
u523_20:
	goto	i1l494
	line	174
	
i1l4608:	
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
	
i1l4610:	
;charge_mgr.c: 177: if(p->type == 4 ||
;charge_mgr.c: 178: p->type == 2 ||
;charge_mgr.c: 179: p->type == 0)
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	4
	xorwf	(indf),w
	btfsc	status,2
	goto	u524_21
	goto	u524_20
u524_21:
	goto	i1l4616
u524_20:
	
i1l4612:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		movlw	2
	xorwf	(indf),w
	btfsc	status,2
	goto	u525_21
	goto	u525_20
u525_21:
	goto	i1l4616
u525_20:
	
i1l4614:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movf	(indf),w
	btfss	status,2
	goto	u526_21
	goto	u526_20
u526_21:
	goto	i1l4618
u526_20:
	line	181
	
i1l4616:	
;charge_mgr.c: 180: {
;charge_mgr.c: 181: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	182
;charge_mgr.c: 182: break;
	goto	i1l494
	line	186
	
i1l4618:	
;charge_mgr.c: 183: }
;charge_mgr.c: 186: if(v <= 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u527_21
	goto	u527_20
u527_21:
	goto	i1l4626
u527_20:
	line	188
	
i1l4620:	
;charge_mgr.c: 187: {
;charge_mgr.c: 188: p->state = 2;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(02h)
	movwf	indf
	line	189
	
i1l4622:	
;charge_mgr.c: 189: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	190
	
i1l4624:	
;charge_mgr.c: 190: p->activatePulseCnt = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	0Bh
	movwf	fsr0
	clrf	indf
	line	191
;charge_mgr.c: 191: }
	goto	i1l494
	line	193
	
i1l4626:	
;charge_mgr.c: 193: else if(v < 62)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	03Eh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u528_21
	goto	u528_20
u528_21:
	goto	i1l4632
u528_20:
	line	195
	
i1l4628:	
;charge_mgr.c: 194: {
;charge_mgr.c: 195: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	196
	
i1l4630:	
;charge_mgr.c: 196: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	197
;charge_mgr.c: 197: }
	goto	i1l494
	line	201
	
i1l4632:	
;charge_mgr.c: 199: else
;charge_mgr.c: 200: {
;charge_mgr.c: 201: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	202
	
i1l4634:	
;charge_mgr.c: 202: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l494
	line	209
	
i1l4636:	
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
	
i1l4638:	
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
	goto	u529_21
	goto	u529_20
u529_21:
	goto	i1l4642
u529_20:
	line	213
	
i1l4640:	
;charge_mgr.c: 212: {
;charge_mgr.c: 213: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	214
;charge_mgr.c: 214: break;
	goto	i1l494
	line	217
	
i1l4642:	
;charge_mgr.c: 215: }
;charge_mgr.c: 217: if(v > 12)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u530_21
	goto	u530_20
u530_21:
	goto	i1l4648
u530_20:
	line	219
	
i1l4644:	
;charge_mgr.c: 218: {
;charge_mgr.c: 219: p->state = 3;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(03h)
	movwf	indf
	line	220
	
i1l4646:	
;charge_mgr.c: 220: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	221
;charge_mgr.c: 221: break;
	goto	i1l494
	line	224
	
i1l4648:	
;charge_mgr.c: 222: }
;charge_mgr.c: 224: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u531_21
	goto	u531_20
u531_21:
	goto	i1l494
u531_20:
	line	226
	
i1l4650:	
;charge_mgr.c: 225: {
;charge_mgr.c: 226: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	227
;charge_mgr.c: 227: break;
	goto	i1l494
	line	233
	
i1l4652:	
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
	
i1l4654:	
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
	goto	u532_21
	goto	u532_20
u532_21:
	goto	i1l4658
u532_20:
	line	237
	
i1l4656:	
;charge_mgr.c: 236: {
;charge_mgr.c: 237: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	238
;charge_mgr.c: 238: break;
	goto	i1l494
	line	241
	
i1l4658:	
;charge_mgr.c: 239: }
;charge_mgr.c: 241: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u533_21
	goto	u533_20
u533_21:
	goto	i1l4662
u533_20:
	line	243
	
i1l4660:	
;charge_mgr.c: 242: {
;charge_mgr.c: 243: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	244
;charge_mgr.c: 244: break;
	goto	i1l494
	line	247
	
i1l4662:	
;charge_mgr.c: 245: }
;charge_mgr.c: 247: if(v >= 124)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	07Ch
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u534_21
	goto	u534_20
u534_21:
	goto	i1l494
u534_20:
	line	249
	
i1l4664:	
;charge_mgr.c: 248: {
;charge_mgr.c: 249: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	250
	
i1l4666:	
;charge_mgr.c: 250: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l494
	line	256
	
i1l4668:	
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
	
i1l4670:	
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
	goto	u535_21
	goto	u535_20
u535_21:
	goto	i1l4674
u535_20:
	line	260
	
i1l4672:	
;charge_mgr.c: 259: {
;charge_mgr.c: 260: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	261
;charge_mgr.c: 261: break;
	goto	i1l494
	line	264
	
i1l4674:	
;charge_mgr.c: 262: }
;charge_mgr.c: 264: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u536_21
	goto	u536_20
u536_21:
	goto	i1l4678
u536_20:
	line	266
	
i1l4676:	
;charge_mgr.c: 265: {
;charge_mgr.c: 266: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	267
;charge_mgr.c: 267: break;
	goto	i1l494
	line	270
	
i1l4678:	
;charge_mgr.c: 268: }
;charge_mgr.c: 270: if(v >= 188)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0BCh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u537_21
	goto	u537_20
u537_21:
	goto	i1l494
u537_20:
	line	272
	
i1l4680:	
;charge_mgr.c: 271: {
;charge_mgr.c: 272: p->state = 5;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(05h)
	movwf	indf
	line	273
	
i1l4682:	
;charge_mgr.c: 273: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l494
	line	279
	
i1l4684:	
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
	
i1l4686:	
;charge_mgr.c: 281: if(v >= 198)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u538_21
	goto	u538_20
u538_21:
	goto	i1l4690
u538_20:
	line	283
	
i1l4688:	
;charge_mgr.c: 282: {
;charge_mgr.c: 283: p->state = 7;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(07h)
	movwf	indf
	line	284
;charge_mgr.c: 284: break;
	goto	i1l494
	line	287
	
i1l4690:	
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
	goto	u539_21
	goto	u539_20
u539_21:
	goto	i1l494
u539_20:
	line	289
	
i1l4692:	
;charge_mgr.c: 288: {
;charge_mgr.c: 289: p->state = 6;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(06h)
	movwf	indf
	goto	i1l494
	line	296
	
i1l4694:	
;charge_mgr.c: 296: if(v < (188 - 10))
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0B2h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u540_21
	goto	u540_20
u540_21:
	goto	i1l494
u540_20:
	line	298
	
i1l4696:	
;charge_mgr.c: 297: {
;charge_mgr.c: 298: p->state = 4;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	movlw	low(04h)
	movwf	indf
	line	299
	
i1l4698:	
;charge_mgr.c: 299: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l494
	line	307
	
i1l4700:	
;charge_mgr.c: 306: if(v > 12 && v < 198 &&
;charge_mgr.c: 307: p->type == 1)
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0Dh
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipc
	goto	u541_21
	goto	u541_20
u541_21:
	goto	i1l494
u541_20:
	
i1l4702:	
	movlw	0
	subwf	(ChargeProcess_Slot@v+1),w
	movlw	0C6h
	skipnz
	subwf	(ChargeProcess_Slot@v),w
	skipnc
	goto	u542_21
	goto	u542_20
u542_21:
	goto	i1l494
u542_20:
	
i1l4704:	
	movf	(ChargeProcess_Slot@p),w
	movwf	fsr0
		decf	(indf),w
	btfss	status,2
	goto	u543_21
	goto	u543_20
u543_21:
	goto	i1l494
u543_20:
	line	309
	
i1l4706:	
;charge_mgr.c: 308: {
;charge_mgr.c: 309: p->state = 1;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	310
	
i1l4708:	
;charge_mgr.c: 310: p->chargeTimer = 0;
	movf	(ChargeProcess_Slot@p),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	goto	i1l494
	line	315
	
i1l4710:	
;charge_mgr.c: 315: p->state = 0;
	incf	(ChargeProcess_Slot@p),w
	movwf	fsr0
	clrf	indf
	line	316
;charge_mgr.c: 316: break;
	goto	i1l494
	line	158
	
i1l4714:	
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
	goto	i1l4598
	xorlw	1^0	; case 1
	skipnz
	goto	i1l4602
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4636
	xorlw	3^2	; case 3
	skipnz
	goto	i1l4652
	xorlw	4^3	; case 4
	skipnz
	goto	i1l4668
	xorlw	5^4	; case 5
	skipnz
	goto	i1l4684
	xorlw	6^5	; case 6
	skipnz
	goto	i1l4694
	xorlw	7^6	; case 7
	skipnz
	goto	i1l4700
	goto	i1l4710
	opt asmopt_pop

	line	318
	
i1l494:	
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
	
i1l2436:	
;charge_mgr.c: 90: if(voltage <= 5)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	06h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u198_21
	goto	u198_20
u198_21:
	goto	i1l2442
u198_20:
	line	91
	
i1l2438:	
;charge_mgr.c: 91: return 4;
	movlw	low(04h)
	goto	i1l478
	line	94
	
i1l2442:	
;charge_mgr.c: 94: if(voltage <= 12)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0Dh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u199_21
	goto	u199_20
u199_21:
	goto	i1l2448
u199_20:
	line	95
	
i1l2444:	
;charge_mgr.c: 95: return 1;
	movlw	low(01h)
	goto	i1l478
	line	98
	
i1l2448:	
;charge_mgr.c: 98: if(voltage >= 136 && voltage <= 161)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	088h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u200_21
	goto	u200_20
u200_21:
	goto	i1l2456
u200_20:
	
i1l2450:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0A2h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u201_21
	goto	u201_20
u201_21:
	goto	i1l2456
u201_20:
	line	99
	
i1l2452:	
;charge_mgr.c: 99: return 2;
	movlw	low(02h)
	goto	i1l478
	line	102
	
i1l2456:	
;charge_mgr.c: 102: if(voltage >= 62 && voltage <= 188)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	03Eh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u202_21
	goto	u202_20
u202_21:
	goto	i1l2464
u202_20:
	
i1l2458:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l2464
u203_20:
	goto	i1l2444
	line	106
	
i1l2464:	
;charge_mgr.c: 106: if(voltage > 188 && voltage < 198)
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0BDh
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipc
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l2472
u204_20:
	
i1l2466:	
	movlw	0
	subwf	(Detect_BatteryType@voltage+1),w
	movlw	0C6h
	skipnz
	subwf	(Detect_BatteryType@voltage),w
	skipnc
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l2472
u205_20:
	goto	i1l2444
	line	110
	
i1l2472:	
;charge_mgr.c: 110: return 0;
	movlw	low(0)
	line	111
	
i1l478:	
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
	
i1l4838:	
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
	
i1l4844:	
;charge_mgr.c: 412: {
;charge_mgr.c: 413: unsigned char s = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->state;
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u566_21
	goto	u566_20
u566_21:
	goto	i1l4848
u566_20:
	
i1l4846:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$436)
	goto	i1l4850
	
i1l4848:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$436)
	
i1l4850:	
	incf	(_CCCV_Control$436),w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CCCV_Control@s)
	line	417
	
i1l4852:	
;charge_mgr.c: 417: if(i == 2) continue;
		movlw	2
	xorwf	((CCCV_Control@i)),w
	btfss	status,2
	goto	u567_21
	goto	u567_20
u567_21:
	goto	i1l4856
u567_20:
	goto	i1l604
	line	421
	
i1l4856:	
;charge_mgr.c: 420: if(s == 2 || s == 3 ||
;charge_mgr.c: 421: s == 4 || s == 5)
		movlw	2
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u568_21
	goto	u568_20
u568_21:
	goto	i1l607
u568_20:
	
i1l4858:	
		movlw	3
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u569_21
	goto	u569_20
u569_21:
	goto	i1l607
u569_20:
	
i1l4860:	
		movlw	4
	xorwf	((CCCV_Control@s)),w
	btfsc	status,2
	goto	u570_21
	goto	u570_20
u570_21:
	goto	i1l607
u570_20:
	
i1l4862:	
		movlw	5
	xorwf	((CCCV_Control@s)),w
	btfss	status,2
	goto	u571_21
	goto	u571_20
u571_21:
	goto	i1l604
u571_20:
	
i1l607:	
	line	423
;charge_mgr.c: 422: {
;charge_mgr.c: 423: hasCharging = 1;
	clrf	(CCCV_Control@hasCharging)
	incf	(CCCV_Control@hasCharging),f
	line	424
	
i1l4864:	
;charge_mgr.c: 424: if((((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage > maxV)
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u572_21
	goto	u572_20
u572_21:
	goto	i1l4868
u572_20:
	
i1l4866:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$447)
	goto	i1l4870
	
i1l4868:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$447)
	
i1l4870:	
	movf	(_CCCV_Control$447),w
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
	goto	u573_25
	movf	0+(??_CCCV_Control+0)+0,w
	subwf	(CCCV_Control@maxV),w
u573_25:
	skipnc
	goto	u573_21
	goto	u573_20
u573_21:
	goto	i1l4880
u573_20:
	line	425
	
i1l4872:	
;charge_mgr.c: 425: maxV = (((i) < 6) ? &g_slot0[(i)] : &g_slot1[(i)-6])->voltage;
	movlw	low(06h)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u574_21
	goto	u574_20
u574_21:
	goto	i1l4876
u574_20:
	
i1l4874:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot1|((0x1)<<8)+0B8h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$458)
	goto	i1l4878
	
i1l4876:	
	movlw	low(0Ch)
	movwf	(i1___bmul@multiplicand)
	movf	(CCCV_Control@i),w
	fcall	i1___bmul
	addlw	low(_g_slot0|((0x1)<<8))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CCCV_Control$458)
	
i1l4878:	
	movf	(_CCCV_Control$458),w
	addlw	03h
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CCCV_Control@maxV)
	incf	fsr0,f
	movf	indf,w
	movwf	(CCCV_Control@maxV+1)
	line	426
	
i1l4880:	
;charge_mgr.c: 426: if(s == 5)
		movlw	5
	xorwf	((CCCV_Control@s)),w
	btfss	status,2
	goto	u575_21
	goto	u575_20
u575_21:
	goto	i1l604
u575_20:
	line	427
	
i1l4882:	
;charge_mgr.c: 427: cvCount++;
	incf	(CCCV_Control@cvCount),f
	line	411
	
i1l604:	
	incf	(CCCV_Control@i),f
	
i1l4884:	
	movlw	low(0Ch)
	subwf	(CCCV_Control@i),w
	skipc
	goto	u576_21
	goto	u576_20
u576_21:
	goto	i1l4844
u576_20:
	line	432
	
i1l4886:	
;charge_mgr.c: 428: }
;charge_mgr.c: 429: }
;charge_mgr.c: 432: if(!hasCharging)
	movf	((CCCV_Control@hasCharging)),w
	btfss	status,2
	goto	u577_21
	goto	u577_20
u577_21:
	goto	i1l4892
u577_20:
	line	434
	
i1l4888:	
;charge_mgr.c: 433: {
;charge_mgr.c: 434: g_pwmDuty = 0;
	clrf	(_g_pwmDuty)	;volatile
	line	435
;charge_mgr.c: 435: g_cvIntegral = 0;
	clrf	(_g_cvIntegral)
	clrf	(_g_cvIntegral+1)
	goto	i1l619
	line	442
	
i1l4892:	
;charge_mgr.c: 437: }
;charge_mgr.c: 442: if(cvCount == 0)
	movf	((CCCV_Control@cvCount)),w
	btfss	status,2
	goto	u578_21
	goto	u578_20
u578_21:
	goto	i1l4910
u578_20:
	line	444
	
i1l4894:	
;charge_mgr.c: 443: {
;charge_mgr.c: 444: if(g_pwmDuty < 25)
	movlw	low(019h)
	subwf	(_g_pwmDuty),w	;volatile
	skipnc
	goto	u579_21
	goto	u579_20
u579_21:
	goto	i1l4902
u579_20:
	line	447
	
i1l4896:	
;charge_mgr.c: 445: {
;charge_mgr.c: 447: g_pwmDuty += 3;
	movlw	low(03h)
	addwf	(_g_pwmDuty),f	;volatile
	line	448
	
i1l4898:	
;charge_mgr.c: 448: if(g_pwmDuty > 25)
	movlw	low(01Ah)
	subwf	(_g_pwmDuty),w	;volatile
	skipc
	goto	u580_21
	goto	u580_20
u580_21:
	goto	i1l619
u580_20:
	line	449
	
i1l4900:	
;charge_mgr.c: 449: g_pwmDuty = 25;
	movlw	low(019h)
	movwf	(_g_pwmDuty)	;volatile
	goto	i1l619
	line	451
	
i1l4902:	
	goto	i1l4900
	line	470
	
i1l4910:	
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
	
i1l4912:	
;charge_mgr.c: 474: if(g_cvIntegral > 200)
	movf	(_g_cvIntegral+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u581_25
	movlw	0C9h
	subwf	(_g_cvIntegral),w
u581_25:

	skipc
	goto	u581_21
	goto	u581_20
u581_21:
	goto	i1l4916
u581_20:
	line	475
	
i1l4914:	
;charge_mgr.c: 475: g_cvIntegral = 200;
	movlw	0C8h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_cvIntegral)
	clrf	(_g_cvIntegral+1)
	goto	i1l4920
	line	476
	
i1l4916:	
;charge_mgr.c: 476: else if(g_cvIntegral < -200)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_g_cvIntegral+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0FFh)^80h
	subwf	btemp+1,w
	skipz
	goto	u582_25
	movlw	038h
	subwf	(_g_cvIntegral),w
u582_25:

	skipnc
	goto	u582_21
	goto	u582_20
u582_21:
	goto	i1l4920
u582_20:
	line	477
	
i1l4918:	
;charge_mgr.c: 477: g_cvIntegral = -200;
	movlw	038h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_g_cvIntegral)
	movlw	0FFh
	movwf	((_g_cvIntegral))+1
	line	480
	
i1l4920:	
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
	
i1l4922:	
;charge_mgr.c: 481: int duty = (int)g_pwmDuty + adjust;
	movf	(_g_pwmDuty),w	;volatile
	movwf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	
i1l4924:	
	movf	(CCCV_Control@adjust),w
	addwf	(CCCV_Control@duty),f
	skipnc
	incf	(CCCV_Control@duty+1),f
	movf	(CCCV_Control@adjust+1),w
	addwf	(CCCV_Control@duty+1),f
	line	484
	
i1l4926:	
;charge_mgr.c: 484: if(duty > 32) duty = 32;
	movf	(CCCV_Control@duty+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u583_25
	movlw	021h
	subwf	(CCCV_Control@duty),w
u583_25:

	skipc
	goto	u583_21
	goto	u583_20
u583_21:
	goto	i1l4930
u583_20:
	
i1l4928:	
	movlw	020h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	line	485
	
i1l4930:	
;charge_mgr.c: 485: if(duty < 0) duty = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(CCCV_Control@duty+1),7
	goto	u584_21
	goto	u584_20
u584_21:
	goto	i1l4934
u584_20:
	
i1l4932:	
	clrf	(CCCV_Control@duty)
	clrf	(CCCV_Control@duty+1)
	line	487
	
i1l4934:	
;charge_mgr.c: 487: g_pwmDuty = (unsigned char)duty;
	movf	(CCCV_Control@duty),w
	movwf	(_g_pwmDuty)	;volatile
	line	489
	
i1l619:	
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
	
i1l2600:	
	clrf	(i1___bmul@product)
	line	43
	
i1l2602:	
	btfss	(i1___bmul@multiplier),(0)&7
	goto	u225_21
	goto	u225_20
u225_21:
	goto	i1l2606
u225_20:
	line	44
	
i1l2604:	
	movf	(i1___bmul@multiplicand),w
	addwf	(i1___bmul@product),f
	line	45
	
i1l2606:	
	clrc
	rlf	(i1___bmul@multiplicand),f
	line	46
	
i1l2608:	
	clrc
	rrf	(i1___bmul@multiplier),f
	line	47
	movf	((i1___bmul@multiplier)),w
	btfss	status,2
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l2602
u226_20:
	line	50
	
i1l2610:	
	movf	(i1___bmul@product),w
	line	51
	
i1l768:	
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
	
i1l2530:	
	clrf	(___awdiv@sign)
	line	15
	
i1l2532:	
	btfss	(___awdiv@divisor+1),7
	goto	u214_21
	goto	u214_20
u214_21:
	goto	i1l2538
u214_20:
	line	16
	
i1l2534:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	17
	
i1l2536:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	19
	
i1l2538:	
	btfss	(___awdiv@dividend+1),7
	goto	u215_21
	goto	u215_20
u215_21:
	goto	i1l2544
u215_20:
	line	20
	
i1l2540:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	21
	
i1l2542:	
	movlw	low(01h)
	xorwf	(___awdiv@sign),f
	line	23
	
i1l2544:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	24
	
i1l2546:	
	movf	((___awdiv@divisor)),w
iorwf	((___awdiv@divisor+1)),w
	btfsc	status,2
	goto	u216_21
	goto	u216_20
u216_21:
	goto	i1l2566
u216_20:
	line	25
	
i1l2548:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	26
	goto	i1l2552
	line	27
	
i1l2550:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	28
	incf	(___awdiv@counter),f
	line	26
	
i1l2552:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l2550
u217_20:
	line	31
	
i1l2554:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	32
	
i1l2556:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u218_25
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u218_25:
	skipc
	goto	u218_21
	goto	u218_20
u218_21:
	goto	i1l2562
u218_20:
	line	33
	
i1l2558:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	34
	
i1l2560:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	36
	
i1l2562:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	37
	
i1l2564:	
	decfsz	(___awdiv@counter),f
	goto	u219_21
	goto	u219_20
u219_21:
	goto	i1l2554
u219_20:
	line	39
	
i1l2566:	
	movf	((___awdiv@sign)),w
	btfsc	status,2
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l2570
u220_20:
	line	40
	
i1l2568:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	41
	
i1l2570:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	42
	
i1l880:	
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
