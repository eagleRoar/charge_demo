opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096AD
opt include "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\sc8f096ad.cgen.inc"
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
# 13 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
INDF EQU 00H ;# 
# 20 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
OPTION_REG EQU 01H ;# 
# 27 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PCL EQU 02H ;# 
# 34 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
STATUS EQU 03H ;# 
# 41 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
FSR EQU 04H ;# 
# 48 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TRISB EQU 05H ;# 
# 55 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PORTB EQU 06H ;# 
# 62 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPDB EQU 07H ;# 
# 69 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPUB EQU 08H ;# 
# 76 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IOCB EQU 09H ;# 
# 83 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PCLATH EQU 0AH ;# 
# 90 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
INTCON EQU 0BH ;# 
# 97 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
QCCON EQU 0CH ;# 
# 104 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PIR1 EQU 0DH ;# 
# 111 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PIE1 EQU 0EH ;# 
# 118 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CMP1CON0 EQU 0FH ;# 
# 125 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CMP1CON1 EQU 10H ;# 
# 132 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PR2 EQU 11H ;# 
# 139 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TMR2 EQU 12H ;# 
# 146 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
T2CON EQU 13H ;# 
# 153 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
OSCCON EQU 14H ;# 
# 160 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMCON0 EQU 15H ;# 
# 167 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMCON1 EQU 16H ;# 
# 174 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMTL EQU 17H ;# 
# 181 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMTH EQU 18H ;# 
# 188 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMD0L EQU 19H ;# 
# 195 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMD1L EQU 1AH ;# 
# 202 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMD4L EQU 1BH ;# 
# 209 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMT4L EQU 1CH ;# 
# 216 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMCON2 EQU 1DH ;# 
# 223 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMDH EQU 1EH ;# 
# 230 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWM01DT EQU 1FH ;# 
# 237 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TMR0 EQU 81H ;# 
# 244 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TRISA EQU 85H ;# 
# 251 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PORTA EQU 86H ;# 
# 258 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPDA EQU 87H ;# 
# 265 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPUA EQU 88H ;# 
# 272 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IOCA EQU 89H ;# 
# 279 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ANSEL3 EQU 8CH ;# 
# 286 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EECON1 EQU 8DH ;# 
# 293 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EECON2 EQU 8EH ;# 
# 300 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EEDAT EQU 8FH ;# 
# 307 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EEDATH EQU 90H ;# 
# 314 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EEADR EQU 91H ;# 
# 321 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
EEADRH EQU 92H ;# 
# 328 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ANSEL0 EQU 93H ;# 
# 335 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ANSEL1 EQU 94H ;# 
# 342 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ADCON0 EQU 95H ;# 
# 349 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ADCON1 EQU 96H ;# 
# 356 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ADRESL EQU 98H ;# 
# 363 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ADRESH EQU 99H ;# 
# 370 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CMP2CON0 EQU 9AH ;# 
# 377 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMD2L EQU 9BH ;# 
# 384 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWMD3L EQU 9CH ;# 
# 391 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PWM23DT EQU 9DH ;# 
# 398 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SEGEN0 EQU 9EH ;# 
# 405 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CMP2CON1 EQU 9FH ;# 
# 412 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TRISC EQU 105H ;# 
# 419 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PORTC EQU 106H ;# 
# 426 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PORTD EQU 107H ;# 
# 433 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPUC EQU 108H ;# 
# 440 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
ANSEL2 EQU 109H ;# 
# 447 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TMR1L EQU 10CH ;# 
# 454 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TMR1H EQU 10DH ;# 
# 461 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
T1CON EQU 10EH ;# 
# 468 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PIR2 EQU 10FH ;# 
# 475 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PIE2 EQU 110H ;# 
# 482 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
KEYCON0 EQU 111H ;# 
# 489 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
KEYCON1 EQU 112H ;# 
# 496 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
KEYCON2 EQU 113H ;# 
# 503 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TRISD EQU 114H ;# 
# 510 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
WPUD EQU 115H ;# 
# 517 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
KEYDATAL EQU 116H ;# 
# 524 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
KEYDATAH EQU 117H ;# 
# 531 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TXSTA0 EQU 118H ;# 
# 538 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
RCSTA0 EQU 119H ;# 
# 545 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SPBRG0 EQU 11AH ;# 
# 552 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TXREG0 EQU 11BH ;# 
# 559 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
RCREG0 EQU 11CH ;# 
# 566 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LCDCON0 EQU 11DH ;# 
# 573 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LCDCON1 EQU 11EH ;# 
# 580 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SEGEN1 EQU 11FH ;# 
# 587 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SEGEN2 EQU 181H ;# 
# 594 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TXSTA1 EQU 185H ;# 
# 601 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
RCSTA1 EQU 186H ;# 
# 608 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
TXREG1 EQU 187H ;# 
# 615 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
RCREG1 EQU 188H ;# 
# 622 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SPBRG1 EQU 189H ;# 
# 629 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
OPACON EQU 18CH ;# 
# 636 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
OPAADJ EQU 18DH ;# 
# 643 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LEDCTR0 EQU 18EH ;# 
# 650 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LEDCTR1 EQU 18FH ;# 
# 657 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IICCON EQU 190H ;# 
# 664 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IICCON2 EQU 191H ;# 
# 671 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IICSTAT EQU 192H ;# 
# 678 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IICBUF EQU 193H ;# 
# 685 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
IICADD EQU 194H ;# 
# 692 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CC0CON EQU 195H ;# 
# 699 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
CC1CON EQU 196H ;# 
# 706 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PDCON0 EQU 197H ;# 
# 713 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PDCON1 EQU 198H ;# 
# 720 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PDADD EQU 199H ;# 
# 727 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PDRDATA EQU 19AH ;# 
# 734 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
PDSDATA EQU 19BH ;# 
# 741 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LCDADD EQU 19CH ;# 
# 748 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
LCDDATA EQU 19DH ;# 
# 755 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
COMEN EQU 19EH ;# 
# 762 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta9\data\include\SC8F096AD.h"
SEGEN3 EQU 19FH ;# 
	FNROOT	_main
	FNCALL	intlevel1,_CMP_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_PIE1
_PIE1	set	0xE
	global	_INTCON
_INTCON	set	0xB
	global	_CMP1CON1
_CMP1CON1	set	0x10
	global	_CMP1CON0
_CMP1CON0	set	0xF
	global	_PORTB
_PORTB	set	0x6
	global	_TRISB
_TRISB	set	0x5
	global	_IOCB
_IOCB	set	0x9
	global	_WPDB
_WPDB	set	0x7
	global	_WPUB
_WPUB	set	0x8
	global	_OPTION_REG
_OPTION_REG	set	0x1
	global	_OSCCON
_OSCCON	set	0x14
	global	_CMP1IF
_CMP1IF	set	0x6D
	global	_CMP1EN
_CMP1EN	set	0x7F
	global	_CMP2CON1
_CMP2CON1	set	0x9F
	global	_CMP2CON0
_CMP2CON0	set	0x9A
	global	_PORTA
_PORTA	set	0x86
	global	_TRISA
_TRISA	set	0x85
	global	_CMP2EN
_CMP2EN	set	0x4D7
	global	_PIE2
_PIE2	set	0x110
	global	_CMP2IF
_CMP2IF	set	0x87D
; #config settings
	file	"SC8F096_CMP_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
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
?_main:	; 1 bytes @ 0x0
?_CMP_Isr:	; 1 bytes @ 0x0
??_CMP_Isr:	; 1 bytes @ 0x0
	ds	2
??_main:	; 1 bytes @ 0x2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      2       2
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
;!Critical Paths under _CMP_Isr in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _CMP_Isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _CMP_Isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _CMP_Isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _CMP_Isr in BANK2
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
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 0
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (1) _CMP_Isr                                              2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!
;! _CMP_Isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      2       2       1       14.3%
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
;!ABS                  0      0       0      11        0.0%
;!DATA                 0      0       0      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
	line	14
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg+status,2]
	line	16
	
l431:	
# 16 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
nop ;# 
	line	17
# 17 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
clrwdt ;# 
psect	maintext
	line	19
	
l433:	
;SC8F096_CMP_C.c: 19: OSCCON = 0x72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	20
;SC8F096_CMP_C.c: 20: OPTION_REG = 0x09;
	movlw	low(09h)
	movwf	(1)	;volatile
	line	23
	
l435:	
;SC8F096_CMP_C.c: 23: WPUB = 0B00000000;
	clrf	(8)	;volatile
	line	24
	
l437:	
;SC8F096_CMP_C.c: 24: WPDB = 0B00000000;
	clrf	(7)	;volatile
	line	25
	
l439:	
;SC8F096_CMP_C.c: 25: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	27
	
l441:	
;SC8F096_CMP_C.c: 27: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	28
	
l443:	
;SC8F096_CMP_C.c: 28: TRISB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	30
	
l445:	
;SC8F096_CMP_C.c: 30: PORTA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	31
	
l447:	
;SC8F096_CMP_C.c: 31: PORTB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	57
	
l449:	
;SC8F096_CMP_C.c: 57: CMP1CON0 = 0B00111000;
	movlw	low(038h)
	movwf	(15)	;volatile
	line	59
	
l451:	
;SC8F096_CMP_C.c: 59: CMP2CON0 = 0B00111001;
	movlw	low(039h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	73
	
l453:	
;SC8F096_CMP_C.c: 73: CMP1CON1 = 0B10010111;
	movlw	low(097h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	75
	
l455:	
;SC8F096_CMP_C.c: 75: CMP2CON1 = 0B10000000;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	77
	
l457:	
;SC8F096_CMP_C.c: 77: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	79
	
l459:	
;SC8F096_CMP_C.c: 79: CMP1EN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(127/8),(127)&7	;volatile
	line	80
	
l461:	
;SC8F096_CMP_C.c: 80: CMP1IF =0;
	bcf	(109/8),(109)&7	;volatile
	line	82
	
l463:	
;SC8F096_CMP_C.c: 82: CMP2EN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1239/8)^080h,(1239)&7	;volatile
	line	83
	
l465:	
;SC8F096_CMP_C.c: 83: CMP2IF =0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2173/8)^0100h,(2173)&7	;volatile
	line	86
	
l467:	
;SC8F096_CMP_C.c: 86: PIE1 = 0X20;
	movlw	low(020h)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(14)	;volatile
	line	87
	
l469:	
;SC8F096_CMP_C.c: 87: PIE2 = 0X20;
	movlw	low(020h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(272)^0100h	;volatile
	line	88
;SC8F096_CMP_C.c: 88: while(1)
	
l45:	
	line	90
# 90 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
clrwdt ;# 
psect	maintext
	goto	l45
	global	start
	ljmp	start
	opt stack 0
	line	94
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_CMP_Isr

;; *************** function _CMP_Isr *****************
;; Defined at:
;;		line 103 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
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
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	103
global __ptext1
__ptext1:	;psect for function _CMP_Isr
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_CMP_C\SC8F096_CMP_C.c"
	line	103
	global	__size_of_CMP_Isr
	__size_of_CMP_Isr	equ	__end_of_CMP_Isr-_CMP_Isr
	
_CMP_Isr:	
;incstack = 0
	opt	stack 7
; Regs used in _CMP_Isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_CMP_Isr+0)
	movf	pclath,w
	movwf	(??_CMP_Isr+1)
	ljmp	_CMP_Isr
psect	text1
	line	105
	
i1l471:	
;SC8F096_CMP_C.c: 105: if(CMP1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(109/8),(109)&7	;volatile
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l477
u1_20:
	line	107
	
i1l473:	
;SC8F096_CMP_C.c: 106: {
;SC8F096_CMP_C.c: 107: CMP1IF = 0;
	bcf	(109/8),(109)&7	;volatile
	line	109
	
i1l475:	
;SC8F096_CMP_C.c: 109: PORTA ^= 0X80;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank1
	xorwf	(134)^080h,f	;volatile
	line	112
	
i1l477:	
;SC8F096_CMP_C.c: 111: }
;SC8F096_CMP_C.c: 112: if(CMP2IF)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2173/8)^0100h,(2173)&7	;volatile
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l55
u2_20:
	line	114
	
i1l479:	
;SC8F096_CMP_C.c: 113: {
;SC8F096_CMP_C.c: 114: CMP2IF = 0;
	bcf	(2173/8)^0100h,(2173)&7	;volatile
	line	115
	
i1l481:	
;SC8F096_CMP_C.c: 115: PORTA ^= 0X40;
	movlw	low(040h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(134)^080h,f	;volatile
	line	118
	
i1l55:	
	movf	(??_CMP_Isr+1),w
	movwf	pclath
	swapf	(??_CMP_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_CMP_Isr
	__end_of_CMP_Isr:
	signat	_CMP_Isr,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
