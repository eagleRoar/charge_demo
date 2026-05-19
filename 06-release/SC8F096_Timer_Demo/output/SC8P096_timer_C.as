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
	FNCALL	_main,_gpio_init
	FNROOT	_main
	FNCALL	intlevel1,_Timer0_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_timer_cnt
	global	_OSCCON
psect	text0,local,class=CODE,delta=2,merge=1
global __ptext0
__ptext0:
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
	global	_T0IE
_T0IE	set	0x5D
	global	_T0IF
_T0IF	set	0x5A
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
; #config settings
	file	"SC8P096_timer_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_timer_cnt:
       ds      2

	file	"SC8P096_timer_C.as"
	line	#
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
?_gpio_init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Timer0_Isr:	; 1 bytes @ 0x0
??_Timer0_Isr:	; 1 bytes @ 0x0
	ds	2
??_gpio_init:	; 1 bytes @ 0x2
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
;!    COMMON           14      2       4
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
;!Critical Paths under _Timer0_Isr in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _Timer0_Isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _Timer0_Isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _Timer0_Isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _Timer0_Isr in BANK2
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
;!                          _gpio_init
;! ---------------------------------------------------------------------------------
;! (1) _gpio_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (2) _Timer0_Isr                                           2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _gpio_init
;!
;! _Timer0_Isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      2       4       1       28.6%
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
;!ABS                  0      0       4      11        0.0%
;!DATA                 0      0       4      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 42 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_gpio_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	42
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	44
	
l631:	
# 44 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
nop ;# 
	line	45
# 45 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	line	46
	
l633:	
;SC8P096_Timer0_C.c: 46: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	47
	
l635:	
;SC8P096_Timer0_C.c: 47: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	48
# 48 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	line	77
	
l637:	
;SC8P096_Timer0_C.c: 77: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	78
	
l639:	
;SC8P096_Timer0_C.c: 78: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	80
	
l641:	
;SC8P096_Timer0_C.c: 80: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	81
	
l643:	
;SC8P096_Timer0_C.c: 81: TRISA = 0B00000000;
	clrf	(133)^080h	;volatile
	line	83
	
l645:	
;SC8P096_Timer0_C.c: 83: WPUB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	84
	
l647:	
;SC8P096_Timer0_C.c: 84: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	86
	
l649:	
;SC8P096_Timer0_C.c: 86: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	87
	
l651:	
;SC8P096_Timer0_C.c: 87: TRISB = 0B00000000;
	clrf	(5)	;volatile
	line	90
	
l653:	
;SC8P096_Timer0_C.c: 90: TMR0 = 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	91
	
l655:	
;SC8P096_Timer0_C.c: 91: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	92
	
l657:	
;SC8P096_Timer0_C.c: 92: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	94
	
l659:	
;SC8P096_Timer0_C.c: 94: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	95
	
l661:	
;SC8P096_Timer0_C.c: 95: gpio_init();
	fcall	_gpio_init
	line	96
;SC8P096_Timer0_C.c: 96: while(1)
	
l243:	
	line	98
# 98 "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
clrwdt ;# 
psect	maintext
	goto	l243
	global	start
	ljmp	start
	opt stack 0
	line	100
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_gpio_init

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 13 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	13
global __ptext1
__ptext1:	;psect for function _gpio_init
psect	text1
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	13
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
;incstack = 0
	opt	stack 6
; Regs used in _gpio_init: [wreg]
	line	16
	
l629:	
;SC8P096_Timer0_C.c: 16: TRISA = 0B11111110;
	movlw	low(0FEh)
	movwf	(133)^080h	;volatile
	line	17
;SC8P096_Timer0_C.c: 17: PORTA = 0B00000001;
	movlw	low(01h)
	movwf	(134)^080h	;volatile
	line	18
	
l227:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
	signat	_gpio_init,89
	global	_Timer0_Isr

;; *************** function _Timer0_Isr *****************
;; Defined at:
;;		line 108 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
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
;;		On exit  : 0/0
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
	line	108
global __ptext2
__ptext2:	;psect for function _Timer0_Isr
psect	text2
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\SC8P096_Timer0_C.c"
	line	108
	global	__size_of_Timer0_Isr
	__size_of_Timer0_Isr	equ	__end_of_Timer0_Isr-_Timer0_Isr
	
_Timer0_Isr:	
;incstack = 0
	opt	stack 6
; Regs used in _Timer0_Isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Timer0_Isr+0)
	movf	pclath,w
	movwf	(??_Timer0_Isr+1)
	ljmp	_Timer0_Isr
psect	text2
	line	110
	
i1l663:	
;SC8P096_Timer0_C.c: 110: if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l251
u1_20:
	line	112
	
i1l665:	
;SC8P096_Timer0_C.c: 111: {
;SC8P096_Timer0_C.c: 112: TMR0 += 6;
	movlw	low(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(129)^080h,f	;volatile
	line	113
	
i1l667:	
;SC8P096_Timer0_C.c: 113: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	115
;SC8P096_Timer0_C.c: 115: PORTB ^= 0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(6),f	;volatile
	line	116
	
i1l669:	
;SC8P096_Timer0_C.c: 116: timer_cnt ++;
	incf	(_timer_cnt),f
	skipnz
	incf	(_timer_cnt+1),f
	line	117
	
i1l251:	
	line	118
;SC8P096_Timer0_C.c: 117: }
;SC8P096_Timer0_C.c: 118: if(timer_cnt > 8000)
	movlw	01Fh
	subwf	(_timer_cnt+1),w
	movlw	041h
	skipnz
	subwf	(_timer_cnt),w
	skipc
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l253
u2_20:
	line	120
	
i1l671:	
;SC8P096_Timer0_C.c: 119: {
;SC8P096_Timer0_C.c: 120: timer_cnt = 0;
	clrf	(_timer_cnt)
	clrf	(_timer_cnt+1)
	line	122
	
i1l253:	
	movf	(??_Timer0_Isr+1),w
	movwf	pclath
	swapf	(??_Timer0_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Timer0_Isr
	__end_of_Timer0_Isr:
	signat	_Timer0_Isr,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
