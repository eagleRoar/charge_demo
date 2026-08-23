/*-------------------------------------------
  L1211 12槽充电器 - LED控制模块 (V2.3原理图适配版)
  功能: 全局双色LED状态显示、红灯闪烁、上电自检序列
  硬件: V2.3中12槽LED红/绿脚各自共用全局网络, 由两个P沟道MOSFET总控:
    PIN_LED_IO1(RC5) → Q11(AO3401, S=VCC1) → 红灯全局网络 (低有效: 0=亮)
    PIN_LED_IO2(RC4) → Q8 (AO3401, S=VCC2) → 绿灯全局网络 (低有效: 0=亮)
  显示规则(全局, 优先级从高到低):
    1. 任何槽ERROR      → 红灯闪烁, 绿灯灭
    2. 任何槽充电中      → 红灯常亮, 绿灯灭
    3. 全部已满(无错误/充电中) → 绿灯常亮
    4. 全部空闲(无电池) → 全灭
  上电自检: Phase0=全红1s → Phase1=全绿1s → Phase2=正常显示
  注: 新增1字节静态变量s_ledBlinkCnt作红灯闪烁节拍(每轮扫描+1)
-------------------------------------------*/
#include "config.h"

/* 红灯闪烁半周期(扫描轮数): TICK_PER_SEC≈1秒扫描轮数, 半周期0.5s */
#define LED_BLINK_HALF      (TICK_PER_SEC / 2)

static volatile unsigned char s_ledBlinkCnt = 0;   /* 红灯闪烁节拍计数 */

/*========================================================================
  函数: Update_LED_Global
  功能: 全局LED状态显示(每轮调用一次, 统计12槽状态后驱动IO)
  说明: V2.3无单槽独立LED, 12槽共用红/绿总线, 只能全局显示
========================================================================*/
void Update_LED_Global(void)
{
	unsigned char i;
	unsigned char hasErr = 0;
	unsigned char hasChg = 0;
	unsigned char hasFull = 0;

	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		unsigned char s = S_STATE(i);
		if(s == CHG_ERROR)
			hasErr = 1;
		else if(s != CHG_IDLE && s != CHG_FULL)
			hasChg = 1;          /* DETECT/ACTIVATE/PRECHARGE/CC/CV/IMP/DIODE */
		else if(s == CHG_FULL)
			hasFull = 1;
	}

	if(hasErr)
	{
		/* 优先级1: 错误 → 红灯闪烁, 绿灯灭 */
		PIN_LED_IO2 = 1;
		if(++s_ledBlinkCnt >= LED_BLINK_HALF)
			s_ledBlinkCnt = 0;
		PIN_LED_IO1 = (s_ledBlinkCnt < (LED_BLINK_HALF / 2)) ? 0 : 1;
	}
	else if(hasChg)
	{
		/* 优先级2: 有充电中 → 红灯常亮, 绿灯灭 */
		PIN_LED_IO1 = 0;
		PIN_LED_IO2 = 1;
	}
	else if(hasFull)
	{
		/* 优先级3: 全部已满(无错误/无充电中) → 绿灯常亮 */
		PIN_LED_IO1 = 1;
		PIN_LED_IO2 = 0;
	}
	else
	{
		/* 优先级4: 全部空闲 → 全灭 */
		PIN_LED_IO1 = 1;
		PIN_LED_IO2 = 1;
	}
}

/*========================================================================
  函数: PowerOnLedSequence
  功能: 上电LED自检序列(ISR中g_powerOnPhase<2时每125us调用一次)
  流程:
    Phase0: 全红1秒 → Phase1: 全绿1秒 → Phase2: 正常显示(Update_LED_Global接管)
  注: 低有效, 0=亮
========================================================================*/
void PowerOnLedSequence(void)
{
	g_powerOnTimer++;

	if(g_powerOnPhase == 0)
	{
		/* Phase 0: 全红1秒 */
		PIN_LED_IO1 = 0;    /* 红灯亮 */
		PIN_LED_IO2 = 1;    /* 绿灯灭 */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 1;
		}
	}
	else if(g_powerOnPhase == 1)
	{
		/* Phase 1: 全绿1秒 */
		PIN_LED_IO1 = 1;    /* 红灯灭 */
		PIN_LED_IO2 = 0;    /* 绿灯亮 */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 2;         /* 自检完成, 进入正常显示 */
		}
	}
	/* Phase 2: 由Update_LED_Global按槽状态驱动 */
}
