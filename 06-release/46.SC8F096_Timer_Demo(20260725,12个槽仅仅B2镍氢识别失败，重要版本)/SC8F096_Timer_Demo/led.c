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
  功能: LED状态维护(当前仅保留接口, LED状态由g_slot[idx].state实时派生,
       不需要缓存g_ledState数组, 节省12B RAM)
  参数: idx - 槽位索引(0~11)
  说明: 每个槽位扫描Phase1时调用一次
  LED映射(供实际IO驱动参考):
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
	(void)idx;
	/* LED状态派生自g_slot[idx].state, 无需缓存数组
	   ERROR闪灯频率由全局g_blinkTick统一控制, 不再需要per-slot timer */
}

/*========================================================================
  函数: Led_BlinkProcess
  功能: LED闪烁计时处理(全局统一计数器)
  说明: 每轮扫描(槽位0的Phase2)调用一次
  闪烁逻辑: g_blinkTick递增, 溢出归零, 所有ERROR槽同步闪烁
  周期: TICK_PER_SEC ticks, 50%占空比
  - 红灯闪烁: g_blinkTick < TICK_PER_SEC/2 时亮, 否则灭
  相比原per-slot timer方案节省: g_blinkTimer[12](12B)+g_blinkPhase[12](12B)
  仅增加1B(g_blinkTick), 净省23B
========================================================================*/
void Led_BlinkProcess(void)
{
	g_blinkTick++;
	if(g_blinkTick >= TICK_PER_SEC)
		g_blinkTick = 0;
}

/*========================================================================
  函数: PowerOnLedSequence
  功能: MINIMAL TEST - 空跑计时2秒(不操作LED, 避免PORTC RMW干扰B1AD)
  说明: 前2秒ISR轻量(仅计数), 给主循环充足时间执行UART打印
  流程:
    Phase0: 等待1s → Phase1
    Phase1: 等待1s → Phase2(进入B1最小测试)
========================================================================*/
void PowerOnLedSequence(void)
{
	g_powerOnTimer++;

	if(g_powerOnPhase == 0)
	{
		/* Phase 0: 等待1秒, 不操作任何IO */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 1;
		}
	}
	else if(g_powerOnPhase == 1)
	{
		/* Phase 1: 等待1秒, 不操作任何IO */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 2;         /* 进入B1最小测试阶段 */
		}
	}
	/* Phase 2: 自检完成, 进入B1最小测试 */
}