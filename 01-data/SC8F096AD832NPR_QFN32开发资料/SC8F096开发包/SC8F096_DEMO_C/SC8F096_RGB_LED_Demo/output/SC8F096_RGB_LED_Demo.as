opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096
opt include "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\sc8f096.cgen.inc"
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
# 13 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
INDF EQU 00H ;# 
# 20 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
OPTION_REG EQU 01H ;# 
# 27 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PCL EQU 02H ;# 
# 34 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
STATUS EQU 03H ;# 
# 41 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
FSR EQU 04H ;# 
# 48 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TRISB EQU 05H ;# 
# 55 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PORTB EQU 06H ;# 
# 62 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPDB EQU 07H ;# 
# 69 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPUB EQU 08H ;# 
# 76 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IOCB EQU 09H ;# 
# 83 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PCLATH EQU 0AH ;# 
# 90 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
INTCON EQU 0BH ;# 
# 97 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
QCCON EQU 0CH ;# 
# 104 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PIR1 EQU 0DH ;# 
# 111 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PIE1 EQU 0EH ;# 
# 118 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CMP1CON0 EQU 0FH ;# 
# 125 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CMP1CON1 EQU 10H ;# 
# 132 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PR2 EQU 11H ;# 
# 139 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TMR2 EQU 12H ;# 
# 146 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
T2CON EQU 13H ;# 
# 153 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
OSCCON EQU 14H ;# 
# 160 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMCON0 EQU 15H ;# 
# 167 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMCON1 EQU 16H ;# 
# 174 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMTL EQU 17H ;# 
# 181 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMTH EQU 18H ;# 
# 188 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMD0L EQU 19H ;# 
# 195 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMD1L EQU 1AH ;# 
# 202 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMD4L EQU 1BH ;# 
# 209 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMT4L EQU 1CH ;# 
# 216 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMCON2 EQU 1DH ;# 
# 223 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMDH EQU 1EH ;# 
# 230 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWM01DT EQU 1FH ;# 
# 237 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TMR0 EQU 81H ;# 
# 244 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TRISA EQU 85H ;# 
# 251 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PORTA EQU 86H ;# 
# 258 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPDA EQU 87H ;# 
# 265 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPUA EQU 88H ;# 
# 272 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IOCA EQU 89H ;# 
# 279 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ANSEL3 EQU 8CH ;# 
# 286 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EECON1 EQU 8DH ;# 
# 293 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EECON2 EQU 8EH ;# 
# 300 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EEDAT EQU 8FH ;# 
# 307 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EEDATH EQU 90H ;# 
# 314 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EEADR EQU 91H ;# 
# 321 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
EEADRH EQU 92H ;# 
# 328 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ANSEL0 EQU 93H ;# 
# 335 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ANSEL1 EQU 94H ;# 
# 342 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ADCON0 EQU 95H ;# 
# 349 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ADCON1 EQU 96H ;# 
# 356 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ADRESL EQU 98H ;# 
# 363 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ADRESH EQU 99H ;# 
# 370 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CMP2CON0 EQU 9AH ;# 
# 377 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMD2L EQU 9BH ;# 
# 384 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWMD3L EQU 9CH ;# 
# 391 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PWM23DT EQU 9DH ;# 
# 398 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SEGEN0 EQU 9EH ;# 
# 405 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CMP2CON1 EQU 9FH ;# 
# 412 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TRISC EQU 105H ;# 
# 419 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PORTC EQU 106H ;# 
# 426 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PORTD EQU 107H ;# 
# 433 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPUC EQU 108H ;# 
# 440 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
ANSEL2 EQU 109H ;# 
# 447 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TMR1L EQU 10CH ;# 
# 454 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TMR1H EQU 10DH ;# 
# 461 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
T1CON EQU 10EH ;# 
# 468 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PIR2 EQU 10FH ;# 
# 475 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PIE2 EQU 110H ;# 
# 482 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
KEYCON0 EQU 111H ;# 
# 489 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
KEYCON1 EQU 112H ;# 
# 496 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
KEYCON2 EQU 113H ;# 
# 503 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TRISD EQU 114H ;# 
# 510 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
WPUD EQU 115H ;# 
# 517 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
KEYDATAL EQU 116H ;# 
# 524 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
KEYDATAH EQU 117H ;# 
# 531 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TXSTA0 EQU 118H ;# 
# 538 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
RCSTA0 EQU 119H ;# 
# 545 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SPBRG0 EQU 11AH ;# 
# 552 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TXREG0 EQU 11BH ;# 
# 559 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
RCREG0 EQU 11CH ;# 
# 566 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LCDCON0 EQU 11DH ;# 
# 573 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LCDCON1 EQU 11EH ;# 
# 580 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SEGEN1 EQU 11FH ;# 
# 587 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SEGEN2 EQU 181H ;# 
# 594 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TXSTA1 EQU 185H ;# 
# 601 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
RCSTA1 EQU 186H ;# 
# 608 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
TXREG1 EQU 187H ;# 
# 615 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
RCREG1 EQU 188H ;# 
# 622 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SPBRG1 EQU 189H ;# 
# 629 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
OPACON EQU 18CH ;# 
# 636 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
OPAADJ EQU 18DH ;# 
# 643 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LEDCTR0 EQU 18EH ;# 
# 650 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LEDCTR1 EQU 18FH ;# 
# 657 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IICCON EQU 190H ;# 
# 664 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IICCON2 EQU 191H ;# 
# 671 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IICSTAT EQU 192H ;# 
# 678 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IICBUF EQU 193H ;# 
# 685 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
IICADD EQU 194H ;# 
# 692 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CC0CON EQU 195H ;# 
# 699 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
CC1CON EQU 196H ;# 
# 706 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PDCON0 EQU 197H ;# 
# 713 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PDCON1 EQU 198H ;# 
# 720 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PDADD EQU 199H ;# 
# 727 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PDRDATA EQU 19AH ;# 
# 734 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
PDSDATA EQU 19BH ;# 
# 741 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LCDADD EQU 19CH ;# 
# 748 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
LCDDATA EQU 19DH ;# 
# 755 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
COMEN EQU 19EH ;# 
# 762 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta12\data\include\SC8F096.h"
SEGEN3 EQU 19FH ;# 
	FNCALL	_main,_LED_B
	FNCALL	_main,_LED_B1
	FNCALL	_main,_LED_G
	FNCALL	_main,_LED_G1
	FNCALL	_main,_LED_R
	FNCALL	_main,_LED_R1
	FNCALL	_main,_Led_Moudle_Device
	FNCALL	_main,_Set_LED_Moudle
	FNROOT	_main
	FNCALL	intlevel1,_Timer_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_dis_buf
	global	Timer_Isr@tcount
	global	_led_c
	global	_B_MainLoop
	global	_OSCCON
psect	text0,local,class=CODE,delta=2,merge=1
global __ptext0
__ptext0:
_OSCCON	set	20
	global	_T2CON
_T2CON	set	19
	global	_PR2
_PR2	set	17
	global	_PIE1
_PIE1	set	14
	global	_PIR1
_PIR1	set	13
	global	_INTCON
_INTCON	set	11
	global	_TRISB
_TRISB	set	5
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_TMR2IE
_TMR2IE	set	0x71
	global	_TMR2IF
_TMR2IF	set	0x69
	global	_TRISA
_TRISA	set	133
	global	_TRISA5
_TRISA5	set	0x42D
	global	_PIE2
_PIE2	set	272
	global	_PIR2
_PIR2	set	271
	global	_TRISC
_TRISC	set	261
	global	_PDSDATA
_PDSDATA	set	411
	global	_LEDCTR1
_LEDCTR1	set	399
	global	_LEDCTR0
_LEDCTR0	set	398
	global	_IF_30
_IF_30	set	0xC74
	global	_IF_15
_IF_15	set	0xC75
	global	_LEDSW_ST
_LEDSW_ST	set	0xC70
	global	_LEDSW_RT
_LEDSW_RT	set	0xC76
; #config settings
	file	"SC8F096_RGB_LED_Demo.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_B_MainLoop:
       ds      1

psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_dis_buf:
       ds      4

Timer_Isr@tcount:
       ds      1

_led_c:
       ds      1

	file	"SC8F096_RGB_LED_Demo.as"
	line	#
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
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
?_Set_LED_Moudle:	; 1 bytes @ 0x0
?_LED_B:	; 1 bytes @ 0x0
?_LED_G:	; 1 bytes @ 0x0
?_LED_R:	; 1 bytes @ 0x0
?_LED_B1:	; 1 bytes @ 0x0
?_LED_G1:	; 1 bytes @ 0x0
?_LED_R1:	; 1 bytes @ 0x0
?_Led_Moudle_Device:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Timer_Isr:	; 1 bytes @ 0x0
??_Timer_Isr:	; 1 bytes @ 0x0
	ds	2
??_Set_LED_Moudle:	; 1 bytes @ 0x2
??_LED_B:	; 1 bytes @ 0x2
??_LED_G:	; 1 bytes @ 0x2
??_LED_R:	; 1 bytes @ 0x2
??_LED_B1:	; 1 bytes @ 0x2
??_LED_G1:	; 1 bytes @ 0x2
??_LED_R1:	; 1 bytes @ 0x2
??_Led_Moudle_Device:	; 1 bytes @ 0x2
	global	Led_Moudle_Device@i
Led_Moudle_Device@i:	; 1 bytes @ 0x2
	ds	1
??_main:	; 1 bytes @ 0x3
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         6
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      3      10
;!    BANK0            80      0       0
;!    BANK1            80      0       0
;!    BANK3            80      0       0
;!    BANK2            80      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_Led_Moudle_Device
;!
;!Critical Paths under _Timer_Isr in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _Timer_Isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _Timer_Isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _Timer_Isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _Timer_Isr in BANK2
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
;! (0) _main                                                 0     0      0     150
;!                              _LED_B
;!                             _LED_B1
;!                              _LED_G
;!                             _LED_G1
;!                              _LED_R
;!                             _LED_R1
;!                  _Led_Moudle_Device
;!                     _Set_LED_Moudle
;! ---------------------------------------------------------------------------------
;! (1) _Set_LED_Moudle                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Led_Moudle_Device                                    1     1      0     150
;!                                              2 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _LED_R1                                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_R                                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_G1                                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_G                                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_B1                                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LED_B                                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (2) _Timer_Isr                                            2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _LED_B
;!   _LED_B1
;!   _LED_G
;!   _LED_G1
;!   _LED_R
;!   _LED_R1
;!   _Led_Moudle_Device
;!   _Set_LED_Moudle
;!
;! _Timer_Isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       1       0        7.1%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      3       A       1       71.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITBANK1            50      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BANK1               50      0       0       6        0.0%
;!BITBANK3            50      0       0       7        0.0%
;!BANK3               50      0       0       8        0.0%
;!BITBANK2            50      0       0       9        0.0%
;!BANK2               50      0       0      10        0.0%
;!ABS                  0      0       A      11        0.0%
;!DATA                 0      0       A      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 18 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
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
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LED_B
;;		_LED_B1
;;		_LED_G
;;		_LED_G1
;;		_LED_R
;;		_LED_R1
;;		_Led_Moudle_Device
;;		_Set_LED_Moudle
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	18
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	18
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	20
	
l869:	
# 20 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
nop ;# 
	line	21
# 21 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	maintext
	line	23
	
l871:	
;SC8F096_RGB_LED_Demo.c: 23: OPTION_REG = 0X0F;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	24
# 24 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	maintext
	line	25
;SC8F096_RGB_LED_Demo.c: 25: OSCCON = 0x70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	26
	
l873:	
;SC8F096_RGB_LED_Demo.c: 26: INTCON = 0;
	clrf	(11)	;volatile
	line	28
	
l875:	
;SC8F096_RGB_LED_Demo.c: 28: PIR1 = 0;
	clrf	(13)	;volatile
	line	29
	
l877:	
;SC8F096_RGB_LED_Demo.c: 29: PIE1 = 0;
	clrf	(14)	;volatile
	line	30
	
l879:	
;SC8F096_RGB_LED_Demo.c: 30: PIR2 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(271)^0100h	;volatile
	line	31
	
l881:	
;SC8F096_RGB_LED_Demo.c: 31: PIE2 = 0;
	clrf	(272)^0100h	;volatile
	line	33
	
l883:	
;SC8F096_RGB_LED_Demo.c: 33: Set_LED_Moudle();
	fcall	_Set_LED_Moudle
	line	36
	
l885:	
;SC8F096_RGB_LED_Demo.c: 36: PR2 = 124;
	movlw	low(07Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(17)	;volatile
	line	37
	
l887:	
;SC8F096_RGB_LED_Demo.c: 37: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	38
	
l889:	
;SC8F096_RGB_LED_Demo.c: 38: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	39
	
l891:	
;SC8F096_RGB_LED_Demo.c: 39: T2CON = 0x07;
	movlw	low(07h)
	movwf	(19)	;volatile
	line	41
	
l893:	
;SC8F096_RGB_LED_Demo.c: 41: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	43
	
l895:	
;SC8F096_RGB_LED_Demo.c: 43: TRISC = 0B00000000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	44
	
l897:	
;SC8F096_RGB_LED_Demo.c: 44: TRISB = 0B00000000;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	45
	
l899:	
;SC8F096_RGB_LED_Demo.c: 45: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	47
	
l901:	
;SC8F096_RGB_LED_Demo.c: 47: dis_buf[0] = 0X1;
	movlw	low(01h)
	movwf	(_dis_buf)	;volatile
	line	48
	
l903:	
;SC8F096_RGB_LED_Demo.c: 48: dis_buf[1] = 0X0;
	clrf	0+(_dis_buf)+01h	;volatile
	line	49
	
l905:	
;SC8F096_RGB_LED_Demo.c: 49: dis_buf[2] = 0X0;
	clrf	0+(_dis_buf)+02h	;volatile
	line	53
	
l907:	
;SC8F096_RGB_LED_Demo.c: 52: {
;SC8F096_RGB_LED_Demo.c: 53: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u161
	goto	u160
u161:
	goto	l907
u160:
	line	55
	
l909:	
;SC8F096_RGB_LED_Demo.c: 54: {
;SC8F096_RGB_LED_Demo.c: 55: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	56
# 56 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	maintext
	line	57
;SC8F096_RGB_LED_Demo.c: 57: switch(led_c)
	goto	l927
	line	59
	
l911:	
	fcall	_LED_B
	goto	l929
	line	60
	
l913:	
	fcall	_LED_G
	goto	l929
	line	61
	
l915:	
	fcall	_LED_R
	goto	l929
	line	62
	
l917:	
	fcall	_LED_B1
	goto	l929
	line	64
	
l919:	
	fcall	_LED_G1
	goto	l929
	line	65
	
l921:	
	fcall	_LED_R1
	goto	l929
	line	67
	
l923:	
	clrf	(_led_c)	;volatile
	goto	l929
	line	57
	
l927:	
	movf	(_led_c),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           26     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l911
	xorlw	1^0	; case 1
	skipnz
	goto	l913
	xorlw	2^1	; case 2
	skipnz
	goto	l915
	xorlw	3^2	; case 3
	skipnz
	goto	l917
	xorlw	4^3	; case 4
	skipnz
	goto	l919
	xorlw	5^4	; case 5
	skipnz
	goto	l921
	goto	l923
	opt asmopt_pop

	line	70
	
l929:	
;SC8F096_RGB_LED_Demo.c: 70: Led_Moudle_Device();
	fcall	_Led_Moudle_Device
	goto	l907
	global	start
	ljmp	start
	opt stack 0
	line	74
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Set_LED_Moudle

;; *************** function _Set_LED_Moudle *****************
;; Defined at:
;;		line 98 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	98
global __ptext1
__ptext1:	;psect for function _Set_LED_Moudle
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	98
	global	__size_of_Set_LED_Moudle
	__size_of_Set_LED_Moudle	equ	__end_of_Set_LED_Moudle-_Set_LED_Moudle
	
_Set_LED_Moudle:	
;incstack = 0
	opt	stack 6
; Regs used in _Set_LED_Moudle: [wreg]
	line	100
	
l713:	
;SC8F096_RGB_LED_Demo.c: 100: LEDCTR0 = 0B11000000;
	movlw	low(0C0h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(398)^0180h	;volatile
	line	128
	
l715:	
;SC8F096_RGB_LED_Demo.c: 128: TRISA5 =0;
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1069/8)^080h,(1069)&7	;volatile
	line	130
	
l282:	
	return
	opt stack 0
GLOBAL	__end_of_Set_LED_Moudle
	__end_of_Set_LED_Moudle:
	signat	_Set_LED_Moudle,89
	global	_Led_Moudle_Device

;; *************** function _Led_Moudle_Device *****************
;; Defined at:
;;		line 139 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 300/300
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	139
global __ptext2
__ptext2:	;psect for function _Led_Moudle_Device
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	139
	global	__size_of_Led_Moudle_Device
	__size_of_Led_Moudle_Device	equ	__end_of_Led_Moudle_Device-_Led_Moudle_Device
	
_Led_Moudle_Device:	
;incstack = 0
	opt	stack 6
; Regs used in _Led_Moudle_Device: [wreg+status,2+status,0]
	line	141
	
l759:	
	line	142
	
l761:	
;SC8F096_RGB_LED_Demo.c: 142: LEDCTR0 = 0X80;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	143
	
l763:	
;SC8F096_RGB_LED_Demo.c: 143: LEDCTR1 = 0X80;
	movlw	low(080h)
	movwf	(399)^0180h	;volatile
	line	154
	
l765:	
;SC8F096_RGB_LED_Demo.c: 154: LEDSW_RT = 1;
	bsf	(3190/8)^0180h,(3190)&7	;volatile
	line	155
;SC8F096_RGB_LED_Demo.c: 155: for(i=0;i<10;i++)
	clrf	(Led_Moudle_Device@i)
	line	157
	
l771:	
;SC8F096_RGB_LED_Demo.c: 156: {
;SC8F096_RGB_LED_Demo.c: 157: PDSDATA = dis_buf[0];
	movf	(_dis_buf),w	;volatile
	movwf	(411)^0180h	;volatile
	line	158
	
l773:	
;SC8F096_RGB_LED_Demo.c: 158: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	159
	
l775:	
;SC8F096_RGB_LED_Demo.c: 159: PDSDATA = dis_buf[1];
	movf	0+(_dis_buf)+01h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	160
;SC8F096_RGB_LED_Demo.c: 160: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	161
	
l777:	
;SC8F096_RGB_LED_Demo.c: 161: PDSDATA = dis_buf[2];
	movf	0+(_dis_buf)+02h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	162
	
l779:	
;SC8F096_RGB_LED_Demo.c: 162: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	155
	
l781:	
	incf	(Led_Moudle_Device@i),f
	
l783:	
	movlw	low(0Ah)
	subwf	(Led_Moudle_Device@i),w
	skipc
	goto	u71
	goto	u70
u71:
	goto	l771
u70:
	
l286:	
	line	164
;SC8F096_RGB_LED_Demo.c: 163: }
;SC8F096_RGB_LED_Demo.c: 164: LEDSW_ST = 1;
	bsf	(3184/8)^0180h,(3184)&7	;volatile
	line	166
;SC8F096_RGB_LED_Demo.c: 166: while(IF_15==0)
	goto	l287
	
l288:	
	line	168
# 168 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	text2
	line	169
	
l287:	
	line	166
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3189/8)^0180h,(3189)&7	;volatile
	goto	u81
	goto	u80
u81:
	goto	l288
u80:
	
l289:	
	line	170
;SC8F096_RGB_LED_Demo.c: 169: }
;SC8F096_RGB_LED_Demo.c: 170: IF_15 = 0;
	bcf	(3189/8)^0180h,(3189)&7	;volatile
	line	171
	
l785:	
;SC8F096_RGB_LED_Demo.c: 171: LEDCTR1 = 0X80;
	movlw	low(080h)
	movwf	(399)^0180h	;volatile
	line	172
	
l787:	
;SC8F096_RGB_LED_Demo.c: 172: for(i=0;i<5;i++)
	clrf	(Led_Moudle_Device@i)
	line	174
	
l793:	
;SC8F096_RGB_LED_Demo.c: 173: {
;SC8F096_RGB_LED_Demo.c: 174: PDSDATA = dis_buf[0];
	movf	(_dis_buf),w	;volatile
	movwf	(411)^0180h	;volatile
	line	175
	
l795:	
;SC8F096_RGB_LED_Demo.c: 175: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	176
	
l797:	
;SC8F096_RGB_LED_Demo.c: 176: PDSDATA = dis_buf[1];
	movf	0+(_dis_buf)+01h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	177
;SC8F096_RGB_LED_Demo.c: 177: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	178
	
l799:	
;SC8F096_RGB_LED_Demo.c: 178: PDSDATA = dis_buf[2];
	movf	0+(_dis_buf)+02h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	179
	
l801:	
;SC8F096_RGB_LED_Demo.c: 179: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	172
	
l803:	
	incf	(Led_Moudle_Device@i),f
	
l805:	
	movlw	low(05h)
	subwf	(Led_Moudle_Device@i),w
	skipc
	goto	u91
	goto	u90
u91:
	goto	l793
u90:
	goto	l292
	line	182
	
l293:	
	line	184
# 184 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	text2
	line	185
	
l292:	
	line	182
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3188/8)^0180h,(3188)&7	;volatile
	goto	u101
	goto	u100
u101:
	goto	l293
u100:
	
l294:	
	line	186
;SC8F096_RGB_LED_Demo.c: 185: }
;SC8F096_RGB_LED_Demo.c: 186: IF_30 = 0;
	bcf	(3188/8)^0180h,(3188)&7	;volatile
	line	187
	
l807:	
;SC8F096_RGB_LED_Demo.c: 187: for(i=0;i<5;i++)
	clrf	(Led_Moudle_Device@i)
	line	189
	
l813:	
;SC8F096_RGB_LED_Demo.c: 188: {
;SC8F096_RGB_LED_Demo.c: 189: PDSDATA = dis_buf[0];
	movf	(_dis_buf),w	;volatile
	movwf	(411)^0180h	;volatile
	line	190
	
l815:	
;SC8F096_RGB_LED_Demo.c: 190: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	191
	
l817:	
;SC8F096_RGB_LED_Demo.c: 191: PDSDATA = dis_buf[1];
	movf	0+(_dis_buf)+01h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	192
;SC8F096_RGB_LED_Demo.c: 192: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	193
	
l819:	
;SC8F096_RGB_LED_Demo.c: 193: PDSDATA = dis_buf[2];
	movf	0+(_dis_buf)+02h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	194
	
l821:	
;SC8F096_RGB_LED_Demo.c: 194: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	187
	
l823:	
	incf	(Led_Moudle_Device@i),f
	
l825:	
	movlw	low(05h)
	subwf	(Led_Moudle_Device@i),w
	skipc
	goto	u111
	goto	u110
u111:
	goto	l813
u110:
	goto	l297
	line	197
	
l298:	
	line	199
# 199 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	text2
	line	200
	
l297:	
	line	197
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3189/8)^0180h,(3189)&7	;volatile
	goto	u121
	goto	u120
u121:
	goto	l298
u120:
	
l299:	
	line	201
;SC8F096_RGB_LED_Demo.c: 200: }
;SC8F096_RGB_LED_Demo.c: 201: IF_15 = 0;
	bcf	(3189/8)^0180h,(3189)&7	;volatile
	line	202
	
l827:	
;SC8F096_RGB_LED_Demo.c: 202: LEDCTR1 = 0X80;
	movlw	low(080h)
	movwf	(399)^0180h	;volatile
	line	203
	
l829:	
;SC8F096_RGB_LED_Demo.c: 203: for(i=0;i<5;i++)
	clrf	(Led_Moudle_Device@i)
	line	205
	
l835:	
;SC8F096_RGB_LED_Demo.c: 204: {
;SC8F096_RGB_LED_Demo.c: 205: PDSDATA = dis_buf[0];
	movf	(_dis_buf),w	;volatile
	movwf	(411)^0180h	;volatile
	line	206
	
l837:	
;SC8F096_RGB_LED_Demo.c: 206: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	207
	
l839:	
;SC8F096_RGB_LED_Demo.c: 207: PDSDATA = dis_buf[1];
	movf	0+(_dis_buf)+01h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	208
;SC8F096_RGB_LED_Demo.c: 208: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	209
	
l841:	
;SC8F096_RGB_LED_Demo.c: 209: PDSDATA = dis_buf[2];
	movf	0+(_dis_buf)+02h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	210
	
l843:	
;SC8F096_RGB_LED_Demo.c: 210: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	203
	
l845:	
	incf	(Led_Moudle_Device@i),f
	
l847:	
	movlw	low(05h)
	subwf	(Led_Moudle_Device@i),w
	skipc
	goto	u131
	goto	u130
u131:
	goto	l835
u130:
	goto	l302
	line	212
	
l303:	
	line	214
# 214 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
clrwdt ;# 
psect	text2
	line	215
	
l302:	
	line	212
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(3188/8)^0180h,(3188)&7	;volatile
	goto	u141
	goto	u140
u141:
	goto	l303
u140:
	
l304:	
	line	216
;SC8F096_RGB_LED_Demo.c: 215: }
;SC8F096_RGB_LED_Demo.c: 216: IF_30 = 0;
	bcf	(3188/8)^0180h,(3188)&7	;volatile
	line	217
	
l849:	
;SC8F096_RGB_LED_Demo.c: 217: for(i=0;i<5;i++)
	clrf	(Led_Moudle_Device@i)
	line	219
	
l855:	
;SC8F096_RGB_LED_Demo.c: 218: {
;SC8F096_RGB_LED_Demo.c: 219: PDSDATA = dis_buf[0];
	movf	(_dis_buf),w	;volatile
	movwf	(411)^0180h	;volatile
	line	220
	
l857:	
;SC8F096_RGB_LED_Demo.c: 220: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	221
	
l859:	
;SC8F096_RGB_LED_Demo.c: 221: PDSDATA = dis_buf[1];
	movf	0+(_dis_buf)+01h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	222
;SC8F096_RGB_LED_Demo.c: 222: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	223
	
l861:	
;SC8F096_RGB_LED_Demo.c: 223: PDSDATA = dis_buf[2];
	movf	0+(_dis_buf)+02h,w	;volatile
	movwf	(411)^0180h	;volatile
	line	224
	
l863:	
;SC8F096_RGB_LED_Demo.c: 224: LEDCTR1 ++;
	incf	(399)^0180h,f	;volatile
	line	217
	
l865:	
	incf	(Led_Moudle_Device@i),f
	
l867:	
	movlw	low(05h)
	subwf	(Led_Moudle_Device@i),w
	skipc
	goto	u151
	goto	u150
u151:
	goto	l855
u150:
	line	226
	
l307:	
	return
	opt stack 0
GLOBAL	__end_of_Led_Moudle_Device
	__end_of_Led_Moudle_Device:
	signat	_Led_Moudle_Device,89
	global	_LED_R1

;; *************** function _LED_R1 *****************
;; Defined at:
;;		line 278 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	278
global __ptext3
__ptext3:	;psect for function _LED_R1
psect	text3
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	278
	global	__size_of_LED_R1
	__size_of_LED_R1	equ	__end_of_LED_R1-_LED_R1
	
_LED_R1:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_R1: [wreg+status,2+status,0]
	line	280
	
l753:	
;SC8F096_RGB_LED_Demo.c: 280: if(dis_buf[2]==255)
		incf	(0+(_dis_buf)+02h),w	;volatile
	btfss	status,2
	goto	u61
	goto	u60
u61:
	goto	l757
u60:
	line	282
	
l755:	
;SC8F096_RGB_LED_Demo.c: 281: {
;SC8F096_RGB_LED_Demo.c: 282: dis_buf[0] = 0;
	clrf	(_dis_buf)	;volatile
	line	283
;SC8F096_RGB_LED_Demo.c: 283: dis_buf[1] = 0;
	clrf	0+(_dis_buf)+01h	;volatile
	line	284
;SC8F096_RGB_LED_Demo.c: 284: dis_buf[2] = 0;
	clrf	0+(_dis_buf)+02h	;volatile
	line	285
;SC8F096_RGB_LED_Demo.c: 285: led_c = 0;
	clrf	(_led_c)	;volatile
	line	286
;SC8F096_RGB_LED_Demo.c: 286: }
	goto	l337
	line	287
	
l757:	
;SC8F096_RGB_LED_Demo.c: 287: else dis_buf[2]++;
	incf	0+(_dis_buf)+02h,f	;volatile
	line	288
	
l337:	
	return
	opt stack 0
GLOBAL	__end_of_LED_R1
	__end_of_LED_R1:
	signat	_LED_R1,89
	global	_LED_R

;; *************** function _LED_R *****************
;; Defined at:
;;		line 248 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	248
global __ptext4
__ptext4:	;psect for function _LED_R
psect	text4
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	248
	global	__size_of_LED_R
	__size_of_LED_R	equ	__end_of_LED_R-_LED_R
	
_LED_R:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_R: [wreg+status,2+status,0]
	line	250
	
l733:	
;SC8F096_RGB_LED_Demo.c: 250: if(dis_buf[2]==250)
		movlw	250
	xorwf	(0+(_dis_buf)+02h),w	;volatile
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l739
u30:
	line	252
	
l735:	
;SC8F096_RGB_LED_Demo.c: 251: {
;SC8F096_RGB_LED_Demo.c: 252: dis_buf[2] = 0;
	clrf	0+(_dis_buf)+02h	;volatile
	line	253
	
l737:	
;SC8F096_RGB_LED_Demo.c: 253: led_c++;
	incf	(_led_c),f	;volatile
	line	254
;SC8F096_RGB_LED_Demo.c: 254: }
	goto	l322
	line	255
	
l739:	
;SC8F096_RGB_LED_Demo.c: 255: else dis_buf[2]++;
	incf	0+(_dis_buf)+02h,f	;volatile
	line	256
	
l322:	
	return
	opt stack 0
GLOBAL	__end_of_LED_R
	__end_of_LED_R:
	signat	_LED_R,89
	global	_LED_G1

;; *************** function _LED_G1 *****************
;; Defined at:
;;		line 268 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	268
global __ptext5
__ptext5:	;psect for function _LED_G1
psect	text5
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	268
	global	__size_of_LED_G1
	__size_of_LED_G1	equ	__end_of_LED_G1-_LED_G1
	
_LED_G1:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_G1: [wreg+status,2+status,0]
	line	270
	
l747:	
;SC8F096_RGB_LED_Demo.c: 270: if(dis_buf[1]==255)
		incf	(0+(_dis_buf)+01h),w	;volatile
	btfss	status,2
	goto	u51
	goto	u50
u51:
	goto	l751
u50:
	line	273
	
l749:	
;SC8F096_RGB_LED_Demo.c: 271: {
;SC8F096_RGB_LED_Demo.c: 273: led_c++;
	incf	(_led_c),f	;volatile
	line	274
;SC8F096_RGB_LED_Demo.c: 274: }
	goto	l332
	line	275
	
l751:	
;SC8F096_RGB_LED_Demo.c: 275: else dis_buf[1]++;
	incf	0+(_dis_buf)+01h,f	;volatile
	line	276
	
l332:	
	return
	opt stack 0
GLOBAL	__end_of_LED_G1
	__end_of_LED_G1:
	signat	_LED_G1,89
	global	_LED_G

;; *************** function _LED_G *****************
;; Defined at:
;;		line 238 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
	line	238
global __ptext6
__ptext6:	;psect for function _LED_G
psect	text6
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	238
	global	__size_of_LED_G
	__size_of_LED_G	equ	__end_of_LED_G-_LED_G
	
_LED_G:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_G: [wreg+status,2+status,0]
	line	240
	
l725:	
;SC8F096_RGB_LED_Demo.c: 240: if(dis_buf[1]==250)
		movlw	250
	xorwf	(0+(_dis_buf)+01h),w	;volatile
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l731
u20:
	line	242
	
l727:	
;SC8F096_RGB_LED_Demo.c: 241: {
;SC8F096_RGB_LED_Demo.c: 242: dis_buf[1] = 0;
	clrf	0+(_dis_buf)+01h	;volatile
	line	243
	
l729:	
;SC8F096_RGB_LED_Demo.c: 243: led_c++;
	incf	(_led_c),f	;volatile
	line	244
;SC8F096_RGB_LED_Demo.c: 244: }
	goto	l317
	line	245
	
l731:	
;SC8F096_RGB_LED_Demo.c: 245: else dis_buf[1]++;
	incf	0+(_dis_buf)+01h,f	;volatile
	line	246
	
l317:	
	return
	opt stack 0
GLOBAL	__end_of_LED_G
	__end_of_LED_G:
	signat	_LED_G,89
	global	_LED_B1

;; *************** function _LED_B1 *****************
;; Defined at:
;;		line 258 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	258
global __ptext7
__ptext7:	;psect for function _LED_B1
psect	text7
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	258
	global	__size_of_LED_B1
	__size_of_LED_B1	equ	__end_of_LED_B1-_LED_B1
	
_LED_B1:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_B1: [wreg+status,2+status,0]
	line	260
	
l741:	
;SC8F096_RGB_LED_Demo.c: 260: if(dis_buf[0]==255)
		incf	((_dis_buf)),w	;volatile
	btfss	status,2
	goto	u41
	goto	u40
u41:
	goto	l745
u40:
	line	263
	
l743:	
;SC8F096_RGB_LED_Demo.c: 261: {
;SC8F096_RGB_LED_Demo.c: 263: led_c++;
	incf	(_led_c),f	;volatile
	line	264
;SC8F096_RGB_LED_Demo.c: 264: }
	goto	l327
	line	265
	
l745:	
;SC8F096_RGB_LED_Demo.c: 265: else dis_buf[0]++;
	incf	(_dis_buf),f	;volatile
	line	266
	
l327:	
	return
	opt stack 0
GLOBAL	__end_of_LED_B1
	__end_of_LED_B1:
	signat	_LED_B1,89
	global	_LED_B

;; *************** function _LED_B *****************
;; Defined at:
;;		line 228 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	228
global __ptext8
__ptext8:	;psect for function _LED_B
psect	text8
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	228
	global	__size_of_LED_B
	__size_of_LED_B	equ	__end_of_LED_B-_LED_B
	
_LED_B:	
;incstack = 0
	opt	stack 6
; Regs used in _LED_B: [wreg+status,2+status,0]
	line	230
	
l717:	
;SC8F096_RGB_LED_Demo.c: 230: if(dis_buf[0]==255)
		incf	((_dis_buf)),w	;volatile
	btfss	status,2
	goto	u11
	goto	u10
u11:
	goto	l723
u10:
	line	232
	
l719:	
;SC8F096_RGB_LED_Demo.c: 231: {
;SC8F096_RGB_LED_Demo.c: 232: dis_buf[0] = 0;
	clrf	(_dis_buf)	;volatile
	line	233
	
l721:	
;SC8F096_RGB_LED_Demo.c: 233: led_c++;
	incf	(_led_c),f	;volatile
	line	234
;SC8F096_RGB_LED_Demo.c: 234: }
	goto	l312
	line	235
	
l723:	
;SC8F096_RGB_LED_Demo.c: 235: else dis_buf[0]++;
	incf	(_dis_buf),f	;volatile
	line	236
	
l312:	
	return
	opt stack 0
GLOBAL	__end_of_LED_B
	__end_of_LED_B:
	signat	_LED_B,89
	global	_Timer_Isr

;; *************** function _Timer_Isr *****************
;; Defined at:
;;		line 76 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	76
global __ptext9
__ptext9:	;psect for function _Timer_Isr
psect	text9
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_RGB_LED_Demo\SC8F096_RGB_LED_Demo.c"
	line	76
	global	__size_of_Timer_Isr
	__size_of_Timer_Isr	equ	__end_of_Timer_Isr-_Timer_Isr
	
_Timer_Isr:	
;incstack = 0
	opt	stack 6
; Regs used in _Timer_Isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Timer_Isr+0)
	movf	pclath,w
	movwf	(??_Timer_Isr+1)
	ljmp	_Timer_Isr
psect	text9
	line	80
	
i1l931:	
;SC8F096_RGB_LED_Demo.c: 78: static unsigned char tcount = 0;
;SC8F096_RGB_LED_Demo.c: 80: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u17_21
	goto	u17_20
u17_21:
	goto	i1l279
u17_20:
	line	82
	
i1l933:	
;SC8F096_RGB_LED_Demo.c: 81: {
;SC8F096_RGB_LED_Demo.c: 82: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	83
	
i1l935:	
;SC8F096_RGB_LED_Demo.c: 83: if(++tcount >= 40)
	movlw	low(028h)
	incf	(Timer_Isr@tcount),f
	subwf	((Timer_Isr@tcount)),w
	skipc
	goto	u18_21
	goto	u18_20
u18_21:
	goto	i1l279
u18_20:
	line	85
	
i1l937:	
;SC8F096_RGB_LED_Demo.c: 84: {
;SC8F096_RGB_LED_Demo.c: 85: tcount = 0;
	clrf	(Timer_Isr@tcount)
	line	86
	
i1l939:	
;SC8F096_RGB_LED_Demo.c: 86: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	89
	
i1l279:	
	movf	(??_Timer_Isr+1),w
	movwf	pclath
	swapf	(??_Timer_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Timer_Isr
	__end_of_Timer_Isr:
	signat	_Timer_Isr,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
