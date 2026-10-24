#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
V57D 检测状态机 决策表穷举验证工具
====================================
验证对象: charge_mgr.c 中 DETECT / IMP_CHECK / DIODE_TEST 的判定逻辑
验证方法: 把 C 判定逐分支翻译为 Python, 对输入空间(关键边界值+区间采样)
          做笛卡尔积穷举, 检查:
            (1) 覆盖完备性     - 是否有输入组合落入盲区(无任何判定)
            (2) 边界一致性     - 相邻 1-ADC 差异导致充电/拒充翻转的边界
            (3) 分支可达性     - 死代码/被掩盖分支
            (4) 语义误判       - 空槽/干电池被放行充电(误充) vs 锂电被拒(拒充)
纯逻辑层验证, 不模拟 PWM 闭环与 ADC 噪声。

运行: python decision_table_exhaust.py
"""

# ============ config.h 阈值 (V57D) ============
VCC_REF_MV = 5000
ADC_V_FULL      = 3100
ADC_V_OVER      = 3850
ADC_V_OPEN      = 3990
ADC_V_NEAR_OPEN = 3500
ADC_V_SHORT     = 500
ADC_V_NIMH_LOW  = 1015
ADC_V_NIMH_MAX  = 2900
BAT_MV_FULL     = 1520
ALPHA_NUM, BETA_NUM, CAL_DEN = 124, 206, 1000
DIODE_RISE_THRESH = 900
DIODE_CLAMP_MARGIN = 150
DIODE_TOP_MARGIN  = 150   # V57E: 钳位到顶容差(A/B判据)
DIODE_PRE_MIN     = 2100  # V57E标定: 爬升/中压钳位放行的pre下界(锂电pre≥2271, 碳性≤1936)
DIODE_MID_MIN     = 2600  # V57E标定: 中压锂电放行绝对下界(锂电超时slot_v≥2637, 镍氢≤2500)
DIODE_PRE_DRY_MAX = 1936  # V57E标定: 干电池(碳性)pre实测上沿, 低压锂电预充放行的pre下界
DIODE_CLIMB_MIN    = 50    # 高压/中压放行所需slot_v相对pre最小爬升: 锂电实测≥80, 碱性/空槽平直差≤6
DIODE_MID_FLAT_MAX = 3000  # 中压平直放行的pre上界: 实测平直锂电pre≤2849, 高于此值必须真实爬升
TIME_DETECT_WAIT   = 240
TIME_DETECT_SETTLE = 800
DIODE_TEST_TICKS   = 240

# ---- 类型/状态(与固件枚举对应) ----
T_UNKNOWN, T_NIMH, T_DRY, T_LI_ION, T_AMBIGUOUS, T_LINEAR_LI = range(6)
TNAME = {T_UNKNOWN:"UNKNOWN", T_NIMH:"NIMH", T_DRY:"DRY", T_LI_ION:"LI_ION",
         T_AMBIGUOUS:"AMBIGUOUS", T_LINEAR_LI:"LINEAR_LI"}


# ============ 1. Detect_BatteryType (charge_mgr.c L111-140) ============
def detect_battery_type(v):
    if v >= ADC_V_OPEN:
        return T_UNKNOWN
    if v < ADC_V_SHORT:
        return T_UNKNOWN
    if ADC_V_NIMH_LOW <= v < ADC_V_OPEN:          # NIMH_DETECT_ENABLE=1
        return T_AMBIGUOUS
    if ADC_V_SHORT <= v < ADC_V_OPEN:
        return T_LI_ION                            # 仅 [500,1015) 可达
    return T_UNKNOWN


# ============ 2. IMP_CHECK (charge_mgr.c L474-556, V57E加空槽判据) ============
def vcc_norm(vcc_mv):
    return vcc_mv * 4096 // 5000

def imp_check(pre, v, vcc_pre, vcc_now, highV):
    """vcc_pre = 打包g_impData时的VCC, vcc_now = 当前VCC
       drop = vcc_pre - vcc_now (>0 表示跌落)
       返回 (动作, ty, 原因). 动作: IDLE/ERROR/LI_ROUTE/DIO"""
    drop = vcc_pre - vcc_now
    if v >= 4050 and pre >= 4050:
        return ("IDLE", T_UNKNOWN, "空槽/拔出: 双值≥4050")
    # V57E 空槽识别: pre与v均接近各自VCC_norm(归一化满量程), 兼容低VCC
    np_, nn = vcc_norm(vcc_pre), vcc_norm(vcc_now)
    if (pre + DIODE_TOP_MARGIN >= np_) and (v + DIODE_TOP_MARGIN >= nn):
        return ("IDLE", T_UNKNOWN, "空槽(V57E): pre/v均≈各自VCC_norm")
    if drop > 300 and v >= ADC_V_OPEN:
        return ("ERROR", T_NIMH, "NiMH: VCC跌>300 且 v≥OPEN")
    if drop > 200 and pre < 3100:
        return ("LI_ROUTE", T_LI_ION, "恒压锂: VCC跌>200 且 pre<3100")
    if (not highV) and pre > v and (pre - v) > 1000:
        return ("ERROR", T_DRY, "干电池: 脉冲大跌>1000")
    if pre > ADC_V_NEAR_OPEN and drop <= 200:
        return ("DIO", None, "高压保护: pre>3500 且 VCC不塌→DIODE_TEST")
    # C代码: if(v>=OPEN) goto imp_diode_test_entry; 后无else, 无条件fall-through
    #  → 该if为死代码, 等效于无条件进入DIODE_TEST
    return ("DIO", None, "默认进入DIODE_TEST (v≥OPEN判据为死代码)")


# ============ 3. DIODE_TEST (charge_mgr.c L596-712, V57E加钳位到顶) ============
def diode_test(pre, v, vcc_pre, vcc_now, ct):
    """返回第一个命中的 (动作, ty, 原因), 无命中返回 None(继续等待).
       动作: LI_ROUTE(放行)/ERROR(拒充)"""
    drop = vcc_pre - vcc_now
    # (1) 爬升 (V57E: pre≥DIODE_PRE_MIN门槛, 拦低压碳性自由浮空)
    if pre >= DIODE_PRE_MIN and v > pre + DIODE_RISE_THRESH:
        if drop > 150:
            return ("LI_ROUTE", T_LI_ION, "爬升>900 且 VCC跌>150")
        return ("LI_ROUTE", T_LINEAR_LI, "爬升>900 且 VCC不塌")
    # (2) 高压回落
    if pre > 3000 and v > ADC_V_NIMH_MAX and v < pre:
        return ("LI_ROUTE", T_LINEAR_LI, "高压回落: pre>3000 且 v∈(2900,pre)")
    # (3) NiMH上拉虚高 (V57E: pre<DIODE_PRE_MIN, 原≤2300误杀B6 T2 pre=2271)
    if v > ADC_V_NIMH_MAX and pre < DIODE_PRE_MIN:
        return ("ERROR", T_DRY, "NiMH上拉虚高: v>2900 且 pre<2100")
    # (4) 低压兜底
    if ct >= 20 and v > 2100 and pre <= 2300 and \
       v + 160 >= pre and v <= pre + DIODE_CLAMP_MARGIN:
        return ("LI_ROUTE", T_LINEAR_LI, "低压兜底: ct≥20 且钳位")
    # (5) 超时最终判定
    if ct >= DIODE_TEST_TICKS:
        # V57E 钳位到顶: v≈当前VCC_norm(线性锂体二极管阻断爬升至顶),
        # 空槽已被IMP_CHECK拦截, 此处仅v到顶即真锂电
        if v + DIODE_TOP_MARGIN >= vcc_norm(vcc_now):
            if drop > 150:
                return ("LI_ROUTE", T_LI_ION, "超时钳位到顶(V57E): VCC跌>150")
            return ("LI_ROUTE", T_LINEAR_LI, "超时钳位到顶(V57E): v≈VCC_norm")
        if ADC_V_NEAR_OPEN < pre < ADC_V_OPEN:
            # (V57K) 高压段须真实爬升: 空槽节点被充电轨偏置到≈3500平直(slot_v≈pre)
            # 与碱性pre≈3500平直均不满足, 只有体二极管阻断爬升的锂电放行
            if v >= pre + DIODE_CLIMB_MIN:
                if drop > 150:
                    return ("LI_ROUTE", T_LI_ION, "超时高压段pre: VCC跌>150")
                return ("LI_ROUTE", T_LINEAR_LI, "超时高压段pre: VCC不塌")
        # (V57E标定) 中压锂电放行: 去掉±150爬升上界, slot_v>2600 + pre≥2100;
        # slot_v上界取OPEN(V57I): 中压pre线性锂爬升可越过3500进入(3500,OPEN)段;
        # (V57K) 平直持稳(pre<3000且slot_v未跌破pre-150)放行爬升缓慢锂电,
        # pre≥3000必须真实爬升(slot_v≥pre+50), 挡碱性/空槽平直高值冒充锂电
        if v > DIODE_MID_MIN and v < ADC_V_OPEN and \
           pre >= DIODE_PRE_MIN and pre < 3500 and \
           ((pre < DIODE_MID_FLAT_MAX and v + 150 >= pre) or
            v >= pre + DIODE_CLIMB_MIN):
            return ("LI_ROUTE", T_LINEAR_LI, "超时中压锂电: v>2600且pre≥2100且未跌")
        # (V57J) 低压锂电预充放行: 深度过放锂电pre≈2000~2500, slot_v爬升超钳位
        # 但未达中压下界, 落于低压兜底(≤pre+150)与中压(v>2600)之间;
        # 碳性pre≤上沿1936隔离, 镍氢v≤pre+150平直不满足爬升
        if v > pre + DIODE_CLAMP_MARGIN and v < ADC_V_OPEN and \
           pre > DIODE_PRE_DRY_MAX and pre < 3500:
            return ("LI_ROUTE", T_LINEAR_LI, "超时低压锂电预充: 爬升超钳位且pre>碳性上沿")
        return ("ERROR", T_DRY, "超时无爬升无钳位")
    return None


# ============ 4. DETECT_LI_ROUTE (charge_mgr.c L156-180) ============
def detect_li_route(v):
    vx_mv = v * VCC_REF_MV // 4096
    bat_mv = (ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV + CAL_DEN // 2) // CAL_DEN
    if bat_mv <= 100:
        return ("ACTIVATE", bat_mv)
    if bat_mv < 900:
        return ("PRECHARGE", bat_mv)
    if bat_mv >= BAT_MV_FULL:
        return ("CV", bat_mv)
    return ("CC", bat_mv)


# ============ 5. 关键边界采样集合 ============
PRE_SAMPLES = [0, 499, 500, 1014, 1015, 1200, 1936, 2099, 2100, 2271, 2300, 2500,
               2600, 2900, 3000, 3099, 3100, 3300, 3499, 3500, 3800, 3850,
               3989, 3990, 4049, 4050, 4095]
V_SAMPLES   = [0, 500, 1015, 1389, 2100, 2300, 2500, 2600, 2637, 2900, 3000, 3201,
               3300, 3499, 3500, 3700, 3850, 3989, 3990, 4049, 4050, 4095]
DROP_SAMPLES = [-200, 0, 149, 150, 199, 200, 299, 300, 400]


def section(title):
    print("\n" + "=" * 62)
    print(title)
    print("=" * 62)


# ============ 检查1: Detect_BatteryType 完备性 ============
def check_detect_type():
    section("1. Detect_BatteryType 完备性 (NIMH_DETECT_ENABLE=1)")
    v_range = range(0, 4100)
    counts = {t: 0 for t in TNAME}
    for v in v_range:
        counts[detect_battery_type(v)] += 1
    for t, c in counts.items():
        print("  v∈[0,4095] %s: %5d" % (TNAME[t].ljust(9), c))
    print("  结论: [1015,3990)全部→AMBIGUOUS, [500,1015)→LI_ION, "
          "<500或≥3990→UNKNOWN. 无盲区, 但LI_ION仅覆盖500~1015窄带.")


# ============ 检查2: IMP_CHECK 决策表穷举 ============
def check_imp_check():
    section("2. IMP_CHECK 决策表穷举 (pre×v×VCC对×highV)")
    from itertools import product
    acts = {}
    n_dead = 0
    # VCC对: 当前VCC取4600/5100两基准, 跌落量取DROP_SAMPLES
    vcc_pairs = [(b + d, b) for b in (4600, 5100) for d in DROP_SAMPLES]
    for pre, v, (vp, vn), hv in product(PRE_SAMPLES, V_SAMPLES, vcc_pairs, (0, 1)):
        a = imp_check(pre, v, vp, vn, hv)
        acts.setdefault(a[0], []).append((pre, v, vp, vn, hv))
        if "死代码" in a[2]:
            n_dead += 1
    total = len(PRE_SAMPLES) * len(V_SAMPLES) * len(vcc_pairs) * 2
    print("  组合总数: %d, 全部分支均有确定输出(无盲区)." % total)
    for k in sorted(acts):
        print("  动作[%s]: %d 例" % (k.ljust(8), len(acts[k])))
    print("  其中'默认进DIODE(v≥OPEN判据为死代码)'命中 %d 例 —— 该if永远执行, 属死代码(无害)." % n_dead)


# ============ 检查3: DIODE_TEST 决策表穷举 ============
def check_diode_test():
    section("3. DIODE_TEST 决策表穷举 (pre×v×VCC对×ct)")
    from itertools import product
    acts = {}
    nohit_wait = 0      # ct<240 无命中 → 继续等待(正常)
    nohit_timeout = 0   # ct>=240 无命中 → 走DRY(超时拒充)
    vcc_pairs = [(b + d, b) for b in (4600, 5100) for d in DROP_SAMPLES]
    for pre, v, (vp, vn), ct in product(PRE_SAMPLES, V_SAMPLES, vcc_pairs,
                                        (0, 19, 20, 239, 240)):
        a = diode_test(pre, v, vp, vn, ct)
        if a is None:
            if ct >= DIODE_TEST_TICKS:
                nohit_timeout += 1
            else:
                nohit_wait += 1
            continue
        acts.setdefault(a[0], []).append((pre, v, vp, vn, ct, a[2]))
    total = len(PRE_SAMPLES) * len(V_SAMPLES) * len(vcc_pairs) * 5
    print("  组合总数: %d" % total)
    for k in sorted(acts):
        print("  动作[%s]: %d 例" % (k.ljust(9), len(acts[k])))
    print("  ct<240 无命中(继续等待): %d   ct≥240 无命中(→DRY拒充): %d" % (nohit_wait, nohit_timeout))
    if nohit_timeout > 0:
        print("  [!] ct≥240 存在无命中组合 → 这些组合全部落为'超时无爬升无钳位→DRY', 检查语义:")
    for pre, v, vp, vn, ct, why in acts.get("ERROR", [])[:12]:
        print("    DRY例: pre=%4d v=%4d VCC=%4d ct=%d (%s)" % (pre, v, vn, ct, why))


# ============ 检查4: 中压盲区量化(pre 2300~3500, 爬升量扫描) ============
def check_midgap():
    section("4. 中压盲区量化 (pre∈[2300,3500], 超时最终判定)")
    for vcc in (4600, 5000):
        print("  -- VCC=%dmV (VCC_norm≈%d) --" % (vcc, vcc_norm(vcc)))
        grid = {}
        for pre in range(2300, 3501, 50):
            for v in range(0, 4096, 25):
                a = diode_test(pre, v, vcc, vcc, DIODE_TEST_TICKS)
                act = "NONE" if a is None else a[0]
                grid.setdefault(act, 0)
                grid[act] += 1
        print("  网格点(pre 25档 × v 164档 = %d):" % sum(grid.values()))
        for k in sorted(grid):
            print("    %s: %d" % (k.ljust(9), grid[k]))
        # 盲区边界: 对固定pre, 扫v找出 拒充区间
        print("  盲区表 (pre, 拒充v区间):")
        for pre in range(2350, 3451, 400):
            rej = []
            for v in range(0, 4096):
                a = diode_test(pre, v, vcc, vcc, DIODE_TEST_TICKS)
                if a is not None and a[0] == "ERROR":
                    rej.append(v)
            segs = []
            for x in rej:
                if segs and x == segs[-1][1] + 1:
                    segs[-1][1] = x
                else:
                    segs.append([x, x])
            print("    pre=%4d: 拒充段=%s" % (pre, ", ".join("[%d,%d]" % (s[0], s[1]) for s in segs)))
    print("  注: 拒充段上限若≈VCC_norm-150 且锂电实际爬升至顶(≈VCC_norm), 则真锂电已全部放行.")


# ============ 检查5: 空槽语义链 (空槽 pre≈v≈VCC_norm, drop≈0) ============
def check_empty_slot():
    section("5. 空槽语义链 (空槽读数≈VCC_norm = VCC×4095/5000, drop=0, ct=240)")
    for vcc in (4400, 4600, 4800, 4874, 4900, 4945, 5000, 5100, 5180):
        norm = vcc * 4095 // 5000   # 空槽归一化读数
        a1 = imp_check(norm, norm, vcc, vcc, 0)
        chain = "IMP_CHECK→[%s] %s" % (a1[0], a1[2])
        if a1[0] == "DIO":
            a2 = diode_test(norm, norm, vcc, vcc, DIODE_TEST_TICKS)
            if a2 is not None:
                chain += " → DIODE_TEST→[%s] %s" % (a2[0], a2[2])
            else:
                chain += " → DIODE_TEST→(无命中)"
        verdict = "正确(回IDLE)" if a1[0] == "IDLE" else \
                  ("[误充!]" if a1[0] == "LI_ROUTE" or (a1[0] == "DIO" and a2[0] == "LI_ROUTE") else "拒充(安全,体验差)")
        print("  VCC=%5d VCC_norm=%4d: %s  → %s" % (vcc, norm, chain, verdict))


# ============ 检查5b: 真锂电语义链(防A误杀: 恒压锂/线性锂不被判空槽) ============
def check_li_semantics():
    section("5b. 真锂电语义链 (A判据不应误杀锂电)")
    # 恒压锂: pre虚高3766, 脉冲后v回落/被钳位, VCC跌>200 (charger IC拉载)
    for vcc in (4598, 5000, 5180):
        np_ = vcc_norm(vcc)
        for pre, v in ((3766, 3500), (3766, 3000), (3766, 1270)):
            a1 = imp_check(pre, v, vcc + 200, vcc, 1)
            tag = "OK(继续)" if a1[0] != "IDLE" else "[误杀!回IDLE]"
            print("  恒压锂 pre=%4d v=%4d VCC=%d→%d: %s %s" % (pre, v, vcc + 200, vcc, a1[0], tag))
        # 恒压锂drop≤150(轻载)时走DIODE, 检查不判空槽
        a1 = imp_check(3766, 3500, vcc, vcc, 1)
        tag = "OK(继续)" if a1[0] != "IDLE" else "[误杀!回IDLE]"
        print("  恒压锂轻载 pre=%4d v=%4d VCC=%d: %s %s" % (3766, 3500, vcc, a1[0], tag))
    # 线性锂: pre=电池电压(低), v爬升至VCC_norm
    for vcc in (4400, 4600, 5000, 5180):
        np_ = vcc_norm(vcc)
        for pre in (1200, 1900, 2500, 3100):
            a1 = imp_check(pre, np_, vcc, vcc, 0)
            tag = "OK(继续)" if a1[0] != "IDLE" else "[误杀!回IDLE]"
            print("  线性锂 pre=%4d v=%d VCC=%d: %s %s" % (pre, np_, vcc, a1[0], tag))
    # 线性锂超时钳位到顶应放行(B判据)
    print("  线性锂 DIODE_TEST超时钳位到顶(B判据):")
    for vcc in (4400, 4600, 5000, 5180):
        np_ = vcc_norm(vcc)
        for pre in (1200, 2500, 3100, 3350):
            a2 = diode_test(pre, np_, vcc, vcc, DIODE_TEST_TICKS)
            print("    pre=%4d v=%4d VCC=%d → %s %s" % (pre, np_, vcc, a2[0] if a2 else "NONE", a2[2] if a2 else ""))
    # 干电池中压平直: 应仍被拒或走CC兜底(不判锂爬升)
    print("  干电池平直(pre≈v, 应拒充):")
    for vcc in (4400, 5000):
        for pre in (1500, 3000):
            a2 = diode_test(pre, pre, vcc, vcc, DIODE_TEST_TICKS)
            print("    pre=v=%4d VCC=%d → %s" % (pre, vcc, (a2[0] + " " + a2[2]) if a2 else "NONE"))


# ============ 检查6: 边界 1-ADC 翻转检测 (超时最终判定, VCC=5000) ============
def check_boundary_flip():
    section("6. 边界 1-ADC 翻转检测 (超时最终判定, VCC=5000)")
    def act_of(pre, v):
        a = diode_test(pre, v, 5000, 5000, DIODE_TEST_TICKS)
        return a[0] if a is not None else "NONE"
    flips = 0
    for (p0, p1, lo, hi) in ((2280, 2320, 2280, 2320),   # v>2300/pre≤2300 边界
                             (3460, 3560, 3460, 3560),   # 3500 边界
                             (3960, 4060, 3960, 4060)):  # 3990/4050 边界
        for pre in range(p0, p1 + 1):
            prev_act = act_of(pre, lo)
            for v in range(lo + 1, hi + 1):
                cur = act_of(pre, v)
                if cur != prev_act:
                    flips += 1
                    if flips <= 14 and {cur, prev_act} & {"LI_ROUTE", "ERROR"}:
                        print("    pre=%4d: v=%4d→%4d  %s→%s" % (pre, v - 1, v, prev_act, cur))
                prev_act = cur
    print("  共 %d 处 1-ADC 翻转(边界硬切, 3个关键区间内). 上表为充电安全相关翻转." % flips)


# ============ 检查7: DETECT_LI_ROUTE 路由验证 ============
def check_route():
    section("7. DETECT_LI_ROUTE 路由 (v→bat_mv→状态)")
    print("  数学: bat_mv = 0.1514×v + 1030 (见下), min(v=0)=1030mV")
    print("  → ACTIVATE(≤100mV)与PRECHARGE(<900mV)在物理上永不可达, 全部锂电直接进CC/CV(已知TODO)")
    for v in (500, 1015, 2300, 2900, 3100, 3236, 3300, 3500, 3767, 3990):
        st, bm = detect_li_route(v)
        print("    v=%4d → bat_mv=%4dmV → %s" % (v, bm, st))


# ============ 检查8: V57E log 5次测试实测用例复核 ============
def check_log_cases():
    section("8. V57E/V57I log 实测用例复核 (DIODE_TEST超时判定, 应全部正确)")
    # (pre, 超时slot_v, VCC, 期望动作)  期望LI_ROUTE=放行, ERROR=拒充
    cases = [
        # ── 线性/恒压锂: 应放行 (原±150钳位全误拒) ──
        (2646, 2651, 4521, "LI_ROUTE", "B3 T3 持稳"),
        (2689, 2693, 4628, "LI_ROUTE", "B3 T5 持稳"),
        (2827, 2760, 4619, "LI_ROUTE", "B4 T1 回落钳位"),
        (2868, 2948, 4730, "LI_ROUTE", "B6 T5 爬升80"),
        (2734, 2830, 4632, "LI_ROUTE", "B9 T1 爬升96"),
        (2849, 2782, 4492, "LI_ROUTE", "B9 T4 回落钳位"),
        (2271, 3123, 4632, "LI_ROUTE", "B6 T2 爬升852(原虚高误杀)"),
        (2419, 2899, 4606, "LI_ROUTE", "B4 T3 爬升480(原拒)"),
        (2457, 2733, 4632, "LI_ROUTE", "B4 T5 爬升276(原拒)"),
        (2759, 3004, 4748, "LI_ROUTE", "B6 T1 爬升245(原拒)"),
        (2570, 2914, 4650, "LI_ROUTE", "B6 T3 爬升344(原拒)"),
        (2643, 2830, 4636, "LI_ROUTE", "B8 T1 爬升187(原拒)"),
        (2618, 2969, 4772, "LI_ROUTE", "B8 T2 爬升351(原拒)"),
        (2602, 2882, 4623, "LI_ROUTE", "B8 T3 爬升280(原拒)"),
        (2705, 2877, 4568, "LI_ROUTE", "B8 T4 爬升172(原拒)"),
        (2681, 2857, 4676, "LI_ROUTE", "B8 T5 爬升176(原拒)"),
        (2814, 3201, 4748, "LI_ROUTE", "B5 T1 恒压锂爬升387(原拒→IDLE)"),
        (2747, 2945, 4645, "LI_ROUTE", "B5 T3 恒压锂(原拒→IDLE)"),
        (2698, 3047, 4632, "LI_ROUTE", "B5 T5 恒压锂(原拒→IDLE)"),
        (2783, 2927, 4658, "LI_ROUTE", "B9 T3 恒压锂爬升144"),
        (2817, 2909, 4699, "LI_ROUTE", "B9 T5 恒压锂爬升92"),
        # ── V57I log 过放锂电 B12: V57J低压预充放行, 原被拒Dry/NiMH ERR ──
        (2152, 2408, 4828, "LI_ROUTE", "B12 T1 过放锂爬升超钳位(原拒)"),
        (1977, 2438, 4804, "LI_ROUTE", "B12 T3 过放锂爬升超钳位(原拒)"),
        # ── V57K log pre≥3000爬升锂电: 验证真实爬升门槛, 应放行 ──
        (3217, 3441, 4685, "LI_ROUTE", "B3 线性锂爬升224"),
        (3321, 3477, 4717, "LI_ROUTE", "B9 线性锂爬升156"),
        # ── 镍氢/碳性/碱性: 应拒充 (其中B2 T3原被误放行, B10 T2原被爬升误放行) ──
        (2350, 2400, 4521, "ERROR", "B2 T3 镍氢持稳(原误放行进CC→CV)"),
        (2517, 2169, 4654, "ERROR", "B2 T1 镍氢下跌"),
        (2872, 2300, 5163, "ERROR", "B2 T2 镍氢大跌"),
        (1648, 1699, 4615, "ERROR", "B2 T5 镍氢低压持稳"),
        (2316, 1110, 5173, "ERROR", "B2 T4 镍氢下跌"),
        (2470, 1991, 5179, "ERROR", "B7 T2 镍氢下跌"),
        (2311, 1983, 4676, "ERROR", "B7 T3 镍氢下跌"),
        (2050, 1715, 4501, "ERROR", "B7 T4 镍氢下跌"),
        (1944, 1770, 4708, "ERROR", "B7 T5 镍氢下跌"),
        (1389, 3000, 5190, "ERROR", "B10 T2 碳性浮空(原爬升误放行→CC)"),
        (1268, 2016, 5041, "ERROR", "B11 T4 碳性爬升"),
        (1280, 2093, 5179, "ERROR", "B11 T5 碳性爬升"),
        (1881, 1530, 4694, "ERROR", "B10 T1 碳性下跌"),
        (1654, 1618, 4632, "ERROR", "B10 T3 碳性持稳"),
        (1870, 1561, 4636, "ERROR", "B10 T4 碳性下跌"),
        (1898, 1874, 4645, "ERROR", "B10 T5 碳性持稳"),
        (1936, 2102, 5179, "ERROR", "B11 T1 碳性爬升"),
        (1860, 2068, 5163, "ERROR", "B11 T2 碳性爬升"),
        (1891, 1441, 5179, "ERROR", "B11 T3 碳性下跌"),
        (2412, 2064, 4606, "ERROR", "B1 T1 碱性大跌"),
        (2026, 1073, 5184, "ERROR", "B1 T2 碱性大跌"),
        (2180, 1713, 4559, "ERROR", "B1 T3 碱性大跌"),
        (2464, 1386, 5072, "ERROR", "B1 T4 碱性大跌"),
        (2220, 1778, 4513, "ERROR", "B1 T5 碱性大跌"),
        (2058, 1375, 4650, "ERROR", "B7 T1 镍氢大跌"),
        # ── V57I log B12 T2: 接触不稳(pre异常高3299, slot_v崩塌), 拒充合理 ──
        (3299, 2448, 4833, "ERROR", "B12 T2 接触不稳(拒充合理)"),
        # ── V57K log: 空槽/碱性平直高值(原误放行进CV) ──
        (3499, 3505, 4681, "ERROR", "B7 碱性平直(原误放行→CV)"),
        (3504, 3506, 4681, "ERROR", "B10 空槽平直(原误放行→CV)"),
        (3515, 3517, 4708, "ERROR", "B12 空槽平直(原误放行→CV)"),
        # ── V57K log: 接触崩塌锂电(pre高但slot_v崩塌), 拒充合理 ──
        (3143, 2711, 4685, "ERROR", "B1 线性锂崩塌(拒充合理)"),
        (3157, 2637, 4712, "ERROR", "B6 线性锂崩塌(拒充合理)"),
    ]
    npass = nfail = 0
    for pre, v, vcc, want, tag in cases:
        a = diode_test(pre, v, vcc, vcc, DIODE_TEST_TICKS)
        got = a[0] if a else "NONE"
        ok = (got == want)
        npass += ok; nfail += (not ok)
        print("  %-2s %-34s pre=%4d v=%4d VCC=%4d → %-8s %s" % (
            "OK " if ok else "!! ", tag, pre, v, vcc, got,
            (a[2] if a else "无命中")))
    print("  通过 %d/%d" % (npass, npass + nfail))


# ============ 主流程 ============
if __name__ == "__main__":
    print("V57D/V57E 检测状态机 决策表穷举验证 (V57E含标定判据)")
    check_detect_type()
    check_imp_check()
    check_diode_test()
    check_midgap()
    check_empty_slot()
    check_li_semantics()
    check_boundary_flip()
    check_route()
    check_log_cases()
    print("\n" + "=" * 62)
    print("验证完成")
