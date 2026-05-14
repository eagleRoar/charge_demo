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
	FNCALL	_main,_DelayXms
	FNCALL	_main,_Init_System
	FNCALL	_main,_Read_IIC
	FNCALL	_main,_Write_IIC
	FNROOT	_main
	global	_result2
	global	_result1
	global	_result
	global	_IICReadData
	global	_PORTB
_PORTB	set	0x6
	global	_TRISB
_TRISB	set	0x5
	global	_WPUB
_WPUB	set	0x8
	global	_OPTION_REG
_OPTION_REG	set	0x1
	global	_OSCCON
_OSCCON	set	0x14
	global	_INTCON
_INTCON	set	0xB
	global	_RB5
_RB5	set	0x35
	global	_PORTA
_PORTA	set	0x86
	global	_WPUA
_WPUA	set	0x88
	global	_TRISA
_TRISA	set	0x85
	global	_IICIF
_IICIF	set	0x87C
	global	_IICADD
_IICADD	set	0x194
	global	_IICCON
_IICCON	set	0x190
	global	_IICBUF
_IICBUF	set	0x193
	global	_ACKEN
_ACKEN	set	0xC8C
	global	_ACKDT
_ACKDT	set	0xC8D
	global	_RCEN
_RCEN	set	0xC8B
	global	_RSEN
_RSEN	set	0xC89
	global	_PEN
_PEN	set	0xC8A
	global	_SEN
_SEN	set	0xC88
; #config settings
	file	"SC8F096_IIC_Master_c.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_result2:
       ds      2

_result1:
       ds      2

_result:
       ds      2

_IICReadData:
       ds      1

	file	"SC8F096_IIC_Master_c.as"
	line	#
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
	clrf	((__pbssCOMMON)+6)&07Fh
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
?_DelayXms:	; 1 bytes @ 0x0
??_DelayXms:	; 1 bytes @ 0x0
?_Write_IIC:	; 1 bytes @ 0x0
?_Read_IIC:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	DelayXms@x
DelayXms@x:	; 1 bytes @ 0x0
	global	Write_IIC@data
Write_IIC@data:	; 1 bytes @ 0x0
	global	Read_IIC@data
Read_IIC@data:	; 1 bytes @ 0x0
	ds	1
??_Write_IIC:	; 1 bytes @ 0x1
??_Read_IIC:	; 1 bytes @ 0x1
	global	DelayXms@i
DelayXms@i:	; 1 bytes @ 0x1
	global	Write_IIC@Adress
Write_IIC@Adress:	; 1 bytes @ 0x1
	global	Read_IIC@ReadData
Read_IIC@ReadData:	; 1 bytes @ 0x1
	ds	1
	global	DelayXms@j
DelayXms@j:	; 1 bytes @ 0x2
	global	Read_IIC@Adress
Read_IIC@Adress:	; 1 bytes @ 0x2
	ds	1
??_main:	; 1 bytes @ 0x3
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         7
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
;!    _main->_DelayXms
;!    _main->_Read_IIC
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
;! (0) _main                                                 0     0      0     295
;!                           _DelayXms
;!                        _Init_System
;!                           _Read_IIC
;!                          _Write_IIC
;! ---------------------------------------------------------------------------------
;! (1) _Write_IIC                                            2     1      1      87
;!                                              0 COMMON     2     1      1
;! ---------------------------------------------------------------------------------
;! (1) _Read_IIC                                             3     2      1     133
;!                                              0 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (1) _Init_System                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _DelayXms                                             3     3      0      75
;!                                              0 COMMON     3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _DelayXms
;!   _Init_System
;!   _Read_IIC
;!   _Write_IIC
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
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
;;		line 152 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
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
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayXms
;;		_Init_System
;;		_Read_IIC
;;		_Write_IIC
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	152
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	152
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	154
	
l608:	
;SC8F096_IIC_Master_c.c: 154: Init_System();
	fcall	_Init_System
	line	155
	
l610:	
;SC8F096_IIC_Master_c.c: 155: TRISA |= 0B00000011;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(133)^080h,f	;volatile
	line	188
	
l612:	
;SC8F096_IIC_Master_c.c: 188: IICCON = 0B00100000;
	movlw	low(020h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(400)^0180h	;volatile
	line	189
	
l614:	
;SC8F096_IIC_Master_c.c: 189: IICADD = 36;
	movlw	low(024h)
	movwf	(404)^0180h	;volatile
	line	193
	
l616:	
;SC8F096_IIC_Master_c.c: 192: {
;SC8F096_IIC_Master_c.c: 193: DelayXms(200);
	movlw	low(0C8h)
	fcall	_DelayXms
	line	194
	
l618:	
;SC8F096_IIC_Master_c.c: 194: Write_IIC(0xa0,0x80);
	movlw	low(080h)
	movwf	(Write_IIC@data)
	movlw	low(0A0h)
	fcall	_Write_IIC
	line	196
	
l620:	
;SC8F096_IIC_Master_c.c: 196: IICReadData = Read_IIC(0xa0,0x80);
	movlw	low(080h)
	movwf	(Read_IIC@data)
	movlw	low(0A0h)
	fcall	_Read_IIC
	movwf	(_IICReadData)	;volatile
	line	197
	
l622:	
;SC8F096_IIC_Master_c.c: 197: RB5 = ~RB5;
	movlw	1<<((53)&7)
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((53)/8),f
	goto	l616
	global	start
	ljmp	start
	opt stack 0
	line	199
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Write_IIC

;; *************** function _Write_IIC *****************
;; Defined at:
;;		line 42 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
;; Parameters:    Size  Location     Type
;;  Adress          1    wreg     unsigned char 
;;  data            1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Adress          1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/300
;;		On exit  : 300/200
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	42
global __ptext1
__ptext1:	;psect for function _Write_IIC
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	42
	global	__size_of_Write_IIC
	__size_of_Write_IIC	equ	__end_of_Write_IIC-_Write_IIC
	
_Write_IIC:	
;incstack = 0
	opt	stack 7
; Regs used in _Write_IIC: [wreg]
;Write_IIC@Adress stored from wreg
	movwf	(Write_IIC@Adress)
	line	77
	
l578:	
;SC8F096_IIC_Master_c.c: 77: SEN =1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3208/8)^0180h,(3208)&7	;volatile
	line	78
;SC8F096_IIC_Master_c.c: 78: while(IICIF==0);
	
l58:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u171
	goto	u170
u171:
	goto	l58
u170:
	
l60:	
	line	79
;SC8F096_IIC_Master_c.c: 79: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	80
	
l580:	
;SC8F096_IIC_Master_c.c: 80: IICBUF = Adress;
	movf	(Write_IIC@Adress),w
	bsf	status, 5	;RP0=1, select bank3
	movwf	(403)^0180h	;volatile
	line	81
;SC8F096_IIC_Master_c.c: 81: while(IICIF==0);
	
l61:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u181
	goto	u180
u181:
	goto	l61
u180:
	
l63:	
	line	82
;SC8F096_IIC_Master_c.c: 82: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	83
	
l582:	
;SC8F096_IIC_Master_c.c: 83: IICBUF = data;
	movf	(Write_IIC@data),w
	bsf	status, 5	;RP0=1, select bank3
	movwf	(403)^0180h	;volatile
	line	84
;SC8F096_IIC_Master_c.c: 84: while(IICIF==0);
	
l64:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u191
	goto	u190
u191:
	goto	l64
u190:
	
l66:	
	line	85
;SC8F096_IIC_Master_c.c: 85: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	86
;SC8F096_IIC_Master_c.c: 86: PEN =1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3210/8)^0180h,(3210)&7	;volatile
	line	87
;SC8F096_IIC_Master_c.c: 87: while(IICIF==0);
	
l67:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u201
	goto	u200
u201:
	goto	l67
u200:
	
l69:	
	line	88
;SC8F096_IIC_Master_c.c: 88: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	90
	
l70:	
	return
	opt stack 0
GLOBAL	__end_of_Write_IIC
	__end_of_Write_IIC:
	signat	_Write_IIC,8313
	global	_Read_IIC

;; *************** function _Read_IIC *****************
;; Defined at:
;;		line 98 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
;; Parameters:    Size  Location     Type
;;  Adress          1    wreg     unsigned char 
;;  data            1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Adress          1    2[COMMON] unsigned char 
;;  ReadData        1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 300/200
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	98
global __ptext2
__ptext2:	;psect for function _Read_IIC
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	98
	global	__size_of_Read_IIC
	__size_of_Read_IIC	equ	__end_of_Read_IIC-_Read_IIC
	
_Read_IIC:	
;incstack = 0
	opt	stack 7
; Regs used in _Read_IIC: [wreg+status,2+status,0]
;Read_IIC@Adress stored from wreg
	movwf	(Read_IIC@Adress)
	line	102
	
l584:	
;SC8F096_IIC_Master_c.c: 100: unsigned char ReadData;
;SC8F096_IIC_Master_c.c: 102: SEN =1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3208/8)^0180h,(3208)&7	;volatile
	line	103
;SC8F096_IIC_Master_c.c: 103: while(IICIF==0);
	
l73:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u211
	goto	u210
u211:
	goto	l73
u210:
	
l75:	
	line	104
;SC8F096_IIC_Master_c.c: 104: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	105
	
l586:	
;SC8F096_IIC_Master_c.c: 105: IICBUF = Adress;
	movf	(Read_IIC@Adress),w
	bsf	status, 5	;RP0=1, select bank3
	movwf	(403)^0180h	;volatile
	line	106
;SC8F096_IIC_Master_c.c: 106: while(IICIF==0);
	
l76:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u221
	goto	u220
u221:
	goto	l76
u220:
	
l78:	
	line	108
;SC8F096_IIC_Master_c.c: 108: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	109
	
l588:	
;SC8F096_IIC_Master_c.c: 109: IICBUF = data;
	movf	(Read_IIC@data),w
	bsf	status, 5	;RP0=1, select bank3
	movwf	(403)^0180h	;volatile
	line	110
;SC8F096_IIC_Master_c.c: 110: while(IICIF==0);
	
l79:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u231
	goto	u230
u231:
	goto	l79
u230:
	
l81:	
	line	111
;SC8F096_IIC_Master_c.c: 111: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	113
;SC8F096_IIC_Master_c.c: 113: RSEN =1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3209/8)^0180h,(3209)&7	;volatile
	line	114
;SC8F096_IIC_Master_c.c: 114: while(IICIF==0);
	
l82:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u241
	goto	u240
u241:
	goto	l82
u240:
	
l84:	
	line	116
;SC8F096_IIC_Master_c.c: 116: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	118
	
l590:	
;SC8F096_IIC_Master_c.c: 118: IICBUF = Adress+1;
	movf	(Read_IIC@Adress),w
	addlw	01h
	bsf	status, 5	;RP0=1, select bank3
	movwf	(403)^0180h	;volatile
	line	119
;SC8F096_IIC_Master_c.c: 119: while(IICIF==0);
	
l85:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u251
	goto	u250
u251:
	goto	l85
u250:
	
l87:	
	line	120
;SC8F096_IIC_Master_c.c: 120: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	121
;SC8F096_IIC_Master_c.c: 121: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3211/8)^0180h,(3211)&7	;volatile
	line	122
;SC8F096_IIC_Master_c.c: 122: while(IICIF==0);
	
l88:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u261
	goto	u260
u261:
	goto	l88
u260:
	
l90:	
	line	123
;SC8F096_IIC_Master_c.c: 123: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	124
	
l592:	
	bsf	status, 5	;RP0=1, select bank3
	movf	(403)^0180h,w	;volatile
	line	126
	
l594:	
;SC8F096_IIC_Master_c.c: 126: ACKDT = 0;
	bcf	(3213/8)^0180h,(3213)&7	;volatile
	line	127
	
l596:	
;SC8F096_IIC_Master_c.c: 127: ACKEN = 1;
	bsf	(3212/8)^0180h,(3212)&7	;volatile
	line	129
;SC8F096_IIC_Master_c.c: 129: while(IICIF==0);
	
l91:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u271
	goto	u270
u271:
	goto	l91
u270:
	
l93:	
	line	130
;SC8F096_IIC_Master_c.c: 130: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	132
;SC8F096_IIC_Master_c.c: 132: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3211/8)^0180h,(3211)&7	;volatile
	line	133
;SC8F096_IIC_Master_c.c: 133: while(IICIF==0);
	
l94:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u281
	goto	u280
u281:
	goto	l94
u280:
	
l96:	
	line	134
;SC8F096_IIC_Master_c.c: 134: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	135
	
l598:	
;SC8F096_IIC_Master_c.c: 135: ReadData = IICBUF;
	bsf	status, 5	;RP0=1, select bank3
	movf	(403)^0180h,w	;volatile
	movwf	(Read_IIC@ReadData)
	line	137
	
l600:	
;SC8F096_IIC_Master_c.c: 137: ACKDT = 1;
	bsf	(3213/8)^0180h,(3213)&7	;volatile
	line	138
	
l602:	
;SC8F096_IIC_Master_c.c: 138: ACKEN = 1;
	bsf	(3212/8)^0180h,(3212)&7	;volatile
	line	140
;SC8F096_IIC_Master_c.c: 140: while(IICIF==0);
	
l97:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u291
	goto	u290
u291:
	goto	l97
u290:
	
l99:	
	line	141
;SC8F096_IIC_Master_c.c: 141: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	143
;SC8F096_IIC_Master_c.c: 143: PEN = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3210/8)^0180h,(3210)&7	;volatile
	line	144
;SC8F096_IIC_Master_c.c: 144: while(IICIF==0);
	
l100:	
	bcf	status, 5	;RP0=0, select bank2
	btfss	(2172/8)^0100h,(2172)&7	;volatile
	goto	u301
	goto	u300
u301:
	goto	l100
u300:
	
l102:	
	line	145
;SC8F096_IIC_Master_c.c: 145: IICIF = 0;
	bcf	(2172/8)^0100h,(2172)&7	;volatile
	line	147
	
l604:	
;SC8F096_IIC_Master_c.c: 147: return ReadData;
	movf	(Read_IIC@ReadData),w
	line	150
	
l103:	
	return
	opt stack 0
GLOBAL	__end_of_Read_IIC
	__end_of_Read_IIC:
	signat	_Read_IIC,8313
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 210 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
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
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	210
global __ptext3
__ptext3:	;psect for function _Init_System
psect	text3
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	210
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 7
; Regs used in _Init_System: [wreg+status,2]
	line	212
	
l542:	
# 212 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
nop ;# 
	line	213
# 213 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
clrwdt ;# 
psect	text3
	line	214
	
l544:	
;SC8F096_IIC_Master_c.c: 214: INTCON = 0;
	clrf	(11)	;volatile
	line	215
	
l546:	
;SC8F096_IIC_Master_c.c: 215: OSCCON = 0X70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	216
	
l548:	
;SC8F096_IIC_Master_c.c: 216: OPTION_REG = 0;
	clrf	(1)	;volatile
	line	218
	
l550:	
;SC8F096_IIC_Master_c.c: 218: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	219
	
l552:	
;SC8F096_IIC_Master_c.c: 219: WPUB = 0B00001000;
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	222
	
l554:	
;SC8F096_IIC_Master_c.c: 222: TRISA = 0B00000011;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	223
	
l556:	
;SC8F096_IIC_Master_c.c: 223: TRISB = 0B00001000;
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	225
	
l558:	
;SC8F096_IIC_Master_c.c: 225: PORTA = 0B00000011;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	226
	
l560:	
;SC8F096_IIC_Master_c.c: 226: PORTB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	228
	
l116:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
	global	_DelayXms

;; *************** function _DelayXms *****************
;; Defined at:
;;		line 22 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    0[COMMON] unsigned char 
;;  j               1    2[COMMON] unsigned char 
;;  i               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/300
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	22
global __ptext4
__ptext4:	;psect for function _DelayXms
psect	text4
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_IIC_Master_Demo\SC8F096_IIC_Master_c.c"
	line	22
	global	__size_of_DelayXms
	__size_of_DelayXms	equ	__end_of_DelayXms-_DelayXms
	
_DelayXms:	
;incstack = 0
	opt	stack 7
; Regs used in _DelayXms: [wreg+status,2+status,0]
;DelayXms@x stored from wreg
	movwf	(DelayXms@x)
	line	25
	
l492:	
;SC8F096_IIC_Master_c.c: 24: unsigned char i,j;
;SC8F096_IIC_Master_c.c: 25: for(i=x;i>0;i--)
	movf	(DelayXms@x),w
	movwf	(DelayXms@i)
	
l494:	
	movf	((DelayXms@i)),w
	btfss	status,2
	goto	u11
	goto	u10
u11:
	goto	l498
u10:
	goto	l55
	line	26
	
l498:	
;SC8F096_IIC_Master_c.c: 26: for(j=153;j>0;j--);
	movlw	low(099h)
	movwf	(DelayXms@j)
	
l504:	
	decf	(DelayXms@j),f
	
l506:	
	movf	((DelayXms@j)),w
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l504
u20:
	line	25
	
l508:	
	decf	(DelayXms@i),f
	goto	l494
	line	27
	
l55:	
	return
	opt stack 0
GLOBAL	__end_of_DelayXms
	__end_of_DelayXms:
	signat	_DelayXms,4217
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
