opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096
opt include "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\sc8f096.cgen.inc"
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
# 13 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
INDF EQU 00H ;# 
# 20 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
OPTION_REG EQU 01H ;# 
# 27 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PCL EQU 02H ;# 
# 34 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
STATUS EQU 03H ;# 
# 41 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
FSR EQU 04H ;# 
# 48 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TRISB EQU 05H ;# 
# 55 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PORTB EQU 06H ;# 
# 62 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPDB EQU 07H ;# 
# 69 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPUB EQU 08H ;# 
# 76 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IOCB EQU 09H ;# 
# 83 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PCLATH EQU 0AH ;# 
# 90 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
INTCON EQU 0BH ;# 
# 97 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
QCCON EQU 0CH ;# 
# 104 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PIR1 EQU 0DH ;# 
# 111 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PIE1 EQU 0EH ;# 
# 118 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CMP1CON0 EQU 0FH ;# 
# 125 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CMP1CON1 EQU 10H ;# 
# 132 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PR2 EQU 11H ;# 
# 139 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TMR2 EQU 12H ;# 
# 146 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
T2CON EQU 13H ;# 
# 153 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
OSCCON EQU 14H ;# 
# 160 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMCON0 EQU 15H ;# 
# 167 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMCON1 EQU 16H ;# 
# 174 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMTL EQU 17H ;# 
# 181 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMTH EQU 18H ;# 
# 188 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMD0L EQU 19H ;# 
# 195 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMD1L EQU 1AH ;# 
# 202 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMD4L EQU 1BH ;# 
# 209 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMT4L EQU 1CH ;# 
# 216 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMCON2 EQU 1DH ;# 
# 223 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMDH EQU 1EH ;# 
# 230 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWM01DT EQU 1FH ;# 
# 237 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TMR0 EQU 81H ;# 
# 244 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TRISA EQU 85H ;# 
# 251 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PORTA EQU 86H ;# 
# 258 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPDA EQU 87H ;# 
# 265 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPUA EQU 88H ;# 
# 272 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IOCA EQU 89H ;# 
# 279 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ANSEL3 EQU 8CH ;# 
# 286 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EECON1 EQU 8DH ;# 
# 293 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EECON2 EQU 8EH ;# 
# 300 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EEDAT EQU 8FH ;# 
# 307 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EEDATH EQU 90H ;# 
# 314 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EEADR EQU 91H ;# 
# 321 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
EEADRH EQU 92H ;# 
# 328 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ANSEL0 EQU 93H ;# 
# 335 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ANSEL1 EQU 94H ;# 
# 342 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ADCON0 EQU 95H ;# 
# 349 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ADCON1 EQU 96H ;# 
# 356 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ADRESL EQU 98H ;# 
# 363 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ADRESH EQU 99H ;# 
# 370 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CMP2CON0 EQU 9AH ;# 
# 377 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMD2L EQU 9BH ;# 
# 384 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWMD3L EQU 9CH ;# 
# 391 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PWM23DT EQU 9DH ;# 
# 398 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SEGEN0 EQU 9EH ;# 
# 405 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CMP2CON1 EQU 9FH ;# 
# 412 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TRISC EQU 105H ;# 
# 419 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PORTC EQU 106H ;# 
# 426 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PORTD EQU 107H ;# 
# 433 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPUC EQU 108H ;# 
# 440 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
ANSEL2 EQU 109H ;# 
# 447 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TMR1L EQU 10CH ;# 
# 454 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TMR1H EQU 10DH ;# 
# 461 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
T1CON EQU 10EH ;# 
# 468 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PIR2 EQU 10FH ;# 
# 475 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PIE2 EQU 110H ;# 
# 482 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
KEYCON0 EQU 111H ;# 
# 489 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
KEYCON1 EQU 112H ;# 
# 496 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
KEYCON2 EQU 113H ;# 
# 503 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TRISD EQU 114H ;# 
# 510 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
WPUD EQU 115H ;# 
# 517 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
KEYDATAL EQU 116H ;# 
# 524 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
KEYDATAH EQU 117H ;# 
# 531 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TXSTA0 EQU 118H ;# 
# 538 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
RCSTA0 EQU 119H ;# 
# 545 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SPBRG0 EQU 11AH ;# 
# 552 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TXREG0 EQU 11BH ;# 
# 559 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
RCREG0 EQU 11CH ;# 
# 566 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LCDCON0 EQU 11DH ;# 
# 573 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LCDCON1 EQU 11EH ;# 
# 580 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SEGEN1 EQU 11FH ;# 
# 587 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SEGEN2 EQU 181H ;# 
# 594 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TXSTA1 EQU 185H ;# 
# 601 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
RCSTA1 EQU 186H ;# 
# 608 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
TXREG1 EQU 187H ;# 
# 615 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
RCREG1 EQU 188H ;# 
# 622 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SPBRG1 EQU 189H ;# 
# 629 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
OPACON EQU 18CH ;# 
# 636 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
OPAADJ EQU 18DH ;# 
# 643 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LEDCTR0 EQU 18EH ;# 
# 650 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LEDCTR1 EQU 18FH ;# 
# 657 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IICCON EQU 190H ;# 
# 664 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IICCON2 EQU 191H ;# 
# 671 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IICSTAT EQU 192H ;# 
# 678 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IICBUF EQU 193H ;# 
# 685 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
IICADD EQU 194H ;# 
# 692 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CC0CON EQU 195H ;# 
# 699 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
CC1CON EQU 196H ;# 
# 706 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PDCON0 EQU 197H ;# 
# 713 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PDCON1 EQU 198H ;# 
# 720 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PDADD EQU 199H ;# 
# 727 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PDRDATA EQU 19AH ;# 
# 734 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
PDSDATA EQU 19BH ;# 
# 741 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LCDADD EQU 19CH ;# 
# 748 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
LCDDATA EQU 19DH ;# 
# 755 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
COMEN EQU 19EH ;# 
# 762 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta14\data\include\SC8F096.h"
SEGEN3 EQU 19FH ;# 
	FNCALL	_main,_Set_LCD_Moudle
	FNCALL	_main,_UpData
	FNROOT	_main
	FNCALL	intlevel1,_Timer_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	Timer_Isr@tcount
	global	_LCD_DataBuf
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
	global	_SEGEN0
_SEGEN0	set	158
	global	_TRISA
_TRISA	set	133
	global	_SEGEN1
_SEGEN1	set	287
	global	_LCDCON1
_LCDCON1	set	286
	global	_LCDCON0
_LCDCON0	set	285
	global	_TRISD
_TRISD	set	276
	global	_PIE2
_PIE2	set	272
	global	_PIR2
_PIR2	set	271
	global	_TRISC
_TRISC	set	261
	global	_LCDEN
_LCDEN	set	0x8EF
	global	_SEGEN3
_SEGEN3	set	415
	global	_COMEN
_COMEN	set	414
	global	_LCDDATA
_LCDDATA	set	413
	global	_LCDADD
_LCDADD	set	412
	global	_SEGEN2
_SEGEN2	set	385
	global	_CC1_RD
_CC1_RD	set	0xCB1
	global	_CC0_RD
_CC0_RD	set	0xCA9
	global	_LCDCS
_LCDCS	set	0xCE7
; #config settings
	file	"SC8F096_Lcd_Demo.as"
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

_LCD_DataBuf:
       ds      1

_sec:
       ds      1

	file	"SC8F096_Lcd_Demo.as"
	line	#
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
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
?_Set_LCD_Moudle:	; 1 bytes @ 0x0
?_UpData:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Timer_Isr:	; 1 bytes @ 0x0
??_Timer_Isr:	; 1 bytes @ 0x0
	ds	2
??_Set_LCD_Moudle:	; 1 bytes @ 0x2
??_UpData:	; 1 bytes @ 0x2
	global	UpData@Val
UpData@Val:	; 1 bytes @ 0x2
	ds	1
	global	UpData@i
UpData@i:	; 1 bytes @ 0x3
	ds	1
??_main:	; 1 bytes @ 0x4
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         3
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      4       8
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
;!    _main->_UpData
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
;! (0) _main                                                 0     0      0      60
;!                     _Set_LCD_Moudle
;!                             _UpData
;! ---------------------------------------------------------------------------------
;! (1) _UpData                                               2     2      0      60
;!                                              2 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Set_LCD_Moudle                                       0     0      0       0
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
;!   _Set_LCD_Moudle
;!   _UpData
;!
;! _Timer_Isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       1       0        7.1%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      4       8       1       57.1%
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
;!ABS                  0      0       8      11        0.0%
;!DATA                 0      0       8      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 22 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
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
;;		_Set_LCD_Moudle
;;		_UpData
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
	line	22
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
	line	22
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	25
	
l681:	
# 25 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
nop ;# 
	line	26
# 26 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
clrwdt ;# 
psect	maintext
	line	28
	
l683:	
;SC8F096_Lcd_Demo.c: 28: OSCCON = 0x70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	29
	
l685:	
;SC8F096_Lcd_Demo.c: 29: INTCON = 0;
	clrf	(11)	;volatile
	line	31
	
l687:	
;SC8F096_Lcd_Demo.c: 31: PIR1 = 0;
	clrf	(13)	;volatile
	line	32
	
l689:	
;SC8F096_Lcd_Demo.c: 32: PIE1 = 0;
	clrf	(14)	;volatile
	line	33
	
l691:	
;SC8F096_Lcd_Demo.c: 33: PIR2 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(271)^0100h	;volatile
	line	34
	
l693:	
;SC8F096_Lcd_Demo.c: 34: PIE2 = 0;
	clrf	(272)^0100h	;volatile
	line	36
	
l695:	
;SC8F096_Lcd_Demo.c: 36: PR2 = 124;
	movlw	low(07Ch)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	37
	
l697:	
;SC8F096_Lcd_Demo.c: 37: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	38
	
l699:	
;SC8F096_Lcd_Demo.c: 38: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	39
	
l701:	
;SC8F096_Lcd_Demo.c: 39: T2CON = 0x05;
	movlw	low(05h)
	movwf	(19)	;volatile
	line	41
	
l703:	
;SC8F096_Lcd_Demo.c: 41: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	43
	
l705:	
;SC8F096_Lcd_Demo.c: 43: TRISC = 0B00001111;
	movlw	low(0Fh)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	44
	
l707:	
;SC8F096_Lcd_Demo.c: 44: TRISB = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	45
	
l709:	
;SC8F096_Lcd_Demo.c: 45: TRISA = 0B11111111;
	movlw	low(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	46
	
l711:	
;SC8F096_Lcd_Demo.c: 46: TRISD = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(276)^0100h	;volatile
	line	48
	
l713:	
;SC8F096_Lcd_Demo.c: 48: Set_LCD_Moudle();
	fcall	_Set_LCD_Moudle
	line	49
	
l715:	
;SC8F096_Lcd_Demo.c: 49: UpData(0x01);
	movlw	low(01h)
	fcall	_UpData
	line	52
	
l717:	
;SC8F096_Lcd_Demo.c: 51: {
;SC8F096_Lcd_Demo.c: 52: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u31
	goto	u30
u31:
	goto	l717
u30:
	line	54
	
l719:	
;SC8F096_Lcd_Demo.c: 53: {
;SC8F096_Lcd_Demo.c: 54: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	55
# 55 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
clrwdt ;# 
psect	maintext
	line	56
	
l721:	
;SC8F096_Lcd_Demo.c: 56: ++sec;
	incf	(_sec),f	;volatile
	line	57
	
l723:	
;SC8F096_Lcd_Demo.c: 57: if(sec >= 250)
	movlw	low(0FAh)
	subwf	(_sec),w	;volatile
	skipc
	goto	u41
	goto	u40
u41:
	goto	l717
u40:
	line	59
	
l725:	
;SC8F096_Lcd_Demo.c: 58: {
;SC8F096_Lcd_Demo.c: 59: sec = 0;
	clrf	(_sec)	;volatile
	line	60
	
l727:	
;SC8F096_Lcd_Demo.c: 60: UpData(0x01);
	movlw	low(01h)
	fcall	_UpData
	goto	l717
	global	start
	ljmp	start
	opt stack 0
	line	64
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_UpData

;; *************** function _UpData *****************
;; Defined at:
;;		line 98 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
;; Parameters:    Size  Location     Type
;;  Val             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Val             1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/200
;;		On exit  : 300/300
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	98
global __ptext1
__ptext1:	;psect for function _UpData
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
	line	98
	global	__size_of_UpData
	__size_of_UpData	equ	__end_of_UpData-_UpData
	
_UpData:	
;incstack = 0
	opt	stack 6
; Regs used in _UpData: [wreg+status,2+status,0]
;UpData@Val stored from wreg
	movwf	(UpData@Val)
	line	102
	
l669:	
;SC8F096_Lcd_Demo.c: 100: volatile unsigned char i;
;SC8F096_Lcd_Demo.c: 102: for(i=0;i<=23;i++)
	clrf	(UpData@i)	;volatile
	
l671:	
	movlw	low(018h)
	subwf	(UpData@i),w	;volatile
	skipc
	goto	u11
	goto	u10
u11:
	goto	l260
u10:
	goto	l261
	line	103
	
l260:	
	line	105
;SC8F096_Lcd_Demo.c: 103: {
;SC8F096_Lcd_Demo.c: 105: LCDCS=1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3303/8)^0180h,(3303)&7	;volatile
	line	106
	
l675:	
;SC8F096_Lcd_Demo.c: 106: LCDADD = (unsigned char)(LCDADD & 0xE0 | i);
	movf	(412)^0180h,w	;volatile
	andlw	0E0h
	iorwf	(UpData@i),w	;volatile
	movwf	(412)^0180h	;volatile
	line	107
	
l677:	
;SC8F096_Lcd_Demo.c: 107: LCDDATA = Val;
	movf	(UpData@Val),w
	movwf	(413)^0180h	;volatile
	line	102
	incf	(UpData@i),f	;volatile
	
l679:	
	movlw	low(018h)
	subwf	(UpData@i),w	;volatile
	skipc
	goto	u21
	goto	u20
u21:
	goto	l260
u20:
	
l261:	
	line	109
;SC8F096_Lcd_Demo.c: 108: }
;SC8F096_Lcd_Demo.c: 109: LCDCS=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3303/8)^0180h,(3303)&7	;volatile
	line	110
	
l262:	
	return
	opt stack 0
GLOBAL	__end_of_UpData
	__end_of_UpData:
	signat	_UpData,4217
	global	_Set_LCD_Moudle

;; *************** function _Set_LCD_Moudle *****************
;; Defined at:
;;		line 120 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/200
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
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	120
global __ptext2
__ptext2:	;psect for function _Set_LCD_Moudle
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
	line	120
	global	__size_of_Set_LCD_Moudle
	__size_of_Set_LCD_Moudle	equ	__end_of_Set_LCD_Moudle-_Set_LCD_Moudle
	
_Set_LCD_Moudle:	
;incstack = 0
	opt	stack 6
; Regs used in _Set_LCD_Moudle: [wreg+status,2+status,0]
	line	122
	
l641:	
;SC8F096_Lcd_Demo.c: 122: TRISA |= 0XFF;
	movlw	low(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	123
;SC8F096_Lcd_Demo.c: 123: TRISB |= 0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	124
	
l643:	
;SC8F096_Lcd_Demo.c: 124: TRISC |= (0X0F);
	movlw	low(0Fh)
	bsf	status, 6	;RP1=1, select bank2
	iorwf	(261)^0100h,f	;volatile
	line	125
	
l645:	
;SC8F096_Lcd_Demo.c: 125: TRISD |= (0XFF);
	movlw	low(0FFh)
	movwf	(276)^0100h	;volatile
	line	126
	
l647:	
;SC8F096_Lcd_Demo.c: 126: CC0_RD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bcf	(3241/8)^0180h,(3241)&7	;volatile
	line	127
	
l649:	
;SC8F096_Lcd_Demo.c: 127: CC1_RD = 0;
	bcf	(3249/8)^0180h,(3249)&7	;volatile
	line	128
	
l651:	
;SC8F096_Lcd_Demo.c: 128: LCDCON0 = 0B00010100;
	movlw	low(014h)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(285)^0100h	;volatile
	line	157
	
l653:	
;SC8F096_Lcd_Demo.c: 157: LCDCON1 = 0B01000000;
	movlw	low(040h)
	movwf	(286)^0100h	;volatile
	line	174
	
l655:	
;SC8F096_Lcd_Demo.c: 174: COMEN = 0B00001111;
	movlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(414)^0180h	;volatile
	line	175
	
l657:	
;SC8F096_Lcd_Demo.c: 175: SEGEN0 = 0xff;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(158)^080h	;volatile
	line	176
	
l659:	
;SC8F096_Lcd_Demo.c: 176: SEGEN1 = 0xff;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(287)^0100h	;volatile
	line	177
	
l661:	
;SC8F096_Lcd_Demo.c: 177: SEGEN2 = 0xff;
	movlw	low(0FFh)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(385)^0180h	;volatile
	line	178
	
l663:	
;SC8F096_Lcd_Demo.c: 178: SEGEN3 = 0B01000000;
	movlw	low(040h)
	movwf	(415)^0180h	;volatile
	line	197
	
l665:	
;SC8F096_Lcd_Demo.c: 197: LCDADD = 0B00000000;
	clrf	(412)^0180h	;volatile
	line	213
	
l667:	
;SC8F096_Lcd_Demo.c: 213: LCDEN = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	(2287/8)^0100h,(2287)&7	;volatile
	line	214
	
l265:	
	return
	opt stack 0
GLOBAL	__end_of_Set_LCD_Moudle
	__end_of_Set_LCD_Moudle:
	signat	_Set_LCD_Moudle,89
	global	_Timer_Isr

;; *************** function _Timer_Isr *****************
;; Defined at:
;;		line 74 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
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
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	74
global __ptext3
__ptext3:	;psect for function _Timer_Isr
psect	text3
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_Lcd_Demo\SC8F096_Lcd_Demo.c"
	line	74
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
psect	text3
	line	78
	
i1l729:	
;SC8F096_Lcd_Demo.c: 76: static unsigned char tcount = 0;
;SC8F096_Lcd_Demo.c: 78: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l257
u5_20:
	line	80
	
i1l731:	
;SC8F096_Lcd_Demo.c: 79: {
;SC8F096_Lcd_Demo.c: 80: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	81
	
i1l733:	
;SC8F096_Lcd_Demo.c: 81: if(++tcount >= 40)
	movlw	low(028h)
	incf	(Timer_Isr@tcount),f
	subwf	((Timer_Isr@tcount)),w
	skipc
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l257
u6_20:
	line	83
	
i1l735:	
;SC8F096_Lcd_Demo.c: 82: {
;SC8F096_Lcd_Demo.c: 83: tcount = 0;
	clrf	(Timer_Isr@tcount)
	line	84
	
i1l737:	
;SC8F096_Lcd_Demo.c: 84: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	87
	
i1l257:	
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
