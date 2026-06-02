/*-------------------------------------------
  L1211 12槽充电器 - LED控制模块
  功能: LED状态更新、闪烁处理、上电自检序列
  LED IO1(红): RC5, 与NTC共用, 分时复用
  LED IO2(绿): RC4
  显示规则:
    红灯亮 = 充电中(DETECT/ACTIVATE/PRECHARGE/CC/CV)
    绿灯亮 = 充满(FULL)
    红灯闪 = 错误(ERROR)
    LED灭  = 空闲(IDLE)
  上电自检: Phase0=全亮1s, Phase1=保持1s, Phase2=正常
-------------------------------------------*/
#include "config.h"

/*========================================================================
  函数: Update_LED_Slot
  功能: 根据槽位充电状态更新LED显示
  参数: idx - 槽位索引(0~11)
  说明: 每个槽位扫描Phase1时调用一次
  LED映射:
    CHG_IDLE          -> LED_OFF       (灭)
    CHG_DETECT        -> LED_RED_ON    (红灯亮, 检测中)
    CHG_ACTIVATE      -> LED_RED_ON    (红灯亮, 激活中)
    CHG_PRECHARGE     -> LED_RED_ON    (红灯亮, 预充中)
    CHG_CC_CHARGE     -> LED_RED_ON    (红灯亮, 恒流充电)
    CHG_CV_CHARGE     -> LED_RED_ON    (红灯亮, 恒压充电)
    CHG_FULL          -> LED_GREEN_ON  (绿灯亮, 充满)
    CHG_ERROR         -> LED_RED_FLASH (红灯闪, 错误)
========================================================================*/
void Update_LED_Slot(unsigned char idx)
{
	BatterySlot_t *p = GSLOT(idx);

	switch(p->state)
	{
	case CHG_IDLE:
		p->ledState = LED_OFF;          /* 空闲: LED关闭 */
		break;
	case CHG_DETECT:                    /* 检测中 */
	case CHG_ACTIVATE:                  /* 激活中 */
	case CHG_PRECHARGE:                 /* 预充中 */
	case CHG_CC_CHARGE:                 /* 恒流充电 */
	case CHG_CV_CHARGE:                 /* 恒压充电 */
		p->ledState = LED_RED_ON;       /* 红灯常亮: 充电中 */
		break;
	case CHG_FULL:
		p->ledState = LED_GREEN_ON;     /* 绿灯常亮: 充满 */
		break;
	case CHG_ERROR:
		p->ledState = LED_RED_FLASH;    /* 红灯闪烁: 错误 */
		break;
	default:
		p->ledState = LED_OFF;          /* 其他: LED关闭 */
		break;
	}
}

/*========================================================================
  函数: Led_BlinkProcess
  功能: LED闪烁计时处理
  说明: 每轮扫描(槽位0的Phase2)调用一次, 处理所有槽位的闪烁
  闪烁逻辑: 每0.5s切换一次闪烁相位(blinkPhase 0/1交替)
  实际LED驱动: 在Charging_Control中根据ledState和blinkPhase控制IO
  - 红灯闪烁: blinkPhase=0时亮, blinkPhase=1时灭(0.5Hz)
========================================================================*/
void Led_BlinkProcess(void)
{
	unsigned char i;
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		/* 仅处理红灯闪烁状态的槽位 */
		if(GSLOT(i)->ledState == LED_RED_FLASH)
		{
			GSLOT(i)->blinkTimer++;     /* 闪烁计时器累加 */
			/* 每0.5秒切换一次闪烁相位 */
			if(GSLOT(i)->blinkTimer >= (TICK_PER_SEC / 2))
			{
				GSLOT(i)->blinkTimer = 0;
				GSLOT(i)->blinkPhase ^= 1;  /* 0/1交替 */
			}
		}
	}
}

/*========================================================================
  函数: PowerOnLedSequence
  功能: 上电LED自检序列
  说明: 系统上电后执行, 测试LED是否正常
  流程:
    Phase0: 全亮1s(LED IO1=1, LED IO2=1), 红灯和绿灯同时亮
    Phase1: 保持1s(继续全亮)
    Phase2: 关闭LED, 进入正常工作模式
  目的: 检测LED是否正常, 同时给用户视觉反馈系统已启动
========================================================================*/
void PowerOnLedSequence(void)
{
	g_powerOnTimer++;                    /* 自检计时器累加 */

	if(g_powerOnPhase == 0)
	{
		/* Phase 0: 全亮1秒 */
		PIN_LED_IO1 = 1;                /* 红灯亮 */
		PIN_LED_IO2 = 1;                /* 绿灯亮 */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 1;         /* 进入Phase 1 */
		}
	}
	else if(g_powerOnPhase == 1)
	{
		/* Phase 1: 保持全亮1秒 */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 2;         /* 进入Phase 2 */
			PIN_LED_IO1 = 0;            /* 关闭LED */
			PIN_LED_IO2 = 0;
		}
	}
	/* Phase 2: 自检完成, 进入正常扫描 */
}