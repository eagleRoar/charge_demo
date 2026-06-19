/*-------------------------------------------
  L1211 12槽充电器 - UART调试输出模块
  功能: 串口发送、状态打印(每秒一次)
  配置: 9600bps, 8N1, TX=RB3(与B3共用), RX=RB4
  输出格式:
    T:温度C VDD:电源电压mV
    B1:V=ADC值 S=状态 T=类型 [ERR/FULL/CHG]
    B2:V=... ...
    ... (共12路)
  注: 调试输出可通过UART_PRINT_EN宏开关控制
-------------------------------------------*/
#include "config.h"

#if UART_PRINT_EN

/*========================================================================
  函数: uart_send_char
  功能: 发送单个字符
  参数: c - 要发送的字符
  说明: 阻塞发送, 等待发送缓冲区空闲
========================================================================*/
void uart_send_char(unsigned char c)
{
	while(TRMT1 == 0);              /* 等待发送缓冲区空闲 */
	TXREG1 = c;                     /* 写入发送寄存器 */
}

/*========================================================================
  函数: uart_send_string
  功能: 发送字符串(以'\0'结尾)
  参数: str - 字符串指针
  说明: 逐个字符发送, 直到遇到'\0'
========================================================================*/
void uart_send_string(const unsigned char *str)
{
	while(*str != '\0')
		uart_send_char(*str++);     /* 逐字符发送 */
}

/*========================================================================
  函数: uart_send_number
  功能: 发送无符号整数的十进制字符串
  参数: num - 要发送的数字
  算法: 逐位取模转字符, 先存后逆序发送
  例如: num=123 -> buf=['3','2','1'] -> 发送"123"
========================================================================*/
void uart_send_number(unsigned int num)
{
	unsigned char buf[6];           /* 最大65535, 5位+1 */
	unsigned char i = 0;
	unsigned char j;

	/* 特殊处理: 0 */
	if(num == 0)
	{
		uart_send_char('0');
		return;
	}

	/* 逐位取模, 存入缓冲区(低位在前) */
	while(num > 0)
	{
		buf[i++] = '0' + (num % 10);  /* 数字转ASCII字符 */
		num /= 10;
	}

	/* 逆序发送(高位在前) */
	for(j = i; j > 0; j--)
		uart_send_char(buf[j-1]);
}

/*========================================================================
  函数: Print_Status
  功能: 打印系统状态(每秒一次)
  输出内容:
    温度: 当前温度摄氏度
    电源电压: VDD电源电压(mV)
    各槽位: B1~B12的电压/状态/类型/附加信息
  输出示例:
    T:25C VDD:5000mV
    B1:V=188 S=4 T=1 CHG
    B2:V=0   S=0 T=0
    B3:V=188 S=6 T=1 FULL
    B4:V=5   S=7 T=4 ERR
========================================================================*/
void Print_Status(void)
{
	unsigned char i;

	/* 打印温度和电源电压 */
	uart_send_string("T:");
	uart_send_number(g_temperature);
	uart_send_string("C NTC:");
	uart_send_number(g_ntcAdc);
	uart_send_string(" VDD:");
	uart_send_number(power_ad);
	uart_send_string("mV\r\n");

	/* 打印 NTC 调试信息 */
	uart_send_string("DBG: phase=");
	uart_send_number(g_tempPhase);
	uart_send_string(" settle=");
	uart_send_number(g_tempSettleCnt);
	uart_send_string(" diag=");
	uart_send_number(g_ntcDiagAdc);
	uart_send_string(" vdd=");
	uart_send_number(g_ntcDiagVdd);
	uart_send_string(" chk=");
	uart_send_number(g_ntcDiagChk);
	uart_send_string(" isr=");
	uart_send_number(g_ntcDebugAdc);
	uart_send_string("\r\n");

	/* 打印12槽位状态 */
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		uart_send_string("B");
		uart_send_number(i + 1);          /* 槽位编号: B1~B12 */
		uart_send_string(":V=");
		uart_send_number(GSLOT(i)->voltage);  /* ADC电压值 */
		uart_send_string(" S=");
		uart_send_number(GSLOT(i)->state);    /* 充电状态 */
		uart_send_string(" T=");
		uart_send_number(GSLOT(i)->type);     /* 电池类型 */
		if(0 == i)
		{
			uart_send_string(" because : ");
			uart_send_number(global_test);
		}
		/* 附加状态信息 */
		if(GSLOT(i)->state == CHG_ERROR)
			uart_send_string(" ERR");      /* 错误 */
		else if(GSLOT(i)->state == CHG_FULL)
			uart_send_string(" FULL");     /* 充满 */
		else if(GSLOT(i)->state == CHG_CC_CHARGE || 
		        GSLOT(i)->state == CHG_CV_CHARGE)
			uart_send_string(" CHG");      /* 充电中 */

		uart_send_string("\r\n");
	}
}
#endif