/*-------------------------------------------
  L1211 12槽充电器 - LED控制模块 (V2.3原理图适配版)
  功能: 全局双色LED状态显示、红灯闪烁、上电自检序列
  硬件: V2.3中12槽LED红/绿脚各自共用全局网络, 由两个P沟道MOSFET总控:
    PIN_LED_IO1(RC5) → Q11(AO3401, S=VCC1) → 红灯全局网络 (低有效: 0=亮)
    PIN_LED_IO2(RC4) → Q8 (AO3401, S=VCC2) → 绿灯全局网络 (低有效: 0=亮)
  显示规则(全局, 优先级从高到低):
    1. 任何槽ERROR      → 红灯闪烁, 绿灯灭
    2. 任何槽"有电池且在检测/充电中" → 红灯常亮, 绿灯灭
    3. 全部已满(无错误/无充电中) → 绿灯常亮
    4. 全部空闲(无电池) → 全灭
  上电自检: Phase0=全红1s → Phase1=全绿1s → Phase2=正常显示
  注: s_ledBlinkCnt作红灯闪烁节拍(1字节)

  V58O LED缺陷修复:
    ①闪烁时间基准: 原按"主循环轮数"计数, 而TICK_PER_SEC是10ms节拍数(=100),
      实测单轮仅3~6ms → 实际周期≈0.15~0.3s(3~7Hz快闪), 且随轮速漂移
      (UART打印阻塞的0.65s长轮会改变轮速, 关掉UART后频率又变) → 现改为按
      g_elapsedTicks(真实10ms节拍)累加, 与状态机计时同一基准, 与轮速解耦.
    ②空槽误点亮红灯: 空槽轮询也会进DETECT, 原判据把检测态一律算"充电中" →
      12个空槽时几乎总有一个在DETECT → 红灯常亮, 违反"全部空闲→全灭".
      现仅当该槽有电池(S_VOLT < ADC_V_OPEN)时才计为"忙".
    ③上电自检期间主循环不再驱动LED(main.c加 g_powerOnPhase>=2 门控),
      自检与正常显示不再争抢同一对引脚.
  -------------------------------------------*/
  #include "config.h"

  /* 红灯闪烁半周期(10ms节拍数): TICK_PER_SEC/4 = 25节拍 = 0.25s → 周期0.5s(2Hz),
    亮0.25s/灭0.25s. 若要1s周期(亮0.5s/灭0.5s)改为 (TICK_PER_SEC/2).
    ⚠ 单位必须是"10ms节拍", 不是"主循环轮数"(见上方缺陷①) */
  #define LED_BLINK_HALF      (TICK_PER_SEC / 4)

  static unsigned char s_ledBlinkCnt = 0;   /* 红灯闪烁累积节拍数(仅主循环访问) */

  /*========================================================================
   函数: Update_LED_Global
   功能: 全局LED状态显示(每轮调用一次, 统计12槽状态后驱动IO)
   说明: V2.3无单槽独立LED, 12槽共用红/绿总线, 只能全局显示
         自检期间(前2秒)本函数不被调用, 引脚由ISR的PowerOnLedSequence独占
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
  {
  hasErr = 1;
  }
  else if(s != CHG_IDLE && s != CHG_FULL)
  {
  /* (V58O缺陷②)只有"确实有电池"的槽才算忙: 空槽也会走
  IDLE→DETECT→IMP_CHECK→IDLE 轮询(空槽读数≈VCC_norm≈4247≥OPEN),
  若把空槽检测态也算"充电中", 12个空槽时几乎总有一个在DETECT
  → 红灯常亮, 违反"全部空闲→全灭".
  ⚠ 空槽读数偶发跌落(实测2692~2905)时会短暂点亮红灯, 属可接受毛刺 */
  if(S_VOLT(i) < ADC_V_OPEN)
  hasChg = 1;      /* 有电池: DETECT/ACTIVATE/PRECHARGE/CC/CV/IMP/DIODE */
  }
  else if(s == CHG_FULL)
  {
  hasFull = 1;
  }
  }

  if(hasErr)
  {
  /* 优先级1: 错误 → 红灯闪烁, 绿灯灭
  (V58O缺陷①)按真实10ms节拍累加: g_elapsedTicks=本轮实际经过的节拍数 */
  PIN_LED_IO2 = 1;
  s_ledBlinkCnt = (unsigned char)(s_ledBlinkCnt + g_elapsedTicks);
  if(s_ledBlinkCnt >= LED_BLINK_HALF)
  s_ledBlinkCnt = 0;
  PIN_LED_IO1 = (s_ledBlinkCnt < (LED_BLINK_HALF / 2)) ? 0 : 1;
  }
  else
  {
  s_ledBlinkCnt = 0;   /* 非错误态复位闪烁相位: 下次进入错误态必从"亮"开始 */

  if(hasChg)
  {
  /* 优先级2: 有电池在检测/充电中 → 红灯常亮, 绿灯灭 */
  PIN_LED_IO1 = 0;
  PIN_LED_IO2 = 1;
  }
  else if(hasFull)
  {
  /* 优先级3: 全部已满(无错误/无充电中) → 绿灯常亮
  ⚠ 现行判据: 任一槽FULL且无错误/充电中即亮绿(允许混有空槽);
  若规格要求"12槽全满才亮绿", 需另加满槽计数判据 */
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
  }

/*========================================================================
  函数: PowerOnLedSequence
  功能: 上电LED自检序列(ISR中g_powerOnPhase<3时每125us调用一次)
  流程(V58P诊断版, 三段各3秒, 共9秒):
    Phase0 = 仅红3s → Phase1 = 红+绿同亮3s → Phase2 = 仅绿3s
    → Phase3 = 正常显示(Update_LED_Global接管)
  目的: 定位/确认LED显示. 生产版应改回两段各1秒(把 3U 改成 1U).
  注: 低有效, 0=亮
  ⚠ 相位总数必须与 main.c 中三处门限(g_powerOnPhase < 3U / >= 3U)一致,
     否则 Update_LED_Global 会因相位到不了3而永不执行(LED被冻结).
========================================================================*/
void PowerOnLedSequence(void)
{
	/* g_powerOnTimer已由ISR按10ms显式节拍递增, 此处不再自增 */

	if(g_powerOnPhase == 0)
	{
		/* (V58P诊断)Phase 0: 仅红3秒(原1秒) 便于目视与万用表实测RC5 */
		PIN_LED_IO1 = 0;    /* 红灯亮 */
		PIN_LED_IO2 = 1;    /* 绿灯灭 */
		if(g_powerOnTimer >= (TICK_PER_SEC * 3U))
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 1;
		}
	}
	else if(g_powerOnPhase == 1)
	{
		/* (V58P诊断)Phase 1: 红+绿同时亮3秒(原为"仅绿1秒")
		   判定绿灯逻辑通路: 与Phase0视觉一样(只红) ⇒ 绿灯没被点亮;
		                     明显更亮/偏黄 ⇒ 绿灯正常 */
		PIN_LED_IO1 = 0;
		PIN_LED_IO2 = 0;
		if(g_powerOnTimer >= (TICK_PER_SEC * 3U))
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 2;
		}
	}
	else if(g_powerOnPhase == 2)
	{
		/* (V58P诊断)Phase 2: 仅绿3秒 —— 即原设计"绿灯1秒"的图案, 拉长到3秒确认 */
		PIN_LED_IO1 = 1;    /* 红灯灭 */
		PIN_LED_IO2 = 0;    /* 绿灯亮 */
		if(g_powerOnTimer >= (TICK_PER_SEC * 3U))
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 3;         /* 自检完成, 进入正常显示 */
		}
	}
	/* Phase 3: 由Update_LED_Global按槽状态驱动 */
}
