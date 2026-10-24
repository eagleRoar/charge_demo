/*-------------------------------------------
  L1211 12槽充电器 - LED控制模块 (V2.3原理图适配版)
  功能: 全局双色LED状态显示、红灯闪烁、上电自检序列
  硬件(V2.3原理图 + 实测确认): 12槽LED红/绿管芯各自共用全局网络, 由两个P沟道
  MOSFET总控(低有效: 0=亮):
    PIN_LED_IO2(RC5) → LED_VCC1轨 → 绿灯全局网络
    PIN_LED_IO1(RC4) → LED_VCC2轨 → 红灯全局网络
  显示规则(全局, 优先级从高到低):
    1. 任何槽ERROR        → 红灯闪烁, 绿灯灭
    2. 任何槽真正充电中    → 红灯常亮, 绿灯灭
    3. 仅有槽处于检测链    → 绿轨常亮(复现V58W检测采样环境, 见Update_LED_Global)
    4. 有槽已满(FULL)      → 绿灯亮(周期熄灯做干净采样, 见下), 红灯灭
    5. 全部空闲(无电池)    → 全灭
  上电自检: Phase0=全绿1s → Phase1=全红1s → Phase2=正常显示
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

  /* FULL槽周期熄灯采样(见 Update_LED_Global): 点亮(下沉,不采样)/回稳(不下沉,不采样)
     /采样(不下沉,可采样) 三相位循环. 硬件约束决定"点亮绿灯"与"干净采样"必须分时:
     FULL时该槽MOSFET常关, 下沉点亮绿灯会把AD节点从~2937拉到~2732(<2800), 若同拍
     采样会被误判"欠压"触发FULL→CC补电. 物理上无法做到0%熄灭, 只能把熄灭期压到
     人眼几乎不可察觉的微闪: 点亮5s → 灭0.25s(回稳0.2s + 采样0.05s), 灭灯占比~4.8%.
     采样相位(节点已回稳且不下沉)才采样推进FULL状态机, 兼顾"绿灯近乎常亮"与"读数干净".
     ⚠ 相位单位同 LED_BLINK_HALF, 均为"10ms节拍" */
  #define FULL_LIT_TICKS      (TICK_PER_SEC * 5)          /* 点亮(下沉)5.0s(近乎常亮) */
  #define FULL_SETTLE_TICKS   (TICK_PER_SEC / 5)          /* 熄灭回稳0.2s(不采样) */
  #define FULL_SAMPLE_TICKS   (TICK_PER_SEC / 20)         /* 熄灭采样0.05s */
  #define FULL_CYCLE_TICKS    (FULL_LIT_TICKS + FULL_SETTLE_TICKS + FULL_SAMPLE_TICKS)
  static unsigned int s_fullTick = 0;       /* FULL槽周期计时(仅主循环访问) */

  /*========================================================================
   函数: Update_LED_Global
   功能: 全局LED状态显示(每轮调用一次, 统计12槽状态后驱动IO)
   说明: V2.3无单槽独立LED, 12颗绿管芯共LED_VCC1轨(RC5), 12颗红管芯共LED_VCC2轨
         (RC4); 颜色只能整轨开/关(全局色); "某槽亮不亮"由该槽AD脚是否下沉决定
         (ISR显示窗; 检测链槽不下沉; FULL槽在"点亮相位"下沉点亮、在"回稳/采样相位"
         不下沉以便主循环干净采样, 见 pass1.5/pass2 与 main.c).
         本函数只负责: ①按优先级选全局配色并驱动红/绿轨; ②输出
         "该点亮的槽"掩码(g_sinkMask)供ISR在显示窗内按槽下沉点灯.
         该槽自身下沉供流, 不依赖其它槽回流, 故12槽全为恒压锂时也能整排亮.
         自检期间(前2秒)本函数不被调用, 引脚由ISR的PowerOnLedSequence独占

   ⚠ 检测链采样环境约束(这是本函数的硬性设计点, 勿擅改):
     检测判据(DETECT/IMP_CHECK/DIODE_TEST)是在V58W的电气环境下标定的 —— V58W检测
     期间点亮的正是 LED_VCC1 轨(绿轨, RC5): 该轨经LED→5.1k向检测槽AD节点注入电流,
     把镍氢节点抬到≈1991, 于是IMP_CHECK入口的pre≈1815, 落在DIODE_PRE_DRY_MAX(1936)
     之下 → 走完判别链终判DRY/NiMH.
       · 若检测期改点红轨(RC4): 红灯管芯压降更低、注入电流更大 → pre被抬到≈2070,
         越过1936命中"低压锂电预充放行" → 镍氢被误判LINEAR_LI进CC;
       · 若检测期两轨全关: 节点回落到真实电池电压≈956, 低于ADC_V_NIMH_LOW(1015)
         → 被Detect_BatteryType直接判LI_ION进CC.
     因此检测链期间必须与V58W完全一致地"只点绿轨(RC5)、红轨关断、该槽不下沉";
     充电/报错才切到红轨(RC4)显示正确颜色. 其余逻辑(采样/判据/阈值)一律不动.
  ========================================================================*/
  void Update_LED_Global(void)
  {
  unsigned char i;
  unsigned char hasErr = 0;
  unsigned char hasChg = 0;
  unsigned char hasDet = 0;
  unsigned char hasFull = 0;
  unsigned int  mask = 0;
  unsigned int  fullBits = 0;   /* 处于FULL态的槽位掩码(点亮相位下沉点灯用) */

  /* pass1: 优先级判定(错误 > 充电中 > 检测链 > 全满 > 空闲) */
  for(i = 0; i < BATTERY_SLOTS; i++)
  {
  unsigned char s = S_STATE(i);
  if(s == CHG_ERROR)
  {
  hasErr = 1;
  }
  else if(s == CHG_ACTIVATE || s == CHG_PRECHARGE ||
          s == CHG_CC_CHARGE || s == CHG_CV_CHARGE)
  {
  /* 处于充电态即视为"忙", 不再用 S_VOLT<OPEN 过滤:
     ① 空槽永不进入充电态(只在 IDLE↔DETECT 轮询, 见上注释), 故对空槽无影响;
     ② 反例(本过滤的致命缺陷): 线性锂(无charger IC)在 CC/CV 阶段 BxAD 读数为
        伪OPEN(≥OPEN), 且 charge_mgr 的"伪OPEN消噪"会使其 g_slot.voltage 长期
        保持高位(≥OPEN) → 若再要求 S_VOLT<OPEN, 正在充电的线性锂被判"非充电中"
        → 红轨不切/该槽不进掩码 → 线性锂充电时无灯. 恒压锂读数<OPEN 故不受影响. */
  hasChg = 1;      /* 真正充电态: ACTIVATE/PRECHARGE/CC/CV */
  }
  else if(s == CHG_DETECT || s == CHG_IMP_CHECK || s == CHG_IMP_DIODE_TEST)
  {
  if(S_VOLT(i) < ADC_V_OPEN)
  hasDet = 1;      /* 检测链(有电池): 采样电气环境须复现V58W, 见上方说明 */
  }
  else if(s == CHG_FULL)
  {
  hasFull = 1;
  }
  }

  /* pass1.5: FULL槽周期熄灯采样相位(仅主循环访问; 按真实10ms节拍 g_elapsedTicks 推进)
     [0,LIT)          点亮相位: 下沉点灯, 不采样
     [LIT,LIT+SETTLE) 回稳相位: 不下沉(节点回稳), 不采样
     [LIT+SETTLE,CYCLE) 采样相位: 不下沉且已回稳, 允许主循环采样推进FULL状态机
     说明: 点亮绿LED必须下沉AD脚, 而下沉会把节点从~2937拉到~2732(<2800), 若同拍采样
     会误判"欠压"触发FULL→CC补电. 故把"点亮"与"采样"分时互斥(见 main.c 主循环避让). */
  if(hasFull)
  {
  for(i = 0; i < BATTERY_SLOTS; i++)
  {
  if(S_STATE(i) == CHG_FULL)
  fullBits |= (unsigned int)1 << i;
  }
  s_fullTick += g_elapsedTicks;
  if(s_fullTick >= FULL_CYCLE_TICKS)
  s_fullTick %= FULL_CYCLE_TICKS;
  if(s_fullTick < FULL_LIT_TICKS)
  {
  g_fullDark = 0;  g_fullSample = 0;   /* 点亮相位: 下沉, 不采样 */
  }
  else if(s_fullTick < (FULL_LIT_TICKS + FULL_SETTLE_TICKS))
  {
  g_fullDark = 1;  g_fullSample = 0;   /* 回稳相位: 不下沉, 不采样 */
  }
  else
  {
  g_fullDark = 1;  g_fullSample = 1;   /* 采样相位: 不下沉, 可采样 */
  }
  }
  else
  {
  s_fullTick = 0;
  g_fullDark = 0;  g_fullSample = 1;   /* 无FULL槽: 不干涉主循环采样 */
  }

  /* pass2: 生成下沉掩码(仅"该显示"的槽才下沉点灯)
     ⚠ 检测链(DETECT/IMP_CHECK/DIODE_TEST)的槽一律不下沉: V58W检测期间无下沉,
     下沉会周期拉低检测槽AD脚、压低采样读数. 故 hasDet 路径下 mask 恒为0. */
  if(hasErr)
  {
  for(i = 0; i < BATTERY_SLOTS; i++)
  {
  unsigned char s = S_STATE(i);
  if(s == CHG_ERROR || s == CHG_CC_CHARGE || s == CHG_CV_CHARGE)
  mask |= (unsigned int)1 << i;   /* 错误态: 错误槽 + CC/CV槽一起显示 */
  }
  }
  else if(hasChg)
  {
  for(i = 0; i < BATTERY_SLOTS; i++)
  {
  unsigned char s = S_STATE(i);
  if(s == CHG_CC_CHARGE || s == CHG_CV_CHARGE)
  mask |= (unsigned int)1 << i;   /* 充电中: 处于CC/CV的槽(含线性锂伪OPEN读数) */
  }
  }
  else if(hasFull)
  {
  /* FULL槽: 仅"点亮相位"下沉点亮绿灯(绿轨由pass3常开); 回稳/采样相位不下沉,
     使AD节点保持真实电平(~2937>2800), 供主循环干净采样. 见 pass1.5 与 main.c 避让. */
  if(!g_fullDark)
  mask = fullBits;
  }
  /* hasDet / 空闲: mask=0, 不开显示窗, 不下沉任何槽(与V58W一致).
     ⚠ 检测链的槽一律不下沉: 复现V58W检测采样环境(见函数头说明). */

  /* pass3: 驱动全局色轨(低有效) + 原子输出掩码给ISR
     g_sinkMask 是 16bit, 非原子写; ISR 读它时若恰好在主循环写的中间会读到撕裂值.
     用 T0IE(INTCON bit5) 关 Timer0 中断(只有它会读 g_sinkMask)后再写, 避免竞态. */
  {
  unsigned char sT0IE = INTCON & 0x20U;   /* 保存 T0IE */
  INTCON &= ~0x20U;                        /* 关 Timer0 中断 */
  if(hasErr)
  {
  /* 优先级1: 错误 → 红灯闪烁(按真实10ms节拍g_elapsedTicks累加), 绿灯灭 */
  s_ledBlinkCnt = (unsigned char)(s_ledBlinkCnt + g_elapsedTicks);
  if(s_ledBlinkCnt >= LED_BLINK_HALF)
  s_ledBlinkCnt = 0;
  if(s_ledBlinkCnt < (LED_BLINK_HALF / 2))
  {
  PIN_LED_IO1 = 0;  PIN_LED_IO2 = 1;   /* 红轨亮: 错误+CC/CV槽一起闪红 */
  g_sinkMask = mask;
  }
  else
  {
  PIN_LED_IO1 = 1;  PIN_LED_IO2 = 1;   /* 全灭(闪烁的暗半周) */
  g_sinkMask = 0;
  }
  }
  else if(hasChg)
  {
  /* 优先级2: 有槽真正充电 → 红轨常亮, 仅CC/CV槽下沉点亮 */
  s_ledBlinkCnt = 0;
  PIN_LED_IO1 = 0;  PIN_LED_IO2 = 1;
  g_sinkMask = mask;
  }
  else if(hasDet)
  {
  /* 优先级3: 仅检测链 → 复现V58W检测采样环境: 只点绿轨(RC5), 红轨关断, 不下沉.
     详见函数头"检测链采样环境约束": 点亮绿轨才能使镍氢pre≈1815落在判别链窗口内. */
  s_ledBlinkCnt = 0;
  PIN_LED_IO1 = 1;  PIN_LED_IO2 = 0;
  g_sinkMask = 0;
  }
  else if(hasFull)
  {
  /* 优先级4: 有FULL槽(无错误/无充电中) → 绿轨常亮. 点亮相位下沉该槽点灯,
     回稳/采样相位不下沉(见pass2); 采样相位读数干净不触发误补电 */
  s_ledBlinkCnt = 0;
  PIN_LED_IO1 = 1;  PIN_LED_IO2 = 0;
  g_sinkMask = mask;
  }
  else
  {
  /* 优先级5: 全部空闲 → 全灭(两轨关断, 掩码清空, 无任何槽下沉) */
  s_ledBlinkCnt = 0;
  PIN_LED_IO1 = 1;  PIN_LED_IO2 = 1;
  g_sinkMask = 0;
  }
  INTCON |= sT0IE;                         /* 恢复 Timer0 中断 */
  }
  }

/*========================================================================
  函数: PowerOnLedSequence
  功能: 上电LED自检序列(ISR中g_powerOnPhase<2时每125us调用一次)
  流程: Phase0 = 仅绿1s → Phase1 = 仅红1s → Phase2 = 正常显示
  可见性(原理图+实测确认): 空板同样可见, 无需插电池.
    灯回路: LED_VCCx(Q11/Q8低有效导通, 源=VCC) → 管芯 → R11(5.1k) → 槽节点Bn
            → 该槽采样分压的下臂(≈10K) → GND
    · 空板: 回流走分压下臂 ⇒ I ≈ (5.1-1.9)/(5.1k+10k) ≈ 210µA ⇒ 可见
    · 有电池: 回流走"电池+0.2R"(阻抗低得多) ⇒ 更亮
    ⚠ 硬性约束: 该槽MOSFET(AO3401, P沟道, 源=VCC)一旦导通, 会把Bn抬到VCC,
      LED两端压差≈0 ⇒ 该槽灯立即熄灭. 因此自检相位0/1期间必须保持12槽MOSFET
      全关(System_Init已把12个栅极置High=关). 切勿为"增亮"而打开槽MOSFET.
    ⚠ 推论: 正在充电/检测(其MOSFET为导通态)的槽, 自身那颗灯不亮; 且12槽灯是
      "全局色"(12颗红管芯共LED_VCC1/2), 并非逐槽独立显示.
  注: 低有效, 0=亮
  ⚠ 相位总数必须与 main.c 三处门限(g_powerOnPhase < 2U / >= 2U)一致,
     否则 Update_LED_Global 会因相位到不了2而永不执行(LED被冻结).
========================================================================*/
void PowerOnLedSequence(void)
{
	/* g_powerOnTimer已由ISR按10ms显式节拍递增, 此处不再自增 */

	if(g_powerOnPhase == 0)
	{
		/* Phase 0: 仅绿1秒: 点亮 LED_VCC1轨(RC5=绿灯) */
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
		/* Phase 1: 仅红1秒: 点亮 LED_VCC2轨(RC4=红灯) */
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
