/**********************************************************
12槽 ADC 采集测试 - 双参数线性标定
SC8F096, 16MHz, UART TX=RC4(J1-CLK), 9600bps
接线: J1-CLK(RC4) → USB-TTL模块RX, J1-GND → 模块GND
注意: 烧录完必须拔掉烧录器, 再接串口模块

标定点: ADC=3345→1.52V, ADC=3457→1.68V (万用表对照)
公式: V_BAT = (1159*V_B1AD - 647*VCC) / 1000
       α=1.159, β=0.647 (双参数线性拟合, 比叠加定理更吻合实测)
**********************************************************/
#pragma warning disable 752
#pragma warning disable 373
#include <sc.h>

#ifndef _XTAL_FREQ
#define _XTAL_FREQ 16000000
#endif

#define     POWER_RATIO      (4096UL*1.2*1000)
#define     SW_TX            RC4
#define     BIT_TIME         104     /* 9600bps */

/* 双参数线性标定: BAT = (α*V_B1AD - β*VCC), α=1.159, β=0.647 */
#define     ALPHA_NUM        1159UL   /* α * 1000 */
#define     BETA_NUM          647UL   /* β * 1000 */
#define     CAL_DEN           1000UL

volatile unsigned int adresult;
volatile unsigned char test_adc;

/* B1..B12对应的ADC通道号 (B1-B5已验证, B6-B12通过卡槽实测校正) */
const unsigned char bx_ch[12] = {
    17,  /* B1=AN17 (验证OK) */
    16,  /* B2=AN16 (验证OK) */
    12,  /* B3=AN12 (验证OK) */
    13,  /* B4=AN13 (验证OK) */
    5,   /* B5=AN5  (验证OK) */
    4,   /* B6=AN4  (实测: 物理B6→原显示B8) */
    28,  /* B7=AN28 (实测: 物理B7→原显示B9) */
    29,  /* B8=AN29 (实测: 物理B8→原显示B10) */
    27,  /* B9=AN27 (实测: 物理B9→原显示B11) */
    26,  /* B10=AN26(实测: 物理B10→原显示B12) */
    7,   /* B11=AN7 (实测: 物理B11→原显示B6) */
    6    /* B12=AN6 (实测: 物理B12→原显示B7) */
};

unsigned char ADC_Sample(unsigned char adch, unsigned char adldo);
void Init_System(void);
void sw_uart_init(void);
void uart_send_char(unsigned char c);
void uart_send_string(const unsigned char *str);
void uart_send_number(unsigned int num);

/*========================================================================
  ADC采样 - 参考官方代码模式: ADCON0循环内写入 + 100μs参考切换延时
  去极值平均: 34次采样, 去min/max后32次>>5平均
  adch: 通道号(0~31), adldo: bit2=1→LDO=3V, =0→VDD参考
  时钟: ADCS=10=Fosc/32, Tad=2μs@16MHz
  注: VDD→LDO参考切换需100μs延时, CHS4用位操作而非ADCON1|=0x40
========================================================================*/
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo)
{
    volatile unsigned long adsum = 0;
    volatile unsigned int admin = 0, admax = 0;
    volatile unsigned int ad_temp = 0;

    /* ADC参考电压从VDD切换到LDO时, 需要延时100us以上(官方参考代码注释) */
    if((!LDO_EN) && (adldo & 0x04))
    {
        ADCON1 = adldo;
        __delay_us(100);
    }
    else
        ADCON1 = adldo;

    /* CHS4位: AN16~AN31需要置1 */
    if(adch & 0x10)
    {
        CHS4 = 1;
        adch &= 0x0f;
    }
    else
        CHS4 = 0;

    unsigned char i;
    for(i = 0; i < 34; i++)
    {
        ADCON0 = (unsigned char)(0x81 | (adch << 2));  /* Fosc/32, Tad=2μs */
        __delay_us(5);           /* 采集时间5μs */
        GODONE = 1;              /* 启动转换 */

        unsigned char j = 0;
        while(GODONE)
        {
            __delay_us(2);
            if(0 == (--j)) return 0;
        }

        ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));  /* 12位AD值 */

        if(0 == admax)
        {
            admax = ad_temp;
            admin = ad_temp;
        }
        else if(ad_temp > admax)
            admax = ad_temp;
        else if(ad_temp < admin)
            admin = ad_temp;

        adsum += ad_temp;
    }

    adsum -= admax;
    if(adsum >= admin)
        adsum -= admin;
    else
        adsum = 0;

    adresult = adsum >> 5;       /* 32次平均 */
    return 0xA5;
}

/*========================================================================
  软件UART
========================================================================*/
void sw_uart_init(void)
{
    TRISC &= ~0x10;
    ANSEL2 &= ~0x10;
    SW_TX = 1;
}

void uart_send_char(unsigned char c)
{
    unsigned char i;
    GIE = 0;
    SW_TX = 0;
    __delay_us(BIT_TIME);
    for(i = 0; i < 8; i++)
    {
        if(c & 0x01) SW_TX = 1; else SW_TX = 0;
        __delay_us(BIT_TIME);
        c >>= 1;
    }
    SW_TX = 1;
    __delay_us(BIT_TIME);
    GIE = 1;
}

void uart_send_string(const unsigned char *str)
{
    while(*str) uart_send_char(*str++);
}

void uart_send_number(unsigned int num)
{
    unsigned char buf[6];
    unsigned char i = 0, j;
    if(num == 0) { uart_send_char('0'); return; }
    while(num > 0) { buf[i++] = '0' + (num % 10); num /= 10; }
    for(j = i; j > 0; j--) uart_send_char(buf[j-1]);
}

/*========================================================================
  main
========================================================================*/
void main(void)
{
    Init_System();
    sw_uart_init();

    ADCON0 = 0x41;

    /* ANSEL: 设为模拟输入的引脚
       AN4=RA4, AN5=RA5, AN6=RA6, AN7=RA7     → ANSEL0
       AN12=RB0, AN13=RB1                       → ANSEL1
       AN16=RC0(B2AD), AN17=RC1(B1AD)           → ANSEL2
       AN26=RD2, AN27=RD3                       → ANSEL3
       AN28=RD4, AN29=RD5                       → ANSEL3
       注意: RD2/RD3 同时是 B11/B8 MOSFET栅极, 也是 B10AD/B9AD ADC输入
             这里设为模拟输入后会覆盖输出状态, 需要后期处理 */
    ANSEL0 |= 0xF0;     /* AN4~7=RA4~7 */
    ANSEL1 |= 0x03;     /* AN12~13=RB0~1 */
    ANSEL2 |= 0x07;     /* AN16~17=RC0~1, AN18=RC2(NTC) */
    ANSEL3 |= 0x3C;     /* AN26~29=RD2~5 */

    uart_send_string("B1-B12 ADC Test\r\n");

    unsigned int tick = 0;
    unsigned int vcc_mv;
    unsigned char bx;

    /* VDD-only诊断: 全通道VDD参考, 排除LDO切换干扰 */
    unsigned int vdd_buf[12];

    while(1)
    {
        asm("clrwdt");
        __delay_ms(10);
        tick++;
        if(tick % 200 != 0) continue;  /* 2秒一次 */
        asm("clrwdt");

        /* === 诊断: 读取VCC === */
        vcc_mv = 5000;
        test_adc = ADC_Sample(31, 0);
        if(0xA5 == test_adc)
        {
            unsigned long pt = (unsigned long)(POWER_RATIO) / adresult;
            vcc_mv = (unsigned int)pt;
        }

        /* === 采集: B2(AN16)放最后读, 避免其电池影响后续通道 === */
        /* 先读B1, B3~B12(跳过B2) */
        ADC_Sample(17, 0);  vdd_buf[0] = adresult;   /* B1=AN17 */
        ADC_Sample(12, 0);  vdd_buf[2] = adresult;   /* B3=AN12 */
        ADC_Sample(13, 0);  vdd_buf[3] = adresult;   /* B4=AN13 */
        ADC_Sample(5, 0);   vdd_buf[4] = adresult;   /* B5=AN5 */
        ADC_Sample(4, 0);   vdd_buf[5] = adresult;   /* B6=AN4 */
        ADC_Sample(28, 0);  vdd_buf[6] = adresult;   /* B7=AN28 */
        ADC_Sample(29, 0);  vdd_buf[7] = adresult;   /* B8=AN29 */
        ADC_Sample(27, 0);  vdd_buf[8] = adresult;   /* B9=AN27 */
        ADC_Sample(26, 0);  vdd_buf[9] = adresult;   /* B10=AN26 */
        ADC_Sample(7, 0);   vdd_buf[10] = adresult;  /* B11=AN7 */
        ADC_Sample(6, 0);   vdd_buf[11] = adresult;  /* B12=AN6 */
        /* B2(AN16)最后读, 不影响任何其他通道 */
        asm("clrwdt");
        ADC_Sample(16, 0);
        vdd_buf[1] = adresult;

        /* === 第3步: 打印 B1~B6 第一行 === */
        for(bx = 0; bx < 6; bx++)
        {
            unsigned long bat_mv;
            unsigned int vx_mv;

            vx_mv = (unsigned long)vdd_buf[bx] * vcc_mv / 4096UL;
            if(vx_mv + 200U >= vcc_mv)
            {
                uart_send_string("B");
                uart_send_number(bx+1);
                uart_send_string("=");
                uart_send_number(vdd_buf[bx]);
                uart_send_string(" OPEN");
            }
            else
            {
                bat_mv = (ALPHA_NUM * vx_mv);
                if(bat_mv > (BETA_NUM * (unsigned long)vcc_mv))
                {
                    bat_mv = (bat_mv - BETA_NUM * (unsigned long)vcc_mv + CAL_DEN/2) / CAL_DEN;
                    uart_send_string("B");
                    uart_send_number(bx+1);
                    uart_send_string("=");
                    uart_send_number(vdd_buf[bx]);
                    uart_send_string(" BAT(");
                    uart_send_number((unsigned int)bat_mv);
                    uart_send_string("mV)");
                }
                else
                {
                    uart_send_string("B");
                    uart_send_number(bx+1);
                    uart_send_string("=");
                    uart_send_number(vdd_buf[bx]);
                    uart_send_string(" ???(");
                    uart_send_number((unsigned int)vx_mv);
                    uart_send_string("mV)");
                }
            }
            uart_send_string(" ");
        }
        uart_send_string("\r\n ");
        asm("clrwdt");

        /* === 第4步: 打印 B7~B12 第二行 === */
        for(bx = 6; bx < 12; bx++)
        {
            unsigned long bat_mv;
            unsigned int vx_mv;

            vx_mv = (unsigned long)vdd_buf[bx] * vcc_mv / 4096UL;
            if(vx_mv + 200U >= vcc_mv)
            {
                uart_send_string("B");
                uart_send_number(bx+1);
                uart_send_string("=");
                uart_send_number(vdd_buf[bx]);
                uart_send_string(" OPEN");
            }
            else
            {
                bat_mv = (ALPHA_NUM * vx_mv);
                if(bat_mv > (BETA_NUM * (unsigned long)vcc_mv))
                {
                    bat_mv = (bat_mv - BETA_NUM * (unsigned long)vcc_mv + CAL_DEN/2) / CAL_DEN;
                    uart_send_string("B");
                    uart_send_number(bx+1);
                    uart_send_string("=");
                    uart_send_number(vdd_buf[bx]);
                    uart_send_string(" BAT(");
                    uart_send_number((unsigned int)bat_mv);
                    uart_send_string("mV) ");
                }
                else
                {
                    uart_send_string("B");
                    uart_send_number(bx+1);
                    uart_send_string("=");
                    uart_send_number(vdd_buf[bx]);
                    uart_send_string(" ???(");
                    uart_send_number((unsigned int)vx_mv);
                    uart_send_string("mV) ");
                }
            }
            uart_send_string(" ");
        }

    print_ntc:
        /* NTC(AN18=RC2), VDD参考(温度公式基于5V分压设计) */
        test_adc = ADC_Sample(18, 0);
        if(0xA5 == test_adc)
        {
            unsigned int ntc_adc = adresult;

            uart_send_string(" NTC=");
            uart_send_number(ntc_adc);

            if(ntc_adc < 100)
            {
                uart_send_string(" T=SHORT");
            }
            else if(ntc_adc > 3996)
            {
                uart_send_string(" T=OPEN");
            }
            else
            {
                unsigned long rt = (unsigned long)ntc_adc * 10000UL / (4096UL - ntc_adc);
                unsigned int temp_x10;
                if(rt >= 10000UL)
                    temp_x10 = 250U - (unsigned int)((rt - 10000UL) * 10UL / 445UL);
                else
                    temp_x10 = 250U + (unsigned int)((10000UL - rt) * 10UL / 445UL);

                uart_send_string(" T=");
                uart_send_number(temp_x10 / 10);
                uart_send_string(".");
                uart_send_number(temp_x10 % 10);
                uart_send_string("C");
            }
        }

        uart_send_string("\r\n VCC=");
        uart_send_number(vcc_mv);
        uart_send_string("mV\r\n");

        asm("clrwdt");
    }
}

/*========================================================================
  系统初始化 - MOSFET栅极全部HIGH(关闭)
========================================================================*/
void Init_System(void)
{
    asm("nop");
    asm("clrwdt");
    OPTION_REG = 0x0F;
    asm("clrwdt");
    OSCCON = 0X70;

    WPUA = 0B00000000;
    WPUB = 0B00000000;
    WPUC = 0B00000000;
    WPUD = 0B00000000;

    /* MOSFET栅极全部HIGH(关闭)
       P沟道AO3401: Gate=High→关, Gate=Low→开
       RC2(AN18/NTC)设为模拟输入 */
    TRISA = 0xF0;  PORTA = 0x0F;
    TRISB = 0x30;  PORTB = 0x4F;
    TRISC = 0x07;  PORTC = 0x00;  /* RC2,RC1,RC0输入; RC2用于NTC */
    TRISD = 0xF0;  PORTD = 0x0F;

    CC0CON = 0;
    CC1CON = 0;

    PR2 = 249;
    TMR2IF = 0;
    TMR2IE = 1;
    T2CON = 0B00000100;
    INTCON = 0XC0;
}

void interrupt Isr_Timer(void)
{
    if(TMR2IF)
    {
        TMR2IF = 0;
    }
}
