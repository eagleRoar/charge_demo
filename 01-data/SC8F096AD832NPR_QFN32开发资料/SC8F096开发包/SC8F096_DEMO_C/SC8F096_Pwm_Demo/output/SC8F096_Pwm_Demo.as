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
	FNCALL	_main,_Init_System
	FNROOT	_main
	global	_PORTB
_PORTB	set	0x6
	global	_TRISB
_TRISB	set	0x5
	global	_OPTION_REG
_OPTION_REG	set	0x1
	global	_OSCCON
_OSCCON	set	0x14
	global	_INTCON
_INTCON	set	0xB
	global	_PWMCON2
_PWMCON2	set	0x1D
	global	_PWMCON0
_PWMCON0	set	0x15
	global	_PWMD4L
_PWMD4L	set	0x1B
	global	_PWM01DT
_PWM01DT	set	0x1F
	global	_PWMD1L
_PWMD1L	set	0x1A
	global	_PWMD0L
_PWMD0L	set	0x19
	global	_PWMDH
_PWMDH	set	0x1E
	global	_PWMT4L
_PWMT4L	set	0x1C
	global	_PWMTL
_PWMTL	set	0x17
	global	_PWMTH
_PWMTH	set	0x18
	global	_PWMCON1
_PWMCON1	set	0x16
	global	_PORTA
_PORTA	set	0x86
	global	_PWMD3L
_PWMD3L	set	0x9C
	global	_PWMD2L
_PWMD2L	set	0x9B
	global	_TRISA
_TRISA	set	0x85
; #config settings
	file	"SC8F096_Pwm_Demo.as"
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
?_Init_System:	; 1 bytes @ 0x0
??_Init_System:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
??_main:	; 1 bytes @ 0x0
	global	main@delaycnt
main@delaycnt:	; 2 bytes @ 0x0
	ds	2
	global	main@pwmbuf
main@pwmbuf:	; 1 bytes @ 0x2
	ds	1
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
;!    COMMON           14      3       3
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
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
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
;! (0) _main                                                 3     3      0      45
;!                                              0 COMMON     3     3      0
;!                        _Init_System
;! ---------------------------------------------------------------------------------
;! (1) _Init_System                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Init_System
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      3       3       1       21.4%
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
;;		line 8 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  delaycnt        2    0[COMMON] unsigned int 
;;  pwmbuf          1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Init_System
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
	line	8
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	10
	
l445:	
;SC8F096_Pwm_Demo.c: 10: unsigned int delaycnt = 0;
	clrf	(main@delaycnt)
	clrf	(main@delaycnt+1)
	line	11
	
l447:	
;SC8F096_Pwm_Demo.c: 11: unsigned char pwmbuf = 0X1F;
	movlw	low(01Fh)
	movwf	(main@pwmbuf)
	line	13
	
l449:	
;SC8F096_Pwm_Demo.c: 13: Init_System();
	fcall	_Init_System
	line	35
	
l451:	
;SC8F096_Pwm_Demo.c: 35: PWMCON1 = 0B11010010;
	movlw	low(0D2h)
	movwf	(22)	;volatile
	line	37
	
l453:	
;SC8F096_Pwm_Demo.c: 37: TRISA = 0B00011111;
	movlw	low(01Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	38
	
l455:	
;SC8F096_Pwm_Demo.c: 38: PWMTH = 0X0C;
	movlw	low(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	40
	
l457:	
;SC8F096_Pwm_Demo.c: 40: PWMTL = 0XFF;
	movlw	low(0FFh)
	movwf	(23)	;volatile
	line	41
	
l459:	
;SC8F096_Pwm_Demo.c: 41: PWMT4L = 0XFF;
	movlw	low(0FFh)
	movwf	(28)	;volatile
	line	43
	
l461:	
;SC8F096_Pwm_Demo.c: 43: PWMDH = 0;
	clrf	(30)	;volatile
	line	45
	
l463:	
;SC8F096_Pwm_Demo.c: 45: PWMD0L = 0X1F;
	movlw	low(01Fh)
	movwf	(25)	;volatile
	line	48
	
l465:	
;SC8F096_Pwm_Demo.c: 48: PWMD1L = 0X7F;
	movlw	low(07Fh)
	movwf	(26)	;volatile
	line	50
	
l467:	
;SC8F096_Pwm_Demo.c: 50: PWM01DT = 0X03;
	movlw	low(03h)
	movwf	(31)	;volatile
	line	53
	
l469:	
;SC8F096_Pwm_Demo.c: 53: PWMD2L = 0X3F;
	movlw	low(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	54
	
l471:	
;SC8F096_Pwm_Demo.c: 54: PWMD3L = 0X7F;
	movlw	low(07Fh)
	movwf	(156)^080h	;volatile
	line	56
	
l473:	
;SC8F096_Pwm_Demo.c: 56: PWMD4L = 0X1F;
	movlw	low(01Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	72
	
l475:	
;SC8F096_Pwm_Demo.c: 72: PWMCON0 = 0X1F;
	movlw	low(01Fh)
	movwf	(21)	;volatile
	line	73
	
l477:	
;SC8F096_Pwm_Demo.c: 73: PWMCON2 =0X10;
	movlw	low(010h)
	movwf	(29)	;volatile
	line	74
	
l479:	
;SC8F096_Pwm_Demo.c: 74: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	76
;SC8F096_Pwm_Demo.c: 76: while(1)
	
l47:	
	line	78
# 78 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
clrwdt ;# 
psect	maintext
	line	79
	
l481:	
;SC8F096_Pwm_Demo.c: 79: if(++delaycnt > 5000)
	incf	(main@delaycnt),f
	skipnz
	incf	(main@delaycnt+1),f
	movlw	013h
	subwf	((main@delaycnt+1)),w
	movlw	089h
	skipnz
	subwf	((main@delaycnt)),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l47
u10:
	line	81
	
l483:	
;SC8F096_Pwm_Demo.c: 80: {
;SC8F096_Pwm_Demo.c: 81: delaycnt = 0;
	clrf	(main@delaycnt)
	clrf	(main@delaycnt+1)
	line	82
	
l485:	
;SC8F096_Pwm_Demo.c: 82: if(++pwmbuf > 0xfe)
	incf	(main@pwmbuf),f
		incf	(((main@pwmbuf))),w
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l49
u20:
	line	84
	
l487:	
;SC8F096_Pwm_Demo.c: 83: {
;SC8F096_Pwm_Demo.c: 84: pwmbuf = 0x01f;
	movlw	low(01Fh)
	movwf	(main@pwmbuf)
	line	85
	
l49:	
	line	86
;SC8F096_Pwm_Demo.c: 85: }
;SC8F096_Pwm_Demo.c: 86: PWMD0L = pwmbuf;
	movf	(main@pwmbuf),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	goto	l47
	global	start
	ljmp	start
	opt stack 0
	line	89
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 99 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	99
global __ptext1
__ptext1:	;psect for function _Init_System
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
	line	99
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 7
; Regs used in _Init_System: [wreg+status,2]
	line	101
	
l431:	
# 101 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
nop ;# 
	line	102
# 102 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
clrwdt ;# 
psect	text1
	line	103
	
l433:	
;SC8F096_Pwm_Demo.c: 103: INTCON = 0;
	clrf	(11)	;volatile
	line	104
	
l435:	
;SC8F096_Pwm_Demo.c: 104: OSCCON = 0X72;
	movlw	low(072h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	105
	
l437:	
;SC8F096_Pwm_Demo.c: 105: OPTION_REG = 0;
	clrf	(1)	;volatile
	line	106
# 106 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Pwm_Demo\SC8F096_Pwm_Demo.c"
clrwdt ;# 
psect	text1
	line	108
;SC8F096_Pwm_Demo.c: 108: TRISA = 0B00011111;
	movlw	low(01Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	109
	
l439:	
;SC8F096_Pwm_Demo.c: 109: TRISB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	111
	
l441:	
;SC8F096_Pwm_Demo.c: 111: PORTA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	112
	
l443:	
;SC8F096_Pwm_Demo.c: 112: PORTB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	114
	
l55:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
