opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F096AD
opt include "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\sc8f096ad.cgen.inc"
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
# 13 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
INDF EQU 00H ;# 
# 20 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
OPTION_REG EQU 01H ;# 
# 27 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PCL EQU 02H ;# 
# 34 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
STATUS EQU 03H ;# 
# 41 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
FSR EQU 04H ;# 
# 48 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TRISB EQU 05H ;# 
# 55 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PORTB EQU 06H ;# 
# 62 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPDB EQU 07H ;# 
# 69 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPUB EQU 08H ;# 
# 76 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IOCB EQU 09H ;# 
# 83 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PCLATH EQU 0AH ;# 
# 90 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
INTCON EQU 0BH ;# 
# 97 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
QCCON EQU 0CH ;# 
# 104 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PIR1 EQU 0DH ;# 
# 111 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PIE1 EQU 0EH ;# 
# 118 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CMP1CON0 EQU 0FH ;# 
# 125 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CMP1CON1 EQU 10H ;# 
# 132 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PR2 EQU 11H ;# 
# 139 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TMR2 EQU 12H ;# 
# 146 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
T2CON EQU 13H ;# 
# 153 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
OSCCON EQU 14H ;# 
# 160 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMCON0 EQU 15H ;# 
# 167 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMCON1 EQU 16H ;# 
# 174 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMTL EQU 17H ;# 
# 181 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMTH EQU 18H ;# 
# 188 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMD0L EQU 19H ;# 
# 195 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMD1L EQU 1AH ;# 
# 202 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMD4L EQU 1BH ;# 
# 209 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMT4L EQU 1CH ;# 
# 216 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMCON2 EQU 1DH ;# 
# 223 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMDH EQU 1EH ;# 
# 230 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWM01DT EQU 1FH ;# 
# 237 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TMR0 EQU 81H ;# 
# 244 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TRISA EQU 85H ;# 
# 251 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PORTA EQU 86H ;# 
# 258 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPDA EQU 87H ;# 
# 265 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPUA EQU 88H ;# 
# 272 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IOCA EQU 89H ;# 
# 279 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ANSEL3 EQU 8CH ;# 
# 286 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EECON1 EQU 8DH ;# 
# 293 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EECON2 EQU 8EH ;# 
# 300 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EEDAT EQU 8FH ;# 
# 307 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EEDATH EQU 90H ;# 
# 314 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EEADR EQU 91H ;# 
# 321 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
EEADRH EQU 92H ;# 
# 328 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ANSEL0 EQU 93H ;# 
# 335 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ANSEL1 EQU 94H ;# 
# 342 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ADCON0 EQU 95H ;# 
# 349 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ADCON1 EQU 96H ;# 
# 356 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ADRESL EQU 98H ;# 
# 363 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ADRESH EQU 99H ;# 
# 370 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CMP2CON0 EQU 9AH ;# 
# 377 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMD2L EQU 9BH ;# 
# 384 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWMD3L EQU 9CH ;# 
# 391 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PWM23DT EQU 9DH ;# 
# 398 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SEGEN0 EQU 9EH ;# 
# 405 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CMP2CON1 EQU 9FH ;# 
# 412 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TRISC EQU 105H ;# 
# 419 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PORTC EQU 106H ;# 
# 426 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PORTD EQU 107H ;# 
# 433 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPUC EQU 108H ;# 
# 440 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
ANSEL2 EQU 109H ;# 
# 447 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TMR1L EQU 10CH ;# 
# 454 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TMR1H EQU 10DH ;# 
# 461 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
T1CON EQU 10EH ;# 
# 468 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PIR2 EQU 10FH ;# 
# 475 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PIE2 EQU 110H ;# 
# 482 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
KEYCON0 EQU 111H ;# 
# 489 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
KEYCON1 EQU 112H ;# 
# 496 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
KEYCON2 EQU 113H ;# 
# 503 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TRISD EQU 114H ;# 
# 510 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
WPUD EQU 115H ;# 
# 517 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
KEYDATAL EQU 116H ;# 
# 524 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
KEYDATAH EQU 117H ;# 
# 531 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TXSTA0 EQU 118H ;# 
# 538 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
RCSTA0 EQU 119H ;# 
# 545 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SPBRG0 EQU 11AH ;# 
# 552 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TXREG0 EQU 11BH ;# 
# 559 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
RCREG0 EQU 11CH ;# 
# 566 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LCDCON0 EQU 11DH ;# 
# 573 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LCDCON1 EQU 11EH ;# 
# 580 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SEGEN1 EQU 11FH ;# 
# 587 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SEGEN2 EQU 181H ;# 
# 594 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TXSTA1 EQU 185H ;# 
# 601 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
RCSTA1 EQU 186H ;# 
# 608 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
TXREG1 EQU 187H ;# 
# 615 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
RCREG1 EQU 188H ;# 
# 622 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SPBRG1 EQU 189H ;# 
# 629 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
OPACON EQU 18CH ;# 
# 636 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
OPAADJ EQU 18DH ;# 
# 643 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LEDCTR0 EQU 18EH ;# 
# 650 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LEDCTR1 EQU 18FH ;# 
# 657 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IICCON EQU 190H ;# 
# 664 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IICCON2 EQU 191H ;# 
# 671 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IICSTAT EQU 192H ;# 
# 678 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IICBUF EQU 193H ;# 
# 685 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
IICADD EQU 194H ;# 
# 692 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CC0CON EQU 195H ;# 
# 699 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
CC1CON EQU 196H ;# 
# 706 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PDCON0 EQU 197H ;# 
# 713 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PDCON1 EQU 198H ;# 
# 720 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PDADD EQU 199H ;# 
# 727 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PDRDATA EQU 19AH ;# 
# 734 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
PDSDATA EQU 19BH ;# 
# 741 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LCDADD EQU 19CH ;# 
# 748 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
LCDDATA EQU 19DH ;# 
# 755 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
COMEN EQU 19EH ;# 
# 762 "H:\MyDownloads\IDE_RAR\SCMCU_IDE_V3.00.00_Beta6\Addins\CompilerBindings\CCompiler\data\include\SC8F096AD.h"
SEGEN3 EQU 19FH ;# 
	FNCALL	_main,_Set_LED_Moudle
	FNROOT	_main
	FNCALL	intlevel1,_Timer_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	Timer_Isr@tcount
	global	_sec
	global	_B_MainLoop
	global	_TRISB
_TRISB	set	0x5
	global	_T2CON
_T2CON	set	0x13
	global	_PR2
_PR2	set	0x11
	global	_PIE1
_PIE1	set	0xE
	global	_PIR1
_PIR1	set	0xD
	global	_INTCON
_INTCON	set	0xB
	global	_OSCCON
_OSCCON	set	0x14
	global	_TMR2IE
_TMR2IE	set	0x71
	global	_TMR2IF
_TMR2IF	set	0x69
	global	_TRISA
_TRISA	set	0x85
	global	_SEGEN1
_SEGEN1	set	0x11F
	global	_LCDCON1
_LCDCON1	set	0x11E
	global	_LCDCON0
_LCDCON0	set	0x11D
	global	_TRISC
_TRISC	set	0x105
	global	_PIE2
_PIE2	set	0x110
	global	_PIR2
_PIR2	set	0x10F
	global	_LEDEN
_LEDEN	set	0x8EE
	global	_SEGEN3
_SEGEN3	set	0x19F
	global	_COMEN
_COMEN	set	0x19E
	global	_LCDDATA
_LCDDATA	set	0x19D
	global	_LCDADD
_LCDADD	set	0x19C
	global	_LCDCS
_LCDCS	set	0xCE7
	global	_LCDDATA8
_LCDDATA8	set	0xCF8
; #config settings
	file	"096_led.as"
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

	file	"096_led.as"
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
;;		line 10 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
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
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	10
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	12
	
l460:	
# 12 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
nop ;# 
	line	13
# 13 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
clrwdt ;# 
psect	maintext
	line	15
	
l462:	
;SC8F096_Led_Demo.c: 15: OSCCON = 0x70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	16
	
l464:	
;SC8F096_Led_Demo.c: 16: INTCON = 0;
	clrf	(11)	;volatile
	line	18
	
l466:	
;SC8F096_Led_Demo.c: 18: PIR1 = 0;
	clrf	(13)	;volatile
	line	19
	
l468:	
;SC8F096_Led_Demo.c: 19: PIE1 = 0;
	clrf	(14)	;volatile
	line	20
	
l470:	
;SC8F096_Led_Demo.c: 20: PIR2 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(271)^0100h	;volatile
	line	21
	
l472:	
;SC8F096_Led_Demo.c: 21: PIE2 = 0;
	clrf	(272)^0100h	;volatile
	line	23
	
l474:	
;SC8F096_Led_Demo.c: 23: Set_LED_Moudle();
	fcall	_Set_LED_Moudle
	line	26
	
l476:	
;SC8F096_Led_Demo.c: 26: PR2 = 124;
	movlw	low(07Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	27
	
l478:	
;SC8F096_Led_Demo.c: 27: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	28
	
l480:	
;SC8F096_Led_Demo.c: 28: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	29
	
l482:	
;SC8F096_Led_Demo.c: 29: T2CON = 0x05;
	movlw	low(05h)
	movwf	(19)	;volatile
	line	31
	
l484:	
;SC8F096_Led_Demo.c: 31: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	33
	
l486:	
;SC8F096_Led_Demo.c: 33: TRISC = 0B11111111;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	34
	
l488:	
;SC8F096_Led_Demo.c: 34: TRISB = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	35
	
l490:	
;SC8F096_Led_Demo.c: 35: TRISA = 0B00000001;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	37
	
l492:	
;SC8F096_Led_Demo.c: 37: Set_LED_Moudle();
	fcall	_Set_LED_Moudle
	line	41
	
l494:	
;SC8F096_Led_Demo.c: 40: {
;SC8F096_Led_Demo.c: 41: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u11
	goto	u10
u11:
	goto	l494
u10:
	line	43
	
l496:	
;SC8F096_Led_Demo.c: 42: {
;SC8F096_Led_Demo.c: 43: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	44
# 44 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
clrwdt ;# 
psect	maintext
	line	45
	
l498:	
;SC8F096_Led_Demo.c: 45: ++sec;
	incf	(_sec),f	;volatile
	line	46
	
l500:	
;SC8F096_Led_Demo.c: 46: if(sec >= 250)
	movlw	low(0FAh)
	subwf	(_sec),w	;volatile
	skipc
	goto	u21
	goto	u20
u21:
	goto	l494
u20:
	line	48
	
l502:	
;SC8F096_Led_Demo.c: 47: {
;SC8F096_Led_Demo.c: 48: sec = 0;
	clrf	(_sec)	;volatile
	line	49
	
l504:	
;SC8F096_Led_Demo.c: 49: LCDADD = 0B10000000;
	movlw	low(080h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(412)^0180h	;volatile
	line	64
	
l506:	
;SC8F096_Led_Demo.c: 64: LCDDATA = 0x01;
	movlw	low(01h)
	movwf	(413)^0180h	;volatile
	line	65
	
l508:	
;SC8F096_Led_Demo.c: 65: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	66
	
l510:	
;SC8F096_Led_Demo.c: 66: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	68
	
l512:	
;SC8F096_Led_Demo.c: 68: LCDDATA = 0x02;
	movlw	low(02h)
	movwf	(413)^0180h	;volatile
	line	69
	
l514:	
;SC8F096_Led_Demo.c: 69: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	70
	
l516:	
;SC8F096_Led_Demo.c: 70: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	72
	
l518:	
;SC8F096_Led_Demo.c: 72: LCDDATA = 0x04;
	movlw	low(04h)
	movwf	(413)^0180h	;volatile
	line	73
	
l520:	
;SC8F096_Led_Demo.c: 73: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	74
	
l522:	
;SC8F096_Led_Demo.c: 74: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	76
	
l524:	
;SC8F096_Led_Demo.c: 76: LCDDATA = 0x08;
	movlw	low(08h)
	movwf	(413)^0180h	;volatile
	line	77
	
l526:	
;SC8F096_Led_Demo.c: 77: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	78
	
l528:	
;SC8F096_Led_Demo.c: 78: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	80
	
l530:	
;SC8F096_Led_Demo.c: 80: LCDDATA = 0x10;
	movlw	low(010h)
	movwf	(413)^0180h	;volatile
	line	81
	
l532:	
;SC8F096_Led_Demo.c: 81: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	82
	
l534:	
;SC8F096_Led_Demo.c: 82: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	84
	
l536:	
;SC8F096_Led_Demo.c: 84: LCDDATA = 0x20;
	movlw	low(020h)
	movwf	(413)^0180h	;volatile
	line	85
	
l538:	
;SC8F096_Led_Demo.c: 85: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	86
	
l540:	
;SC8F096_Led_Demo.c: 86: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	88
	
l542:	
;SC8F096_Led_Demo.c: 88: LCDDATA = 0x40;
	movlw	low(040h)
	movwf	(413)^0180h	;volatile
	line	89
	
l544:	
;SC8F096_Led_Demo.c: 89: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	90
	
l546:	
;SC8F096_Led_Demo.c: 90: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	92
	
l548:	
;SC8F096_Led_Demo.c: 92: LCDDATA = 0x80;
	movlw	low(080h)
	movwf	(413)^0180h	;volatile
	line	93
	
l550:	
;SC8F096_Led_Demo.c: 93: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	94
	
l552:	
;SC8F096_Led_Demo.c: 94: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	96
	
l554:	
;SC8F096_Led_Demo.c: 96: LCDDATA = 0x01F;
	movlw	low(01Fh)
	movwf	(413)^0180h	;volatile
	line	97
	
l556:	
;SC8F096_Led_Demo.c: 97: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	98
	
l558:	
;SC8F096_Led_Demo.c: 98: LCDADD++;
	incf	(412)^0180h,f	;volatile
	line	100
	
l560:	
;SC8F096_Led_Demo.c: 100: LCDDATA = 0xFF;
	movlw	low(0FFh)
	movwf	(413)^0180h	;volatile
	line	101
	
l562:	
;SC8F096_Led_Demo.c: 101: LCDDATA8 = 1;
	bsf	(3320/8)^0180h,(3320)&7	;volatile
	line	103
	
l564:	
;SC8F096_Led_Demo.c: 103: LCDCS = 0;
	bcf	(3303/8)^0180h,(3303)&7	;volatile
	line	105
	
l566:	
;SC8F096_Led_Demo.c: 105: LEDEN = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	(2286/8)^0100h,(2286)&7	;volatile
	goto	l494
	global	start
	ljmp	start
	opt stack 0
	line	111
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Set_LED_Moudle

;; *************** function _Set_LED_Moudle *****************
;; Defined at:
;;		line 135 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/200
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
	line	135
global __ptext1
__ptext1:	;psect for function _Set_LED_Moudle
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	135
	global	__size_of_Set_LED_Moudle
	__size_of_Set_LED_Moudle	equ	__end_of_Set_LED_Moudle-_Set_LED_Moudle
	
_Set_LED_Moudle:	
;incstack = 0
	opt	stack 6
; Regs used in _Set_LED_Moudle: [wreg+status,2]
	line	138
	
l450:	
;SC8F096_Led_Demo.c: 138: LCDCON0 = 0B00111011;
	movlw	low(03Bh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(285)^0100h	;volatile
	line	167
	
l452:	
;SC8F096_Led_Demo.c: 167: LCDCON1 = 0;
	clrf	(286)^0100h	;volatile
	line	174
	
l454:	
;SC8F096_Led_Demo.c: 174: COMEN = 0B00000011;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(414)^0180h	;volatile
	line	175
	
l456:	
;SC8F096_Led_Demo.c: 175: SEGEN1 = 0xff;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(287)^0100h	;volatile
	line	176
	
l458:	
;SC8F096_Led_Demo.c: 176: SEGEN3 = 0B01000000;
	movlw	low(040h)
	bsf	status, 5	;RP0=1, select bank3
	movwf	(415)^0180h	;volatile
	line	196
	
l74:	
	return
	opt stack 0
GLOBAL	__end_of_Set_LED_Moudle
	__end_of_Set_LED_Moudle:
	signat	_Set_LED_Moudle,89
	global	_Timer_Isr

;; *************** function _Timer_Isr *****************
;; Defined at:
;;		line 113 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
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
	line	113
global __ptext2
__ptext2:	;psect for function _Timer_Isr
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096AD开发包\SC8F096_DEMO_C\SC8F096_Led_Demo\SC8F096_Led_Demo.c"
	line	113
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
	line	117
	
i1l568:	
;SC8F096_Led_Demo.c: 115: static unsigned char tcount = 0;
;SC8F096_Led_Demo.c: 117: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l71
u3_20:
	line	119
	
i1l570:	
;SC8F096_Led_Demo.c: 118: {
;SC8F096_Led_Demo.c: 119: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	120
	
i1l572:	
;SC8F096_Led_Demo.c: 120: if(++tcount >= 40)
	movlw	low(028h)
	incf	(Timer_Isr@tcount),f
	subwf	((Timer_Isr@tcount)),w
	skipc
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l71
u4_20:
	line	122
	
i1l574:	
;SC8F096_Led_Demo.c: 121: {
;SC8F096_Led_Demo.c: 122: tcount = 0;
	clrf	(Timer_Isr@tcount)
	line	123
	
i1l576:	
;SC8F096_Led_Demo.c: 123: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	126
	
i1l71:	
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
