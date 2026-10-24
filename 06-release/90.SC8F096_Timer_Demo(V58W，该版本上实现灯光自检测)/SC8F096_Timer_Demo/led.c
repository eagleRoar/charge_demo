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
  功能: 上电LED自检序列(ISR中g_powerOnPhase<2时每125us调用一次)
  流程(V58U): Phase0 = 仅绿1s → Phase1 = 仅红1s → Phase2 = 正常显示
  可见性(原理图+实测确认): 空板同样可见, 无需插电池.
    灯回路: LED_VCCx(Q11/Q8低有效导通, 源=VCC) → 管芯 → R11(5.1k) → 槽节点Bn
            → 该槽采样分压的下臂(≈10K) → GND
    · 空板: 回流走分压下臂 ⇒ I ≈ (5.1-1.9)/(5.1k+10k) ≈ 210µA ⇒ 可见
    · 有电池: 回流走"电池+0.2R"(阻抗低得多) ⇒ 更亮
    ⚠ 硬性约束: 该槽MOSFET(AO3401, P沟道, 源=VCC)一旦导通, 会把Bn抬到VCC,
      LED两端压差≈0 ⇒ 该槽灯立即熄灭. 因此自检相位0/1期间必须保持12槽MOSFET
      全关(System_Init已把12个栅极置High=关). 切勿为"增亮"而打开槽MOSFET ——
      V58T曾这样做, 结果空板全黑(自伤, 非硬件限制).
    ⚠ 推论: 正在充电/检测(其MOSFET为导通态)的槽, 自身那颗灯不亮; 只有MOSFET为
      关态的槽才亮. 且12槽灯是"全局色"(12颗红管芯共LED_VCC1, 12颗绿管芯共
      LED_VCC2), 并非逐槽独立显示.
  硬件(V2.3, 见原理图LED区):
    每槽1颗两脚双色LED(反并联红/绿管芯), 红端接全局轨LED_VCC1(经Q11, 栅=LED_IO1),
    绿端接LED_VCC2(经Q8, 栅=LED_IO2); 回路为
    LED_VCCx → R(n)5.1k → BxAD节点 → 该槽电池 → 该槽MOSFET → GND.
    ⇒ 颜色由全局轨决定, "亮不亮"由该槽是否导通决定:
       · 空槽/ERROR/FULL(门控关断) → 该槽灯恒灭
       · 自检图案只有在"插有电池且该槽导通"的槽上才看得到
         (例如B1插一节锂电: DETECT期间持令牌→MOSFET导通)
  ⚠ 因此LED自检/闪烁的验收必须"在指定槽插上电池"才有意义.
  注: 低有效, 0=亮; 相位时长3s(生产版可把 3U 改为 1U)
  ⚠ 相位总数必须与 main.c 三处门限(g_powerOnPhase < 2U / >= 2U)一致,
     否则 Update_LED_Global 会因相位到不了2而永不执行(LED被冻结).
========================================================================*/
void PowerOnLedSequence(void)
{
	/* g_powerOnTimer已由ISR按10ms显式节拍递增, 此处不再自增 */

	if(g_powerOnPhase == 0)
	{
		/* (V58R)Phase 0: 仅绿1秒(LED_VCC2经Q8上电)
		   顺序按现场实测要求: 先绿后红(此前代码是先红后绿, 属顺序不符) */
		PIN_LED_IO1 = 1;    /* 红灯灭 */
		PIN_LED_IO2 = 0;    /* 绿灯亮 */
		if(g_powerOnTimer >= TICK_PER_SEC)   /* 1秒(规格) */
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 1;
		}
	}
	else if(g_powerOnPhase == 1)
	{
		/* Phase 1: 仅红3秒(LED_VCC1经Q11上电) */
		PIN_LED_IO1 = 0;    /* 红灯亮 */
		PIN_LED_IO2 = 1;    /* 绿灯灭 */
		if(g_powerOnTimer >= TICK_PER_SEC)
		{
			g_powerOnTimer = 0;
			g_powerOnPhase = 2;         /* 自检完成, 进入正常显示(空盘→全灭) */
		}
	}
	/* Phase 2: 由Update_LED_Global按槽状态驱动 */
}
