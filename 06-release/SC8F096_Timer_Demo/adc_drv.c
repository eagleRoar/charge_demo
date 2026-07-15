/*-------------------------------------------
  L1211 12槽充电器 - ADC驱动模块
  功能: ADC初始化、单次采样(去极值平均)、通道读取
  ADC特性: 12位分辨率, 参考电压VDD=5V, 右对齐
  采样算法: 采集34次, 去掉最大值和最小值, 对剩余32次取平均
  时钟: Fosc/32, Tad=2μs@16MHz (09-test验证配置)
  注: 采样结果存放在全局变量adresult中
  移植自: 09-test/SC8F096_ADC_Demo/SC8F096_ADC.c
-------------------------------------------*/
#include "config.h"

/*========================================================================
  全局变量
========================================================================*/
volatile unsigned int adresult;      /* ADC采样结果(去极值平均后的值, 0~4095) */
volatile unsigned char test_adc;     /* ADC采样状态: ADC_OK=成功, 其他=失败 */

/*========================================================================
  函数: AD_Init
  功能: ADC模块初始化
  配置: 通道AN0, ADC使能, 时钟Fosc/32(Tad=2μs), 右对齐, 参考电压VDD
========================================================================*/
void AD_Init(void)
{
	CC0CON = 0;             /* 关闭比较器0 */
	CC1CON = 0;             /* 关闭比较器1 */
	ADCON0 = 0X81;          /* AN0通道, ADC使能, 时钟Fosc/32(Tad=2μs) */
	ADCON1 = 0;             /* 右对齐, 参考电压=VDD */
}

/*========================================================================
  函数: ADC_Sample
  功能: ADC单通道采样(去极值平均算法)
  参数:
    adch  - ADC通道号(0~31), bit4=1表示高通道(AN16~AN31)
    adldo - LDO配置(bit2=1→LDO=3V参考, =0→VDD参考)
  返回: ADC_OK=采样成功, 其他=失败
  算法:
    1. 采集34次ADC数据
    2. 记录最大值和最小值
    3. 总和去掉最大值和最小值(去极值), 剩余32个取平均(>>5)
    4. 结果存入adresult
  说明:
    - VDD→LDO参考切换需100μs延时
    - CHS4使用位操作(CHS4=1/0)而非ADCON1直接写
    - 每次转换前5μs采集延时确保S&H电容充满
    - 去极值平均可有效滤除偶发噪声干扰
========================================================================*/
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo)
{
	volatile unsigned long adsum = 0;    /* ADC累加和 */
	volatile unsigned int admin = 0;     /* 最小值 */
	volatile unsigned int admax = 0;     /* 最大值 */
	volatile unsigned int ad_temp = 0;   /* 临时值 */
	unsigned char i;

	/* VDD→LDO参考切换需100us延时(官方参考代码注释) */
	if((!LDO_EN) && (adldo & 0x04))
	{
		ADCON1 = adldo;
		__delay_us(100);
	}
	else
		ADCON1 = adldo;

	/* CHS4位操作: AN16~AN31需要置1, AN0~AN15需要清零 */
	if(adch & 0x10)
	{
		CHS4 = 1;
		adch &= 0x0f;
	}
	else
		CHS4 = 0;

	/* 采集34次, 去掉最高和最低值, 32次平均 */
	for(i = 0; i < 34; i++)
	{
		/* Fosc/32, Tad=2μs@16MHz */
		ADCON0 = (unsigned char)(0x81U | ((unsigned int)(adch) << 2));
		__delay_us(5);                  /* 采集时间5μs */
		GODONE = 1;                     /* 启动ADC转换 */

		/* 等待转换完成, 超时保护 */
		unsigned char j = 0;
		while(GODONE)
		{
			__delay_us(2);
			if(0 == (--j))              /* 超时返回0 */
				return 0;
		}

		/* 读取12位ADC结果: ADRESH高8位 + ADRESL高4位 */
		ad_temp = (unsigned int)((ADRESH << 4) + (ADRESL >> 4));

		/* 第一次采集: 初始化最大值和最小值 */
		if(0 == admax)
		{
			admax = ad_temp;
			admin = ad_temp;
		}
		/* 更新最大值 */
		else if(ad_temp > admax)
			admax = ad_temp;
		/* 更新最小值 */
		else if(ad_temp < admin)
			admin = ad_temp;

		adsum += ad_temp;               /* 累加 */
	}

	/* 去掉最大值和最小值, 取平均(除以32) */
	adsum -= admax;
	if(adsum >= admin)
		adsum -= admin;
	else
		adsum = 0;

	adresult = adsum >> 5;              /* 除以32 = 右移5位 */
	return ADC_OK;
}
