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
	FNCALL	_main,_ADC_Sample
	FNCALL	_main,_Init_System
	FNCALL	_main,___lldiv
	FNCALL	_main,___lmul
	FNCALL	_main,___lwdiv
	FNCALL	_main,___lwmod
	FNCALL	_main,_sw_uart_init
	FNCALL	_main,_uart_send_number
	FNCALL	_main,_uart_send_string
	FNCALL	_uart_send_string,_uart_send_char
	FNCALL	_uart_send_number,___lwdiv
	FNCALL	_uart_send_number,___lwmod
	FNCALL	_uart_send_number,_uart_send_char
	FNROOT	_main
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_test_adc
	global	_adresult
	global	_OSCCON
psect	text0,local,class=CODE,delta=2,merge=1
global __ptext0
__ptext0:
_OSCCON	set	20
	global	_T2CON
_T2CON	set	19
	global	_PR2
_PR2	set	17
	global	_INTCON
_INTCON	set	11
	global	_WPUB
_WPUB	set	8
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	5
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_TMR2IE
_TMR2IE	set	0x71
	global	_TMR2IF
_TMR2IF	set	0x69
	global	_GIE
_GIE	set	0x5F
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
	global	_WPUA
_WPUA	set	136
	global	_PORTA
_PORTA	set	134
	global	_TRISA
_TRISA	set	133
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
	global	_RC4
_RC4	set	0x834
	global	_CC1CON
_CC1CON	set	406
	global	_CC0CON
_CC0CON	set	405
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
	retlw	66	;'B'
	retlw	49	;'1'
	retlw	45	;'-'
	retlw	66	;'B'
	retlw	49	;'1'
	retlw	50	;'2'
	retlw	32	;' '
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_28:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	61	;'='
	retlw	83	;'S'
	retlw	72	;'H'
	retlw	79	;'O'
	retlw	82	;'R'
	retlw	84	;'T'
	retlw	0
psect	strings
	
STR_33:	
	retlw	13
	retlw	10
	retlw	32	;' '
	retlw	86	;'V'
	retlw	67	;'C'
	retlw	67	;'C'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_29:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	61	;'='
	retlw	79	;'O'
	retlw	80	;'P'
	retlw	69	;'E'
	retlw	78	;'N'
	retlw	0
psect	strings
	
STR_7:	
	retlw	32	;' '
	retlw	66	;'B'
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	40	;'('
	retlw	0
psect	strings
	
STR_27:	
	retlw	32	;' '
	retlw	78	;'N'
	retlw	84	;'T'
	retlw	67	;'C'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_4:	
	retlw	32	;' '
	retlw	79	;'O'
	retlw	80	;'P'
	retlw	69	;'E'
	retlw	78	;'N'
	retlw	0
psect	strings
	
STR_34:	
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_21:	
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	41	;')'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_14:	
	retlw	13
	retlw	10
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_8:	
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	41	;')'
	retlw	0
psect	strings
	
STR_30:	
	retlw	32	;' '
	retlw	84	;'T'
	retlw	61	;'='
	retlw	0
psect	strings
	
STR_11:	
	retlw	32	;' '
	retlw	63	;'?'
	retlw	91	;'['
	retlw	0
psect	strings
	
STR_31:	
	retlw	46	;'.'
	retlw	0
psect	strings
	
STR_2:	
	retlw	66	;'B'
	retlw	0
psect	strings
	
STR_32:	
	retlw	67	;'C'
	retlw	0
psect	strings
STR_24	equ	STR_11+0
STR_17	equ	STR_4+0
STR_5	equ	STR_2+0
STR_9	equ	STR_2+0
STR_15	equ	STR_2+0
STR_18	equ	STR_2+0
STR_22	equ	STR_2+0
STR_3	equ	STR_33+6
STR_6	equ	STR_33+6
STR_10	equ	STR_33+6
STR_16	equ	STR_33+6
STR_19	equ	STR_33+6
STR_23	equ	STR_33+6
STR_12	equ	STR_8+0
STR_20	equ	STR_7+0
STR_25	equ	STR_21+0
STR_13	equ	STR_14+2
STR_26	equ	STR_14+2
; #config settings
	file	"SC8F096_ADC_Demo.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_test_adc:
       ds      1

_adresult:
       ds      2

	file	"SC8F096_ADC_Demo.as"
	line	#
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
	clrf	((__pbssBANK1)+2)&07Fh
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
	global	main@pt
main@pt:	; 4 bytes @ 0x0
	ds	4
	global	_main$526
_main$526:	; 2 bytes @ 0x4
	ds	2
	global	_main$527
_main$527:	; 2 bytes @ 0x6
	ds	2
	global	main@tick
main@tick:	; 2 bytes @ 0x8
	ds	2
	global	main@vdd_buf
main@vdd_buf:	; 24 bytes @ 0xA
	ds	24
	global	main@temp_x10
main@temp_x10:	; 2 bytes @ 0x22
	ds	2
	global	main@rt
main@rt:	; 4 bytes @ 0x24
	ds	4
	global	main@vx_mv
main@vx_mv:	; 2 bytes @ 0x28
	ds	2
	global	main@vx_mv_199
main@vx_mv_199:	; 2 bytes @ 0x2A
	ds	2
	global	main@bat_mv
main@bat_mv:	; 4 bytes @ 0x2C
	ds	4
	global	main@bat_mv_198
main@bat_mv_198:	; 4 bytes @ 0x30
	ds	4
	global	main@ntc_adc
main@ntc_adc:	; 2 bytes @ 0x34
	ds	2
	global	main@vcc_mv
main@vcc_mv:	; 2 bytes @ 0x36
	ds	2
	global	main@bx
main@bx:	; 1 bytes @ 0x38
	ds	1
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_Init_System:	; 1 bytes @ 0x0
?_sw_uart_init:	; 1 bytes @ 0x0
?_uart_send_char:	; 1 bytes @ 0x0
?_uart_send_string:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
??_Isr_Timer:	; 1 bytes @ 0x0
	ds	2
??_Init_System:	; 1 bytes @ 0x2
?_ADC_Sample:	; 1 bytes @ 0x2
??_sw_uart_init:	; 1 bytes @ 0x2
??_uart_send_char:	; 1 bytes @ 0x2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x2
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x2
	global	?___lmul
?___lmul:	; 4 bytes @ 0x2
	global	ADC_Sample@adldo
ADC_Sample@adldo:	; 1 bytes @ 0x2
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x2
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x2
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x2
	ds	1
??_ADC_Sample:	; 1 bytes @ 0x3
	global	uart_send_char@c
uart_send_char@c:	; 1 bytes @ 0x3
	ds	1
	global	uart_send_char@i
uart_send_char@i:	; 1 bytes @ 0x4
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x4
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x4
	ds	1
??_uart_send_string:	; 1 bytes @ 0x5
	global	uart_send_string@str
uart_send_string@str:	; 1 bytes @ 0x5
	ds	1
??___lwdiv:	; 1 bytes @ 0x6
??___lwmod:	; 1 bytes @ 0x6
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x6
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x6
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x6
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x8
	ds	1
?_uart_send_number:	; 1 bytes @ 0x9
	global	uart_send_number@num
uart_send_number@num:	; 2 bytes @ 0x9
	ds	1
??___lmul:	; 1 bytes @ 0xA
??___lldiv:	; 1 bytes @ 0xA
	ds	1
??_uart_send_number:	; 1 bytes @ 0xB
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	ADC_Sample@j
ADC_Sample@j:	; 1 bytes @ 0x0
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x0
	global	uart_send_number@buf
uart_send_number@buf:	; 6 bytes @ 0x0
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x1
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x2
	ds	1
	global	ADC_Sample@adsum
ADC_Sample@adsum:	; 4 bytes @ 0x3
	ds	1
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x4
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x4
	ds	2
	global	uart_send_number@i
uart_send_number@i:	; 1 bytes @ 0x6
	ds	1
	global	uart_send_number@j
uart_send_number@j:	; 1 bytes @ 0x7
	global	ADC_Sample@admin
ADC_Sample@admin:	; 2 bytes @ 0x7
	ds	1
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x8
	ds	1
	global	ADC_Sample@admax
ADC_Sample@admax:	; 2 bytes @ 0x9
	ds	2
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0xB
	ds	1
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0xC
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x10
	ds	1
??_main:	; 1 bytes @ 0x11
	ds	8
;!
;!Data Sizes:
;!    Strings     93
;!    Constant    0
;!    Data        0
;!    BSS         3
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     11      11
;!    BANK0            80     25      25
;!    BANK1            80     57      60
;!    BANK3            80      0       0
;!    BANK2            80      0       0

;!
;!Pointer List with Targets:
;!
;!    uart_send_string@str	PTR const unsigned char  size(1) Largest target is 18
;!		 -> STR_34(CODE[5]), STR_33(CODE[8]), STR_32(CODE[2]), STR_31(CODE[2]), 
;!		 -> STR_30(CODE[4]), STR_29(CODE[8]), STR_28(CODE[9]), STR_27(CODE[6]), 
;!		 -> STR_26(CODE[2]), STR_25(CODE[5]), STR_24(CODE[4]), STR_23(CODE[2]), 
;!		 -> STR_22(CODE[2]), STR_21(CODE[5]), STR_20(CODE[6]), STR_19(CODE[2]), 
;!		 -> STR_18(CODE[2]), STR_17(CODE[6]), STR_16(CODE[2]), STR_15(CODE[2]), 
;!		 -> STR_14(CODE[4]), STR_13(CODE[2]), STR_12(CODE[4]), STR_11(CODE[4]), 
;!		 -> STR_10(CODE[2]), STR_9(CODE[2]), STR_8(CODE[4]), STR_7(CODE[6]), 
;!		 -> STR_6(CODE[2]), STR_5(CODE[2]), STR_4(CODE[6]), STR_3(CODE[2]), 
;!		 -> STR_2(CODE[2]), STR_1(CODE[18]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_uart_send_number
;!    _uart_send_string->_uart_send_char
;!    _uart_send_number->___lwdiv
;!    ___lldiv->___lmul
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->___lldiv
;!    ___lldiv->___lmul
;!
;!Critical Paths under _Isr_Timer in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _Isr_Timer in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _Isr_Timer in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _Isr_Timer in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 8, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                65    65      0    9250
;!                                             17 BANK0      8     8      0
;!                                              0 BANK1     57    57      0
;!                         _ADC_Sample
;!                        _Init_System
;!                            ___lldiv
;!                             ___lmul
;!                            ___lwdiv
;!                            ___lwmod
;!                       _sw_uart_init
;!                   _uart_send_number
;!                   _uart_send_string
;! ---------------------------------------------------------------------------------
;! (1) _uart_send_string                                     1     1      0    1032
;!                                              5 COMMON     1     1      0
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (1) _uart_send_number                                    10     8      2    2362
;!                                              9 COMMON     2     0      2
;!                                              0 BANK0      8     8      0
;!                            ___lwdiv
;!                            ___lwmod
;!                     _uart_send_char
;! ---------------------------------------------------------------------------------
;! (2) _uart_send_char                                       3     3      0      69
;!                                              2 COMMON     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4     477
;!                                              2 COMMON     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     374
;!                                              2 COMMON     7     3      4
;! ---------------------------------------------------------------------------------
;! (1) _sw_uart_init                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) ___lmul                                              12     4      8    1280
;!                                              2 COMMON     8     0      8
;!                                              0 BANK0      4     4      0
;! ---------------------------------------------------------------------------------
;! (1) ___lldiv                                             13     5      8     820
;!                                              4 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _Init_System                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_Sample                                          18    17      1    1267
;!                                              2 COMMON     5     4      1
;!                                              0 BANK0     13    13      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _Isr_Timer                                            2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _ADC_Sample
;!   _Init_System
;!   ___lldiv
;!     ___lmul (ARG)
;!   ___lmul
;!   ___lwdiv
;!   ___lwmod
;!   _sw_uart_init
;!   _uart_send_number
;!     ___lwdiv
;!     ___lwmod
;!     _uart_send_char
;!   _uart_send_string
;!     _uart_send_char
;!
;! _Isr_Timer (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      B       B       1       78.6%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50     19      19       4       31.3%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITBANK1            50      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BANK1               50     39      3C       6       75.0%
;!BITBANK3            50      0       0       7        0.0%
;!BANK3               50      0       0       8        0.0%
;!BITBANK2            50      0       0       9        0.0%
;!BANK2               50      0       0      10        0.0%
;!ABS                  0      0      60      11        0.0%
;!DATA                 0      0      60      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 168 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rt              4   36[BANK1 ] unsigned long 
;;  temp_x10        2   34[BANK1 ] unsigned int 
;;  bat_mv          4   48[BANK1 ] unsigned long 
;;  vx_mv           2   42[BANK1 ] unsigned int 
;;  bat_mv          4   44[BANK1 ] unsigned long 
;;  vx_mv           2   40[BANK1 ] unsigned int 
;;  ntc_adc         2   52[BANK1 ] unsigned int 
;;  pt              4    0[BANK1 ] unsigned long 
;;  vdd_buf        24   10[BANK1 ] unsigned int [12]
;;  vcc_mv          2   54[BANK1 ] unsigned int 
;;  tick            2    8[BANK1 ] unsigned int 
;;  bx              1   56[BANK1 ] unsigned char 
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
;;      Locals:         0       0      57       0       0
;;      Temps:          0       8       0       0       0
;;      Totals:         0       8      57       0       0
;;Total ram usage:       65 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADC_Sample
;;		_Init_System
;;		___lldiv
;;		___lmul
;;		___lwdiv
;;		___lwmod
;;		_sw_uart_init
;;		_uart_send_number
;;		_uart_send_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	168
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	168
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	170
	
l1384:	
;SC8F096_ADC.c: 170: Init_System();
	fcall	_Init_System
	line	171
	
l1386:	
;SC8F096_ADC.c: 171: sw_uart_init();
	fcall	_sw_uart_init
	line	173
;SC8F096_ADC.c: 173: ADCON0 = 0x41;
	movlw	low(041h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	183
	
l1388:	
;SC8F096_ADC.c: 183: ANSEL0 |= 0xF0;
	movlw	low(0F0h)
	iorwf	(147)^080h,f	;volatile
	line	184
	
l1390:	
;SC8F096_ADC.c: 184: ANSEL1 |= 0x03;
	movlw	low(03h)
	iorwf	(148)^080h,f	;volatile
	line	185
	
l1392:	
;SC8F096_ADC.c: 185: ANSEL2 |= 0x07;
	movlw	low(07h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	iorwf	(265)^0100h,f	;volatile
	line	186
	
l1394:	
;SC8F096_ADC.c: 186: ANSEL3 |= 0x3C;
	movlw	low(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(140)^080h,f	;volatile
	line	188
	
l1396:	
;SC8F096_ADC.c: 188: uart_send_string("B1-B12 ADC Test\r\n");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	190
	
l1398:	
;SC8F096_ADC.c: 190: unsigned int tick = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@tick)^080h
	clrf	(main@tick+1)^080h
	line	197
;SC8F096_ADC.c: 191: unsigned int vcc_mv;
;SC8F096_ADC.c: 192: unsigned char bx;
;SC8F096_ADC.c: 195: unsigned int vdd_buf[12];
;SC8F096_ADC.c: 197: while(1)
	
l290:	
	line	199
# 199 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	line	200
	
l1400:	
;SC8F096_ADC.c: 200: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	52
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
	u1117:
decfsz	((??_main+0)+0),f
	goto	u1117
	decfsz	((??_main+0)+0+1),f
	goto	u1117
opt asmopt_pop

	line	201
	
l1402:	
;SC8F096_ADC.c: 201: tick++;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@tick)^080h,f
	skipnz
	incf	(main@tick+1)^080h,f
	line	202
	
l1404:	
;SC8F096_ADC.c: 202: if(tick % 200 != 0) continue;
	movlw	0C8h
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(main@tick+1)^080h,w
	movwf	(___lwmod@dividend+1)
	movf	(main@tick)^080h,w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfsc	status,2
	goto	u921
	goto	u920
u921:
	goto	l291
u920:
	goto	l290
	
l291:	
	line	203
# 203 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	line	206
	
l1408:	
;SC8F096_ADC.c: 206: vcc_mv = 5000;
	movlw	088h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@vcc_mv)^080h
	movlw	013h
	movwf	((main@vcc_mv)^080h)+1
	line	207
	
l1410:	
;SC8F096_ADC.c: 207: test_adc = ADC_Sample(31, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_test_adc)^080h	;volatile
	line	208
	
l1412:	
;SC8F096_ADC.c: 208: if(0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)^080h),w	;volatile
	btfss	status,2
	goto	u931
	goto	u930
u931:
	goto	l1418
u930:
	line	210
	
l1414:	
;SC8F096_ADC.c: 209: {
;SC8F096_ADC.c: 210: unsigned long pt = (unsigned long)((4096UL*1.2*1000)) / adresult;
	movf	(_adresult)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	((___lldiv@divisor))+1
	clrf	2+((___lldiv@divisor))
	clrf	3+((___lldiv@divisor))
	movlw	0
	movwf	(___lldiv@dividend+3)
	movlw	04Bh
	movwf	(___lldiv@dividend+2)
	movlw	0
	movwf	(___lldiv@dividend+1)
	movlw	0
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@pt+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@pt+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@pt+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@pt)^080h

	line	211
	
l1416:	
;SC8F096_ADC.c: 211: vcc_mv = (unsigned int)pt;
	movf	(main@pt+1)^080h,w
	movwf	(main@vcc_mv+1)^080h
	movf	(main@pt)^080h,w
	movwf	(main@vcc_mv)^080h
	line	216
	
l1418:	
;SC8F096_ADC.c: 212: }
;SC8F096_ADC.c: 216: ADC_Sample(17, 0); vdd_buf[0] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(011h)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	(main@vdd_buf+1)^080h
	movf	(_adresult)^080h,w	;volatile
	movwf	(main@vdd_buf)^080h
	line	217
	
l1420:	
;SC8F096_ADC.c: 217: ADC_Sample(12, 0); vdd_buf[2] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(0Ch)
	fcall	_ADC_Sample
	
l1422:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+04h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+04h
	line	218
;SC8F096_ADC.c: 218: ADC_Sample(13, 0); vdd_buf[3] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(0Dh)
	fcall	_ADC_Sample
	
l1424:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+06h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+06h
	line	219
	
l1426:	
;SC8F096_ADC.c: 219: ADC_Sample(5, 0); vdd_buf[4] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(05h)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+08h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+08h
	line	220
	
l1428:	
;SC8F096_ADC.c: 220: ADC_Sample(7, 0); vdd_buf[5] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(07h)
	fcall	_ADC_Sample
	
l1430:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+0Ah
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+0Ah
	line	221
;SC8F096_ADC.c: 221: ADC_Sample(6, 0); vdd_buf[6] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(06h)
	fcall	_ADC_Sample
	
l1432:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+0Ch
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+0Ch
	line	222
	
l1434:	
;SC8F096_ADC.c: 222: ADC_Sample(4, 0); vdd_buf[7] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(04h)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+0Eh
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+0Eh
	line	223
	
l1436:	
;SC8F096_ADC.c: 223: ADC_Sample(28, 0); vdd_buf[8] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(01Ch)
	fcall	_ADC_Sample
	
l1438:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+010h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+010h
	line	224
;SC8F096_ADC.c: 224: ADC_Sample(29, 0); vdd_buf[9] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(01Dh)
	fcall	_ADC_Sample
	
l1440:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+012h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+012h
	line	225
	
l1442:	
;SC8F096_ADC.c: 225: ADC_Sample(27, 0); vdd_buf[10] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(01Bh)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+014h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+014h
	line	226
	
l1444:	
;SC8F096_ADC.c: 226: ADC_Sample(26, 0); vdd_buf[11] = adresult;
	clrf	(ADC_Sample@adldo)
	movlw	low(01Ah)
	fcall	_ADC_Sample
	
l1446:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+016h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+016h
	line	228
# 228 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	line	229
;SC8F096_ADC.c: 229: ADC_Sample(16, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(010h)
	fcall	_ADC_Sample
	line	230
	
l1448:	
;SC8F096_ADC.c: 230: vdd_buf[1] = adresult;
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adresult+1)^080h,w	;volatile
	movwf	1+(main@vdd_buf)^080h+02h
	movf	(_adresult)^080h,w	;volatile
	movwf	0+(main@vdd_buf)^080h+02h
	line	233
	
l1450:	
;SC8F096_ADC.c: 233: for(bx = 0; bx < 6; bx++)
	clrf	(main@bx)^080h
	line	238
	
l1456:	
;SC8F096_ADC.c: 234: {
;SC8F096_ADC.c: 235: unsigned long bat_mv;
;SC8F096_ADC.c: 236: unsigned int vx_mv;
;SC8F096_ADC.c: 238: vx_mv = (unsigned long)vdd_buf[bx] * vcc_mv / 4096UL;
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(___lmul@multiplier)
	movf	1+(??_main+0)+0,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplicand)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplicand))+1
	clrf	2+((___lmul@multiplicand))
	clrf	3+((___lmul@multiplicand))
	fcall	___lmul
	movf	(0+?___lmul),w
	movwf	(??_main+2)+0
	movf	(1+?___lmul),w
	movwf	((??_main+2)+0+1)
	movf	(2+?___lmul),w
	movwf	((??_main+2)+0+2)
	movf	(3+?___lmul),w
	movwf	((??_main+2)+0+3)
	movlw	0Ch
u945:
	clrc
	rrf	(??_main+2)+3,f
	rrf	(??_main+2)+2,f
	rrf	(??_main+2)+1,f
	rrf	(??_main+2)+0,f
u940:
	addlw	-1
	skipz
	goto	u945
	movf	1+(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@vx_mv+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@vx_mv)^080h
	line	239
	
l1458:	
;SC8F096_ADC.c: 239: if(vx_mv + 200U >= vcc_mv)
	movf	(main@vx_mv)^080h,w
	addlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vx_mv+1)^080h,w
	skipnc
	addlw	1
	addlw	high(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u955
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(??_main+0)+0,w
u955:
	skipc
	goto	u951
	goto	u950
u951:
	goto	l1462
u950:
	line	241
	
l1460:	
;SC8F096_ADC.c: 240: {
;SC8F096_ADC.c: 241: uart_send_string("B");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	242
;SC8F096_ADC.c: 242: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	243
;SC8F096_ADC.c: 243: uart_send_string("=");
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	244
;SC8F096_ADC.c: 244: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	245
;SC8F096_ADC.c: 245: uart_send_string(" OPEN");
	movlw	(low((((STR_4)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	246
;SC8F096_ADC.c: 246: }
	goto	l297
	line	249
	
l1462:	
;SC8F096_ADC.c: 247: else
;SC8F096_ADC.c: 248: {
;SC8F096_ADC.c: 249: bat_mv = (1159UL * vx_mv);
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vx_mv)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vx_mv+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	04h
	movwf	(___lmul@multiplicand+1)
	movlw	087h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv+3)^080h
	movf	(2+(?___lmul)),w
	movwf	(main@bat_mv+2)^080h
	movf	(1+(?___lmul)),w
	movwf	(main@bat_mv+1)^080h
	movf	(0+(?___lmul)),w
	movwf	(main@bat_mv)^080h

	line	250
;SC8F096_ADC.c: 250: if(bat_mv > (647UL * (unsigned long)vcc_mv))
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	02h
	movwf	(___lmul@multiplicand+1)
	movlw	087h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@bat_mv+3)^080h,w
	subwf	(3+(?___lmul)),w
	skipz
	goto	u965
	movf	(main@bat_mv+2)^080h,w
	subwf	(2+(?___lmul)),w
	skipz
	goto	u965
	movf	(main@bat_mv+1)^080h,w
	subwf	(1+(?___lmul)),w
	skipz
	goto	u965
	movf	(main@bat_mv)^080h,w
	subwf	(0+(?___lmul)),w
u965:
	skipnc
	goto	u961
	goto	u960
u961:
	goto	l1480
u960:
	line	252
	
l1464:	
;SC8F096_ADC.c: 251: {
;SC8F096_ADC.c: 252: bat_mv = (bat_mv - 647UL * (unsigned long)vcc_mv + 1000UL/2) / 1000UL;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	03h
	movwf	(___lldiv@divisor+1)
	movlw	0E8h
	movwf	(___lldiv@divisor)

	movlw	0F4h
	movwf	((??_main+0)+0)
	movlw	01h
	movwf	((??_main+0)+0+1)
	movlw	0
	movwf	((??_main+0)+0+2)
	movlw	0
	movwf	((??_main+0)+0+3)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0FFh
	movwf	(___lmul@multiplicand+3)
	movlw	0FFh
	movwf	(___lmul@multiplicand+2)
	movlw	0FDh
	movwf	(___lmul@multiplicand+1)
	movlw	079h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(0+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+0)
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___lmul)),w
	clrf	((??_main+4)+0+2)
	skipnc
	incf	((??_main+4)+0+2),f
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+1)
	skipnc
	incf	((??_main+4)+0+2),f
	movf	(2+(?___lmul)),w
	addwf	((??_main+4)+0+2),w
	clrf	((??_main+4)+0+3)
	skipnc
	incf	((??_main+4)+0+3),f
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+2)
	skipnc
	incf	((??_main+4)+0+3),f
	movf	(3+(?___lmul)),w
	addwf	((??_main+4)+0+3),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+3)
	movf	0+(??_main+4)+0,w
	addwf	(??_main+0)+0,f
	movf	1+(??_main+4)+0,w
	skipnc
	incfsz	1+(??_main+4)+0,w
	goto	u970
	goto	u971
u970:
	addwf	(??_main+0)+1,f
u971:
	movf	2+(??_main+4)+0,w
	skipnc
	incfsz	2+(??_main+4)+0,w
	goto	u972
	goto	u973
u972:
	addwf	(??_main+0)+2,f
u973:
	movf	3+(??_main+4)+0,w
	skipnc
	incf	3+(??_main+4)+0,w
	addwf	(??_main+0)+3,f
	movf	3+(??_main+0)+0,w
	movwf	(___lldiv@dividend+3)
	movf	2+(??_main+0)+0,w
	movwf	(___lldiv@dividend+2)
	movf	1+(??_main+0)+0,w
	movwf	(___lldiv@dividend+1)
	movf	0+(??_main+0)+0,w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv)^080h

	line	253
	
l1466:	
;SC8F096_ADC.c: 253: uart_send_string("B");
	movlw	(low((((STR_5)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	254
	
l1468:	
;SC8F096_ADC.c: 254: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	255
	
l1470:	
;SC8F096_ADC.c: 255: uart_send_string("=");
	movlw	(low((((STR_6)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	256
	
l1472:	
;SC8F096_ADC.c: 256: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	257
	
l1474:	
;SC8F096_ADC.c: 257: uart_send_string(" BAT(");
	movlw	(low((((STR_7)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	258
	
l1476:	
;SC8F096_ADC.c: 258: uart_send_number((unsigned int)bat_mv);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bat_mv+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@bat_mv)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	259
	
l1478:	
;SC8F096_ADC.c: 259: uart_send_string("mV)");
	movlw	(low((((STR_8)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	260
;SC8F096_ADC.c: 260: }
	goto	l297
	line	263
	
l1480:	
;SC8F096_ADC.c: 261: else
;SC8F096_ADC.c: 262: {
;SC8F096_ADC.c: 263: uart_send_string("B");
	movlw	(low((((STR_9)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	264
;SC8F096_ADC.c: 264: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	265
;SC8F096_ADC.c: 265: uart_send_string("=");
	movlw	(low((((STR_10)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	266
;SC8F096_ADC.c: 266: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	267
;SC8F096_ADC.c: 267: uart_send_string(" ?[");
	movlw	(low((((STR_11)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	268
;SC8F096_ADC.c: 268: uart_send_number((unsigned int)vx_mv);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@vx_mv+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@vx_mv)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	269
;SC8F096_ADC.c: 269: uart_send_string("mV)");
	movlw	(low((((STR_12)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	271
	
l297:	
	line	272
;SC8F096_ADC.c: 270: }
;SC8F096_ADC.c: 271: }
;SC8F096_ADC.c: 272: uart_send_string(" ");
	movlw	(low((((STR_13)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	233
	
l1482:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@bx)^080h,f
	
l1484:	
	movlw	low(06h)
	subwf	(main@bx)^080h,w
	skipc
	goto	u981
	goto	u980
u981:
	goto	l1456
u980:
	line	274
	
l1486:	
;SC8F096_ADC.c: 273: }
;SC8F096_ADC.c: 274: uart_send_string("\r\n ");
	movlw	(low((((STR_14)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	275
# 275 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	line	278
	
l1488:	
;SC8F096_ADC.c: 278: for(bx = 6; bx < 12; bx++)
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@bx)^080h
	line	283
	
l1494:	
;SC8F096_ADC.c: 279: {
;SC8F096_ADC.c: 280: unsigned long bat_mv;
;SC8F096_ADC.c: 281: unsigned int vx_mv;
;SC8F096_ADC.c: 283: vx_mv = (unsigned long)vdd_buf[bx] * vcc_mv / 4096UL;
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(___lmul@multiplier)
	movf	1+(??_main+0)+0,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplicand)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplicand))+1
	clrf	2+((___lmul@multiplicand))
	clrf	3+((___lmul@multiplicand))
	fcall	___lmul
	movf	(0+?___lmul),w
	movwf	(??_main+2)+0
	movf	(1+?___lmul),w
	movwf	((??_main+2)+0+1)
	movf	(2+?___lmul),w
	movwf	((??_main+2)+0+2)
	movf	(3+?___lmul),w
	movwf	((??_main+2)+0+3)
	movlw	0Ch
u995:
	clrc
	rrf	(??_main+2)+3,f
	rrf	(??_main+2)+2,f
	rrf	(??_main+2)+1,f
	rrf	(??_main+2)+0,f
u990:
	addlw	-1
	skipz
	goto	u995
	movf	1+(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@vx_mv_199+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@vx_mv_199)^080h
	line	284
	
l1496:	
;SC8F096_ADC.c: 284: if(vx_mv + 200U >= vcc_mv)
	movf	(main@vx_mv_199)^080h,w
	addlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vx_mv_199+1)^080h,w
	skipnc
	addlw	1
	addlw	high(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(??_main+0)+0,w
	skipz
	goto	u1005
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(??_main+0)+0,w
u1005:
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l1500
u1000:
	line	286
	
l1498:	
;SC8F096_ADC.c: 285: {
;SC8F096_ADC.c: 286: uart_send_string("B");
	movlw	(low((((STR_15)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	287
;SC8F096_ADC.c: 287: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	288
;SC8F096_ADC.c: 288: uart_send_string("=");
	movlw	(low((((STR_16)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	289
;SC8F096_ADC.c: 289: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	290
;SC8F096_ADC.c: 290: uart_send_string(" OPEN");
	movlw	(low((((STR_17)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	291
;SC8F096_ADC.c: 291: }
	goto	l303
	line	294
	
l1500:	
;SC8F096_ADC.c: 292: else
;SC8F096_ADC.c: 293: {
;SC8F096_ADC.c: 294: bat_mv = (1159UL * vx_mv);
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vx_mv_199)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vx_mv_199+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	04h
	movwf	(___lmul@multiplicand+1)
	movlw	087h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv_198+3)^080h
	movf	(2+(?___lmul)),w
	movwf	(main@bat_mv_198+2)^080h
	movf	(1+(?___lmul)),w
	movwf	(main@bat_mv_198+1)^080h
	movf	(0+(?___lmul)),w
	movwf	(main@bat_mv_198)^080h

	line	295
;SC8F096_ADC.c: 295: if(bat_mv > (647UL * (unsigned long)vcc_mv))
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	02h
	movwf	(___lmul@multiplicand+1)
	movlw	087h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@bat_mv_198+3)^080h,w
	subwf	(3+(?___lmul)),w
	skipz
	goto	u1015
	movf	(main@bat_mv_198+2)^080h,w
	subwf	(2+(?___lmul)),w
	skipz
	goto	u1015
	movf	(main@bat_mv_198+1)^080h,w
	subwf	(1+(?___lmul)),w
	skipz
	goto	u1015
	movf	(main@bat_mv_198)^080h,w
	subwf	(0+(?___lmul)),w
u1015:
	skipnc
	goto	u1011
	goto	u1010
u1011:
	goto	l1518
u1010:
	line	297
	
l1502:	
;SC8F096_ADC.c: 296: {
;SC8F096_ADC.c: 297: bat_mv = (bat_mv - 647UL * (unsigned long)vcc_mv + 1000UL/2) / 1000UL;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	03h
	movwf	(___lldiv@divisor+1)
	movlw	0E8h
	movwf	(___lldiv@divisor)

	movlw	0F4h
	movwf	((??_main+0)+0)
	movlw	01h
	movwf	((??_main+0)+0+1)
	movlw	0
	movwf	((??_main+0)+0+2)
	movlw	0
	movwf	((??_main+0)+0+3)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@vcc_mv)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@vcc_mv+1)^080h,w
	movwf	((___lmul@multiplier))+1
	clrf	2+((___lmul@multiplier))
	clrf	3+((___lmul@multiplier))
	movlw	0FFh
	movwf	(___lmul@multiplicand+3)
	movlw	0FFh
	movwf	(___lmul@multiplicand+2)
	movlw	0FDh
	movwf	(___lmul@multiplicand+1)
	movlw	079h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(0+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv_198)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+0)
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___lmul)),w
	clrf	((??_main+4)+0+2)
	skipnc
	incf	((??_main+4)+0+2),f
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv_198+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+1)
	skipnc
	incf	((??_main+4)+0+2),f
	movf	(2+(?___lmul)),w
	addwf	((??_main+4)+0+2),w
	clrf	((??_main+4)+0+3)
	skipnc
	incf	((??_main+4)+0+3),f
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv_198+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+2)
	skipnc
	incf	((??_main+4)+0+3),f
	movf	(3+(?___lmul)),w
	addwf	((??_main+4)+0+3),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(main@bat_mv_198+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+4)+0+3)
	movf	0+(??_main+4)+0,w
	addwf	(??_main+0)+0,f
	movf	1+(??_main+4)+0,w
	skipnc
	incfsz	1+(??_main+4)+0,w
	goto	u1020
	goto	u1021
u1020:
	addwf	(??_main+0)+1,f
u1021:
	movf	2+(??_main+4)+0,w
	skipnc
	incfsz	2+(??_main+4)+0,w
	goto	u1022
	goto	u1023
u1022:
	addwf	(??_main+0)+2,f
u1023:
	movf	3+(??_main+4)+0,w
	skipnc
	incf	3+(??_main+4)+0,w
	addwf	(??_main+0)+3,f
	movf	3+(??_main+0)+0,w
	movwf	(___lldiv@dividend+3)
	movf	2+(??_main+0)+0,w
	movwf	(___lldiv@dividend+2)
	movf	1+(??_main+0)+0,w
	movwf	(___lldiv@dividend+1)
	movf	0+(??_main+0)+0,w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv_198+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv_198+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv_198+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@bat_mv_198)^080h

	line	298
	
l1504:	
;SC8F096_ADC.c: 298: uart_send_string("B");
	movlw	(low((((STR_18)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	299
	
l1506:	
;SC8F096_ADC.c: 299: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	300
	
l1508:	
;SC8F096_ADC.c: 300: uart_send_string("=");
	movlw	(low((((STR_19)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	301
	
l1510:	
;SC8F096_ADC.c: 301: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	302
	
l1512:	
;SC8F096_ADC.c: 302: uart_send_string(" BAT(");
	movlw	(low((((STR_20)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	303
	
l1514:	
;SC8F096_ADC.c: 303: uart_send_number((unsigned int)bat_mv);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bat_mv_198+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@bat_mv_198)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	304
	
l1516:	
;SC8F096_ADC.c: 304: uart_send_string("mV) ");
	movlw	(low((((STR_21)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	305
;SC8F096_ADC.c: 305: }
	goto	l303
	line	308
	
l1518:	
;SC8F096_ADC.c: 306: else
;SC8F096_ADC.c: 307: {
;SC8F096_ADC.c: 308: uart_send_string("B");
	movlw	(low((((STR_22)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	309
;SC8F096_ADC.c: 309: uart_send_number(bx+1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@bx)^080h,w
	movwf	(uart_send_number@num)
	clrf	(uart_send_number@num+1)
	incf	(uart_send_number@num),f
	skipnz
	incf	(uart_send_number@num+1),f
	fcall	_uart_send_number
	line	310
;SC8F096_ADC.c: 310: uart_send_string("=");
	movlw	(low((((STR_23)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	311
;SC8F096_ADC.c: 311: uart_send_number(vdd_buf[bx]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(main@bx)^080h,w
	addlw	low(main@vdd_buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(uart_send_number@num)
	incf	fsr0,f
	movf	indf,w
	movwf	(uart_send_number@num+1)
	fcall	_uart_send_number
	line	312
;SC8F096_ADC.c: 312: uart_send_string(" ?[");
	movlw	(low((((STR_24)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	313
;SC8F096_ADC.c: 313: uart_send_number((unsigned int)vx_mv);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@vx_mv_199+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@vx_mv_199)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	314
;SC8F096_ADC.c: 314: uart_send_string("mV) ");
	movlw	(low((((STR_25)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	316
	
l303:	
	line	317
;SC8F096_ADC.c: 315: }
;SC8F096_ADC.c: 316: }
;SC8F096_ADC.c: 317: uart_send_string(" ");
	movlw	(low((((STR_26)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	278
	
l1520:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@bx)^080h,f
	
l1522:	
	movlw	low(0Ch)
	subwf	(main@bx)^080h,w
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l1494
u1030:
	line	322
	
l1524:	
;SC8F096_ADC.c: 322: test_adc = ADC_Sample(18, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(012h)
	fcall	_ADC_Sample
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_test_adc)^080h	;volatile
	line	323
	
l1526:	
;SC8F096_ADC.c: 323: if(0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)^080h),w	;volatile
	btfss	status,2
	goto	u1041
	goto	u1040
u1041:
	goto	l1566
u1040:
	line	325
	
l1528:	
;SC8F096_ADC.c: 324: {
;SC8F096_ADC.c: 325: unsigned int ntc_adc = adresult;
	movf	(_adresult+1)^080h,w	;volatile
	movwf	(main@ntc_adc+1)^080h
	movf	(_adresult)^080h,w	;volatile
	movwf	(main@ntc_adc)^080h
	line	327
	
l1530:	
;SC8F096_ADC.c: 327: uart_send_string(" NTC=");
	movlw	(low((((STR_27)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	328
	
l1532:	
;SC8F096_ADC.c: 328: uart_send_number(ntc_adc);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@ntc_adc+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@ntc_adc)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	330
;SC8F096_ADC.c: 330: if(ntc_adc < 100)
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(main@ntc_adc+1)^080h,w
	movlw	064h
	skipnz
	subwf	(main@ntc_adc)^080h,w
	skipnc
	goto	u1051
	goto	u1050
u1051:
	goto	l1536
u1050:
	line	332
	
l1534:	
;SC8F096_ADC.c: 331: {
;SC8F096_ADC.c: 332: uart_send_string(" T=SHORT");
	movlw	(low((((STR_28)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	333
;SC8F096_ADC.c: 333: }
	goto	l1566
	line	334
	
l1536:	
;SC8F096_ADC.c: 334: else if(ntc_adc > 3996)
	movlw	0Fh
	subwf	(main@ntc_adc+1)^080h,w
	movlw	09Dh
	skipnz
	subwf	(main@ntc_adc)^080h,w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l1540
u1060:
	line	336
	
l1538:	
;SC8F096_ADC.c: 335: {
;SC8F096_ADC.c: 336: uart_send_string(" T=OPEN");
	movlw	(low((((STR_29)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	337
;SC8F096_ADC.c: 337: }
	goto	l1566
	line	340
	
l1540:	
;SC8F096_ADC.c: 338: else
;SC8F096_ADC.c: 339: {
;SC8F096_ADC.c: 340: unsigned long rt = (unsigned long)ntc_adc * 10000UL / (4096UL - ntc_adc);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	010h
	movwf	(___lldiv@divisor+1)
	movlw	0
	movwf	(___lldiv@divisor)

	bsf	status, 5	;RP0=1, select bank1
	movf	(main@ntc_adc)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+0)+0)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@ntc_adc+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_main+0)+0+1)
	clrf	((??_main+0)+0+2)
	clrf	((??_main+0)+0+3)
	movf	0+(??_main+0)+0,w
	subwf	(___lldiv@divisor),f
	movf	1+(??_main+0)+0,w
	skipc
	incfsz	1+(??_main+0)+0,w
	goto	u1075
	goto	u1076
u1075:
	subwf	(___lldiv@divisor+1),f
u1076:
	movf	2+(??_main+0)+0,w
	skipc
	incfsz	2+(??_main+0)+0,w
	goto	u1077
	goto	u1078
u1077:
	subwf	(___lldiv@divisor+2),f
u1078:
	movf	3+(??_main+0)+0,w
	skipc
	incfsz	3+(??_main+0)+0,w
	goto	u1079
	goto	u1070
u1079:
	subwf	(___lldiv@divisor+3),f
u1070:

	bsf	status, 5	;RP0=1, select bank1
	movf	(main@ntc_adc)^080h,w
	movwf	(___lmul@multiplier)
	movf	(main@ntc_adc+1)^080h,w
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
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@rt+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@rt+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@rt+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@rt)^080h

	line	342
	
l1542:	
;SC8F096_ADC.c: 341: unsigned int temp_x10;
;SC8F096_ADC.c: 342: if(rt >= 10000UL)
		movf	(main@rt+3)^080h,w
	btfss	status,2
	goto	u1080
	movf	(main@rt+2)^080h,w
	btfss	status,2
	goto	u1080
	movlw	39
	subwf	(main@rt+1)^080h,w
	skipz
	goto	u1083
	movlw	16
	subwf	(main@rt)^080h,w
	skipz
	goto	u1083
u1083:
	btfss	status,0
	goto	u1081
	goto	u1080

u1081:
	goto	l1548
u1080:
	line	343
	
l1544:	
;SC8F096_ADC.c: 343: temp_x10 = 250U - (unsigned int)((rt - 10000UL) * 10UL / 445UL);
	movlw	0FAh
	movwf	(main@temp_x10)^080h
	clrf	(main@temp_x10+1)^080h
	
l1546:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	01h
	movwf	(___lldiv@divisor+1)
	movlw	0BDh
	movwf	(___lldiv@divisor)

	movlw	0F0h
	movwf	((??_main+0)+0)
	movlw	0D8h
	movwf	((??_main+0)+0+1)
	movlw	0FFh
	movwf	((??_main+0)+0+2)
	movlw	0FFh
	movwf	((??_main+0)+0+3)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@rt)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(??_main+0)+0,f
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@rt+1)^080h,w
	skipnc
	incfsz	(main@rt+1)^080h,w
	goto	u1090
	goto	u1091
u1090:
	bcf	status, 5	;RP0=0, select bank0
	addwf	(??_main+0)+1,f
u1091:
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@rt+2)^080h,w
	skipnc
	incfsz	(main@rt+2)^080h,w
	goto	u1092
	goto	u1093
u1092:
	bcf	status, 5	;RP0=0, select bank0
	addwf	(??_main+0)+2,f
u1093:
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@rt+3)^080h,w
	skipnc
	incf	(main@rt+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(??_main+0)+3,f
	movf	3+(??_main+0)+0,w
	movwf	(___lmul@multiplier+3)
	movf	2+(??_main+0)+0,w
	movwf	(___lmul@multiplier+2)
	movf	1+(??_main+0)+0,w
	movwf	(___lmul@multiplier+1)
	movf	0+(??_main+0)+0,w
	movwf	(___lmul@multiplier)

	movlw	0Ah
	movwf	(___lmul@multiplicand)
	clrf	(___lmul@multiplicand+1)
	clrf	(___lmul@multiplicand+2)
	clrf	(___lmul@multiplicand+3)

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
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@temp_x10)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	skipc
	decf	(main@temp_x10+1)^080h,f
	subwf	(main@temp_x10+1)^080h,f
	goto	l1552
	line	345
	
l1548:	
;SC8F096_ADC.c: 344: else
;SC8F096_ADC.c: 345: temp_x10 = 250U + (unsigned int)((10000UL - rt) * 10UL / 445UL);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor+3)
	movlw	0
	movwf	(___lldiv@divisor+2)
	movlw	01h
	movwf	(___lldiv@divisor+1)
	movlw	0BDh
	movwf	(___lldiv@divisor)

	movlw	0
	movwf	(___lmul@multiplier+3)
	movlw	0
	movwf	(___lmul@multiplier+2)
	movlw	027h
	movwf	(___lmul@multiplier+1)
	movlw	010h
	movwf	(___lmul@multiplier)

	bsf	status, 5	;RP0=1, select bank1
	movf	(main@rt)^080h,w
	subwf	(___lmul@multiplier),f
	movf	(main@rt+1)^080h,w
	skipc
	incfsz	(main@rt+1)^080h,w
	goto	u1105
	goto	u1106
u1105:
	subwf	(___lmul@multiplier+1),f
u1106:
	movf	(main@rt+2)^080h,w
	skipc
	incfsz	(main@rt+2)^080h,w
	goto	u1107
	goto	u1108
u1107:
	subwf	(___lmul@multiplier+2),f
u1108:
	movf	(main@rt+3)^080h,w
	skipc
	incfsz	(main@rt+3)^080h,w
	goto	u1109
	goto	u1100
u1109:
	subwf	(___lmul@multiplier+3),f
u1100:

	movlw	0Ah
	movwf	(___lmul@multiplicand)
	clrf	(___lmul@multiplicand+1)
	clrf	(___lmul@multiplicand+2)
	clrf	(___lmul@multiplicand+3)

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
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@temp_x10+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@temp_x10)^080h
	
l1550:	
	movlw	0FAh
	addwf	(main@temp_x10)^080h,f
	skipnc
	incf	(main@temp_x10+1)^080h,f
	line	347
	
l1552:	
;SC8F096_ADC.c: 347: uart_send_string(" T=");
	movlw	(low((((STR_30)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	348
	
l1554:	
;SC8F096_ADC.c: 348: uart_send_number(temp_x10 / 10);
	movlw	0Ah
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temp_x10+1)^080h,w
	movwf	(___lwdiv@dividend+1)
	movf	(main@temp_x10)^080h,w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_main$526+1)^080h
	movf	(0+(?___lwdiv)),w
	movwf	(_main$526)^080h
	
l1556:	
;SC8F096_ADC.c: 348: uart_send_number(temp_x10 / 10);
	movf	(_main$526+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(_main$526)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	349
	
l1558:	
;SC8F096_ADC.c: 349: uart_send_string(".");
	movlw	(low((((STR_31)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	350
	
l1560:	
;SC8F096_ADC.c: 350: uart_send_number(temp_x10 % 10);
	movlw	0Ah
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@temp_x10+1)^080h,w
	movwf	(___lwmod@dividend+1)
	movf	(main@temp_x10)^080h,w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_main$527+1)^080h
	movf	(0+(?___lwmod)),w
	movwf	(_main$527)^080h
	
l1562:	
;SC8F096_ADC.c: 350: uart_send_number(temp_x10 % 10);
	movf	(_main$527+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(_main$527)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	351
	
l1564:	
;SC8F096_ADC.c: 351: uart_send_string("C");
	movlw	(low((((STR_32)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	355
	
l1566:	
;SC8F096_ADC.c: 352: }
;SC8F096_ADC.c: 353: }
;SC8F096_ADC.c: 355: uart_send_string("\r\n VCC=");
	movlw	(low((((STR_33)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	356
	
l1568:	
;SC8F096_ADC.c: 356: uart_send_number(vcc_mv);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@vcc_mv+1)^080h,w
	movwf	(uart_send_number@num+1)
	movf	(main@vcc_mv)^080h,w
	movwf	(uart_send_number@num)
	fcall	_uart_send_number
	line	357
	
l1570:	
;SC8F096_ADC.c: 357: uart_send_string("mV\r\n");
	movlw	(low((((STR_34)-__stringbase)|8000h)))&0ffh
	fcall	_uart_send_string
	line	359
# 359 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	goto	l290
	global	start
	ljmp	start
	opt stack 0
	line	361
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_send_string

;; *************** function _uart_send_string *****************
;; Defined at:
;;		line 151 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> STR_34(5), STR_33(8), STR_32(2), STR_31(2), 
;;		 -> STR_30(4), STR_29(8), STR_28(9), STR_27(6), 
;;		 -> STR_26(2), STR_25(5), STR_24(4), STR_23(2), 
;;		 -> STR_22(2), STR_21(5), STR_20(6), STR_19(2), 
;;		 -> STR_18(2), STR_17(6), STR_16(2), STR_15(2), 
;;		 -> STR_14(4), STR_13(2), STR_12(4), STR_11(4), 
;;		 -> STR_10(2), STR_9(2), STR_8(4), STR_7(6), 
;;		 -> STR_6(2), STR_5(2), STR_4(6), STR_3(2), 
;;		 -> STR_2(2), STR_1(18), 
;; Auto vars:     Size  Location     Type
;;  str             1    5[COMMON] PTR const unsigned char 
;;		 -> STR_34(5), STR_33(8), STR_32(2), STR_31(2), 
;;		 -> STR_30(4), STR_29(8), STR_28(9), STR_27(6), 
;;		 -> STR_26(2), STR_25(5), STR_24(4), STR_23(2), 
;;		 -> STR_22(2), STR_21(5), STR_20(6), STR_19(2), 
;;		 -> STR_18(2), STR_17(6), STR_16(2), STR_15(2), 
;;		 -> STR_14(4), STR_13(2), STR_12(4), STR_11(4), 
;;		 -> STR_10(2), STR_9(2), STR_8(4), STR_7(6), 
;;		 -> STR_6(2), STR_5(2), STR_4(6), STR_3(2), 
;;		 -> STR_2(2), STR_1(18), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_send_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	151
global __ptext1
__ptext1:	;psect for function _uart_send_string
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	151
	global	__size_of_uart_send_string
	__size_of_uart_send_string	equ	__end_of_uart_send_string-_uart_send_string
	
_uart_send_string:	
;incstack = 0
	opt	stack 5
; Regs used in _uart_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_send_string@str stored from wreg
	movwf	(uart_send_string@str)
	line	153
	
l1278:	
;SC8F096_ADC.c: 153: while(*str) uart_send_char(*str++);
	goto	l1284
	
l1280:	
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_send_char
	
l1282:	
	incf	(uart_send_string@str),f
	
l1284:	
	movf	(uart_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	xorlw	0
	skipz
	goto	u811
	goto	u810
u811:
	goto	l1280
u810:
	line	154
	
l276:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_string
	__end_of_uart_send_string:
	signat	_uart_send_string,4217
	global	_uart_send_number

;; *************** function _uart_send_number *****************
;; Defined at:
;;		line 156 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;  num             2    9[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  buf             6    0[BANK0 ] unsigned char [6]
;;  j               1    7[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       8       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_uart_send_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	156
global __ptext2
__ptext2:	;psect for function _uart_send_number
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	156
	global	__size_of_uart_send_number
	__size_of_uart_send_number	equ	__end_of_uart_send_number-_uart_send_number
	
_uart_send_number:	
;incstack = 0
	opt	stack 5
; Regs used in _uart_send_number: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	159
	
l1286:	
;SC8F096_ADC.c: 158: unsigned char buf[6];
;SC8F096_ADC.c: 159: unsigned char i = 0, j;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(uart_send_number@i)
	line	160
	
l1288:	
;SC8F096_ADC.c: 160: if(num == 0) { uart_send_char('0'); return; }
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u821
	goto	u820
u821:
	goto	l1300
u820:
	
l1290:	
	movlw	low(030h)
	fcall	_uart_send_char
	goto	l280
	line	161
	
l1294:	
	bcf	status, 5	;RP0=0, select bank0
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
	
l1296:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(uart_send_number@i),f
	
l1298:	
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
	
l1300:	
	movf	((uart_send_number@num)),w
iorwf	((uart_send_number@num+1)),w
	btfss	status,2
	goto	u831
	goto	u830
u831:
	goto	l1294
u830:
	line	162
	
l1302:	
;SC8F096_ADC.c: 162: for(j = i; j > 0; j--) uart_send_char(buf[j-1]);
	bcf	status, 5	;RP0=0, select bank0
	movf	(uart_send_number@i),w
	movwf	(uart_send_number@j)
	
l1304:	
	movf	((uart_send_number@j)),w
	btfss	status,2
	goto	u841
	goto	u840
u841:
	goto	l1308
u840:
	goto	l280
	
l1308:	
	movf	(uart_send_number@j),w
	addlw	0FFh
	addlw	low(uart_send_number@buf|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_uart_send_char
	
l1310:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(uart_send_number@j),f
	goto	l1304
	line	163
	
l280:	
	return
	opt stack 0
GLOBAL	__end_of_uart_send_number
	__end_of_uart_send_number:
	signat	_uart_send_number,4217
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 134 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    3[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_string
;;		_uart_send_number
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	134
global __ptext3
__ptext3:	;psect for function _uart_send_char
psect	text3
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	134
	global	__size_of_uart_send_char
	__size_of_uart_send_char	equ	__end_of_uart_send_char-_uart_send_char
	
_uart_send_char:	
;incstack = 0
	opt	stack 5
; Regs used in _uart_send_char: [wreg+status,2+status,0]
;uart_send_char@c stored from wreg
	movwf	(uart_send_char@c)
	line	137
	
l1140:	
;SC8F096_ADC.c: 136: unsigned char i;
;SC8F096_ADC.c: 137: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	138
;SC8F096_ADC.c: 138: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	139
	
l1142:	
;SC8F096_ADC.c: 139: _delay((unsigned long)((104)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	138
movwf	((??_uart_send_char+0)+0),f
	u1127:
decfsz	(??_uart_send_char+0)+0,f
	goto	u1127
	nop
opt asmopt_pop

	line	140
	
l1144:	
;SC8F096_ADC.c: 140: for(i = 0; i < 8; i++)
	clrf	(uart_send_char@i)
	line	141
	
l266:	
	line	142
;SC8F096_ADC.c: 141: {
;SC8F096_ADC.c: 142: if(c & 0x01) RC4 = 1; else RC4 = 0;
	btfss	(uart_send_char@c),(0)&7
	goto	u561
	goto	u560
u561:
	goto	l268
u560:
	
l1150:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	goto	l1152
	
l268:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	143
	
l1152:	
;SC8F096_ADC.c: 143: _delay((unsigned long)((104)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	138
movwf	((??_uart_send_char+0)+0),f
	u1137:
decfsz	(??_uart_send_char+0)+0,f
	goto	u1137
	nop
opt asmopt_pop

	line	144
	
l1154:	
;SC8F096_ADC.c: 144: c >>= 1;
	clrc
	rrf	(uart_send_char@c),f
	line	140
	
l1156:	
	incf	(uart_send_char@i),f
	
l1158:	
	movlw	low(08h)
	subwf	(uart_send_char@i),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l266
u570:
	
l267:	
	line	146
;SC8F096_ADC.c: 145: }
;SC8F096_ADC.c: 146: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	147
	
l1160:	
;SC8F096_ADC.c: 147: _delay((unsigned long)((104)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	138
movwf	((??_uart_send_char+0)+0),f
	u1147:
decfsz	(??_uart_send_char+0)+0,f
	goto	u1147
	nop
opt asmopt_pop

	line	148
	
l1162:	
;SC8F096_ADC.c: 148: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	149
	
l270:	
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
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 200/100
;;		On exit  : 200/0
;;		Unchanged: 200/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
global __ptext4
__ptext4:	;psect for function ___lwmod
psect	text4
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
l1190:	
	movf	((___lwmod@divisor)),w
iorwf	((___lwmod@divisor+1)),w
	btfsc	status,2
	goto	u621
	goto	u620
u621:
	goto	l1206
u620:
	line	14
	
l1192:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	l1196
	line	16
	
l1194:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	17
	incf	(___lwmod@counter),f
	line	15
	
l1196:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u631
	goto	u630
u631:
	goto	l1194
u630:
	line	20
	
l1198:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u645
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u645:
	skipc
	goto	u641
	goto	u640
u641:
	goto	l1202
u640:
	line	21
	
l1200:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	22
	
l1202:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	23
	
l1204:	
	decfsz	(___lwmod@counter),f
	goto	u651
	goto	u650
u651:
	goto	l1198
u650:
	line	25
	
l1206:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	26
	
l677:	
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
;;  divisor         2    2[COMMON] unsigned int 
;;  dividend        2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] unsigned int 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 200/100
;;		On exit  : 200/0
;;		Unchanged: 200/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_send_number
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
global __ptext5
__ptext5:	;psect for function ___lwdiv
psect	text5
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l1164:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l1166:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u581
	goto	u580
u581:
	goto	l1186
u580:
	line	16
	
l1168:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l1172
	line	18
	
l1170:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l1172:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u591
	goto	u590
u591:
	goto	l1170
u590:
	line	22
	
l1174:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l1176:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u605
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u605:
	skipc
	goto	u601
	goto	u600
u601:
	goto	l1182
u600:
	line	24
	
l1178:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l1180:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l1182:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l1184:	
	decfsz	(___lwdiv@counter),f
	goto	u611
	goto	u610
u611:
	goto	l1174
u610:
	line	30
	
l1186:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l667:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_sw_uart_init

;; *************** function _sw_uart_init *****************
;; Defined at:
;;		line 127 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
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
;;		On exit  : 300/200
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	127
global __ptext6
__ptext6:	;psect for function _sw_uart_init
psect	text6
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	127
	global	__size_of_sw_uart_init
	__size_of_sw_uart_init	equ	__end_of_sw_uart_init-_sw_uart_init
	
_sw_uart_init:	
;incstack = 0
	opt	stack 6
; Regs used in _sw_uart_init: []
	line	129
	
l1276:	
;SC8F096_ADC.c: 129: TRISC &= ~0x10;
	bsf	status, 6	;RP1=1, select bank2
	bcf	(261)^0100h+(4/8),(4)&7	;volatile
	line	130
;SC8F096_ADC.c: 130: ANSEL2 &= ~0x10;
	bcf	(265)^0100h+(4/8),(4)&7	;volatile
	line	131
;SC8F096_ADC.c: 131: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	132
	
l263:	
	return
	opt stack 0
GLOBAL	__end_of_sw_uart_init
	__end_of_sw_uart_init:
	signat	_sw_uart_init,89
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    2[COMMON] unsigned long 
;;  multiplicand    4    6[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    0[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    2[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 200/100
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       4       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
global __ptext7
__ptext7:	;psect for function ___lmul
psect	text7
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 6
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l1346:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l339:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u851
	goto	u850
u851:
	goto	l1350
u850:
	line	122
	
l1348:	
	movf	(___lmul@multiplicand),w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u861
	addwf	(___lmul@product+1),f
u861:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u862
	addwf	(___lmul@product+2),f
u862:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u863
	addwf	(___lmul@product+3),f
u863:

	line	123
	
l1350:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l1352:	
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
	goto	u871
	goto	u870
u871:
	goto	l339
u870:
	line	128
	
l1354:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l342:	
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
;;  divisor         4    4[BANK0 ] unsigned long 
;;  dividend        4    8[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   12[BANK0 ] unsigned long 
;;  counter         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    4[BANK0 ] unsigned long 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
global __ptext8
__ptext8:	;psect for function ___lldiv
psect	text8
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l1358:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l1360:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u881
	goto	u880
u881:
	goto	l1380
u880:
	line	16
	
l1362:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l1366
	line	18
	
l1364:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l1366:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u891
	goto	u890
u891:
	goto	l1364
u890:
	line	22
	
l1368:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l1370:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u905
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u905
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u905
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u905:
	skipc
	goto	u901
	goto	u900
u901:
	goto	l1376
u900:
	line	24
	
l1372:	
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
	
l1374:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l1376:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l1378:	
	decfsz	(___lldiv@counter),f
	goto	u911
	goto	u910
u911:
	goto	l1368
u910:
	line	30
	
l1380:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l614:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 366 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	366
global __ptext9
__ptext9:	;psect for function _Init_System
psect	text9
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	366
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 6
; Regs used in _Init_System: [wreg+status,2]
	line	368
	
l1314:	
# 368 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
	line	369
# 369 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	text9
	line	370
	
l1316:	
;SC8F096_ADC.c: 370: OPTION_REG = 0x0F;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	371
# 371 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	text9
	line	372
;SC8F096_ADC.c: 372: OSCCON = 0X70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	374
	
l1318:	
;SC8F096_ADC.c: 374: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	375
	
l1320:	
;SC8F096_ADC.c: 375: WPUB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	376
	
l1322:	
;SC8F096_ADC.c: 376: WPUC = 0B00000000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(264)^0100h	;volatile
	line	377
	
l1324:	
;SC8F096_ADC.c: 377: WPUD = 0B00000000;
	clrf	(277)^0100h	;volatile
	line	382
;SC8F096_ADC.c: 382: TRISA = 0xF0; PORTA = 0x0F;
	movlw	low(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	movlw	low(0Fh)
	movwf	(134)^080h	;volatile
	line	383
;SC8F096_ADC.c: 383: TRISB = 0x30; PORTB = 0x4F;
	movlw	low(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	movlw	low(04Fh)
	movwf	(6)	;volatile
	line	384
;SC8F096_ADC.c: 384: TRISC = 0x07; PORTC = 0x00;
	movlw	low(07h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	
l1326:	
	clrf	(262)^0100h	;volatile
	line	385
	
l1328:	
;SC8F096_ADC.c: 385: TRISD = 0xF0; PORTD = 0x0F;
	movlw	low(0F0h)
	movwf	(276)^0100h	;volatile
	
l1330:	
	movlw	low(0Fh)
	movwf	(263)^0100h	;volatile
	line	387
	
l1332:	
;SC8F096_ADC.c: 387: CC0CON = 0;
	bsf	status, 5	;RP0=1, select bank3
	clrf	(405)^0180h	;volatile
	line	388
	
l1334:	
;SC8F096_ADC.c: 388: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	390
	
l1336:	
;SC8F096_ADC.c: 390: PR2 = 249;
	movlw	low(0F9h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	391
	
l1338:	
;SC8F096_ADC.c: 391: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	392
	
l1340:	
;SC8F096_ADC.c: 392: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	393
	
l1342:	
;SC8F096_ADC.c: 393: T2CON = 0B00000100;
	movlw	low(04h)
	movwf	(19)	;volatile
	line	394
	
l1344:	
;SC8F096_ADC.c: 394: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	395
	
l318:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 61 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;;  adldo           1    2[COMMON] unsigned char 
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
;;		On entry : 0/100
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         0      13       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         5      13       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	61
global __ptext10
__ptext10:	;psect for function _ADC_Sample
psect	text10
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	61
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
;incstack = 0
	opt	stack 6
; Regs used in _ADC_Sample: [wreg+status,2+status,0]
;ADC_Sample@adch stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADC_Sample@adch)
	line	63
	
l1210:	
;SC8F096_ADC.c: 63: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	64
	
l1212:	
;SC8F096_ADC.c: 64: volatile unsigned int admin = 0, admax = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	65
;SC8F096_ADC.c: 65: volatile unsigned int ad_temp = 0;
	clrf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	line	68
	
l1214:	
;SC8F096_ADC.c: 68: if((!LDO_EN) && (adldo & 0x04))
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u661
	goto	u660
u661:
	goto	l1220
u660:
	
l1216:	
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u671
	goto	u670
u671:
	goto	l1220
u670:
	line	70
	
l1218:	
;SC8F096_ADC.c: 69: {
;SC8F096_ADC.c: 70: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	71
;SC8F096_ADC.c: 71: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_Sample+0)+0),f
	u1157:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u1157
opt asmopt_pop

	line	72
;SC8F096_ADC.c: 72: }
	goto	l1222
	line	74
	
l1220:	
;SC8F096_ADC.c: 73: else
;SC8F096_ADC.c: 74: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	77
	
l1222:	
;SC8F096_ADC.c: 77: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u681
	goto	u680
u681:
	goto	l245
u680:
	line	79
	
l1224:	
;SC8F096_ADC.c: 78: {
;SC8F096_ADC.c: 79: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	80
	
l1226:	
;SC8F096_ADC.c: 80: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	81
;SC8F096_ADC.c: 81: }
	goto	l1228
	line	82
	
l245:	
	line	83
;SC8F096_ADC.c: 82: else
;SC8F096_ADC.c: 83: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	86
	
l1228:	
;SC8F096_ADC.c: 85: unsigned char i;
;SC8F096_ADC.c: 86: for(i = 0; i < 34; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	88
	
l1234:	
;SC8F096_ADC.c: 87: {
;SC8F096_ADC.c: 88: ADCON0 = (unsigned char)(0x81 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u695:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u695
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	081h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	89
	
l1236:	
;SC8F096_ADC.c: 89: _delay((unsigned long)((5)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	6
movwf	((??_ADC_Sample+0)+0),f
	u1167:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u1167
	nop
opt asmopt_pop

	line	90
	
l1238:	
;SC8F096_ADC.c: 90: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	92
	
l1240:	
;SC8F096_ADC.c: 92: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	93
;SC8F096_ADC.c: 93: while(GODONE)
	goto	l249
	
l250:	
	line	95
;SC8F096_ADC.c: 94: {
;SC8F096_ADC.c: 95: _delay((unsigned long)((2)*(16000000/4000000.0)));
		opt asmopt_push
	opt asmopt_off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	opt asmopt_pop

	line	96
;SC8F096_ADC.c: 96: if(0 == (--j)) return 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(ADC_Sample@j),f
	goto	u701
	goto	u700
u701:
	goto	l249
u700:
	
l1242:	
	movlw	low(0)
	goto	l252
	line	97
	
l249:	
	line	93
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u711
	goto	u710
u711:
	goto	l250
u710:
	line	99
	
l1246:	
;SC8F096_ADC.c: 97: }
;SC8F096_ADC.c: 99: ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));
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
	
l1248:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	101
	
l1250:	
;SC8F096_ADC.c: 101: if(0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u721
	goto	u720
u721:
	goto	l1254
u720:
	line	103
	
l1252:	
;SC8F096_ADC.c: 102: {
;SC8F096_ADC.c: 103: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	line	104
;SC8F096_ADC.c: 104: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	105
;SC8F096_ADC.c: 105: }
	goto	l255
	line	106
	
l1254:	
;SC8F096_ADC.c: 106: else if(ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u735
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u735:
	skipnc
	goto	u731
	goto	u730
u731:
	goto	l1258
u730:
	line	107
	
l1256:	
;SC8F096_ADC.c: 107: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	l255
	line	108
	
l1258:	
;SC8F096_ADC.c: 108: else if(ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u745
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u745:
	skipnc
	goto	u741
	goto	u740
u741:
	goto	l255
u740:
	line	109
	
l1260:	
;SC8F096_ADC.c: 109: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	111
	
l255:	
;SC8F096_ADC.c: 111: adsum += ad_temp;
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
	goto	u751
	addwf	(ADC_Sample@adsum+1),f	;volatile
u751:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u752
	addwf	(ADC_Sample@adsum+2),f	;volatile
u752:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u753
	addwf	(ADC_Sample@adsum+3),f	;volatile
u753:

	line	86
	
l1262:	
	incf	(ADC_Sample@i),f
	
l1264:	
	movlw	low(022h)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u761
	goto	u760
u761:
	goto	l1234
u760:
	line	114
	
l1266:	
;SC8F096_ADC.c: 112: }
;SC8F096_ADC.c: 114: adsum -= admax;
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
	goto	u775
	goto	u776
u775:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u776:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u777
	goto	u778
u777:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u778:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u779
	goto	u770
u779:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u770:

	line	115
;SC8F096_ADC.c: 115: if(adsum >= admin)
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+3),w	;volatile
	skipz
	goto	u785
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u785
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u785
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u785:
	skipc
	goto	u781
	goto	u780
u781:
	goto	l259
u780:
	line	116
	
l1268:	
;SC8F096_ADC.c: 116: adsum -= admin;
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
	goto	u795
	goto	u796
u795:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u796:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u797
	goto	u798
u797:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u798:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u799
	goto	u790
u799:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u790:

	goto	l1270
	line	117
	
l259:	
	line	118
;SC8F096_ADC.c: 117: else
;SC8F096_ADC.c: 118: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	120
	
l1270:	
;SC8F096_ADC.c: 120: adresult = adsum >> 5;
	movf	(ADC_Sample@adsum),w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w	;volatile
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w	;volatile
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	05h
u805:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u800:
	addlw	-1
	skipz
	goto	u805
	movf	1+(??_ADC_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adresult+1)^080h	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)^080h	;volatile
	line	121
	
l1272:	
;SC8F096_ADC.c: 121: return 0xA5;
	movlw	low(0A5h)
	line	122
	
l252:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,8313
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 397 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	397
global __ptext11
__ptext11:	;psect for function _Isr_Timer
psect	text11
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	397
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
;incstack = 0
	opt	stack 5
; Regs used in _Isr_Timer: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Isr_Timer+0)
	movf	pclath,w
	movwf	(??_Isr_Timer+1)
	ljmp	_Isr_Timer
psect	text11
	line	399
	
i1l1136:	
;SC8F096_ADC.c: 399: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l324
u55_20:
	line	401
	
i1l1138:	
;SC8F096_ADC.c: 400: {
;SC8F096_ADC.c: 401: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	403
	
i1l324:	
	movf	(??_Isr_Timer+1),w
	movwf	pclath
	swapf	(??_Isr_Timer+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Isr_Timer
	__end_of_Isr_Timer:
	signat	_Isr_Timer,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
