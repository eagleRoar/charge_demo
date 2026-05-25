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
	FNCALL	_main,_AD_Init
	FNCALL	_main,_Init_System
	FNCALL	_main,___ftdiv
	FNCALL	_main,___fttol
	FNCALL	_main,___lwtoft
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNROOT	_main
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_result
	global	_power_ad
	global	_adresult
	global	_test_adc
psect	nvBANK0,class=BANK0,space=1,noexec
global __pnvBANK0
__pnvBANK0:
_test_adc:
       ds      1

	global	_OSCCON
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
	global	_TRISB7
_TRISB7	set	0x2F
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
	global	_WPUC
_WPUC	set	264
	global	_PORTD
_PORTD	set	263
	global	_PORTC
_PORTC	set	262
	global	_TRISC
_TRISC	set	261
	global	_CC1CON
_CC1CON	set	406
	global	_CC0CON
_CC0CON	set	405
; #config settings
	file	"SC8F096_ADC_Demo.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_result:
       ds      2

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_power_ad:
       ds      2

_adresult:
       ds      2

	file	"SC8F096_ADC_Demo.as"
	line	#
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
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
?_AD_Init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
??_Isr_Timer:	; 1 bytes @ 0x0
	ds	2
??_Init_System:	; 1 bytes @ 0x2
??_AD_Init:	; 1 bytes @ 0x2
?_ADC_Sample:	; 1 bytes @ 0x2
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x2
	global	ADC_Sample@adldo
ADC_Sample@adldo:	; 1 bytes @ 0x2
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x2
	ds	1
??_ADC_Sample:	; 1 bytes @ 0x3
	ds	2
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x5
	ds	1
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x6
	ds	1
??___ftpack:	; 1 bytes @ 0x7
	ds	3
??___lwtoft:	; 1 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x0
	global	ADC_Sample@j
ADC_Sample@j:	; 1 bytes @ 0x0
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x0
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x1
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x2
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x3
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x3
	global	ADC_Sample@adsum
ADC_Sample@adsum:	; 4 bytes @ 0x3
	ds	3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x6
	ds	1
	global	ADC_Sample@admin
ADC_Sample@admin:	; 2 bytes @ 0x7
	ds	2
??___ftdiv:	; 1 bytes @ 0x9
	global	ADC_Sample@admax
ADC_Sample@admax:	; 2 bytes @ 0x9
	ds	2
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0xB
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0xC
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0xD
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x10
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x11
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x12
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x12
	ds	4
??___fttol:	; 1 bytes @ 0x16
	ds	3
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x19
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x1A
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x1E
	ds	1
??_main:	; 1 bytes @ 0x1F
	ds	1
	global	main@power_temp
main@power_temp:	; 4 bytes @ 0x20
	ds	4
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         6
;!    Persistent  1
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     10      12
;!    BANK0            80     36      41
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
;!    ___lwtoft->___ftpack
;!    ___ftdiv->___ftpack
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->___fttol
;!    ___fttol->___ftdiv
;!    ___ftdiv->___lwtoft
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 5     5      0    4695
;!                                             31 BANK0      5     5      0
;!                         _ADC_Sample
;!                            _AD_Init
;!                        _Init_System
;!                            ___ftdiv
;!                            ___fttol
;!                           ___lwtoft
;! ---------------------------------------------------------------------------------
;! (1) ___lwtoft                                             3     0      3    1704
;!                                              0 BANK0      3     0      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (1) ___fttol                                             13     9      4     305
;!                                             18 BANK0     13     9      4
;!                            ___ftdiv (ARG)
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (1) ___ftdiv                                             15     9      6    2017
;!                                              3 BANK0     15     9      6
;!                           ___ftpack
;!                           ___lwtoft (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___ftpack                                             8     3      5    1629
;!                                              2 COMMON     8     3      5
;! ---------------------------------------------------------------------------------
;! (1) _Init_System                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _AD_Init                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_Sample                                          18    17      1     635
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
;!   _AD_Init
;!   _Init_System
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
;!
;! _Isr_Timer (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      A       C       1       85.7%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50     24      29       4       51.3%
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
;!ABS                  0      0      35      11        0.0%
;!DATA                 0      0      35      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 120 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  power_temp      4   32[BANK0 ] volatile unsigned long 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADC_Sample
;;		_AD_Init
;;		_Init_System
;;		___ftdiv
;;		___fttol
;;		___lwtoft
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	120
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	120
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	122
	
l1174:	
;SC8F096_ADC.c: 122: Init_System();
	fcall	_Init_System
	line	123
;SC8F096_ADC.c: 123: AD_Init();
	fcall	_AD_Init
	line	125
;SC8F096_ADC.c: 125: while (1)
	
l267:	
	line	127
# 127 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	maintext
	line	130
	
l1176:	
;SC8F096_ADC.c: 130: TRISB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(47/8),(47)&7	;volatile
	line	131
	
l1178:	
;SC8F096_ADC.c: 131: ANSEL1 |= 0X80;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(148)^080h+(7/8),(7)&7	;volatile
	line	132
;SC8F096_ADC.c: 132: test_adc = ADC_Sample(15, 7);
	movlw	low(07h)
	movwf	(ADC_Sample@adldo)
	movlw	low(0Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	133
	
l1180:	
;SC8F096_ADC.c: 133: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u761
	goto	u760
u761:
	goto	l1184
u760:
	goto	l1188
	line	139
	
l1184:	
;SC8F096_ADC.c: 137: else
;SC8F096_ADC.c: 138: {
;SC8F096_ADC.c: 139: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	140
;SC8F096_ADC.c: 140: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	141
	
l1186:	
;SC8F096_ADC.c: 141: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0),f
	u787:
decfsz	(??_main+0)+0,f
	goto	u787
	nop
opt asmopt_pop

	line	144
	
l1188:	
;SC8F096_ADC.c: 142: }
;SC8F096_ADC.c: 144: test_adc = ADC_Sample(31, 0);
	clrf	(ADC_Sample@adldo)
	movlw	low(01Fh)
	fcall	_ADC_Sample
	movwf	(_test_adc)	;volatile
	line	145
	
l1190:	
;SC8F096_ADC.c: 145: if (0xA5 == test_adc)
		movlw	165
	xorwf	((_test_adc)),w	;volatile
	btfss	status,2
	goto	u771
	goto	u770
u771:
	goto	l1196
u770:
	line	149
	
l1192:	
;SC8F096_ADC.c: 146: {
;SC8F096_ADC.c: 147: volatile unsigned long power_temp;
;SC8F096_ADC.c: 149: power_temp = (unsigned long)(((4096UL*1.2*1000))/adresult);
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
	movwf	(main@power_temp+3)	;volatile
	movf	(2+(?___fttol)),w
	movwf	(main@power_temp+2)	;volatile
	movf	(1+(?___fttol)),w
	movwf	(main@power_temp+1)	;volatile
	movf	(0+(?___fttol)),w
	movwf	(main@power_temp)	;volatile

	line	150
	
l1194:	
;SC8F096_ADC.c: 150: power_ad = (unsigned int)(power_temp);
	movf	(main@power_temp+1),w	;volatile
	movwf	(_power_ad+1)	;volatile
	movf	(main@power_temp),w	;volatile
	movwf	(_power_ad)	;volatile
	line	151
;SC8F096_ADC.c: 151: }
	goto	l267
	line	154
	
l1196:	
;SC8F096_ADC.c: 152: else
;SC8F096_ADC.c: 153: {
;SC8F096_ADC.c: 154: ADCON0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(149)^080h	;volatile
	line	155
;SC8F096_ADC.c: 155: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	156
	
l1198:	
;SC8F096_ADC.c: 156: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	132
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0),f
	u797:
decfsz	(??_main+0)+0,f
	goto	u797
	nop
opt asmopt_pop

	goto	l267
	global	start
	ljmp	start
	opt stack 0
	line	161
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	___lwtoft

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 28 in file "D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
global __ptext1
__ptext1:	;psect for function ___lwtoft
psect	text1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\lwtoft.c"
	line	28
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
;incstack = 0
	opt	stack 5
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l1144:	
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
	
l644:	
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
;;  f1              3   18[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   26[BANK0 ] unsigned long 
;;  exp1            1   30[BANK0 ] unsigned char 
;;  sign1           1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   18[BANK0 ] long 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
global __ptext2
__ptext2:	;psect for function ___fttol
psect	text2
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
;incstack = 0
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l1104:	
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
	goto	u661
	goto	u660
u661:
	goto	l1108
u660:
	line	50
	
l1106:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l535
	line	51
	
l1108:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u675:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u670:
	addlw	-1
	skipz
	goto	u675
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l1110:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l1112:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l1114:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l1116:	
	movlw	08Eh
	subwf	(___fttol@exp1),f
	line	56
	
l1118:	
	btfss	(___fttol@exp1),7
	goto	u681
	goto	u680
u681:
	goto	l1128
u680:
	line	57
	
l1120:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u691
	goto	u690
u691:
	goto	l1124
u690:
	goto	l1106
	line	60
	
l1124:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l1126:	
	incfsz	(___fttol@exp1),f
	goto	u701
	goto	u700
u701:
	goto	l1124
u700:
	goto	l1136
	line	63
	
l1128:	
	movlw	low(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u711
	goto	u710
u711:
	goto	l1134
u710:
	goto	l1106
	line	66
	
l1132:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	65
	
l1134:	
	movf	((___fttol@exp1)),w
	btfss	status,2
	goto	u721
	goto	u720
u721:
	goto	l1132
u720:
	line	70
	
l1136:	
	movf	((___fttol@sign1)),w
	btfsc	status,2
	goto	u731
	goto	u730
u731:
	goto	l1140
u730:
	line	71
	
l1138:	
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
	
l1140:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l535:	
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
;;  f2              3    3[BANK0 ] float 
;;  f1              3    6[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   13[BANK0 ] float 
;;  sign            1   17[BANK0 ] unsigned char 
;;  exp             1   16[BANK0 ] unsigned char 
;;  cntr            1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    3[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
global __ptext3
__ptext3:	;psect for function ___ftdiv
psect	text3
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\ftdiv.c"
	line	56
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
;incstack = 0
	opt	stack 5
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l1064:	
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
	goto	u621
	goto	u620
u621:
	goto	l1068
u620:
	line	64
	
l1066:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l499
	line	65
	
l1068:	
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
	goto	u631
	goto	u630
u631:
	goto	l500
u630:
	line	66
	
l1070:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l499
	
l500:	
	line	67
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	68
	
l1072:	
	movlw	low(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	69
	
l1074:	
	movf	0+(___ftdiv@f1)+02h,w
	movwf	(___ftdiv@sign)
	line	70
	
l1076:	
	movf	0+(___ftdiv@f2)+02h,w
	xorwf	(___ftdiv@sign),f
	line	71
	
l1078:	
	movlw	low(080h)
	andwf	(___ftdiv@sign),f
	line	72
	
l1080:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	73
	
l1082:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	74
	
l1084:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	75
	
l1086:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	76
	
l1088:	
	movlw	low(018h)
	movwf	(___ftdiv@cntr)
	line	78
	
l1090:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	79
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u645
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u645
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u645:
	skipc
	goto	u641
	goto	u640
u641:
	goto	l1096
u640:
	line	80
	
l1092:	
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
	
l1094:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	83
	
l1096:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	84
	
l1098:	
	decfsz	(___ftdiv@cntr),f
	goto	u651
	goto	u650
u651:
	goto	l1090
u650:
	line	85
	
l1100:	
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
	
l499:	
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
;;  arg             3    2[COMMON] unsigned um
;;  exp             1    5[COMMON] unsigned char 
;;  sign            1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    2[COMMON] float 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___lwtoft
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
global __ptext4
__ptext4:	;psect for function ___ftpack
psect	text4
	file	"D:\6.software\58.SCMCU_IDE\SCMCU_IDE_V2.00.16\data\sources\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
;incstack = 0
	opt	stack 5
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l922:	
	movf	((___ftpack@exp)),w
	btfsc	status,2
	goto	u391
	goto	u390
u391:
	goto	l446
u390:
	
l924:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u401
	goto	u400
u401:
	goto	l928
u400:
	
l446:	
	line	65
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l447
	line	67
	
l926:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l928:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u411
	goto	u410
u411:
	goto	l926
u410:
	goto	l932
	line	71
	
l930:	
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
	
l932:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u421
	goto	u420
u421:
	goto	l930
u420:
	goto	l936
	line	76
	
l934:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l936:	
	btfsc	(___ftpack@arg+1),(15)&7
	goto	u431
	goto	u430
u431:
	goto	l458
u430:
	
l938:	
	movlw	low(02h)
	subwf	(___ftpack@exp),w
	skipnc
	goto	u441
	goto	u440
u441:
	goto	l934
u440:
	
l458:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u451
	goto	u450
u451:
	goto	l459
u450:
	line	80
	
l940:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l459:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l942:	
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
	goto	u461
	goto	u460
u461:
	goto	l460
u460:
	line	84
	
l944:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l460:	
	line	85
	line	86
	
l447:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 170 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
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
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	170
global __ptext5
__ptext5:	;psect for function _Init_System
psect	text5
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	170
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 6
; Regs used in _Init_System: [wreg+status,2]
	line	172
	
l1016:	
# 172 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
	line	173
# 173 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	text5
	line	174
	
l1018:	
;SC8F096_ADC.c: 174: OPTION_REG = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(1)	;volatile
	line	175
# 175 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
clrwdt ;# 
psect	text5
	line	176
	
l1020:	
;SC8F096_ADC.c: 176: OSCCON = 0X70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	178
	
l1022:	
;SC8F096_ADC.c: 178: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	179
	
l1024:	
;SC8F096_ADC.c: 179: WPUB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	180
	
l1026:	
;SC8F096_ADC.c: 180: WPUC = 0B00000000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(264)^0100h	;volatile
	line	181
	
l1028:	
;SC8F096_ADC.c: 181: WPUD = 0B00000000;
	clrf	(277)^0100h	;volatile
	line	183
	
l1030:	
;SC8F096_ADC.c: 183: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	184
	
l1032:	
;SC8F096_ADC.c: 184: TRISB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	185
	
l1034:	
;SC8F096_ADC.c: 185: TRISC = 0B00000000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	186
	
l1036:	
;SC8F096_ADC.c: 186: TRISD = 0B00000000;
	clrf	(276)^0100h	;volatile
	line	188
	
l1038:	
;SC8F096_ADC.c: 188: PORTA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	189
	
l1040:	
;SC8F096_ADC.c: 189: PORTB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	190
	
l1042:	
;SC8F096_ADC.c: 190: PORTC = 0B00000000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(262)^0100h	;volatile
	line	191
	
l1044:	
;SC8F096_ADC.c: 191: PORTD = 0B00000000;
	clrf	(263)^0100h	;volatile
	line	193
	
l1046:	
;SC8F096_ADC.c: 193: CC0CON = 0;
	bsf	status, 5	;RP0=1, select bank3
	clrf	(405)^0180h	;volatile
	line	194
	
l1048:	
;SC8F096_ADC.c: 194: CC1CON = 0;
	clrf	(406)^0180h	;volatile
	line	198
	
l1050:	
;SC8F096_ADC.c: 198: PR2 = 249;
	movlw	low(0F9h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	199
	
l1052:	
;SC8F096_ADC.c: 199: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	200
	
l1054:	
;SC8F096_ADC.c: 200: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	202
	
l1056:	
;SC8F096_ADC.c: 202: T2CON = 0B00000100;
	movlw	low(04h)
	movwf	(19)	;volatile
	line	203
	
l1058:	
;SC8F096_ADC.c: 203: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	204
	
l277:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
	global	_AD_Init

;; *************** function _AD_Init *****************
;; Defined at:
;;		line 234 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/0
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
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	234
global __ptext6
__ptext6:	;psect for function _AD_Init
psect	text6
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	234
	global	__size_of_AD_Init
	__size_of_AD_Init	equ	__end_of_AD_Init-_AD_Init
	
_AD_Init:	
;incstack = 0
	opt	stack 6
; Regs used in _AD_Init: [wreg+status,2]
	line	264
	
l1060:	
;SC8F096_ADC.c: 264: ADCON0 = 0X41;
	movlw	low(041h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	281
	
l1062:	
;SC8F096_ADC.c: 281: ADCON1 = 0;
	clrf	(150)^080h	;volatile
	line	282
	
l286:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Init
	__end_of_AD_Init:
	signat	_AD_Init,89
	global	_ADC_Sample

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 46 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
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
;;		On exit  : 300/0
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
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	46
global __ptext7
__ptext7:	;psect for function _ADC_Sample
psect	text7
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	46
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
	line	48
	
l946:	
;SC8F096_ADC.c: 48: volatile unsigned long adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	49
	
l948:	
;SC8F096_ADC.c: 49: volatile unsigned int admin = 0, admax = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	50
;SC8F096_ADC.c: 50: volatile unsigned int ad_temp = 0;
	clrf	(ADC_Sample@ad_temp)	;volatile
	clrf	(ADC_Sample@ad_temp+1)	;volatile
	line	52
	
l950:	
;SC8F096_ADC.c: 52: if ((!LDO_EN) && (adldo & 0x04) )
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1202/8)^080h,(1202)&7	;volatile
	goto	u471
	goto	u470
u471:
	goto	l956
u470:
	
l952:	
	btfss	(ADC_Sample@adldo),(2)&7
	goto	u481
	goto	u480
u481:
	goto	l956
u480:
	line	55
	
l954:	
;SC8F096_ADC.c: 53: {
;SC8F096_ADC.c: 55: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	56
;SC8F096_ADC.c: 56: _delay((unsigned long)((100)*(16000000/4000000.0)));
	opt asmopt_push
opt asmopt_off
	movlw	133
movwf	((??_ADC_Sample+0)+0),f
	u807:
decfsz	(??_ADC_Sample+0)+0,f
	goto	u807
opt asmopt_pop

	line	57
;SC8F096_ADC.c: 57: }
	goto	l958
	line	59
	
l956:	
;SC8F096_ADC.c: 58: else
;SC8F096_ADC.c: 59: ADCON1 = adldo;
	movf	(ADC_Sample@adldo),w
	movwf	(150)^080h	;volatile
	line	61
	
l958:	
;SC8F096_ADC.c: 61: if(adch & 0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(ADC_Sample@adch),(4)&7
	goto	u491
	goto	u490
u491:
	goto	l247
u490:
	line	63
	
l960:	
;SC8F096_ADC.c: 62: {
;SC8F096_ADC.c: 63: CHS4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7	;volatile
	line	64
	
l962:	
;SC8F096_ADC.c: 64: adch &= 0x0f;
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(ADC_Sample@adch),f
	line	65
;SC8F096_ADC.c: 65: }
	goto	l964
	line	66
	
l247:	
	line	67
;SC8F096_ADC.c: 66: else
;SC8F096_ADC.c: 67: CHS4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1206/8)^080h,(1206)&7	;volatile
	line	68
	
l964:	
;SC8F096_ADC.c: 68: unsigned char i = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@i)
	line	69
;SC8F096_ADC.c: 69: for (i = 0; i < 10; i++)
	clrf	(ADC_Sample@i)
	line	71
	
l970:	
;SC8F096_ADC.c: 70: {
;SC8F096_ADC.c: 71: ADCON0 = (unsigned char)(0X41 | (adch << 2));
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u505:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u505
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	72
# 72 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
	line	73
# 73 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
	line	74
# 74 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
	line	75
# 75 "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
nop ;# 
psect	text7
	line	76
	
l972:	
;SC8F096_ADC.c: 76: GODONE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1193/8)^080h,(1193)&7	;volatile
	line	78
	
l974:	
;SC8F096_ADC.c: 78: unsigned char j = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ADC_Sample@j)
	line	79
;SC8F096_ADC.c: 79: while (GODONE)
	goto	l251
	
l252:	
	line	81
;SC8F096_ADC.c: 80: {
;SC8F096_ADC.c: 81: _delay((unsigned long)((2)*(16000000/4000000.0)));
		opt asmopt_push
	opt asmopt_off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	opt asmopt_pop

	line	83
;SC8F096_ADC.c: 83: if (0 == (--j))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(ADC_Sample@j),f
	goto	u511
	goto	u510
u511:
	goto	l251
u510:
	line	84
	
l976:	
;SC8F096_ADC.c: 84: return 0;
	movlw	low(0)
	goto	l254
	line	85
	
l251:	
	line	79
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1193/8)^080h,(1193)&7	;volatile
	goto	u521
	goto	u520
u521:
	goto	l252
u520:
	line	87
	
l980:	
;SC8F096_ADC.c: 85: }
;SC8F096_ADC.c: 87: ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));
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
	
l982:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(152)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(ADC_Sample@ad_temp),f	;volatile
	skipnc
	incf	(ADC_Sample@ad_temp+1),f	;volatile
	line	89
	
l984:	
;SC8F096_ADC.c: 89: if (0 == admax)
	movf	((ADC_Sample@admax)),w	;volatile
iorwf	((ADC_Sample@admax+1)),w	;volatile
	btfss	status,2
	goto	u531
	goto	u530
u531:
	goto	l988
u530:
	line	91
	
l986:	
;SC8F096_ADC.c: 90: {
;SC8F096_ADC.c: 91: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	line	92
;SC8F096_ADC.c: 92: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	93
;SC8F096_ADC.c: 93: }
	goto	l257
	line	94
	
l988:	
;SC8F096_ADC.c: 94: else if (ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w	;volatile
	skipz
	goto	u545
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w	;volatile
u545:
	skipnc
	goto	u541
	goto	u540
u541:
	goto	l992
u540:
	line	95
	
l990:	
;SC8F096_ADC.c: 95: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admax+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admax)	;volatile
	goto	l257
	line	96
	
l992:	
;SC8F096_ADC.c: 96: else if (ad_temp < admin)
	movf	(ADC_Sample@admin+1),w	;volatile
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u555
	movf	(ADC_Sample@admin),w	;volatile
	subwf	(ADC_Sample@ad_temp),w	;volatile
u555:
	skipnc
	goto	u551
	goto	u550
u551:
	goto	l257
u550:
	line	97
	
l994:	
;SC8F096_ADC.c: 97: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	(ADC_Sample@admin+1)	;volatile
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	(ADC_Sample@admin)	;volatile
	line	99
	
l257:	
;SC8F096_ADC.c: 99: adsum += ad_temp;
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
	goto	u561
	addwf	(ADC_Sample@adsum+1),f	;volatile
u561:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u562
	addwf	(ADC_Sample@adsum+2),f	;volatile
u562:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u563
	addwf	(ADC_Sample@adsum+3),f	;volatile
u563:

	line	69
	
l996:	
	incf	(ADC_Sample@i),f
	
l998:	
	movlw	low(0Ah)
	subwf	(ADC_Sample@i),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l970
u570:
	line	101
	
l1000:	
;SC8F096_ADC.c: 100: }
;SC8F096_ADC.c: 101: adsum -= admax;
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
	goto	u585
	goto	u586
u585:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u586:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u587
	goto	u588
u587:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u588:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u589
	goto	u580
u589:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u580:

	line	102
;SC8F096_ADC.c: 102: if (adsum >= admin)
	movf	(ADC_Sample@admin),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	3+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+3),w	;volatile
	skipz
	goto	u595
	movf	2+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+2),w	;volatile
	skipz
	goto	u595
	movf	1+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum+1),w	;volatile
	skipz
	goto	u595
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),w	;volatile
u595:
	skipc
	goto	u591
	goto	u590
u591:
	goto	l261
u590:
	line	103
	
l1002:	
;SC8F096_ADC.c: 103: adsum -= admin;
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
	goto	u605
	goto	u606
u605:
	subwf	(ADC_Sample@adsum+1),f	;volatile
u606:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u607
	goto	u608
u607:
	subwf	(ADC_Sample@adsum+2),f	;volatile
u608:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u609
	goto	u600
u609:
	subwf	(ADC_Sample@adsum+3),f	;volatile
u600:

	goto	l1004
	line	104
	
l261:	
	line	105
;SC8F096_ADC.c: 104: else
;SC8F096_ADC.c: 105: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	107
	
l1004:	
;SC8F096_ADC.c: 107: adresult = adsum >> 3;
	movf	(ADC_Sample@adsum),w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w	;volatile
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w	;volatile
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u615:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u610:
	addlw	-1
	skipz
	goto	u615
	movf	1+(??_ADC_Sample+0)+0,w
	movwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	movwf	(_adresult)	;volatile
	line	109
	
l1006:	
;SC8F096_ADC.c: 109: adsum = 0;
	clrf	(ADC_Sample@adsum)	;volatile
	clrf	(ADC_Sample@adsum+1)	;volatile
	clrf	(ADC_Sample@adsum+2)	;volatile
	clrf	(ADC_Sample@adsum+3)	;volatile
	line	110
	
l1008:	
;SC8F096_ADC.c: 110: admin = 0;
	clrf	(ADC_Sample@admin)	;volatile
	clrf	(ADC_Sample@admin+1)	;volatile
	line	111
	
l1010:	
;SC8F096_ADC.c: 111: admax = 0;
	clrf	(ADC_Sample@admax)	;volatile
	clrf	(ADC_Sample@admax+1)	;volatile
	line	112
	
l1012:	
;SC8F096_ADC.c: 112: return 0xA5;
	movlw	low(0A5h)
	line	114
	
l254:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
	signat	_ADC_Sample,8313
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 215 in file "E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
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
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	215
global __ptext8
__ptext8:	;psect for function _Isr_Timer
psect	text8
	file	"E:\1.workspace\7.other\17.charge_demo\charge_demo\09-test\SC8F096_ADC_Demo\SC8F096_ADC.c"
	line	215
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
psect	text8
	line	217
	
i1l918:	
;SC8F096_ADC.c: 217: if (TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l283
u38_20:
	line	219
	
i1l920:	
;SC8F096_ADC.c: 218: {
;SC8F096_ADC.c: 219: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	223
	
i1l283:	
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
