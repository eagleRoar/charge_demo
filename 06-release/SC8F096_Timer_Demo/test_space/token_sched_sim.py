#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
V57W 检测链令牌调度 离线仿真
=============================
验证对象: charge_mgr.c 中 Slot_Charge_Ctrl() / CCCV_Control() 的
          "检测链令牌"(g_detectOwner) 调度规则 + DETECT窄带重置上限
          + 上电静默窗(A) + 插入沿门控(B), 不涉及任何判定阈值。

[A] 不变量验证(压缩tick, 快): 把 C 的调度骨架逐条翻译为 Python 离散时间
    仿真, 多场景跑 tick, 断言 6 条不变量:
      I1 无越权持有: 令牌持有者必处于检测链状态
      I2 检测互斥:   同一 tick 至多一个槽在推进检测链
      I3 隔离完备:   有槽在跑检测链(未冻结)时, 其余槽必须无充电电流
      I4 无死锁:     单槽单次入链的"非冻结推进"tick 数有界
      I5 重置有界:   窄带重置次数不超过 NARROW_RST_MAX
      I6 插入沿:     被令牌看门狗强制回IDLE的槽, 在重新观测为空槽
                     (重新武装)前不得再次进入检测链
    另以 single_point=False 跑同一场景(等价 V57T 缺陷态: 令牌仅在
    IDLE→DETECT 申请, 4 条重判入链路径不申请), 要求必须报出违规
    —— 确认仿真能捕获该缺陷。
    [A4] 为窄带重置活锁反向对照: narrow_rst_max=None(无上限=V57U活锁态)
    必须被 I4 捕获; narrow_rst_max=3(V57V)必须 0 违规。
    [A5] 上电静默窗(A)验证: 静默窗内令牌须始终FREE且12槽均被采样;
    boot_settle=0(无窗)时首tick即 owner!=FREE —— 反向对照。
    [A6] 插入沿(B)验证: 看门狗强制回IDLE的槽, edge_gate=False(关闭B)
    必须被 I6 捕获, edge_gate=True(开启B)必须 0 违规。

[B] 令牌占用率量化(真实tick量级): 用 config.h 的真实 tick 常量跑长时间,
    统计"检测链占用tick / 总tick", 即充电被暂停的时间占比
    (串行化的必然代价), 并给出插电池检测延迟。
    注: [B] 的 tick秒换算成立的前提是 charge_ticks 严格等于真实经过的
    10ms 数(即 V57V 取消 min-1-tick 下限后的行为); V57U 及更早版本在
    令牌冻结环境下 tick 相对真实时间放快 2~5 倍, 该换算不成立。

说明(重要):
  - 仅仿真"谁在何时持令牌、谁被冻结/是否有电流", 不复现 ADC/判定阈值细节。
  - 空槽按 C L517 路径处理: IMP_CHECK 阶段双值≥4050即判空槽→IDLE(不进DIODE)。

运行: python token_sched_sim.py
"""

# ---------------- 状态 / 类型 ----------------
IDLE, DETECT, IMP, DIODE, CC, CV, FULL, ERROR = "IDLE", "DETECT", "IMP", "DIODE", "CC", "CV", "FULL", "ERROR"
CHAIN = (DETECT, IMP, DIODE)                 # 检测链三态(C: DETECT/IMP_CHECK/IMP_DIODE_TEST)
GATE_ON = (DETECT, IMP, CC, CV)              # C L1280-1290: 这些状态门极ON

EMPTY, DRY, LI_ION, LINEAR_LI = "EMPTY", "DRY", "LI_ION", "LINEAR_LI"
RST_LOOP = "RST_LOOP"     # 采样值持续落在DETECT窄带→反复命中重置门禁的槽(见[A4])
FREE = 0xFF
NARROW_RST_MAX = 3        # 对齐 charge_mgr.c NARROW_RST_MAX

# ---------------- [A] 压缩tick量级(只验调度正确性) ----------------
T_FAST = dict(IDLE_POLL=5, DETECT=8, IMP=1, DIODE=8, CC=12, CV=15,
              FULL=10, ERR=6, MAX_CHAIN=64, MAX_REJUDGE=2)

# ---------------- [B] 真实tick量级(10ms/tick, 取自 config.h) ----------------
T_REAL = dict(IDLE_POLL=2400,   # IDLE_POLL_TICKS  : 空槽轮询停留 24s
              DETECT=240,       # TIME_DETECT_WAIT : 2.4s (空槽/高压锂电路径)
              IMP=5,            # IMP_PULSE_TICKS  : 50ms
              DIODE=240,        # DIODE_TEST_TICKS : 2.4s
              CC=1600,          # CC_LINEAR_LI_TICKS: 16s无进展超时
              CV=8000, FULL=12000, ERR=600,
              MAX_CHAIN=20000, MAX_REJUDGE=2)


class Sim:
    """12槽调度仿真: owner 等价 g_detectOwner(FREE=空闲)"""

    def __init__(self, types, states=None, single_point=True, timing=None,
                 narrow_rst_max=NARROW_RST_MAX, boot_settle=0,
                 edge_gate=True, owner_timeout=None):
        self.single_point = single_point   # True=V57U单点判定, False=V57T仅IDLE申请
        self.narrow_rst_max = narrow_rst_max  # None=无上限(V57U活锁态)
        self.boot_settle = boot_settle     # [A] 上电静默窗长度(tick), 0=关闭
        self.edge_gate = edge_gate         # [B] 插入沿门控开关, False=等价未加B
        self.owner_timeout = owner_timeout # 令牌看门狗阈值(tick), None=不建模
        self.T = dict(timing or T_FAST)
        self.typ = list(types)
        self.state = list(states) if states else [IDLE] * 12
        self.ct = [0] * 12
        self.nrst = [0] * 12           # 本次入链的窄带重置次数(C: g_narrowRstCnt)
        self.gate = [False] * 12
        self.pchain = [0] * 12         # 本次入链的"非冻结推进"tick计数
        self.owner = FREE
        self.rejudge = [0] * 12
        self.done = [False] * 12       # 是否已完成一次归类
        self.boot = boot_settle        # [A] 静默窗剩余tick
        self.armed = 0x0FFF            # [B] 插入沿武装掩码(C: g_slotOpen), 上电全武装
        self.sampled = [False] * 12    # [A] 是否已在静默窗内被采样过
        self.forced = [False] * 12     # [I6] 是否被看门狗强制回IDLE且尚未重新武装
        self.viol = []
        self.t = 0
        self.busy = 0                  # 令牌被占用的tick数(=充电暂停tick数)

    def bad(self, tag, msg):
        if len(self.viol) <= 8:
            self.viol.append("t=%d [%s] %s" % (self.t, tag, msg))

    def owner_name(self):
        return "FREE" if self.owner == FREE else "B%d" % (self.owner + 1)

    # ---------- I1: 令牌持有者必须处于检测链状态 ----------
    def _check_owner(self):
        if self.owner != FREE and self.state[self.owner] not in CHAIN:
            self.bad("I1", "令牌持有者B%d状态=%s(非检测链) → 令牌泄漏"
                     % (self.owner + 1, self.state[self.owner]))

    # ---------- 单 tick: 复刻 main() 的 for(i=0;i<12;i++) Slot_Charge_Ctrl(i) ----------
    def step(self):
        self.t += 1
        T = self.T

        if self.boot > 0:
            self.boot -= 1                 # [A] 上电静默窗递减(对齐 main.c)

        for idx in range(12):
            s = self.state[idx]

            # [C L215] 冻结分支: 有令牌且非本槽 → 门极关断 + 不推进状态机/不采样
            if self.owner != FREE and self.owner != idx:
                self.gate[idx] = False
                continue

            # [V57U 单点判定] 处于检测链即持有 → 本槽在链状态时必须已持令牌
            # (上一tick的switch后单点判定已申请; 未持有即为隔离失效)
            if s in CHAIN and self.owner != idx:
                self.bad("I3", "槽B%d处于%s但未持令牌(owner=%s) → 检测期环境污染"
                         % (idx + 1, s, self.owner_name()))

            if s in CHAIN:
                self.pchain[idx] += 1          # I4: 非冻结推进计数
                if self.pchain[idx] > T["MAX_CHAIN"]:
                    self.bad("I4", "槽B%d入链已推进%d tick未退出 → 疑似死锁"
                             % (idx + 1, self.pchain[idx]))
            else:
                self.pchain[idx] = 0

            self.ct[idx] += 1
            self._run(idx)

            # [看门狗] 检测链驻留超时→强制回IDLE. 注意不重新武装(armed保持0),
            # 故B(edge_gate)会挡住它立刻重入链 —— 这正是[I6]要验证的.
            if (self.owner_timeout is not None and self.state[idx] in CHAIN
                    and self.pchain[idx] >= self.owner_timeout):
                self.state[idx] = IDLE
                self.ct[idx] = 0
                self.pchain[idx] = 0
                self.forced[idx] = True

            # [C L1268-1280] 令牌单点判定: 处于检测链即持有, 离开检测链即释放
            if self.single_point:
                if self.state[idx] in CHAIN:
                    self.owner = idx
                elif self.owner == idx:
                    self.owner = FREE
            elif self.owner == idx and self.state[idx] not in CHAIN:
                self.owner = FREE          # V57T态: 仅出链释放

            # [C L1280-1290] 门极
            self.gate[idx] = self.state[idx] in GATE_ON

            # I1: 每槽处理完毕后令牌必须一致
            # (固件里状态只能由本状态机改, 令牌判定紧跟switch; 故每槽处理完毕
            #  即为真实一致性边界。压力测试的外部拔插是绕过状态机的模拟,
            #  只能在此边界校验, 否则会误报"tick间隙"的假泄漏)
            self._check_owner()

        if self.owner != FREE:
            self.busy += 1

        self._check_tick()

    # ---------- 单槽状态机(语义对齐 C) ----------
    def _run(self, idx):
        s, ct, T = self.state[idx], self.ct[idx], self.T

        if s == IDLE:
            # [A] 上电静默窗(C L278): 窗口内保持IDLE只采样不入链, 12槽基线得以建立
            if self.boot > 0:
                self.ct[idx] = 0
                self.sampled[idx] = True
                return
            # C L253-264: 空槽需轮询停留IDLE_POLL; 有电池(slot_v<OPEN)转DETECT
            if self.typ[idx] == EMPTY:
                if self.edge_gate:
                    self.armed |= 1 << idx        # [B] 观测为空槽 → 武装插入沿
                if ct < T["IDLE_POLL"]:
                    return
            else:
                # [B] 插入沿门控: 仅"曾观测为空槽"的槽转有电池才允许入链(申请令牌)
                if self.edge_gate and not (self.armed & (1 << idx)):
                    return
                if self.edge_gate:
                    self.armed &= ~(1 << idx)     # 消费本次插入沿
            if self.owner != FREE and self.owner != idx:
                self.bad("I2", "槽B%d在令牌被%s占用时入链" % (idx + 1, self.owner_name()))
            self.ct[idx] = 0
            self.state[idx] = DETECT
            self.pchain[idx] = 0
            self.nrst[idx] = 0
            if not self.single_point:
                self.owner = idx                  # V57T: 仅此处(C L264)申请令牌
            return

        if s == DETECT:
            # 窄带重置活锁模型(C L334-352): 采样值持续落在(NIMH_MAX,OPEN)
            # 且无capFlag时固件把进度清零重读. RST_LOOP槽即此类.
            # narrow_rst_max=None 等价"无上限"= V57U 活锁形态(重置→清capFlag
            # →再重置), 进度永远到不了出链tick → 令牌被永久占用.
            if self.typ[idx] == RST_LOOP and ct >= T["DETECT"]:
                if self.narrow_rst_max is None or self.nrst[idx] < self.narrow_rst_max:
                    self.nrst[idx] += 1
                    self.ct[idx] = 0
                    return
            if ct < T["DETECT"]:
                return
            self.ct[idx] = 0
            self.state[idx] = IMP
            return

        if s == IMP:
            if ct < T["IMP"]:
                return
            self.ct[idx] = 0
            if self.typ[idx] == EMPTY:
                self.state[idx] = IDLE       # C L517: 空槽/拔出(双值≥4050) → IDLE
                self.done[idx] = True
            else:
                self.state[idx] = DIODE
            return

        if s == DIODE:
            if ct < T["DIODE"]:
                return
            self.ct[idx] = 0
            if self.typ[idx] == DRY:
                self.state[idx] = ERROR
            elif self.typ[idx] == LI_ION:
                self.state[idx] = CV
            else:
                self.state[idx] = CC
            self.done[idx] = True
            return

        if s == CC:
            if ct < T["CC"]:
                return
            self.ct[idx] = 0
            if self.typ[idx] == LINEAR_LI:
                # C L947: LINEAR_LI CC无进展超时 → 回DETECT重判(重判入链路径)
                if self.rejudge[idx] < T["MAX_REJUDGE"]:
                    self.rejudge[idx] += 1
                    self.state[idx] = DETECT
                    self.pchain[idx] = 0
                else:
                    self.state[idx] = ERROR
            else:
                self.state[idx] = CV
            return

        if s == CV:
            if ct < T["CV"]:
                return
            self.ct[idx] = 0
            self.state[idx] = FULL
            self.done[idx] = True
            return

        if s == FULL:
            if ct < T["FULL"]:
                return
            self.ct[idx] = 0
            self.state[idx] = IDLE             # 拔出/补电循环 → 回IDLE(可再插入)
            if self.edge_gate:
                self.armed |= 1 << idx         # C L1202: 回IDLE前已确认读出OPEN → 重新武装
                self.forced[idx] = False
            return

        if s == ERROR:
            if ct < T["ERR"]:
                return
            self.ct[idx] = 0
            # C L1249-1256: ERROR重判 → DETECT(重判入链路径)
            if self.typ[idx] == LINEAR_LI and self.rejudge[idx] < T["MAX_REJUDGE"]:
                self.rejudge[idx] += 1
                self.state[idx] = DETECT
                self.pchain[idx] = 0
            else:
                self.done[idx] = True
            return

    # ---------- 每 tick 安全断言 ----------
    def _check_tick(self):
        # I5: 窄带重置次数不得超过上限(上限存在时). 与I4(入链推进tick有界)
        #     共同覆盖"重置→清capFlag→再重置"自锁: 无上限时I4必报,
        #     有上限时必须始终≤上限且最终离开检测链.
        if self.narrow_rst_max is not None:
            for i in range(12):
                if self.nrst[i] > self.narrow_rst_max:
                    self.bad("I5", "槽B%d窄带重置%d次超上限%d"
                             % (i + 1, self.nrst[i], self.narrow_rst_max))

        # 未冻结的检测态槽 = 本 tick 真正在推进检测链的槽
        active = [i for i in range(12)
                  if self.state[i] in CHAIN and not (self.owner != FREE and self.owner != i)]

        # I2: 至多一个槽在推进检测链
        if len(active) > 1:
            self.bad("I2", "同时有%d个槽在推进检测链: %s"
                     % (len(active), [i + 1 for i in active]))

        # I3(隔离): 有槽在跑检测链时, 其余槽必须无充电电流
        #   电流 = 门极ON 且 占空比>0; 有令牌时占空比只按令牌槽算(C L1343-1348)
        if self.owner != FREE:
            ostate = self.state[self.owner]
            pwm = 0 if ostate in (DETECT, DIODE) else 1   # DETECT/DIODE→PWM=0, IMP→脉冲
        else:
            pwm = 1                                       # 无令牌: 正常输出
        if active and pwm > 0:
            charging = [i + 1 for i in range(12)
                        if self.gate[i] and i not in active]
            if charging:
                self.bad("I3", "槽%s在跑检测链, 但槽%s仍在充电(隔离失效)"
                         % ([i + 1 for i in active], charging))

        # I6: 被看门狗强制回IDLE的槽, 在重新观测为空槽(重新武装)前不得再入链
        for i in range(12):
            if self.forced[i] and self.state[i] in CHAIN:
                self.bad("I6", "槽B%d被看门狗强制回IDLE后未观测为空槽即重入链"
                         % (i + 1))

    def all_done(self):
        return all(self.done)


# ---------------- 场景 ----------------
MIX = [DRY, DRY, DRY, LINEAR_LI, LI_ION, LINEAR_LI,
       DRY, LINEAR_LI, LI_ION, LINEAR_LI, LINEAR_LI, LI_ION]


def mix_with_reentry():
    """含"重判入链"起点的初态: B7=ERROR(ERROR重判), B10=CC(CC超时)"""
    st = [IDLE] * 12
    st[6] = ERROR
    st[9] = CC
    return st


def run(name, types, states=None, ticks=1500, single_point=True,
        narrow_rst_max=NARROW_RST_MAX, boot_settle=0, edge_gate=True,
        owner_timeout=None):
    sim = Sim(types, states, single_point, narrow_rst_max=narrow_rst_max,
              boot_settle=boot_settle, edge_gate=edge_gate,
              owner_timeout=owner_timeout)
    first_all_done = None
    for _ in range(ticks):
        sim.step()
        if first_all_done is None and sim.all_done():
            first_all_done = sim.t
    print("  %-26s %-10s 全归类@t=%-6s" %
          (name, "OK" if not sim.viol else "违规%d条" % len(sim.viol),
           first_all_done if first_all_done else "未完成"))
    for v in sim.viol:
        print("      " + v)
    return sim


def duty_test(k_empty, ticks=40000):
    """真实tick量级: k个空槽 + (12-k)个已在CV充电的槽, 统计令牌占用率
    (40000 tick = 400s = 6.7min, 覆盖多个空槽轮询周期)"""
    types = [EMPTY] * k_empty + [LI_ION] * (12 - k_empty)
    states = [IDLE] * k_empty + [CV] * (12 - k_empty)
    T = dict(T_REAL)
    T["CV"] = ticks * 10        # 充电槽不参与链, 等价"一直在CV"
    sim = Sim(types, states, timing=T)
    for _ in range(ticks):
        sim.step()
    return sim


def main():
    bad = 0
    print("=" * 76)
    print("V57W 检测链令牌调度离线仿真  (single_point=True = 当前代码)")
    print("=" * 76)

    print("\n[A1] 调度不变量: 场景验证(要求 0 违规)")
    for nm, ty, st in [
        ("S1 12槽全空",            [EMPTY] * 12,     None),
        ("S2 满载12颗混合",         MIX,              None),
        ("S3 含CC超时/ERROR重判",   MIX,              mix_with_reentry()),
        ("S4 全为线性锂(反复重判)",  [LINEAR_LI] * 12, None),
    ]:
        if run(nm, ty, st).viol:
            bad += 1

    print("\n[A2] 调度不变量: 随机拔插压力(20 seeds × 300 tick, 要求 0 违规)")
    import random
    rnd_bad = 0
    for seed in range(20):
        rnd = random.Random(seed)
        ty = [EMPTY] * 12
        for i in range(12):
            if rnd.random() < 0.5:
                ty[i] = rnd.choice([DRY, LI_ION, LINEAR_LI])
        sim = Sim(ty, [IDLE] * 12)
        for _ in range(300):
            sim.step()
            for i in range(12):
                r = rnd.random()
                if r < 0.004:                       # 拔出 → 空槽
                    sim.typ[i], sim.state[i], sim.ct[i] = EMPTY, IDLE, 0
                    sim.gate[i], sim.done[i] = False, False
                elif r < 0.008:                     # 插入
                    sim.typ[i], sim.state[i], sim.ct[i] = rnd.choice([DRY, LI_ION, LINEAR_LI]), IDLE, 0
        if sim.viol:
            rnd_bad += 1
            print("  seed=%-3d 违规%d条: %s" % (seed, len(sim.viol), sim.viol[0]))
    if rnd_bad == 0:
        print("  20 seeds 全部通过")
    else:
        bad += 1

    print("\n[A3] 反向对照(single_point=False = V57T缺陷态, 要求必须报违规)")
    s = run("V57T态: 重判不持令牌", MIX, mix_with_reentry(), single_point=False)
    if s.viol:
        print("    -> 已捕获缺陷(证明仿真有效), 首次违规: %s" % s.viol[0])
    else:
        print("    -> 未捕获缺陷! 仿真灵敏度不足")
        bad += 1

    print("\n[A4] 反向对照: DETECT窄带重置活锁(要求 无上限必报 / 有上限不报)")
    s = run("V57U态: 重置无上限→永久驻留", [RST_LOOP] + [EMPTY] * 11, None,
            ticks=200, narrow_rst_max=None)
    if s.viol:
        print("    -> 已捕获活锁(证明仿真有效), 首次违规: %s" % s.viol[0])
    else:
        print("    -> 未捕获活锁! 仿真灵敏度不足")
        bad += 1
    s = run("V57V: 重置上限%d→正常出链" % NARROW_RST_MAX,
            [RST_LOOP] + [EMPTY] * 11, None, ticks=600)
    if s.viol:
        bad += 1

    print("\n[A5] 上电静默窗(A): 窗口内令牌FREE且12槽均被采样")
    BOOT = 30
    s = Sim(MIX, [IDLE] * 12, boot_settle=BOOT)
    for _ in range(BOOT):
        s.step()
        if s.boot > 0 and s.owner != FREE and len(s.viol) == 0:
            s.bad("A5", "静默窗内 t=%d 令牌已被B%d占用" % (s.t, s.owner + 1))
    miss = [i + 1 for i in range(12) if not s.sampled[i]]
    if miss:
        s.bad("A5", "静默窗内未采样的槽: %s" % miss)
    print("  %-30s %-10s" % ("静默窗%d tick内采样12槽" % BOOT,
                              "OK" if not s.viol else "违规%d条" % len(s.viol)))
    for v in s.viol:
        print("      " + v)
    if s.viol:
        bad += 1
    s0 = Sim(MIX, [IDLE] * 12, boot_settle=0)
    s0.step()
    print("  %-30s %-10s" % ("反向: 无静默窗→首tick即持令牌",
                              "OK" if s0.owner != FREE else "未复现! 对照无效"))
    if s0.owner == FREE:
        bad += 1

    print("\n[A6] 插入沿(B): 看门狗强制回IDLE后不得未武装重入链")
    t6 = dict(T_FAST)
    t6["MAX_CHAIN"] = 100000            # 关掉I4噪声, 只观察I6
    for gate, exp in ((True, "B开: 强制后需拔插(应0违规)"),
                      (False, "B关: 应立刻重抢(须被I6捕获)")):
        s = Sim([RST_LOOP] + [EMPTY] * 11, [IDLE] * 12, timing=t6,
                narrow_rst_max=NARROW_RST_MAX, owner_timeout=20, edge_gate=gate)
        for _ in range(300):
            s.step()
        print("  %-30s %-10s" % (exp, "违规%d条" % len(s.viol) if s.viol else "OK"))
        for v in s.viol[:2]:
            print("      " + v)
        if gate and s.viol:
            bad += 1
        if not gate and not s.viol:
            print("      -> 未捕获! 仿真灵敏度不足")
            bad += 1

    print("\n[B] 真实tick量级: 串行化对充电的占用(串行化代价量化)")
    print("    空槽数 | 令牌占用率(充电暂停) | 充电占空比 | 单次空槽链占用")
    for k in (1, 4, 8, 11, 12):
        sim = duty_test(k)
        pct = 100.0 * sim.busy / sim.t
        chain_s = (T_REAL["DETECT"] + T_REAL["IMP"]) * 0.01
        print("    %2d槽   |        %5.1f%%        |    %5.1f%%   |    %.2fs"
              % (k, pct, 100 - pct, chain_s))
        if sim.viol:
            bad += 1
            print("      违规: %s" % sim.viol[0])

    print("\n" + "=" * 76)
    print("结论: %s" % ("全部通过" if bad == 0 else "存在 %d 项未通过" % bad))
    print("=" * 76)
    return 0 if bad == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
