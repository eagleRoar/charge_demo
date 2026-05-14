opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096
opt include "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\sc8f096.cgen.inc"
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
# 13 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
INDF EQU 00H ;# 
# 20 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
OPTION_REG EQU 01H ;# 
# 27 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PCL EQU 02H ;# 
# 34 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
STATUS EQU 03H ;# 
# 41 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
FSR EQU 04H ;# 
# 48 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TRISB EQU 05H ;# 
# 55 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PORTB EQU 06H ;# 
# 62 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPDB EQU 07H ;# 
# 69 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPUB EQU 08H ;# 
# 76 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IOCB EQU 09H ;# 
# 83 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PCLATH EQU 0AH ;# 
# 90 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
INTCON EQU 0BH ;# 
# 97 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
QCCON EQU 0CH ;# 
# 104 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PIR1 EQU 0DH ;# 
# 111 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PIE1 EQU 0EH ;# 
# 118 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CMP1CON0 EQU 0FH ;# 
# 125 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CMP1CON1 EQU 10H ;# 
# 132 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PR2 EQU 11H ;# 
# 139 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TMR2 EQU 12H ;# 
# 146 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
T2CON EQU 13H ;# 
# 153 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
OSCCON EQU 14H ;# 
# 160 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMCON0 EQU 15H ;# 
# 167 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMCON1 EQU 16H ;# 
# 174 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMTL EQU 17H ;# 
# 181 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMTH EQU 18H ;# 
# 188 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMD0L EQU 19H ;# 
# 195 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMD1L EQU 1AH ;# 
# 202 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMD4L EQU 1BH ;# 
# 209 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMT4L EQU 1CH ;# 
# 216 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMCON2 EQU 1DH ;# 
# 223 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMDH EQU 1EH ;# 
# 230 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWM01DT EQU 1FH ;# 
# 237 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TMR0 EQU 81H ;# 
# 244 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TRISA EQU 85H ;# 
# 251 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PORTA EQU 86H ;# 
# 258 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPDA EQU 87H ;# 
# 265 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPUA EQU 88H ;# 
# 272 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IOCA EQU 89H ;# 
# 279 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ANSEL3 EQU 8CH ;# 
# 286 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EECON1 EQU 8DH ;# 
# 293 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EECON2 EQU 8EH ;# 
# 300 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EEDAT EQU 8FH ;# 
# 307 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EEDATH EQU 90H ;# 
# 314 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EEADR EQU 91H ;# 
# 321 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
EEADRH EQU 92H ;# 
# 328 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ANSEL0 EQU 93H ;# 
# 335 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ANSEL1 EQU 94H ;# 
# 342 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ADCON0 EQU 95H ;# 
# 349 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ADCON1 EQU 96H ;# 
# 356 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ADRESL EQU 98H ;# 
# 363 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ADRESH EQU 99H ;# 
# 370 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CMP2CON0 EQU 9AH ;# 
# 377 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMD2L EQU 9BH ;# 
# 384 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWMD3L EQU 9CH ;# 
# 391 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PWM23DT EQU 9DH ;# 
# 398 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SEGEN0 EQU 9EH ;# 
# 405 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CMP2CON1 EQU 9FH ;# 
# 412 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TRISC EQU 105H ;# 
# 419 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PORTC EQU 106H ;# 
# 426 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PORTD EQU 107H ;# 
# 433 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPUC EQU 108H ;# 
# 440 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
ANSEL2 EQU 109H ;# 
# 447 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TMR1L EQU 10CH ;# 
# 454 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TMR1H EQU 10DH ;# 
# 461 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
T1CON EQU 10EH ;# 
# 468 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PIR2 EQU 10FH ;# 
# 475 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PIE2 EQU 110H ;# 
# 482 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
KEYCON0 EQU 111H ;# 
# 489 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
KEYCON1 EQU 112H ;# 
# 496 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
KEYCON2 EQU 113H ;# 
# 503 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TRISD EQU 114H ;# 
# 510 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
WPUD EQU 115H ;# 
# 517 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
KEYDATAL EQU 116H ;# 
# 524 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
KEYDATAH EQU 117H ;# 
# 531 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TXSTA0 EQU 118H ;# 
# 538 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
RCSTA0 EQU 119H ;# 
# 545 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SPBRG0 EQU 11AH ;# 
# 552 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TXREG0 EQU 11BH ;# 
# 559 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
RCREG0 EQU 11CH ;# 
# 566 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LCDCON0 EQU 11DH ;# 
# 573 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LCDCON1 EQU 11EH ;# 
# 580 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SEGEN1 EQU 11FH ;# 
# 587 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SEGEN2 EQU 181H ;# 
# 594 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TXSTA1 EQU 185H ;# 
# 601 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
RCSTA1 EQU 186H ;# 
# 608 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
TXREG1 EQU 187H ;# 
# 615 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
RCREG1 EQU 188H ;# 
# 622 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SPBRG1 EQU 189H ;# 
# 629 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
OPACON EQU 18CH ;# 
# 636 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
OPAADJ EQU 18DH ;# 
# 643 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LEDCTR0 EQU 18EH ;# 
# 650 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LEDCTR1 EQU 18FH ;# 
# 657 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IICCON EQU 190H ;# 
# 664 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IICCON2 EQU 191H ;# 
# 671 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IICSTAT EQU 192H ;# 
# 678 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IICBUF EQU 193H ;# 
# 685 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
IICADD EQU 194H ;# 
# 692 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CC0CON EQU 195H ;# 
# 699 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
CC1CON EQU 196H ;# 
# 706 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PDCON0 EQU 197H ;# 
# 713 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PDCON1 EQU 198H ;# 
# 720 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PDADD EQU 199H ;# 
# 727 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PDRDATA EQU 19AH ;# 
# 734 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
PDSDATA EQU 19BH ;# 
# 741 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LCDADD EQU 19CH ;# 
# 748 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
LCDDATA EQU 19DH ;# 
# 755 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
COMEN EQU 19EH ;# 
# 762 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V2.00.16_Beta13\data\include\SC8F096.h"
SEGEN3 EQU 19FH ;# 
	FNCALL	_main,_Memory_Read
	FNCALL	_main,_Memory_Write
	FNCALL	_main,_Program_Read
	FNROOT	_main
	global	_tmp4
	global	_tmp4_absaddr
_tmp4_absaddr	set	0x703
	global	_tmp3
	global	_tmp3_absaddr
_tmp3_absaddr	set	0x702
	global	_tmp2
	global	_tmp2_absaddr
_tmp2_absaddr	set	0x701
	global	_tmp1
	global	_tmp1_absaddr
_tmp1_absaddr	set	0x700
	global	_tmp4
	global	_tmp4_absaddr
_tmp4_absaddr	set	0x703
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
psect	_tmp4_text,class=CODE,delta=2,noexec
global __p_tmp4_text
__p_tmp4_text:
psect	strings
psect	_tmp4_text
_tmp4:
psect	strings
psect	_tmp4_text
psect	strings
psect	_tmp4_text
	retlw	0AAh
psect	strings
psect	_tmp4_text
	global __end_of_tmp4
psect	strings
psect	_tmp4_text
__end_of_tmp4:
	global	_tmp3
	global	_tmp3_absaddr
_tmp3_absaddr	set	0x702
psect	strings
psect	_tmp3_text,class=CODE,delta=2,noexec
global __p_tmp3_text
__p_tmp3_text:
psect	strings
psect	_tmp3_text
_tmp3:
psect	strings
psect	_tmp3_text
psect	strings
psect	_tmp3_text
	retlw	0AAh
psect	strings
psect	_tmp3_text
	global __end_of_tmp3
psect	strings
psect	_tmp3_text
__end_of_tmp3:
	global	_tmp2
	global	_tmp2_absaddr
_tmp2_absaddr	set	0x701
psect	strings
psect	_tmp2_text,class=CODE,delta=2,noexec
global __p_tmp2_text
__p_tmp2_text:
psect	strings
psect	_tmp2_text
_tmp2:
psect	strings
psect	_tmp2_text
psect	strings
psect	_tmp2_text
	retlw	0AAh
psect	strings
psect	_tmp2_text
	global __end_of_tmp2
psect	strings
psect	_tmp2_text
__end_of_tmp2:
	global	_tmp1
	global	_tmp1_absaddr
_tmp1_absaddr	set	0x700
psect	strings
psect	_tmp1_text,class=CODE,delta=2,noexec
global __p_tmp1_text
__p_tmp1_text:
psect	strings
psect	_tmp1_text
_tmp1:
psect	strings
psect	_tmp1_text
psect	strings
psect	_tmp1_text
	retlw	0AAh
psect	strings
psect	_tmp1_text
	global __end_of_tmp1
psect	strings
psect	_tmp1_text
__end_of_tmp1:
	global	_read_data
	global	_t
	global	_read_rom_data
	global	_data
	global	_datanum
psect	nvCOMMON,class=COMMON,space=1,noexec
global __pnvCOMMON
__pnvCOMMON:
_datanum:
       ds      1

	global	_GIE
_GIE	set	0x5F
	global	_EEADRH
_EEADRH	set	146
	global	_EEADR
_EEADR	set	145
	global	_EEDATH
_EEDATH	set	144
	global	_EEDAT
_EEDAT	set	143
	global	_EECON2
_EECON2	set	142
	global	_TRISA
_TRISA	set	133
	global	_RD
_RD	set	0x468
	global	_WR
_WR	set	0x469
	global	_WREN
_WREN	set	0x46A
	global	_EEPGD
_EEPGD	set	0x46F
	global	_RA1
_RA1	set	0x431
	global	_RA0
_RA0	set	0x430
; #config settings
	file	"SC8F096_EEPROM_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_read_data:
       ds      2

_t:
       ds      2

_read_rom_data:
       ds      1

_data:
       ds      1

	file	"SC8F096_EEPROM_C.as"
	line	#
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
?_Memory_Write:	; 1 bytes @ 0x0
?_Memory_Read:	; 1 bytes @ 0x0
??_Memory_Read:	; 1 bytes @ 0x0
?_Program_Read:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	Memory_Write@Value
Memory_Write@Value:	; 2 bytes @ 0x0
	global	Program_Read@P_Addr
Program_Read@P_Addr:	; 2 bytes @ 0x0
	ds	2
??_Memory_Write:	; 1 bytes @ 0x2
??_Program_Read:	; 1 bytes @ 0x2
	global	Memory_Write@Addr
Memory_Write@Addr:	; 1 bytes @ 0x2
	global	Memory_Read@Addr
Memory_Read@Addr:	; 1 bytes @ 0x2
	ds	1
??_main:	; 1 bytes @ 0x3
	global	main@read_addr
main@read_addr:	; 2 bytes @ 0x3
	ds	2
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
;!    COMMON           14      5      12
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
;!    _main->_Memory_Read
;!    _main->_Memory_Write
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
;! (0) _main                                                 2     2      0     257
;!                                              3 COMMON     2     2      0
;!                        _Memory_Read
;!                       _Memory_Write
;!                       _Program_Read
;! ---------------------------------------------------------------------------------
;! (1) _Program_Read                                         2     0      2      98
;!                                              0 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _Memory_Write                                         3     1      2     120
;!                                              0 COMMON     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _Memory_Read                                          3     3      0      15
;!                                              0 COMMON     3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Memory_Read
;!   _Memory_Write
;!   _Program_Read
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      5       C       1       85.7%
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
;!ABS                  0      0       C      11        0.0%
;!DATA                 0      0       C      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 23 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  read_addr       2    3[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Memory_Read
;;		_Memory_Write
;;		_Program_Read
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
	line	23
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
	line	23
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	25
	
l762:	
# 25 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
	line	26
# 26 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
clrwdt ;# 
psect	maintext
	line	27
	
l764:	
;SC8F096_EEPROM_C.c: 27: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	28
;SC8F096_EEPROM_C.c: 28: data = 0;
	clrf	(_data)	;volatile
	line	47
;SC8F096_EEPROM_C.c: 47: while(1)
	
l259:	
	line	49
# 49 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
clrwdt ;# 
psect	maintext
	line	50
;SC8F096_EEPROM_C.c: 50: for(datanum=0;datanum<128;datanum++)
	clrf	(_datanum)	;volatile
	
l766:	
	movlw	low(080h)
	subwf	(_datanum),w	;volatile
	skipc
	goto	u111
	goto	u110
u111:
	goto	l770
u110:
	goto	l780
	line	52
	
l770:	
;SC8F096_EEPROM_C.c: 51: {
;SC8F096_EEPROM_C.c: 52: Memory_Write(datanum,0x55aa);
	movlw	0AAh
	movwf	(Memory_Write@Value)
	movlw	055h
	movwf	((Memory_Write@Value))+1
	movf	(_datanum),w	;volatile
	fcall	_Memory_Write
	line	53
	
l772:	
;SC8F096_EEPROM_C.c: 53: Memory_Read(datanum);
	movf	(_datanum),w	;volatile
	fcall	_Memory_Read
	line	54
	
l774:	
;SC8F096_EEPROM_C.c: 54: if(0x55aa == read_data)
		movlw	170
	xorwf	((_read_data)),w	;volatile
	movlw	85
	skipnz
	xorwf	((_read_data+1)),w	;volatile
	btfss	status,2
	goto	u121
	goto	u120
u121:
	goto	l262
u120:
	line	56
	
l776:	
;SC8F096_EEPROM_C.c: 55: {
;SC8F096_EEPROM_C.c: 56: data++;
	incf	(_data),f	;volatile
	line	57
	
l262:	
	line	50
	incf	(_datanum),f	;volatile
	
l778:	
	movlw	low(080h)
	subwf	(_datanum),w	;volatile
	skipc
	goto	u131
	goto	u130
u131:
	goto	l770
u130:
	line	60
	
l780:	
;SC8F096_EEPROM_C.c: 57: }
;SC8F096_EEPROM_C.c: 59: }
;SC8F096_EEPROM_C.c: 60: if(data == 128)
		movlw	128
	xorwf	((_data)),w	;volatile
	btfss	status,2
	goto	u141
	goto	u140
u141:
	goto	l263
u140:
	line	62
	
l782:	
;SC8F096_EEPROM_C.c: 61: {
;SC8F096_EEPROM_C.c: 62: RA0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7	;volatile
	line	63
	
l784:	
;SC8F096_EEPROM_C.c: 63: data = 0;
	clrf	(_data)	;volatile
	line	64
;SC8F096_EEPROM_C.c: 64: }
	goto	l786
	line	65
	
l263:	
;SC8F096_EEPROM_C.c: 65: else RA0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7	;volatile
	line	67
	
l786:	
;SC8F096_EEPROM_C.c: 67: for(datanum=0;datanum<4;datanum++)
	clrf	(_datanum)	;volatile
	
l788:	
	movlw	low(04h)
	subwf	(_datanum),w	;volatile
	skipc
	goto	u151
	goto	u150
u151:
	goto	l792
u150:
	goto	l802
	line	69
	
l792:	
;SC8F096_EEPROM_C.c: 68: {
;SC8F096_EEPROM_C.c: 69: unsigned int read_addr = 0x0700;
	movlw	0
	movwf	(main@read_addr)
	movlw	07h
	movwf	((main@read_addr))+1
	line	70
;SC8F096_EEPROM_C.c: 70: read_addr = read_addr + datanum;
	movf	(_datanum),w	;volatile
	addwf	(main@read_addr),f
	skipnc
	incf	(main@read_addr+1),f
	line	71
	
l794:	
;SC8F096_EEPROM_C.c: 71: Program_Read(read_addr);
	movf	(main@read_addr+1),w
	movwf	(Program_Read@P_Addr+1)
	movf	(main@read_addr),w
	movwf	(Program_Read@P_Addr)
	fcall	_Program_Read
	line	72
	
l796:	
;SC8F096_EEPROM_C.c: 72: if(0xaa == read_rom_data)
		movlw	170
	xorwf	((_read_rom_data)),w	;volatile
	btfss	status,2
	goto	u161
	goto	u160
u161:
	goto	l267
u160:
	line	74
	
l798:	
;SC8F096_EEPROM_C.c: 73: {
;SC8F096_EEPROM_C.c: 74: data++;
	incf	(_data),f	;volatile
	line	75
	
l267:	
	line	67
	incf	(_datanum),f	;volatile
	
l800:	
	movlw	low(04h)
	subwf	(_datanum),w	;volatile
	skipc
	goto	u171
	goto	u170
u171:
	goto	l792
u170:
	line	78
	
l802:	
;SC8F096_EEPROM_C.c: 75: }
;SC8F096_EEPROM_C.c: 77: }
;SC8F096_EEPROM_C.c: 78: if(data == 4)
		movlw	4
	xorwf	((_data)),w	;volatile
	btfss	status,2
	goto	u181
	goto	u180
u181:
	goto	l268
u180:
	line	80
	
l804:	
;SC8F096_EEPROM_C.c: 79: {
;SC8F096_EEPROM_C.c: 80: RA1 = 1;
	bsf	(1073/8)^080h,(1073)&7	;volatile
	line	81
	
l806:	
;SC8F096_EEPROM_C.c: 81: data = 0;
	clrf	(_data)	;volatile
	line	82
;SC8F096_EEPROM_C.c: 82: }
	goto	l259
	line	83
	
l268:	
;SC8F096_EEPROM_C.c: 83: else RA1 = 0;
	bcf	(1073/8)^080h,(1073)&7	;volatile
	goto	l259
	global	start
	ljmp	start
	opt stack 0
	line	86
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Program_Read

;; *************** function _Program_Read *****************
;; Defined at:
;;		line 154 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
;; Parameters:    Size  Location     Type
;;  P_Addr          2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 200/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	154
global __ptext1
__ptext1:	;psect for function _Program_Read
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
	line	154
	global	__size_of_Program_Read
	__size_of_Program_Read	equ	__end_of_Program_Read-_Program_Read
	
_Program_Read:	
;incstack = 0
	opt	stack 7
; Regs used in _Program_Read: [wreg]
	line	157
	
l756:	
;SC8F096_EEPROM_C.c: 157: EEADR = P_Addr & 0x00ff;
	movf	(Program_Read@P_Addr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	158
;SC8F096_EEPROM_C.c: 158: EEADRH = (P_Addr & 0xff00)>>8;
	movf	0+(Program_Read@P_Addr)+01h,w
	movwf	(146)^080h	;volatile
	line	160
	
l758:	
;SC8F096_EEPROM_C.c: 160: EEPGD = 1;
	bsf	(1135/8)^080h,(1135)&7	;volatile
	line	162
	
l760:	
;SC8F096_EEPROM_C.c: 162: RD = 1;
	bsf	(1128/8)^080h,(1128)&7	;volatile
	line	163
# 163 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
	line	164
# 164 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
psect	text1
	line	166
;SC8F096_EEPROM_C.c: 166: read_rom_data = EEDAT;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(143)^080h,w	;volatile
	movwf	(_read_rom_data)	;volatile
	line	168
	
l284:	
	return
	opt stack 0
GLOBAL	__end_of_Program_Read
	__end_of_Program_Read:
	signat	_Program_Read,4217
	global	_Memory_Write

;; *************** function _Memory_Write *****************
;; Defined at:
;;		line 97 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
;; Parameters:    Size  Location     Type
;;  Addr            1    wreg     unsigned char 
;;  Value           2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  Addr            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
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
	line	97
global __ptext2
__ptext2:	;psect for function _Memory_Write
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
	line	97
	global	__size_of_Memory_Write
	__size_of_Memory_Write	equ	__end_of_Memory_Write-_Memory_Write
	
_Memory_Write:	
;incstack = 0
	opt	stack 7
; Regs used in _Memory_Write: [wreg]
;Memory_Write@Addr stored from wreg
	movwf	(Memory_Write@Addr)
	line	100
	
l740:	
;SC8F096_EEPROM_C.c: 100: EEADR = Addr;
	movf	(Memory_Write@Addr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(145)^080h	;volatile
	line	101
	
l742:	
;SC8F096_EEPROM_C.c: 101: EEPGD = 0;
	bcf	(1135/8)^080h,(1135)&7	;volatile
	line	103
;SC8F096_EEPROM_C.c: 103: EEDAT = (unsigned char)(Value & 0x00ff);
	movf	(Memory_Write@Value),w
	movwf	(143)^080h	;volatile
	line	104
;SC8F096_EEPROM_C.c: 104: EEDATH = (Value & 0xff00)>>8;
	movf	0+(Memory_Write@Value)+01h,w
	movwf	(144)^080h	;volatile
	line	106
	
l744:	
;SC8F096_EEPROM_C.c: 106: WREN = 1;
	bsf	(1130/8)^080h,(1130)&7	;volatile
	line	107
	
l746:	
;SC8F096_EEPROM_C.c: 107: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	109
;SC8F096_EEPROM_C.c: 109: while(GIE) GIE = 0;
	
l275:	
	btfsc	(95/8),(95)&7	;volatile
	goto	u101
	goto	u100
u101:
	goto	l746
u100:
	line	112
	
l748:	
;SC8F096_EEPROM_C.c: 112: EECON2 = 0x55;
	movlw	low(055h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(142)^080h	;volatile
	line	113
;SC8F096_EEPROM_C.c: 113: EECON2 = 0xaa;
	movlw	low(0AAh)
	movwf	(142)^080h	;volatile
	line	114
	
l750:	
;SC8F096_EEPROM_C.c: 114: WR = 1;
	bsf	(1129/8)^080h,(1129)&7	;volatile
	line	115
# 115 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
	line	116
# 116 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
	line	117
# 117 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
clrwdt ;# 
psect	text2
	line	119
	
l752:	
;SC8F096_EEPROM_C.c: 119: WREN = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1130/8)^080h,(1130)&7	;volatile
	line	120
	
l754:	
;SC8F096_EEPROM_C.c: 120: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	122
	
l278:	
	return
	opt stack 0
GLOBAL	__end_of_Memory_Write
	__end_of_Memory_Write:
	signat	_Memory_Write,8313
	global	_Memory_Read

;; *************** function _Memory_Read *****************
;; Defined at:
;;		line 132 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
;; Parameters:    Size  Location     Type
;;  Addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Addr            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, btemp+1
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	132
global __ptext3
__ptext3:	;psect for function _Memory_Read
psect	text3
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
	line	132
	global	__size_of_Memory_Read
	__size_of_Memory_Read	equ	__end_of_Memory_Read-_Memory_Read
	
_Memory_Read:	
;incstack = 0
	opt	stack 7
; Regs used in _Memory_Read: [wreg+btemp+1]
;Memory_Read@Addr stored from wreg
	movwf	(Memory_Read@Addr)
	line	135
	
l680:	
;SC8F096_EEPROM_C.c: 135: EEADR = Addr;
	movf	(Memory_Read@Addr),w
	movwf	(145)^080h	;volatile
	line	136
	
l682:	
;SC8F096_EEPROM_C.c: 136: EEPGD = 0;
	bcf	(1135/8)^080h,(1135)&7	;volatile
	line	138
	
l684:	
;SC8F096_EEPROM_C.c: 138: RD = 1;
	bsf	(1128/8)^080h,(1128)&7	;volatile
	line	139
# 139 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
	line	140
# 140 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_DEMO_C\SC8F096_EEPRom_Demo\SC8F096_EEPROM_C.c"
nop ;# 
psect	text3
	line	142
;SC8F096_EEPROM_C.c: 142: read_data = EEDAT;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(143)^080h,w	;volatile
	movwf	(_read_data)	;volatile
	clrf	(_read_data+1)	;volatile
	line	143
	
l686:	
;SC8F096_EEPROM_C.c: 143: read_data = read_data | (unsigned int)(EEDATH<<8);
	movf	(144)^080h,w	;volatile
	movwf	(??_Memory_Read+0)+0
	clrf	(??_Memory_Read+0)+0+1
	movf	(??_Memory_Read+0)+0,w
	movwf	(??_Memory_Read+0)+1
	clrf	(??_Memory_Read+0)+0
	movf	0+(??_Memory_Read+0)+0,w
	iorwf	(_read_data),f	;volatile
	movf	1+(??_Memory_Read+0)+0,w
	iorwf	(_read_data+1),f	;volatile
	line	145
	
l281:	
	return
	opt stack 0
GLOBAL	__end_of_Memory_Read
	__end_of_Memory_Read:
	signat	_Memory_Read,4217
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
