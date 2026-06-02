/*-------------------------------------------
  L1211 12槽充电器 - ADC驱动模块
  功能: ADC初始化、单次采样(去极值平均)、通道读取
  ADC特性: 12位分辨率, 参考电压VDD=5V, 右对齐
  采样算法: 采集10次, 去掉最大值和最小值, 对剩余8次取平均
  注: 采样结果存放在全局变量adresult中
-------------------------------------------*/
#include "config.h"

/*========================================================================
  全局变量
========================================================================*/
volatile unsigned int adresult;      /* ADC采样结果(去极值平均后的值, 0~4095) */
volatile unsigned char test_adc;     /* ADC采样状态: 0xA5=成功, 其他=失败 */

/*========================================================================
  函数: AD_Init
  功能: ADC模块初始化
  配置: 通道AN0, ADC使能, 时钟Fosc/8, 右对齐, 参考电压VDD
========================================================================*/
void AD_Init(void)
{
	CC0CON = 0;             /* 关闭比较器0 */
	CC1CON = 0;             /* 关闭比较器1 */
	ADCON0 = 0X41;          /* AN0通道, ADC使能, 时钟Fosc/8 */
	ADCON1 = 0;             /* 右对齐, 参考电压=VDD */
}

/*========================================================================
  函数: ADC_Sample
  功能: ADC单通道采样(去极值平均算法)
  参数:
    adch  - ADC通道号(0~31), bit4=1表示高通道
    adldo - LDO配置(用于高通道时使能内部LDO)
  返回: 0xA5=采样成功, 其他=失败
  算法:
    1. 采集10次ADC数据
    2. 记录最大值和最小值
    3. 总和去掉最大值和最小值(去极值), 剩余8个取平均
    4. 结果存入adresult
  说明: 去极值平均可以有效滤除偶发噪声干扰
========================================================================*/
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo)
{
	volatile unsigned long adsum = 0;    /* ADC累加和 */
	volatile unsigned int admin = 0;     /* 最小值 */
	volatile unsigned int admax = 0;     /* 最大值 */
	volatile unsigned int ad_temp = 0;   /* 临时值 */

	/* 高通道(bit4=1)需要使能内部LDO */
	if ((!LDO_EN) && (adldo & 0x04))
	{
		ADCON1 = adldo;
		__delay_us(100);    /* 等待LDO稳定 */
	}
	else
		ADCON1 = adldo;

	/* 处理高通道标志(bit4) */
	if(adch & 0x10)
	{
		CHS4 = 1;           /* 使能高通道选择 */
		adch &= 0x0f;       /* 去掉bit4, 取低4位通道号 */
	}
	else
		CHS4 = 0;

	unsigned char i = 0;
	/* 采集10次, 去掉最高和最低值, 取平均 */
	for (i = 0; i < 10; i++)
	{
		/* 设置ADC通道并启动转换 */
		ADCON0 = (unsigned char)(0X41 | (adch << 2));
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
		GODONE = 1;                     /* 启动ADC转换 */

		/* 等待转换完成, 超时保护 */
		unsigned char j = 0;
		while (GODONE)
		{
			__delay_us(2);
			if (0 == (--j))             /* 超时返回0 */
				return 0;
		}

		/* 读取12位ADC结果: ADRESH高8位 + ADRESL高4位 */
		ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));

		/* 第一次采集: 初始化最大值和最小值 */
		if (0 == admax)
		{
			admax = ad_temp;
			admin = ad_temp;
		}
		/* 更新最大值 */
		else if (ad_temp > admax)
			admax = ad_temp;
		/* 更新最小值 */
		else if (ad_temp < admin)
			admin = ad_temp;

		adsum += ad_temp;               /* 累加 */
	}

	/* 去掉最大值和最小值, 取平均(除以8) */
	adsum -= admax;
	if (adsum >= admin)
		adsum -= admin;
	else
		adsum = 0;

	adresult = adsum >> 3;              /* 除以8 = 右移3位 */

	/* 清理变量 */
	adsum = 0;
	admin = 0;
	admax = 0;
	return 0xA5;                        /* 返回成功标志 */
}

/*========================================================================
  函数: ADC_ReadChannel
  功能: 读取指定ADC通道的采样值
  参数: ch - ADC通道号(0~31)
  返回: 采样结果(0~4095), 失败返回0
  说明: 封装ADC_Sample, 简化调用接口
========================================================================*/
unsigned int ADC_ReadChannel(unsigned char ch)
{
	test_adc = ADC_Sample(ch, 7);       /* 使用LDO=7采样 */
	if (0xA5 == test_adc)
		return adresult;                /* 成功: 返回采样结果 */

	/* 失败: 复位ADC模块 */
	ADCON0 = 0;
	ADCON1 = 0;
	__delay_us(100);
	return 0;
}