#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
V57U 检测链令牌调度 离线仿真
=============================
验证对象: charge_mgr.c 中 Slot_Charge_Ctrl() / CCCV_Control() 的
          "检测链令牌"(g_detectOwner) 调度规则, 不涉及任何判定阈值。

[A] 不变量验证(压缩tick, 快): 把 C 的调度骨架逐条翻译为 Python 离散时间
    仿真, 多场景跑 tick, 断言 4 条不变量:
      I1 无越权持有: 令牌持有者必处于检测链状态
      I2 检测互斥:   同一 tick 至多一个槽在推进检测链
      I3 隔离完备:   有槽在跑检测链(未冻结)时, 其余槽必须无充电电流
      I4 无死锁:     单槽单次入链的"非冻结推进"tick 数有界
    另以 single_point=False 跑同一场景(等价 V57T 缺陷态: 令牌仅在
    IDLE→DETECT 申请, 4 条重判入链路径不申请), 要求必须报出违规
    —— 确认仿真能捕获该缺陷。

[B] 令牌占用率量化(真实tick量级): 用 config.h 的真实 tick 常量跑长时间,
    统计"检测链占用tick / 总tick", 即充电被暂停的时间占比
    (串行化的必然代价), 并给出插电池检测延迟。

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
FREE = 0xFF

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

    def __init__(self, types, states=None, single_point=True, timing=None):
        self.single_point = single_point   # True=V57U单点判定, False=V57T仅IDLE申请
        self.T = dict(timing or T_FAST)
        self.typ = list(types)
        self.state = list(states) if states else [IDLE] * 12
        self.ct = [0] * 12
        self.gate = [False] * 12
        self.pchain = [0] * 12         # 本次入链的"非冻结推进"tick计数
        self.owner = FREE
        self.rejudge = [0] * 12
        self.done = [False] * 12       # 是否已完成一次归类
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
            # C L253-264: 空槽需轮询停留IDLE_POLL; 有电池(slot_v<OPEN)立即转DETECT
            if self.typ[idx] == EMPTY and ct < T["IDLE_POLL"]:
                return
            if self.owner != FREE and self.owner != idx:
                self.bad("I2", "槽B%d在令牌被%s占用时入链" % (idx + 1, self.owner_name()))
            self.ct[idx] = 0
            self.state[idx] = DETECT
            self.pchain[idx] = 0
            if not self.single_point:
                self.owner = idx                  # V57T: 仅此处(C L264)申请令牌
            return

        if s == DETECT:
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


def run(name, types, states=None, ticks=1500, single_point=True):
    sim = Sim(types, states, single_point)
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
    print("V57U 检测链令牌调度离线仿真  (single_point=True = 当前代码)")
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
