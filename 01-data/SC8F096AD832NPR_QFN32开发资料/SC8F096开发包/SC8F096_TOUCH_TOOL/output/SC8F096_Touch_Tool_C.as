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
	FNCALL	_main,_CheckTouchKey
	FNCALL	_main,_Delay_nms
	FNCALL	_main,_Refurbish_Sfr
	FNCALL	_main,_System_Init
	FNCALL	_Delay_nms,_Delay
	FNCALL	_CheckTouchKey,_CheckTouchKey_F
	FNCALL	_CheckTouchKey_F,_I2C_Write1bYTE
	FNCALL	_CheckTouchKey_F,_I2C_WriteStart
	FNCALL	_CheckTouchKey_F,_I2C_WriteStop
	FNCALL	_CheckTouchKey_F,_Key_Test
	FNCALL	_I2C_WriteStop,_I2C_WaitMoment
	FNCALL	_I2C_WriteStart,_I2C_WaitMoment
	FNCALL	_I2C_Write1bYTE,_I2C_WaitMoment
	FNROOT	_main
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_MainTime
	global	_TKdata
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
	global	_WPUB
_WPUB	set	8
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	5
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_TMR2IF
_TMR2IF	set	0x69
	global	_TMR2IE
_TMR2IE	set	0x71
	global	_KEYDATAH
_KEYDATAH	set	279
	global	_KEYDATAL
_KEYDATAL	set	278
	global	_KEYCON2
_KEYCON2	set	275
	global	_KEYCON1
_KEYCON1	set	274
	global	_KEYCON0
_KEYCON0	set	273
	global	_I2C_SDA_IO
_I2C_SDA_IO	set	2093
	global	_I2C_SCL_IO
_I2C_SCL_IO	set	2092
	global	_RC4
_RC4	set	0x834
	global	_RC5
_RC5	set	0x835
; #config settings
	file	"SC8F096_Touch_Tool_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_MainTime:
       ds      2

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_TKdata:
       ds      32

	file	"SC8F096_Touch_Tool_C.as"
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+020h)
	fcall	clear_ram0
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
?_I2C_WriteStart:	; 1 bytes @ 0x0
?_I2C_Write1bYTE:	; 1 bytes @ 0x0
?_I2C_WriteStop:	; 1 bytes @ 0x0
?_I2C_WaitMoment:	; 1 bytes @ 0x0
?_CheckTouchKey_F:	; 1 bytes @ 0x0
?_CheckTouchKey:	; 1 bytes @ 0x0
?_System_Init:	; 1 bytes @ 0x0
?_Refurbish_Sfr:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
??_Isr_Timer:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Key_Test:	; 2 bytes @ 0x0
	ds	2
??_I2C_WriteStart:	; 1 bytes @ 0x2
??_I2C_Write1bYTE:	; 1 bytes @ 0x2
??_I2C_WriteStop:	; 1 bytes @ 0x2
??_I2C_WaitMoment:	; 1 bytes @ 0x2
??_Key_Test:	; 1 bytes @ 0x2
?_Delay:	; 1 bytes @ 0x2
??_System_Init:	; 1 bytes @ 0x2
??_Refurbish_Sfr:	; 1 bytes @ 0x2
	global	I2C_Write1bYTE@data
I2C_Write1bYTE@data:	; 1 bytes @ 0x2
	global	Delay@dtemp
Delay@dtemp:	; 2 bytes @ 0x2
	ds	1
	global	I2C_Write1bYTE@i
I2C_Write1bYTE@i:	; 1 bytes @ 0x3
	ds	1
??_CheckTouchKey_F:	; 1 bytes @ 0x4
??_Delay:	; 1 bytes @ 0x4
?_Delay_nms:	; 1 bytes @ 0x4
	global	CheckTouchKey_F@checksum
CheckTouchKey_F@checksum:	; 1 bytes @ 0x4
	global	Delay_nms@inittempl
Delay_nms@inittempl:	; 2 bytes @ 0x4
	ds	1
??_CheckTouchKey:	; 1 bytes @ 0x5
	ds	1
??_Delay_nms:	; 1 bytes @ 0x6
	global	Delay_nms@i
Delay_nms@i:	; 2 bytes @ 0x6
	ds	2
??_main:	; 1 bytes @ 0x8
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         34
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      8      10
;!    BANK0            80      0      32
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
;!    _main->_Delay_nms
;!    _Delay_nms->_Delay
;!    _CheckTouchKey->_CheckTouchKey_F
;!    _CheckTouchKey_F->_I2C_Write1bYTE
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0     234
;!                      _CheckTouchKey
;!                          _Delay_nms
;!                      _Refurbish_Sfr
;!                        _System_Init
;! ---------------------------------------------------------------------------------
;! (1) _System_Init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Refurbish_Sfr                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Delay_nms                                            4     2      2     154
;!                                              4 COMMON     4     2      2
;!                              _Delay
;! ---------------------------------------------------------------------------------
;! (2) _Delay                                                2     0      2      65
;!                                              2 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _CheckTouchKey                                        0     0      0      80
;!                    _CheckTouchKey_F
;! ---------------------------------------------------------------------------------
;! (2) _CheckTouchKey_F                                      1     1      0      80
;!                                              4 COMMON     1     1      0
;!                     _I2C_Write1bYTE
;!                     _I2C_WriteStart
;!                      _I2C_WriteStop
;!                           _Key_Test
;! ---------------------------------------------------------------------------------
;! (3) _Key_Test                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _I2C_WriteStop                                        0     0      0       0
;!                     _I2C_WaitMoment
;! ---------------------------------------------------------------------------------
;! (3) _I2C_WriteStart                                       0     0      0       0
;!                     _I2C_WaitMoment
;! ---------------------------------------------------------------------------------
;! (3) _I2C_Write1bYTE                                       2     2      0      35
;!                                              2 COMMON     2     2      0
;!                     _I2C_WaitMoment
;! ---------------------------------------------------------------------------------
;! (4) _I2C_WaitMoment                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _Isr_Timer                                            2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _CheckTouchKey
;!     _CheckTouchKey_F
;!       _I2C_Write1bYTE
;!         _I2C_WaitMoment
;!       _I2C_WriteStart
;!         _I2C_WaitMoment
;!       _I2C_WriteStop
;!         _I2C_WaitMoment
;!       _Key_Test
;!   _Delay_nms
;!     _Delay
;!   _Refurbish_Sfr
;!   _System_Init
;!
;! _Isr_Timer (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      8       A       1       71.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50      0      20       4       40.0%
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
;!ABS                  0      0      2A      11        0.0%
;!DATA                 0      0      2A      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 101 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_CheckTouchKey
;;		_Delay_nms
;;		_Refurbish_Sfr
;;		_System_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	101
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	101
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	103
	
l1472:	
;main.c: 103: Delay_nms(100);
	movlw	064h
	movwf	(Delay_nms@inittempl)
	clrf	(Delay_nms@inittempl+1)
	fcall	_Delay_nms
	line	104
;main.c: 104: System_Init();
	fcall	_System_Init
	line	106
;main.c: 106: while(1)
	
l575:	
	line	109
;main.c: 107: {
;main.c: 109: Refurbish_Sfr();
	fcall	_Refurbish_Sfr
	line	110
;main.c: 110: CheckTouchKey();
	fcall	_CheckTouchKey
	goto	l575
	global	start
	ljmp	start
	opt stack 0
	line	113
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_System_Init

;; *************** function _System_Init *****************
;; Defined at:
;;		line 34 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
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
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	34
global __ptext1
__ptext1:	;psect for function _System_Init
psect	text1
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	34
	global	__size_of_System_Init
	__size_of_System_Init	equ	__end_of_System_Init-_System_Init
	
_System_Init:	
;incstack = 0
	opt	stack 6
; Regs used in _System_Init: [wreg+status,2]
	line	36
	
l1418:	
# 36 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
clrwdt ;# 
psect	text1
	line	37
	
l1420:	
;main.c: 37: OSCCON = 0X70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	38
;main.c: 38: OPTION_REG = 0B00001111;
	movlw	low(0Fh)
	movwf	(1)	;volatile
	line	39
# 39 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
clrwdt ;# 
psect	text1
	line	41
;main.c: 41: TRISB = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	43
	
l1422:	
;main.c: 43: PORTB = 0;
	clrf	(6)	;volatile
	line	45
	
l1424:	
;main.c: 45: WPUB = 0;
	clrf	(8)	;volatile
	line	47
	
l1426:	
;main.c: 47: PIE1 = 0;
	clrf	(14)	;volatile
	line	49
	
l1428:	
;main.c: 49: INTCON = 0xC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	50
	
l560:	
	return
	opt stack 0
GLOBAL	__end_of_System_Init
	__end_of_System_Init:
	signat	_System_Init,89
	global	_Refurbish_Sfr

;; *************** function _Refurbish_Sfr *****************
;; Defined at:
;;		line 59 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
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
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	59
global __ptext2
__ptext2:	;psect for function _Refurbish_Sfr
psect	text2
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	59
	global	__size_of_Refurbish_Sfr
	__size_of_Refurbish_Sfr	equ	__end_of_Refurbish_Sfr-_Refurbish_Sfr
	
_Refurbish_Sfr:	
;incstack = 0
	opt	stack 6
; Regs used in _Refurbish_Sfr: [wreg+status,2]
	line	61
	
l1430:	
# 61 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
clrwdt ;# 
psect	text2
	line	62
	
l1432:	
;main.c: 62: OSCCON = 0X70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	63
;main.c: 63: OPTION_REG = 0B00001111;
	movlw	low(0Fh)
	movwf	(1)	;volatile
	line	64
# 64 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
clrwdt ;# 
psect	text2
	line	66
;main.c: 66: TRISB = 0B11111111;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	68
	
l1434:	
;main.c: 68: PORTB = 0;
	clrf	(6)	;volatile
	line	70
	
l1436:	
;main.c: 70: WPUB = 0;
	clrf	(8)	;volatile
	line	72
	
l1438:	
;main.c: 72: PIE1 = 0;
	clrf	(14)	;volatile
	line	74
	
l1440:	
;main.c: 74: INTCON = 0xC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	76
	
l1442:	
;main.c: 76: T2CON =4;
	movlw	low(04h)
	movwf	(19)	;volatile
	line	77
	
l1444:	
;main.c: 77: PR2 =250;
	movlw	low(0FAh)
	movwf	(17)	;volatile
	line	78
	
l563:	
	return
	opt stack 0
GLOBAL	__end_of_Refurbish_Sfr
	__end_of_Refurbish_Sfr:
	signat	_Refurbish_Sfr,89
	global	_Delay_nms

;; *************** function _Delay_nms *****************
;; Defined at:
;;		line 20 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
;; Parameters:    Size  Location     Type
;;  inittempl       2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	20
global __ptext3
__ptext3:	;psect for function _Delay_nms
psect	text3
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	20
	global	__size_of_Delay_nms
	__size_of_Delay_nms	equ	__end_of_Delay_nms-_Delay_nms
	
_Delay_nms:	
;incstack = 0
	opt	stack 5
; Regs used in _Delay_nms: [wreg+status,2+status,0+pclath+cstack]
	line	24
	
l1464:	
;main.c: 22: unsigned int i;
;main.c: 24: for(i=0;i<inittempl;i++)
	clrf	(Delay_nms@i)
	clrf	(Delay_nms@i+1)
	goto	l1470
	line	26
	
l1466:	
;main.c: 25: {
;main.c: 26: Delay(154);
	movlw	09Ah
	movwf	(Delay@dtemp)
	clrf	(Delay@dtemp+1)
	fcall	_Delay
	line	27
# 27 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
clrwdt ;# 
psect	text3
	line	24
	
l1468:	
	incf	(Delay_nms@i),f
	skipnz
	incf	(Delay_nms@i+1),f
	
l1470:	
	movf	(Delay_nms@inittempl+1),w
	subwf	(Delay_nms@i+1),w
	skipz
	goto	u245
	movf	(Delay_nms@inittempl),w
	subwf	(Delay_nms@i),w
u245:
	skipc
	goto	u241
	goto	u240
u241:
	goto	l1466
u240:
	line	29
	
l557:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_nms
	__end_of_Delay_nms:
	signat	_Delay_nms,4217
	global	_Delay

;; *************** function _Delay *****************
;; Defined at:
;;		line 13 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
;; Parameters:    Size  Location     Type
;;  dtemp           2    2[COMMON] unsigned int 
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
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Delay_nms
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	13
global __ptext4
__ptext4:	;psect for function _Delay
psect	text4
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	13
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
;incstack = 0
	opt	stack 5
; Regs used in _Delay: [wreg+status,2+status,0]
	line	15
	
l1460:	
;main.c: 15: while(dtemp--);
	
l1462:	
	movlw	01h
	subwf	(Delay@dtemp),f
	movlw	0
	skipc
	decf	(Delay@dtemp+1),f
	subwf	(Delay@dtemp+1),f
		incf	(((Delay@dtemp))),w
	skipz
	goto	u231
	incf	(((Delay@dtemp+1))),w
	btfss	status,2
	goto	u231
	goto	u230
u231:
	goto	l1462
u230:
	line	16
	
l551:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
	signat	_Delay,4217
	global	_CheckTouchKey

;; *************** function _CheckTouchKey *****************
;; Defined at:
;;		line 565 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_CheckTouchKey_F
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	565
global __ptext5
__ptext5:	;psect for function _CheckTouchKey
psect	text5
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	565
	global	__size_of_CheckTouchKey
	__size_of_CheckTouchKey	equ	__end_of_CheckTouchKey-_CheckTouchKey
	
_CheckTouchKey:	
;incstack = 0
	opt	stack 3
; Regs used in _CheckTouchKey: [wreg+status,2+status,0+pclath+cstack]
	line	567
	
l1408:	
;CheckTouchKey.c: 567: CheckTouchKey_F();
	fcall	_CheckTouchKey_F
	line	568
	
l289:	
	return
	opt stack 0
GLOBAL	__end_of_CheckTouchKey
	__end_of_CheckTouchKey:
	signat	_CheckTouchKey,89
	global	_CheckTouchKey_F

;; *************** function _CheckTouchKey_F *****************
;; Defined at:
;;		line 340 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  checksum        1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_I2C_Write1bYTE
;;		_I2C_WriteStart
;;		_I2C_WriteStop
;;		_Key_Test
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	340
global __ptext6
__ptext6:	;psect for function _CheckTouchKey_F
psect	text6
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	340
	global	__size_of_CheckTouchKey_F
	__size_of_CheckTouchKey_F	equ	__end_of_CheckTouchKey_F-_CheckTouchKey_F
	
_CheckTouchKey_F:	
;incstack = 0
	opt	stack 3
; Regs used in _CheckTouchKey_F: [wreg+status,2+status,0+pclath+cstack]
	line	343
	
l1182:	
;CheckTouchKey.c: 343: unsigned char checksum = 0;
	clrf	(CheckTouchKey_F@checksum)
	line	346
# 346 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
clrwdt ;# 
psect	text6
	line	349
	
l1184:	
;CheckTouchKey.c: 349: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	353
	
l1186:	
;CheckTouchKey.c: 353: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	357
	
l1188:	
;CheckTouchKey.c: 357: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	361
	
l1190:	
;CheckTouchKey.c: 361: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	365
	
l1192:	
;CheckTouchKey.c: 365: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	369
	
l1194:	
;CheckTouchKey.c: 369: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	373
	
l1196:	
;CheckTouchKey.c: 373: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	377
	
l1198:	
;CheckTouchKey.c: 377: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	381
	
l1200:	
;CheckTouchKey.c: 381: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	385
	
l1202:	
;CheckTouchKey.c: 385: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	389
	
l1204:	
;CheckTouchKey.c: 389: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	393
	
l1206:	
;CheckTouchKey.c: 393: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	397
	
l1208:	
;CheckTouchKey.c: 397: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	401
	
l1210:	
;CheckTouchKey.c: 401: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	405
	
l1212:	
;CheckTouchKey.c: 405: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	408
	
l1214:	
;CheckTouchKey.c: 408: if (checksum)
	movf	((CheckTouchKey_F@checksum)),w
	btfsc	status,2
	goto	u181
	goto	u180
u181:
	goto	l286
u180:
	line	411
	
l1216:	
;CheckTouchKey.c: 409: {
;CheckTouchKey.c: 411: Key_Test();
	fcall	_Key_Test
	line	414
	
l1218:	
;CheckTouchKey.c: 414: checksum *= 3;
	clrc
	rlf	(CheckTouchKey_F@checksum),w
	addwf	(CheckTouchKey_F@checksum),f
	line	415
	
l1220:	
;CheckTouchKey.c: 415: checksum += 2;
	incf	(CheckTouchKey_F@checksum),f
	incf	(CheckTouchKey_F@checksum),f
	line	417
	
l1222:	
;CheckTouchKey.c: 417: I2C_WriteStart();
	fcall	_I2C_WriteStart
	line	418
	
l1224:	
;CheckTouchKey.c: 418: I2C_Write1bYTE(0xa0);
	movlw	low(0A0h)
	fcall	_I2C_Write1bYTE
	line	419
	
l1226:	
;CheckTouchKey.c: 419: I2C_Write1bYTE(checksum);
	movf	(CheckTouchKey_F@checksum),w
	fcall	_I2C_Write1bYTE
	line	422
	
l1228:	
;CheckTouchKey.c: 422: I2C_Write1bYTE(1);
	movlw	low(01h)
	fcall	_I2C_Write1bYTE
	line	423
	
l1230:	
;CheckTouchKey.c: 423: I2C_Write1bYTE(TKdata[0] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	(_TKdata),w
	fcall	_I2C_Write1bYTE
	line	424
	
l1232:	
;CheckTouchKey.c: 424: I2C_Write1bYTE((TKdata[0]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01h,w
	fcall	_I2C_Write1bYTE
	line	425
	
l1234:	
;CheckTouchKey.c: 425: checksum += 1;
	incf	(CheckTouchKey_F@checksum),f
	line	426
	
l1236:	
;CheckTouchKey.c: 426: checksum += (TKdata[0] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	(_TKdata),w
	addwf	(CheckTouchKey_F@checksum),f
	line	427
	
l1238:	
;CheckTouchKey.c: 427: checksum += ((TKdata[0]>>8) & 0xff);
	movf	0+(_TKdata)+01h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	431
;CheckTouchKey.c: 431: I2C_Write1bYTE(2);
	movlw	low(02h)
	fcall	_I2C_Write1bYTE
	line	432
;CheckTouchKey.c: 432: I2C_Write1bYTE(TKdata[1] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+02h,w
	fcall	_I2C_Write1bYTE
	line	433
;CheckTouchKey.c: 433: I2C_Write1bYTE((TKdata[1]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+02h,w
	fcall	_I2C_Write1bYTE
	line	434
	
l1240:	
;CheckTouchKey.c: 434: checksum += 2;
	incf	(CheckTouchKey_F@checksum),f
	incf	(CheckTouchKey_F@checksum),f
	line	435
	
l1242:	
;CheckTouchKey.c: 435: checksum += (TKdata[1] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+02h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	436
	
l1244:	
;CheckTouchKey.c: 436: checksum += ((TKdata[1]>>8) & 0xff);
	movf	1+(_TKdata)+02h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	440
	
l1246:	
;CheckTouchKey.c: 440: I2C_Write1bYTE(3);
	movlw	low(03h)
	fcall	_I2C_Write1bYTE
	line	441
	
l1248:	
;CheckTouchKey.c: 441: I2C_Write1bYTE(TKdata[2] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+04h,w
	fcall	_I2C_Write1bYTE
	line	442
	
l1250:	
;CheckTouchKey.c: 442: I2C_Write1bYTE((TKdata[2]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+04h,w
	fcall	_I2C_Write1bYTE
	line	443
	
l1252:	
;CheckTouchKey.c: 443: checksum += 3;
	movlw	low(03h)
	addwf	(CheckTouchKey_F@checksum),f
	line	444
	
l1254:	
;CheckTouchKey.c: 444: checksum += (TKdata[2] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+04h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	445
	
l1256:	
;CheckTouchKey.c: 445: checksum += ((TKdata[2]>>8) & 0xff);
	movf	1+(_TKdata)+04h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	449
	
l1258:	
;CheckTouchKey.c: 449: I2C_Write1bYTE(4);
	movlw	low(04h)
	fcall	_I2C_Write1bYTE
	line	450
	
l1260:	
;CheckTouchKey.c: 450: I2C_Write1bYTE(TKdata[3] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+06h,w
	fcall	_I2C_Write1bYTE
	line	451
	
l1262:	
;CheckTouchKey.c: 451: I2C_Write1bYTE((TKdata[3]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+06h,w
	fcall	_I2C_Write1bYTE
	line	452
	
l1264:	
;CheckTouchKey.c: 452: checksum += 4;
	movlw	low(04h)
	addwf	(CheckTouchKey_F@checksum),f
	line	453
	
l1266:	
;CheckTouchKey.c: 453: checksum += (TKdata[3] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+06h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	454
	
l1268:	
;CheckTouchKey.c: 454: checksum += ((TKdata[3]>>8) & 0xff);
	movf	1+(_TKdata)+06h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	458
	
l1270:	
;CheckTouchKey.c: 458: I2C_Write1bYTE(5);
	movlw	low(05h)
	fcall	_I2C_Write1bYTE
	line	459
	
l1272:	
;CheckTouchKey.c: 459: I2C_Write1bYTE(TKdata[4] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+08h,w
	fcall	_I2C_Write1bYTE
	line	460
	
l1274:	
;CheckTouchKey.c: 460: I2C_Write1bYTE((TKdata[4]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+08h,w
	fcall	_I2C_Write1bYTE
	line	461
	
l1276:	
;CheckTouchKey.c: 461: checksum += 5;
	movlw	low(05h)
	addwf	(CheckTouchKey_F@checksum),f
	line	462
	
l1278:	
;CheckTouchKey.c: 462: checksum += (TKdata[4] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+08h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	463
	
l1280:	
;CheckTouchKey.c: 463: checksum += ((TKdata[4]>>8) & 0xff);
	movf	1+(_TKdata)+08h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	467
	
l1282:	
;CheckTouchKey.c: 467: I2C_Write1bYTE(6);
	movlw	low(06h)
	fcall	_I2C_Write1bYTE
	line	468
	
l1284:	
;CheckTouchKey.c: 468: I2C_Write1bYTE(TKdata[5] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+0Ah,w
	fcall	_I2C_Write1bYTE
	line	469
	
l1286:	
;CheckTouchKey.c: 469: I2C_Write1bYTE((TKdata[5]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+0Ah,w
	fcall	_I2C_Write1bYTE
	line	470
	
l1288:	
;CheckTouchKey.c: 470: checksum += 6;
	movlw	low(06h)
	addwf	(CheckTouchKey_F@checksum),f
	line	471
	
l1290:	
;CheckTouchKey.c: 471: checksum += (TKdata[5] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+0Ah,w
	addwf	(CheckTouchKey_F@checksum),f
	line	472
	
l1292:	
;CheckTouchKey.c: 472: checksum += ((TKdata[5]>>8) & 0xff);
	movf	1+(_TKdata)+0Ah,w
	addwf	(CheckTouchKey_F@checksum),f
	line	476
	
l1294:	
;CheckTouchKey.c: 476: I2C_Write1bYTE(7);
	movlw	low(07h)
	fcall	_I2C_Write1bYTE
	line	477
	
l1296:	
;CheckTouchKey.c: 477: I2C_Write1bYTE(TKdata[7] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+0Eh,w
	fcall	_I2C_Write1bYTE
	line	478
	
l1298:	
;CheckTouchKey.c: 478: I2C_Write1bYTE((TKdata[7]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+0Eh,w
	fcall	_I2C_Write1bYTE
	line	479
	
l1300:	
;CheckTouchKey.c: 479: checksum += 7;
	movlw	low(07h)
	addwf	(CheckTouchKey_F@checksum),f
	line	480
	
l1302:	
;CheckTouchKey.c: 480: checksum += (TKdata[7] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+0Eh,w
	addwf	(CheckTouchKey_F@checksum),f
	line	481
	
l1304:	
;CheckTouchKey.c: 481: checksum += ((TKdata[7]>>8) & 0xff);
	movf	1+(_TKdata)+0Eh,w
	addwf	(CheckTouchKey_F@checksum),f
	line	485
	
l1306:	
;CheckTouchKey.c: 485: I2C_Write1bYTE(8);
	movlw	low(08h)
	fcall	_I2C_Write1bYTE
	line	486
	
l1308:	
;CheckTouchKey.c: 486: I2C_Write1bYTE(TKdata[8] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+010h,w
	fcall	_I2C_Write1bYTE
	line	487
	
l1310:	
;CheckTouchKey.c: 487: I2C_Write1bYTE((TKdata[8]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+010h,w
	fcall	_I2C_Write1bYTE
	line	488
	
l1312:	
;CheckTouchKey.c: 488: checksum += 8;
	movlw	low(08h)
	addwf	(CheckTouchKey_F@checksum),f
	line	489
	
l1314:	
;CheckTouchKey.c: 489: checksum += (TKdata[8] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+010h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	490
	
l1316:	
;CheckTouchKey.c: 490: checksum += ((TKdata[8]>>8) & 0xff);
	movf	1+(_TKdata)+010h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	494
	
l1318:	
;CheckTouchKey.c: 494: I2C_Write1bYTE(9);
	movlw	low(09h)
	fcall	_I2C_Write1bYTE
	line	495
	
l1320:	
;CheckTouchKey.c: 495: I2C_Write1bYTE(TKdata[9] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+012h,w
	fcall	_I2C_Write1bYTE
	line	496
	
l1322:	
;CheckTouchKey.c: 496: I2C_Write1bYTE((TKdata[9]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+012h,w
	fcall	_I2C_Write1bYTE
	line	497
	
l1324:	
;CheckTouchKey.c: 497: checksum += 9;
	movlw	low(09h)
	addwf	(CheckTouchKey_F@checksum),f
	line	498
	
l1326:	
;CheckTouchKey.c: 498: checksum += (TKdata[9] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+012h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	499
	
l1328:	
;CheckTouchKey.c: 499: checksum += ((TKdata[9]>>8) & 0xff);
	movf	1+(_TKdata)+012h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	503
	
l1330:	
;CheckTouchKey.c: 503: I2C_Write1bYTE(10);
	movlw	low(0Ah)
	fcall	_I2C_Write1bYTE
	line	504
	
l1332:	
;CheckTouchKey.c: 504: I2C_Write1bYTE(TKdata[10] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+014h,w
	fcall	_I2C_Write1bYTE
	line	505
	
l1334:	
;CheckTouchKey.c: 505: I2C_Write1bYTE((TKdata[10]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+014h,w
	fcall	_I2C_Write1bYTE
	line	506
	
l1336:	
;CheckTouchKey.c: 506: checksum += 10;
	movlw	low(0Ah)
	addwf	(CheckTouchKey_F@checksum),f
	line	507
	
l1338:	
;CheckTouchKey.c: 507: checksum += (TKdata[10] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+014h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	508
	
l1340:	
;CheckTouchKey.c: 508: checksum += ((TKdata[10]>>8) & 0xff);
	movf	1+(_TKdata)+014h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	512
	
l1342:	
;CheckTouchKey.c: 512: I2C_Write1bYTE(11);
	movlw	low(0Bh)
	fcall	_I2C_Write1bYTE
	line	513
	
l1344:	
;CheckTouchKey.c: 513: I2C_Write1bYTE(TKdata[11] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+016h,w
	fcall	_I2C_Write1bYTE
	line	514
	
l1346:	
;CheckTouchKey.c: 514: I2C_Write1bYTE((TKdata[11]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+016h,w
	fcall	_I2C_Write1bYTE
	line	515
	
l1348:	
;CheckTouchKey.c: 515: checksum += 11;
	movlw	low(0Bh)
	addwf	(CheckTouchKey_F@checksum),f
	line	516
	
l1350:	
;CheckTouchKey.c: 516: checksum += (TKdata[11] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+016h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	517
	
l1352:	
;CheckTouchKey.c: 517: checksum += ((TKdata[11]>>8) & 0xff);
	movf	1+(_TKdata)+016h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	521
	
l1354:	
;CheckTouchKey.c: 521: I2C_Write1bYTE(12);
	movlw	low(0Ch)
	fcall	_I2C_Write1bYTE
	line	522
	
l1356:	
;CheckTouchKey.c: 522: I2C_Write1bYTE(TKdata[12] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+018h,w
	fcall	_I2C_Write1bYTE
	line	523
	
l1358:	
;CheckTouchKey.c: 523: I2C_Write1bYTE((TKdata[12]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+018h,w
	fcall	_I2C_Write1bYTE
	line	524
	
l1360:	
;CheckTouchKey.c: 524: checksum += 12;
	movlw	low(0Ch)
	addwf	(CheckTouchKey_F@checksum),f
	line	525
	
l1362:	
;CheckTouchKey.c: 525: checksum += (TKdata[12] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+018h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	526
	
l1364:	
;CheckTouchKey.c: 526: checksum += ((TKdata[12]>>8) & 0xff);
	movf	1+(_TKdata)+018h,w
	addwf	(CheckTouchKey_F@checksum),f
	line	530
	
l1366:	
;CheckTouchKey.c: 530: I2C_Write1bYTE(13);
	movlw	low(0Dh)
	fcall	_I2C_Write1bYTE
	line	531
	
l1368:	
;CheckTouchKey.c: 531: I2C_Write1bYTE(TKdata[13] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Ah,w
	fcall	_I2C_Write1bYTE
	line	532
	
l1370:	
;CheckTouchKey.c: 532: I2C_Write1bYTE((TKdata[13]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+01Ah,w
	fcall	_I2C_Write1bYTE
	line	533
	
l1372:	
;CheckTouchKey.c: 533: checksum += 13;
	movlw	low(0Dh)
	addwf	(CheckTouchKey_F@checksum),f
	line	534
	
l1374:	
;CheckTouchKey.c: 534: checksum += (TKdata[13] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Ah,w
	addwf	(CheckTouchKey_F@checksum),f
	line	535
	
l1376:	
;CheckTouchKey.c: 535: checksum += ((TKdata[13]>>8) & 0xff);
	movf	1+(_TKdata)+01Ah,w
	addwf	(CheckTouchKey_F@checksum),f
	line	539
	
l1378:	
;CheckTouchKey.c: 539: I2C_Write1bYTE(14);
	movlw	low(0Eh)
	fcall	_I2C_Write1bYTE
	line	540
	
l1380:	
;CheckTouchKey.c: 540: I2C_Write1bYTE(TKdata[14] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Ch,w
	fcall	_I2C_Write1bYTE
	line	541
	
l1382:	
;CheckTouchKey.c: 541: I2C_Write1bYTE((TKdata[14]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+01Ch,w
	fcall	_I2C_Write1bYTE
	line	542
	
l1384:	
;CheckTouchKey.c: 542: checksum += 14;
	movlw	low(0Eh)
	addwf	(CheckTouchKey_F@checksum),f
	line	543
	
l1386:	
;CheckTouchKey.c: 543: checksum += (TKdata[14] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Ch,w
	addwf	(CheckTouchKey_F@checksum),f
	line	544
	
l1388:	
;CheckTouchKey.c: 544: checksum += ((TKdata[14]>>8) & 0xff);
	movf	1+(_TKdata)+01Ch,w
	addwf	(CheckTouchKey_F@checksum),f
	line	548
	
l1390:	
;CheckTouchKey.c: 548: I2C_Write1bYTE(15);
	movlw	low(0Fh)
	fcall	_I2C_Write1bYTE
	line	549
	
l1392:	
;CheckTouchKey.c: 549: I2C_Write1bYTE(TKdata[15] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Eh,w
	fcall	_I2C_Write1bYTE
	line	550
	
l1394:	
;CheckTouchKey.c: 550: I2C_Write1bYTE((TKdata[15]>>8) & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_TKdata)+01Eh,w
	fcall	_I2C_Write1bYTE
	line	551
	
l1396:	
;CheckTouchKey.c: 551: checksum += 15;
	movlw	low(0Fh)
	addwf	(CheckTouchKey_F@checksum),f
	line	552
	
l1398:	
;CheckTouchKey.c: 552: checksum += (TKdata[15] & 0xff);
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_TKdata)+01Eh,w
	addwf	(CheckTouchKey_F@checksum),f
	line	553
	
l1400:	
;CheckTouchKey.c: 553: checksum += ((TKdata[15]>>8) & 0xff);
	movf	1+(_TKdata)+01Eh,w
	addwf	(CheckTouchKey_F@checksum),f
	line	556
	
l1402:	
;CheckTouchKey.c: 556: I2C_Write1bYTE(checksum);
	movf	(CheckTouchKey_F@checksum),w
	fcall	_I2C_Write1bYTE
	line	557
;CheckTouchKey.c: 557: I2C_WriteStop();
	fcall	_I2C_WriteStop
	line	560
	
l286:	
	return
	opt stack 0
GLOBAL	__end_of_CheckTouchKey_F
	__end_of_CheckTouchKey_F:
	signat	_CheckTouchKey_F,89
	global	_Key_Test

;; *************** function _Key_Test *****************
;; Defined at:
;;		line 32 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  236[None  ] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
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
;;		_CheckTouchKey_F
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	32
global __ptext7
__ptext7:	;psect for function _Key_Test
psect	text7
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	32
	global	__size_of_Key_Test
	__size_of_Key_Test	equ	__end_of_Key_Test-_Key_Test
	
_Key_Test:	
;incstack = 0
	opt	stack 4
; Regs used in _Key_Test: [wreg+status,2]
	line	35
	
l956:	
;CheckTouchKey.c: 35: KEYCON0 = 0x02;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(273)^0100h	;volatile
	line	36
;CheckTouchKey.c: 36: KEYCON1 = 0x40|0x10|0x00;
	movlw	low(050h)
	movwf	(274)^0100h	;volatile
	line	37
;CheckTouchKey.c: 37: KEYCON2 = 0x80|0X10|0X08|0X00|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	38
# 38 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	39
# 39 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	40
# 40 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	41
# 41 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	42
# 42 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	43
# 43 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	44
# 44 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	45
# 45 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	46
# 46 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	47
	
l958:	
;CheckTouchKey.c: 47: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	48
;CheckTouchKey.c: 48: while(!(KEYCON0&0x80));
	
l237:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u11
	goto	u10
u11:
	goto	l237
u10:
	line	49
	
l960:	
;CheckTouchKey.c: 49: TKdata[0] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_TKdata+1)
	clrf	(_TKdata)
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_TKdata),f
	skipnc
	incf	(_TKdata+1),f
	line	50
	
l962:	
;CheckTouchKey.c: 50: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	55
	
l964:	
;CheckTouchKey.c: 55: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	56
	
l966:	
;CheckTouchKey.c: 56: KEYCON1 = 0x40|0x10|0x01;
	movlw	low(051h)
	movwf	(274)^0100h	;volatile
	line	57
	
l968:	
;CheckTouchKey.c: 57: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	58
# 58 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	59
# 59 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	60
# 60 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	61
# 61 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	62
# 62 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	63
# 63 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	64
# 64 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	65
# 65 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	66
# 66 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	67
	
l970:	
;CheckTouchKey.c: 67: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	68
;CheckTouchKey.c: 68: while(!(KEYCON0&0x80));
	
l240:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u21
	goto	u20
u21:
	goto	l240
u20:
	line	69
	
l972:	
;CheckTouchKey.c: 69: TKdata[1] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+02h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+02h
	line	70
	
l974:	
;CheckTouchKey.c: 70: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	75
	
l976:	
;CheckTouchKey.c: 75: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	76
	
l978:	
;CheckTouchKey.c: 76: KEYCON1 = 0x40|0x10|0x02;
	movlw	low(052h)
	movwf	(274)^0100h	;volatile
	line	77
	
l980:	
;CheckTouchKey.c: 77: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	78
# 78 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	79
# 79 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	80
# 80 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	81
# 81 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	82
# 82 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	83
# 83 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	84
# 84 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	85
# 85 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	86
# 86 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	87
	
l982:	
;CheckTouchKey.c: 87: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	88
;CheckTouchKey.c: 88: while(!(KEYCON0&0x80));
	
l243:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u31
	goto	u30
u31:
	goto	l243
u30:
	line	89
	
l984:	
;CheckTouchKey.c: 89: TKdata[2] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+04h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+04h
	line	90
	
l986:	
;CheckTouchKey.c: 90: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	96
	
l988:	
;CheckTouchKey.c: 96: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	97
	
l990:	
;CheckTouchKey.c: 97: KEYCON1 = 0x40|0x10|0x03;
	movlw	low(053h)
	movwf	(274)^0100h	;volatile
	line	98
	
l992:	
;CheckTouchKey.c: 98: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	99
# 99 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	100
# 100 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	101
# 101 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	102
# 102 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	103
# 103 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	104
# 104 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	105
# 105 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	106
# 106 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	107
# 107 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	108
	
l994:	
;CheckTouchKey.c: 108: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	109
;CheckTouchKey.c: 109: while(!(KEYCON0&0x80));
	
l246:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u41
	goto	u40
u41:
	goto	l246
u40:
	line	110
	
l996:	
;CheckTouchKey.c: 110: TKdata[3] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+06h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+06h
	line	111
	
l998:	
;CheckTouchKey.c: 111: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	115
	
l1000:	
;CheckTouchKey.c: 115: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	116
	
l1002:	
;CheckTouchKey.c: 116: KEYCON1 = 0x40|0x10|0x04;
	movlw	low(054h)
	movwf	(274)^0100h	;volatile
	line	117
	
l1004:	
;CheckTouchKey.c: 117: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	118
# 118 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	119
# 119 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	120
# 120 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	121
# 121 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	122
# 122 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	123
# 123 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	124
# 124 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	125
# 125 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	126
# 126 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	127
	
l1006:	
;CheckTouchKey.c: 127: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	128
;CheckTouchKey.c: 128: while(!(KEYCON0&0x80));
	
l249:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u51
	goto	u50
u51:
	goto	l249
u50:
	line	129
	
l1008:	
;CheckTouchKey.c: 129: TKdata[4] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+08h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+08h
	line	130
	
l1010:	
;CheckTouchKey.c: 130: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	135
	
l1012:	
;CheckTouchKey.c: 135: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	136
	
l1014:	
;CheckTouchKey.c: 136: KEYCON1 = 0x40|0x10|0x05;
	movlw	low(055h)
	movwf	(274)^0100h	;volatile
	line	137
	
l1016:	
;CheckTouchKey.c: 137: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	138
# 138 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	139
# 139 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	140
# 140 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	141
# 141 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	142
# 142 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	143
# 143 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	144
# 144 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	145
# 145 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	146
# 146 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	147
	
l1018:	
;CheckTouchKey.c: 147: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	148
;CheckTouchKey.c: 148: while(!(KEYCON0&0x80));
	
l252:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u61
	goto	u60
u61:
	goto	l252
u60:
	line	149
	
l1020:	
;CheckTouchKey.c: 149: TKdata[5] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+0Ah
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+0Ah
	line	150
	
l1022:	
;CheckTouchKey.c: 150: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	154
	
l1024:	
;CheckTouchKey.c: 154: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	155
	
l1026:	
;CheckTouchKey.c: 155: KEYCON1 = 0x40|0x10|0x07;
	movlw	low(057h)
	movwf	(274)^0100h	;volatile
	line	156
	
l1028:	
;CheckTouchKey.c: 156: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	157
# 157 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	158
# 158 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	159
# 159 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	160
# 160 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	161
# 161 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	162
# 162 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	163
# 163 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	164
# 164 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	165
# 165 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	166
	
l1030:	
;CheckTouchKey.c: 166: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	167
;CheckTouchKey.c: 167: while(!(KEYCON0&0x80));
	
l255:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u71
	goto	u70
u71:
	goto	l255
u70:
	line	168
	
l1032:	
;CheckTouchKey.c: 168: TKdata[7] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+0Eh
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+0Eh
	line	169
	
l1034:	
;CheckTouchKey.c: 169: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	173
	
l1036:	
;CheckTouchKey.c: 173: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	174
	
l1038:	
;CheckTouchKey.c: 174: KEYCON1 = 0x40|0x10|0x08;
	movlw	low(058h)
	movwf	(274)^0100h	;volatile
	line	175
	
l1040:	
;CheckTouchKey.c: 175: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	176
# 176 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	177
# 177 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	178
# 178 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	179
# 179 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	180
# 180 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	181
# 181 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	182
# 182 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	183
# 183 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	184
# 184 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	185
	
l1042:	
;CheckTouchKey.c: 185: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	186
;CheckTouchKey.c: 186: while(!(KEYCON0&0x80));
	
l258:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u81
	goto	u80
u81:
	goto	l258
u80:
	line	187
	
l1044:	
;CheckTouchKey.c: 187: TKdata[8] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+010h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+010h
	line	188
	
l1046:	
;CheckTouchKey.c: 188: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	193
	
l1048:	
;CheckTouchKey.c: 193: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	194
	
l1050:	
;CheckTouchKey.c: 194: KEYCON1 = 0x40|0x10|0x09;
	movlw	low(059h)
	movwf	(274)^0100h	;volatile
	line	195
	
l1052:	
;CheckTouchKey.c: 195: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	196
# 196 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	197
# 197 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	198
# 198 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	199
# 199 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	200
# 200 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	201
# 201 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	202
# 202 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	203
# 203 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	204
# 204 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	205
	
l1054:	
;CheckTouchKey.c: 205: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	206
;CheckTouchKey.c: 206: while(!(KEYCON0&0x80));
	
l261:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u91
	goto	u90
u91:
	goto	l261
u90:
	line	207
	
l1056:	
;CheckTouchKey.c: 207: TKdata[9] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+012h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+012h
	line	208
	
l1058:	
;CheckTouchKey.c: 208: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	213
	
l1060:	
;CheckTouchKey.c: 213: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	214
	
l1062:	
;CheckTouchKey.c: 214: KEYCON1 = 0x40|0x10|0x0A;
	movlw	low(05Ah)
	movwf	(274)^0100h	;volatile
	line	215
	
l1064:	
;CheckTouchKey.c: 215: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	216
# 216 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	217
# 217 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	218
# 218 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	219
# 219 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	220
# 220 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	221
# 221 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	222
# 222 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	223
# 223 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	224
# 224 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	225
	
l1066:	
;CheckTouchKey.c: 225: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	226
;CheckTouchKey.c: 226: while(!(KEYCON0&0x80));
	
l264:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u101
	goto	u100
u101:
	goto	l264
u100:
	line	227
	
l1068:	
;CheckTouchKey.c: 227: TKdata[10] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+014h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+014h
	line	228
	
l1070:	
;CheckTouchKey.c: 228: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	234
	
l1072:	
;CheckTouchKey.c: 234: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	235
	
l1074:	
;CheckTouchKey.c: 235: KEYCON1 = 0x40|0x10|0x0B;
	movlw	low(05Bh)
	movwf	(274)^0100h	;volatile
	line	236
	
l1076:	
;CheckTouchKey.c: 236: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	237
# 237 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	238
# 238 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	239
# 239 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	240
# 240 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	241
# 241 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	242
# 242 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	243
# 243 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	244
# 244 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	245
# 245 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	246
	
l1078:	
;CheckTouchKey.c: 246: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	247
;CheckTouchKey.c: 247: while(!(KEYCON0&0x80));
	
l267:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u111
	goto	u110
u111:
	goto	l267
u110:
	line	248
	
l1080:	
;CheckTouchKey.c: 248: TKdata[11] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+016h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+016h
	line	249
	
l1082:	
;CheckTouchKey.c: 249: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	253
	
l1084:	
;CheckTouchKey.c: 253: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	254
	
l1086:	
;CheckTouchKey.c: 254: KEYCON1 = 0x40|0x10|0x0C;
	movlw	low(05Ch)
	movwf	(274)^0100h	;volatile
	line	255
	
l1088:	
;CheckTouchKey.c: 255: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	256
# 256 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	257
# 257 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	258
# 258 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	259
# 259 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	260
# 260 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	261
# 261 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	262
# 262 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	263
# 263 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	264
# 264 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	265
	
l1090:	
;CheckTouchKey.c: 265: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	266
;CheckTouchKey.c: 266: while(!(KEYCON0&0x80));
	
l270:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u121
	goto	u120
u121:
	goto	l270
u120:
	line	267
	
l1092:	
;CheckTouchKey.c: 267: TKdata[12] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+018h
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+018h
	line	268
	
l1094:	
;CheckTouchKey.c: 268: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	273
	
l1096:	
;CheckTouchKey.c: 273: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	274
	
l1098:	
;CheckTouchKey.c: 274: KEYCON1 = 0x40|0x10|0x0D;
	movlw	low(05Dh)
	movwf	(274)^0100h	;volatile
	line	275
	
l1100:	
;CheckTouchKey.c: 275: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	276
# 276 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	277
# 277 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	278
# 278 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	279
# 279 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	280
# 280 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	281
# 281 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	282
# 282 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	283
# 283 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	284
# 284 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	285
	
l1102:	
;CheckTouchKey.c: 285: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	286
;CheckTouchKey.c: 286: while(!(KEYCON0&0x80));
	
l273:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u131
	goto	u130
u131:
	goto	l273
u130:
	line	287
	
l1104:	
;CheckTouchKey.c: 287: TKdata[13] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+01Ah
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+01Ah
	line	288
	
l1106:	
;CheckTouchKey.c: 288: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	292
	
l1108:	
;CheckTouchKey.c: 292: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	293
	
l1110:	
;CheckTouchKey.c: 293: KEYCON1 = 0x40|0x10|0x0E;
	movlw	low(05Eh)
	movwf	(274)^0100h	;volatile
	line	294
	
l1112:	
;CheckTouchKey.c: 294: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	295
# 295 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	296
# 296 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	297
# 297 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	298
# 298 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	299
# 299 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	300
# 300 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	301
# 301 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	302
# 302 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	303
# 303 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	304
	
l1114:	
;CheckTouchKey.c: 304: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	305
;CheckTouchKey.c: 305: while(!(KEYCON0&0x80));
	
l276:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u141
	goto	u140
u141:
	goto	l276
u140:
	line	306
	
l1116:	
;CheckTouchKey.c: 306: TKdata[14] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+01Ch
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+01Ch
	line	307
	
l1118:	
;CheckTouchKey.c: 307: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	311
	
l1120:	
;CheckTouchKey.c: 311: KEYCON0 = 0x02;
	movlw	low(02h)
	movwf	(273)^0100h	;volatile
	line	312
	
l1122:	
;CheckTouchKey.c: 312: KEYCON1 = 0x40|0x10|0x0F;
	movlw	low(05Fh)
	movwf	(274)^0100h	;volatile
	line	313
	
l1124:	
;CheckTouchKey.c: 313: KEYCON2 = 0x80|0X10|0X08|0X00|0X01|0X01;
	movlw	low(099h)
	movwf	(275)^0100h	;volatile
	line	314
# 314 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	315
# 315 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	316
# 316 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	317
# 317 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	318
# 318 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	319
# 319 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	320
# 320 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	321
# 321 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	322
# 322 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text7
	line	323
	
l1126:	
;CheckTouchKey.c: 323: KEYCON0 |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(273)^0100h+(0/8),(0)&7	;volatile
	line	324
;CheckTouchKey.c: 324: while(!(KEYCON0&0x80));
	
l279:	
	btfss	(273)^0100h,(7)&7	;volatile
	goto	u151
	goto	u150
u151:
	goto	l279
u150:
	line	325
	
l1128:	
;CheckTouchKey.c: 325: TKdata[15] = ((KEYDATAH<<8) + KEYDATAL);
	movf	(279)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_TKdata)+01Eh
	bsf	status, 6	;RP1=1, select bank2
	movf	(278)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_TKdata)+01Eh
	line	326
	
l1130:	
;CheckTouchKey.c: 326: KEYCON0 = 0x00;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(273)^0100h	;volatile
	line	331
	
l282:	
	return
	opt stack 0
GLOBAL	__end_of_Key_Test
	__end_of_Key_Test:
	signat	_Key_Test,90
	global	_I2C_WriteStop

;; *************** function _I2C_WriteStop *****************
;; Defined at:
;;		line 600 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_WaitMoment
;; This function is called by:
;;		_CheckTouchKey_F
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	600
global __ptext8
__ptext8:	;psect for function _I2C_WriteStop
psect	text8
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	600
	global	__size_of_I2C_WriteStop
	__size_of_I2C_WriteStop	equ	__end_of_I2C_WriteStop-_I2C_WriteStop
	
_I2C_WriteStop:	
;incstack = 0
	opt	stack 3
; Regs used in _I2C_WriteStop: [status,2+status,0+pclath+cstack]
	line	602
	
l1170:	
;CheckTouchKey.c: 602: I2C_SDA_IO = 0;
	bcf	(2093/8)^0100h,(2093)&7	;volatile
	line	603
;CheckTouchKey.c: 603: I2C_SCL_IO = 0;
	bcf	(2092/8)^0100h,(2092)&7	;volatile
	line	604
	
l1172:	
;CheckTouchKey.c: 604: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	606
	
l1174:	
;CheckTouchKey.c: 606: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	607
	
l1176:	
;CheckTouchKey.c: 607: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	608
;CheckTouchKey.c: 608: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	609
	
l1178:	
;CheckTouchKey.c: 609: RC5 = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	line	611
;CheckTouchKey.c: 611: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	612
	
l1180:	
;CheckTouchKey.c: 612: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	613
;CheckTouchKey.c: 613: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	614
	
l295:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WriteStop
	__end_of_I2C_WriteStop:
	signat	_I2C_WriteStop,89
	global	_I2C_WriteStart

;; *************** function _I2C_WriteStart *****************
;; Defined at:
;;		line 583 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/200
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_WaitMoment
;; This function is called by:
;;		_CheckTouchKey_F
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	583
global __ptext9
__ptext9:	;psect for function _I2C_WriteStart
psect	text9
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	583
	global	__size_of_I2C_WriteStart
	__size_of_I2C_WriteStart	equ	__end_of_I2C_WriteStart-_I2C_WriteStart
	
_I2C_WriteStart:	
;incstack = 0
	opt	stack 3
; Regs used in _I2C_WriteStart: [status,2+status,0+pclath+cstack]
	line	585
	
l1134:	
;CheckTouchKey.c: 585: I2C_SDA_IO = 0;
	bcf	(2093/8)^0100h,(2093)&7	;volatile
	line	586
;CheckTouchKey.c: 586: I2C_SCL_IO = 0;
	bcf	(2092/8)^0100h,(2092)&7	;volatile
	line	587
	
l1136:	
;CheckTouchKey.c: 587: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	589
	
l1138:	
;CheckTouchKey.c: 589: RC5 = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	line	590
	
l1140:	
;CheckTouchKey.c: 590: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	591
;CheckTouchKey.c: 591: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	592
	
l1142:	
;CheckTouchKey.c: 592: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	line	594
;CheckTouchKey.c: 594: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	595
	
l1144:	
;CheckTouchKey.c: 595: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	596
;CheckTouchKey.c: 596: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	597
	
l292:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WriteStart
	__end_of_I2C_WriteStart:
	signat	_I2C_WriteStart,89
	global	_I2C_Write1bYTE

;; *************** function _I2C_Write1bYTE *****************
;; Defined at:
;;		line 622 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/200
;;		On exit  : 300/200
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_WaitMoment
;; This function is called by:
;;		_CheckTouchKey_F
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	622
global __ptext10
__ptext10:	;psect for function _I2C_Write1bYTE
psect	text10
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	622
	global	__size_of_I2C_Write1bYTE
	__size_of_I2C_Write1bYTE	equ	__end_of_I2C_Write1bYTE-_I2C_Write1bYTE
	
_I2C_Write1bYTE:	
;incstack = 0
	opt	stack 3
; Regs used in _I2C_Write1bYTE: [wreg+status,2+status,0+pclath+cstack]
;I2C_Write1bYTE@data stored from wreg
	movwf	(I2C_Write1bYTE@data)
	line	624
	
l1146:	
;CheckTouchKey.c: 624: unsigned char i = 8;
	movlw	low(08h)
	movwf	(I2C_Write1bYTE@i)
	line	625
	
l1148:	
;CheckTouchKey.c: 625: I2C_SDA_IO = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2093/8)^0100h,(2093)&7	;volatile
	line	626
	
l1150:	
;CheckTouchKey.c: 626: I2C_SCL_IO = 0;
	bcf	(2092/8)^0100h,(2092)&7	;volatile
	line	629
	
l1152:	
;CheckTouchKey.c: 628: {
;CheckTouchKey.c: 629: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	630
	
l1154:	
;CheckTouchKey.c: 630: if(data&0x80)
	btfss	(I2C_Write1bYTE@data),(7)&7
	goto	u161
	goto	u160
u161:
	goto	l299
u160:
	line	631
	
l1156:	
;CheckTouchKey.c: 631: RC5 = 1;
	bsf	(2101/8)^0100h,(2101)&7	;volatile
	goto	l300
	line	632
	
l299:	
	line	633
;CheckTouchKey.c: 632: else
;CheckTouchKey.c: 633: RC5 = 0;
	bcf	(2101/8)^0100h,(2101)&7	;volatile
	
l300:	
	line	635
;CheckTouchKey.c: 635: RC4 = 1;
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	636
;CheckTouchKey.c: 636: data <<= 1;
	clrc
	rlf	(I2C_Write1bYTE@data),f
	line	638
;CheckTouchKey.c: 637: }
;CheckTouchKey.c: 638: while(--i);
	decfsz	(I2C_Write1bYTE@i),f
	goto	u171
	goto	u170
u171:
	goto	l1152
u170:
	
l301:	
	line	639
;CheckTouchKey.c: 639: RC4 = 0;
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	641
;CheckTouchKey.c: 641: I2C_SDA_IO = 1;
	bsf	(2093/8)^0100h,(2093)&7	;volatile
	line	643
	
l1158:	
;CheckTouchKey.c: 643: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	644
	
l1160:	
;CheckTouchKey.c: 644: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2100/8)^0100h,(2100)&7	;volatile
	line	645
;CheckTouchKey.c: 645: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	647
	
l1162:	
	line	648
	
l1164:	
;CheckTouchKey.c: 648: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2100/8)^0100h,(2100)&7	;volatile
	line	649
	
l1166:	
;CheckTouchKey.c: 649: I2C_SDA_IO = 0;
	bcf	(2093/8)^0100h,(2093)&7	;volatile
	line	651
	
l302:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write1bYTE
	__end_of_I2C_Write1bYTE:
	signat	_I2C_Write1bYTE,4217
	global	_I2C_WaitMoment

;; *************** function _I2C_WaitMoment *****************
;; Defined at:
;;		line 695 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/200
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
;;		_I2C_WriteStart
;;		_I2C_WriteStop
;;		_I2C_Write1bYTE
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	695
global __ptext11
__ptext11:	;psect for function _I2C_WaitMoment
psect	text11
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
	line	695
	global	__size_of_I2C_WaitMoment
	__size_of_I2C_WaitMoment	equ	__end_of_I2C_WaitMoment-_I2C_WaitMoment
	
_I2C_WaitMoment:	
;incstack = 0
	opt	stack 3
; Regs used in _I2C_WaitMoment: []
	line	697
	
l954:	
# 697 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
	line	698
# 698 "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\CheckTouchKey.c"
nop ;# 
psect	text11
	line	699
	
l317:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WaitMoment
	__end_of_I2C_WaitMoment:
	signat	_I2C_WaitMoment,89
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 83 in file "H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
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
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	83
global __ptext12
__ptext12:	;psect for function _Isr_Timer
psect	text12
	file	"H:\MyDownloads\说明书&测试报告\开发包\SC8F096开发包\SC8F096_TOUCH_TOOL\main.c"
	line	83
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
;incstack = 0
	opt	stack 3
; Regs used in _Isr_Timer: [wreg+status,2+status,0]
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
psect	text12
	line	85
	
i1l1446:	
;main.c: 85: if(TMR2IE==1&&TMR2IF==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(113/8),(113)&7	;volatile
	goto	u21_21
	goto	u21_20
u21_21:
	goto	i1l1454
u21_20:
	
i1l1448:	
	btfss	(105/8),(105)&7	;volatile
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l1454
u22_20:
	line	87
	
i1l1450:	
;main.c: 86: {
;main.c: 87: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	88
	
i1l1452:	
;main.c: 88: MainTime++;
	incf	(_MainTime),f	;volatile
	skipnz
	incf	(_MainTime+1),f	;volatile
	line	89
;main.c: 89: }
	goto	i1l570
	line	93
	
i1l1454:	
;main.c: 91: else
;main.c: 92: {
;main.c: 93: INTCON &= 0xC0;
	movlw	low(0C0h)
	andwf	(11),f	;volatile
	line	94
	
i1l1456:	
;main.c: 94: PIR1 = 0;
	clrf	(13)	;volatile
	line	97
	
i1l570:	
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
