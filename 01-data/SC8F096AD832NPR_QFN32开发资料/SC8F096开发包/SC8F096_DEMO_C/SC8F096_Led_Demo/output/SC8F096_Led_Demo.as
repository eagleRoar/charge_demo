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
	FNCALL	_main,_Set_LED_Moudle
	FNROOT	_main
	FNCALL	intlevel1,_Timer_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	Timer_Isr@tcount
	global	_sec
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
	global	_TMR2IE
_TMR2IE	set	0x71
	global	_TMR2IF
_TMR2IF	set	0x69
	global	_TRISA
_TRISA	set	133
	global	_SEGEN1
_SEGEN1	set	287
	global	_LCDCON1
_LCDCON1	set	286
	global	_LCDCON0
_LCDCON0	set	285
	global	_PIE2
_PIE2	set	272
	global	_PIR2
_PIR2	set	271
	global	_TRISC
_TRISC	set	261
	global	_LEDEN
_LEDEN	set	0x8EE
	global	_SEGEN3
_SEGEN3	set	415
	global	_COMEN
_COMEN	set	414
	global	_LCDDATA
_LCDDATA	set	413
	global	_LCDADD
_LCDADD	set	412
	global	_LCDCS
_LCDCS	set	0xCE7
	global	_LCDDATA8
_LCDDATA8	set	0xCF8
; #config settings
	file	"SC8F096_Led_Demo.as"
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
Timer_Isr@tcount:
       ds      1

_sec:
       ds      1

	file	"SC8F096_Led_Demo.as"
	line	#
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
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
?_main:	; 1 bytes @ 0x0
?_Timer_Isr:	; 1 bytes @ 0x0
??_Timer_Isr:	; 1 bytes @ 0x0
	ds	2
??_Set_LED_Moudle:	; 1 bytes @ 0x2
??_main:	; 1 bytes @ 0x2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         2
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      2       5
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
;!    None.
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
;! (0) _main                                                 0     0      0       0
;!                     _Set_LED_Moudle
;! ---------------------------------------------------------------------------------
;! (1) _Set_LED_Moudle                                       0     0      0       0
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
;!   _Set_LED_Moudle
;!
;! _Timer_Isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       1       0        7.1%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      2       5       1       35.7%
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
;!ABS                  0      0       5      11        0.0%
;!DATA                 0      0       5      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 10 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/200
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Set_LED_Moudle
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	10
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	12
	
l640:	
# 12 "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
nop ;# 
	line	13
# 13 "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
clrwdt ;# 
psect	maintext
	line	15
	
l642:	
;SC8F096_Led_Demo.c: 15: OSCCON = 0x70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	16
	
l644:	
;SC8F096_Led_Demo.c: 16: INTCON = 0;
	clrf	(11)	;volatile
	line	18
	
l646:	
;SC8F096_Led_Demo.c: 18: PIR1 = 0;
	clrf	(13)	;volatile
	line	19
	
l648:	
;SC8F096_Led_Demo.c: 19: PIE1 = 0;
	clrf	(14)	;volatile
	line	20
	
l650:	
;SC8F096_Led_Demo.c: 20: PIR2 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(271)^0100h	;volatile
	line	21
	
l652:	
;SC8F096_Led_Demo.c: 21: PIE2 = 0;
	clrf	(272)^0100h	;volatile
	line	23
	
l654:	
;SC8F096_Led_Demo.c: 23: PR2 = 124;
	movlw	low(07Ch)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	24
	
l656:	
;SC8F096_Led_Demo.c: 24: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	25
	
l658:	
;SC8F096_Led_Demo.c: 25: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	26
	
l660:	
;SC8F096_Led_Demo.c: 26: T2CON = 0x05;
	movlw	low(05h)
	movwf	(19)	;volatile
	line	28
	
l662:	
;SC8F096_Led_Demo.c: 28: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	30
	
l664:	
;SC8F096_Led_Demo.c: 30: TRISC = 0B00000011;
	movlw	low(03h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	31
	
l666:	
;SC8F096_Led_Demo.c: 31: TRISB = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	32
	
l668:	
;SC8F096_Led_Demo.c: 32: TRISA = 0B00000001;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	34
	
l670:	
;SC8F096_Led_Demo.c: 34: Set_LED_Moudle();
	fcall	_Set_LED_Moudle
	line	38
	
l672:	
;SC8F096_Led_Demo.c: 37: {
;SC8F096_Led_Demo.c: 38: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u11
	goto	u10
u11:
	goto	l672
u10:
	line	40
	
l674:	
;SC8F096_Led_Demo.c: 39: {
;SC8F096_Led_Demo.c: 40: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	41
# 41 "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
clrwdt ;# 
psect	maintext
	line	42
	
l676:	
;SC8F096_Led_Demo.c: 42: ++sec;
	incf	(_sec),f	;volatile
	line	43
	
l678:	
;SC8F096_Led_Demo.c: 43: if(sec >= 250)
	movlw	low(0FAh)
	subwf	(_sec),w	;volatile
	skipc
	goto	u21
	goto	u20
u21:
	goto	l672
u20:
	line	45
	
l680:	
;SC8F096_Led_Demo.c: 44: {
;SC8F096_Led_Demo.c: 45: sec = 0;
	clrf	(_sec)	;volatile
	line	46
	
l682:	
;SC8F096_Led_Demo.c: 46: LCDADD = 0B10000000;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(412)^0180h	;volatile
	line	61
	
l684:	
;SC8F096_Led_Demo.c: 61: LCDDATA = 0x01;
	movlw	low(01h)
	movwf	(413)^0180h	;volatile
	line	62
	
l686:	
;SC8F096_Led_Demo.c: 62: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	63
	
l688:	
;SC8F096_Led_Demo.c: 63: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	65
	
l690:	
;SC8F096_Led_Demo.c: 65: LCDDATA = 0x02;
	movlw	low(02h)
	movwf	(413)^0180h	;volatile
	line	66
	
l692:	
;SC8F096_Led_Demo.c: 66: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	67
	
l694:	
;SC8F096_Led_Demo.c: 67: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	69
	
l696:	
;SC8F096_Led_Demo.c: 69: LCDDATA = 0x04;
	movlw	low(04h)
	movwf	(413)^0180h	;volatile
	line	70
	
l698:	
;SC8F096_Led_Demo.c: 70: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	71
	
l700:	
;SC8F096_Led_Demo.c: 71: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	73
	
l702:	
;SC8F096_Led_Demo.c: 73: LCDDATA = 0x08;
	movlw	low(08h)
	movwf	(413)^0180h	;volatile
	line	74
	
l704:	
;SC8F096_Led_Demo.c: 74: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	75
	
l706:	
;SC8F096_Led_Demo.c: 75: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	77
	
l708:	
;SC8F096_Led_Demo.c: 77: LCDDATA = 0x10;
	movlw	low(010h)
	movwf	(413)^0180h	;volatile
	line	78
	
l710:	
;SC8F096_Led_Demo.c: 78: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	79
	
l712:	
;SC8F096_Led_Demo.c: 79: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	81
	
l714:	
;SC8F096_Led_Demo.c: 81: LCDDATA = 0x20;
	movlw	low(020h)
	movwf	(413)^0180h	;volatile
	line	82
	
l716:	
;SC8F096_Led_Demo.c: 82: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	83
	
l718:	
;SC8F096_Led_Demo.c: 83: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	85
	
l720:	
;SC8F096_Led_Demo.c: 85: LCDDATA = 0x40;
	movlw	low(040h)
	movwf	(413)^0180h	;volatile
	line	86
	
l722:	
;SC8F096_Led_Demo.c: 86: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	87
	
l724:	
;SC8F096_Led_Demo.c: 87: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	89
	
l726:	
;SC8F096_Led_Demo.c: 89: LCDDATA = 0x80;
	movlw	low(080h)
	movwf	(413)^0180h	;volatile
	line	90
	
l728:	
;SC8F096_Led_Demo.c: 90: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	91
	
l730:	
;SC8F096_Led_Demo.c: 91: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	93
	
l732:	
;SC8F096_Led_Demo.c: 93: LCDDATA = 0x01F;
	movlw	low(01Fh)
	movwf	(413)^0180h	;volatile
	line	94
	
l734:	
;SC8F096_Led_Demo.c: 94: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	95
	
l736:	
;SC8F096_Led_Demo.c: 95: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	97
	
l738:	
;SC8F096_Led_Demo.c: 97: LCDDATA = 0xFF;
	movlw	low(0FFh)
	movwf	(413)^0180h	;volatile
	line	98
	
l740:	
;SC8F096_Led_Demo.c: 98: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	100
	
l742:	
;SC8F096_Led_Demo.c: 100: LCDCS = 0;
	bcf	(3303/8)^0180h,(3303)&7	;volatile
	line	102
	
l744:	
;SC8F096_Led_Demo.c: 102: LEDEN = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	(2286/8)^0100h,(2286)&7	;volatile
	goto	l672
	global	start
	ljmp	start
	opt stack 0
	line	108
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Set_LED_Moudle

;; *************** function _Set_LED_Moudle *****************
;; Defined at:
;;		line 132 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
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
;;		On exit  : 300/300
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
	line	132
global __ptext1
__ptext1:	;psect for function _Set_LED_Moudle
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	132
	global	__size_of_Set_LED_Moudle
	__size_of_Set_LED_Moudle	equ	__end_of_Set_LED_Moudle-_Set_LED_Moudle
	
_Set_LED_Moudle:	
;incstack = 0
	opt	stack 6
; Regs used in _Set_LED_Moudle: [wreg+status,2]
	line	135
	
l630:	
;SC8F096_Led_Demo.c: 135: LCDCON0 = 0B00111011;
	movlw	low(03Bh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(285)^0100h	;volatile
	line	164
	
l632:	
;SC8F096_Led_Demo.c: 164: LCDCON1 = 0;
	clrf	(286)^0100h	;volatile
	line	171
	
l634:	
;SC8F096_Led_Demo.c: 171: COMEN = 0B00000011;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(414)^0180h	;volatile
	line	172
	
l636:	
;SC8F096_Led_Demo.c: 172: SEGEN1 = 0xff;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(287)^0100h	;volatile
	line	173
	
l638:	
;SC8F096_Led_Demo.c: 173: SEGEN3 = 0B01000000;
	movlw	low(040h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(415)^0180h	;volatile
	line	193
	
l254:	
	return
	opt stack 0
GLOBAL	__end_of_Set_LED_Moudle
	__end_of_Set_LED_Moudle:
	signat	_Set_LED_Moudle,89
	global	_Timer_Isr

;; *************** function _Timer_Isr *****************
;; Defined at:
;;		line 110 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
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
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	110
global __ptext2
__ptext2:	;psect for function _Timer_Isr
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	110
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
psect	text2
	line	114
	
i1l746:	
;SC8F096_Led_Demo.c: 112: static unsigned char tcount = 0;
;SC8F096_Led_Demo.c: 114: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l251
u3_20:
	line	116
	
i1l748:	
;SC8F096_Led_Demo.c: 115: {
;SC8F096_Led_Demo.c: 116: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	117
	
i1l750:	
;SC8F096_Led_Demo.c: 117: if(++tcount >= 40)
	movlw	low(028h)
	incf	(Timer_Isr@tcount),f
	subwf	((Timer_Isr@tcount)),w
	skipc
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l251
u4_20:
	line	119
	
i1l752:	
;SC8F096_Led_Demo.c: 118: {
;SC8F096_Led_Demo.c: 119: tcount = 0;
	clrf	(Timer_Isr@tcount)
	line	120
	
i1l754:	
;SC8F096_Led_Demo.c: 120: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	123
	
i1l251:	
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
