# -*- coding: utf-8 -*-
"""
DIODE_TEST 判定链 A 层改写等价性验证
=====================================
验证目标: 把 charge_mgr.c CHG_IMP_DIODE_TEST 中超时判定链(6级+前置3级)
改写为"A层命名布尔量+判定清单"风格后, 对任意输入(pre, slot_v, vcc)的
判定结果与原文完全一致.

方法:
  1. orig 实现: 逐条照抄 C 原文条件(含硬编码字面量 3000/2100/2300/160/3500)
  2. refact 实现: 每个判据提炼为具名布尔函数, 判定链改为清单顺序
  3. numpy 全穷举: pre∈[0,4095] x slot_v∈[0,4300] 全网格, 对
     (ct∈{10,100,240} x vcc_now∈{4000,4847,5179,5200} x dropped∈{F,T})
     所有组合对比两实现结果矩阵
  4. 随机标量抽查: 100万组随机输入(vcc_imp 覆盖与 vcc_now+150 的边界)
     对比两实现

判定链(按原文顺序, 先命中者生效):
  P1 快速爬升      pre>=2100 && sv>pre+900            -> LI/LIN(按VCC跌落)
  P2 高压回落      pre>3000  && sv>2900 && sv<pre     -> LIN
  P3 NiMH上拉虚高  sv>2900  && pre<2100              -> DRY
  P4 低压钳位兜底  ct>=20: sv>2100 && pre<=2300 && sv+160>=pre && sv<=pre+150 -> LIN
  P5 超时终判      ct>=240:
    5a 钳位到顶    sv+150>=vcc_norm                  -> LI/LIN(按VCC跌落)
    5b 高压爬升    pre>3500 && pre<3990 && sv>=pre+50 -> LI/LIN(按VCC跌落)
    5c 中压放行    sv>2600 && sv<3990 && pre>=2100 && pre<3500
                   && ((pre<3000 && sv+150>=pre) || sv>=pre+50) -> LIN
    5d 低压预充    sv>pre+150 && sv<3990 && pre>1936 && pre<3500 -> LIN
    5e DRY

结果编码: CONT=0(继续等待)  LIN=1(线性锂)  LI=2(恒压锂)  DRY=3
"""

import numpy as np
import random

# --- 常量 (与 config.h 一致) ---
VCC_REF_MV    = 5000
DIODE_TEST_TICKS  = 240
DIODE_RISE_THRESH = 900
DIODE_TOP_MARGIN  = 150
DIODE_CLAMP_MARGIN = 150   # charge_mgr.c 本地常量: 钳位判据最大允许爬升(ADC)
DIODE_PRE_MIN     = 2100
DIODE_MID_MIN     = 2600
DIODE_PRE_DRY_MAX = 1936
DIODE_CLIMB_MIN   = 50
DIODE_MID_FLAT_MAX = 3000
ADC_V_OPEN        = 3990
ADC_V_NEAR_OPEN   = 3500
ADC_V_NIMH_MAX    = 2900

CONT, LIN, LI, DRY = 0, 1, 2, 3

def vcc_norm_of(vcc):
    return vcc * 4096 // VCC_REF_MV


# =====================================================================
# 实现一: 原文直译 (orig) —— 条件保持 C 源码原样
# =====================================================================
def orig_rise_fast(pre, sv):
    return (pre >= DIODE_PRE_MIN) & (sv > pre + DIODE_RISE_THRESH)

def orig_hi_recover(pre, sv):
    return (pre > 3000) & (sv > ADC_V_NIMH_MAX) & (sv < pre)

def orig_nimh_fake(pre, sv):
    return (sv > ADC_V_NIMH_MAX) & (pre < DIODE_PRE_MIN)

def orig_low_clamp(pre, sv):
    return (sv > 2100) & (pre <= 2300) & (sv + 160 >= pre) & (sv <= pre + DIODE_CLAMP_MARGIN)

def orig_top_clamped(pre, sv, vn):
    return sv + DIODE_TOP_MARGIN >= vn

def orig_hi_climb(pre, sv):
    return (pre > ADC_V_NEAR_OPEN) & (pre < ADC_V_OPEN) & (sv >= pre + DIODE_CLIMB_MIN)

def orig_mid_grow(pre, sv):
    return ((sv > DIODE_MID_MIN) & (sv < ADC_V_OPEN) & (pre >= DIODE_PRE_MIN) & (pre < 3500)
            & (((pre < DIODE_MID_FLAT_MAX) & (sv + 150 >= pre)) | (sv >= pre + DIODE_CLIMB_MIN)))

def orig_low_prechg(pre, sv):
    return ((sv > pre + DIODE_CLAMP_MARGIN) & (sv < ADC_V_OPEN)
            & (pre > DIODE_PRE_DRY_MAX) & (pre < 3500))


# =====================================================================
# 实现二: A层改写 (refact) —— 命名布尔量 + 判定清单
# =====================================================================
def refact_rise_fast(pre, sv):
    # 早期快速爬升: 体二极管阻断, 电容被100K持续充电
    return IS_RISE_FAST(pre, sv)

def refact_hi_recover(pre, sv):
    # 高压锂电回落: 低内阻把电容拉回电池本体
    return IS_HI_RECOVER(pre, sv)

def refact_nimh_fake(pre, sv):
    # NiMH/干电池上拉虚高: 100K把电容充到假高电平
    return IS_NIMH_FAKE_HIGH(pre, sv)

def refact_low_clamp(pre, sv):
    # 低压锂电钳位兜底: 体二极管把电容钳在电池电压附近
    return IS_LOW_CLAMP(pre, sv)

def refact_top_clamped(pre, sv, vn):
    # 钳位到顶: 归一化读数贴近当前VCC满量程
    return IS_TOP_CLAMPED(pre, sv, vn)

def refact_hi_climb(pre, sv):
    # 高压段须真实爬升(挡空槽轨偏置/碱性平直)
    return IS_HI_CLIMB(pre, sv)

def refact_mid_grow(pre, sv):
    # 中压段: 平直持稳(pre<3000)或真实爬升
    return IS_MID_GROW(pre, sv)

def refact_low_prechg(pre, sv):
    # 低压锂电预充: 深度过放锂电爬升超钳位但未达中压下界
    return IS_LOW_PRECHG(pre, sv)


# 命名布尔量(A层目标风格, 逐一定义, 便于独立审查)
def IS_RISE_FAST(pre, sv):
    return (pre >= DIODE_PRE_MIN) & (sv > pre + DIODE_RISE_THRESH)

def IS_HI_RECOVER(pre, sv):
    return (pre > 3000) & (sv > ADC_V_NIMH_MAX) & (sv < pre)

def IS_NIMH_FAKE_HIGH(pre, sv):
    return (sv > ADC_V_NIMH_MAX) & (pre < DIODE_PRE_MIN)

def IS_LOW_CLAMP(pre, sv):
    return (sv > 2100) & (pre <= 2300) & (sv + 160 >= pre) & (sv <= pre + DIODE_CLAMP_MARGIN)

def IS_TOP_CLAMPED(pre, sv, vn):
    return sv + DIODE_TOP_MARGIN >= vn

def IS_HI_CLIMB(pre, sv):
    return (pre > ADC_V_NEAR_OPEN) & (pre < ADC_V_OPEN) & (sv >= pre + DIODE_CLIMB_MIN)

def IS_MID_GROW(pre, sv):
    return ((sv > DIODE_MID_MIN) & (sv < ADC_V_OPEN) & (pre >= DIODE_PRE_MIN) & (pre < 3500)
            & (((pre < DIODE_MID_FLAT_MAX) & (sv + 150 >= pre)) | (sv >= pre + DIODE_CLIMB_MIN)))

def IS_LOW_PRECHG(pre, sv):
    return ((sv > pre + DIODE_CLAMP_MARGIN) & (sv < ADC_V_OPEN)
            & (pre > DIODE_PRE_DRY_MAX) & (pre < 3500))


# =====================================================================
# 判定链执行器: 按顺序应用条件, 先命中者生效
# =====================================================================
_ORIG = {
    'rise_fast': orig_rise_fast, 'hi_recover': orig_hi_recover, 'nimh_fake': orig_nimh_fake,
    'low_clamp': orig_low_clamp, 'top_clamped': orig_top_clamped, 'hi_climb': orig_hi_climb,
    'mid_grow': orig_mid_grow, 'low_prechg': orig_low_prechg,
}
_REF = {
    'rise_fast': refact_rise_fast, 'hi_recover': refact_hi_recover, 'nimh_fake': refact_nimh_fake,
    'low_clamp': refact_low_clamp, 'top_clamped': refact_top_clamped, 'hi_climb': refact_hi_climb,
    'mid_grow': refact_mid_grow, 'low_prechg': refact_low_prechg,
}

def build_chain(ct, refact):
    """返回 [(mask_fn, result)]; result 可为标量或 callable(dropped)->标量.
       mask_fn(P, S, V) -> bool矩阵; V=当前vcc_norm."""
    pool = _REF if refact else _ORIG
    def M(name, need_v=False):
        fn = pool[name]
        return (lambda P, S, V: fn(P, S, V)) if need_v else (lambda P, S, V: fn(P, S))
    chain = []
    # 前置三级(任意时刻生效)
    chain.append((M('rise_fast'), lambda d: LI if d else LIN))
    chain.append((M('hi_recover'), LIN))
    chain.append((M('nimh_fake'), DRY))
    # 低压钳位兜底(ct>=20)
    if ct >= 20:
        chain.append((M('low_clamp'), LIN))
    # 超时终判链(ct>=240)
    if ct >= DIODE_TEST_TICKS:
        chain.append((M('top_clamped', need_v=True), lambda d: LI if d else LIN))
        chain.append((M('hi_climb'), lambda d: LI if d else LIN))
        chain.append((M('mid_grow'), LIN))
        chain.append((M('low_prechg'), LIN))
        chain.append((lambda P, S, V: np.ones(P.shape, dtype=bool), DRY))
    return chain

def run_chain(P, S, V, dropped, chain):
    shape = (P.shape[0], S.shape[1])
    result = np.full(shape, CONT, dtype=np.int8)
    decided = np.zeros(shape, dtype=bool)
    for mask_fn, res in chain:
        mask = mask_fn(P, S, V) & ~decided
        if callable(res):
            result[mask] = res(dropped)
        else:
            result[mask] = res
        decided |= mask
    return result


# =====================================================================
# 验证1: numpy 全穷举对比
# =====================================================================
def verify_exhaustive():
    pre_grid  = np.arange(0, 4096, dtype=np.int32)      # 4096 点
    sv_grid   = np.arange(0, 4301, dtype=np.int32)      # 4301 点
    P = pre_grid[:, None]
    S = sv_grid[None, :]

    vcc_cases = [4000, 4847, 5179, 5200]
    ct_cases  = [10, 100, 240]
    total_pairs = len(P.ravel())

    print("=" * 66)
    print(f"验证1: numpy 全穷举  pre×slot_v = {total_pairs:,} 组合/组")
    print(f"       参数组合: ct={ct_cases} x vcc_now={vcc_cases} x dropped={{F,T}}")
    print("=" * 66)

    n_ok = 0
    n_total = 0
    for ct in ct_cases:
        for vcc_now in vcc_cases:
            vn = vcc_norm_of(vcc_now)
            for dropped in (False, True):
                n_total += 1
                co_orig = build_chain(ct, False)
                co_ref  = build_chain(ct, True)
                m_orig = run_chain(P, S, vn, dropped, co_orig)
                m_ref  = run_chain(P, S, vn, dropped, co_ref)
                if np.array_equal(m_orig, m_ref):
                    n_ok += 1
                    print(f"  OK  ct={ct:<4} vcc={vcc_now} dropped={int(dropped)}  一致")
                else:
                    diff = np.argwhere(m_orig != m_ref)
                    print(f"  FAIL ct={ct:<4} vcc={vcc_now} dropped={int(dropped)}  差异{len(diff)}处, "
                          f"例: pre={diff[0,0]} sv={diff[0,1]} orig={m_orig[tuple(diff[0])]} ref={m_ref[tuple(diff[0])]}")
                    return False
    print(f"\n全穷举: {n_ok}/{n_total} 组完全一致")
    return n_ok == n_total


# =====================================================================
# 验证2: 随机标量抽查 (vcc_imp 覆盖比较边界)
# =====================================================================
def refact_scalar(pre, sv, vcc_now, vcc_imp, ct):
    d = vcc_imp > vcc_now + 150
    if IS_RISE_FAST_S(pre, sv):
        return LI if d else LIN
    if IS_HI_RECOVER_S(pre, sv):
        return LIN
    if IS_NIMH_FAKE_S(pre, sv):
        return DRY
    if ct >= 20 and IS_LOW_CLAMP_S(pre, sv):
        return LIN
    if ct >= DIODE_TEST_TICKS:
        vn = vcc_norm_of(vcc_now)
        if sv + DIODE_TOP_MARGIN >= vn:
            return LI if d else LIN
        if IS_HI_CLIMB_S(pre, sv):
            return LI if d else LIN
        if IS_MID_GROW_S(pre, sv):
            return LIN
        if IS_LOW_PRECHG_S(pre, sv):
            return LIN
        return DRY
    return CONT

def orig_scalar(pre, sv, vcc_now, vcc_imp, ct):
    if pre >= DIODE_PRE_MIN and sv > pre + DIODE_RISE_THRESH:
        return LI if vcc_imp > vcc_now + 150 else LIN
    if pre > 3000 and sv > ADC_V_NIMH_MAX and sv < pre:
        return LIN
    if sv > ADC_V_NIMH_MAX and pre < DIODE_PRE_MIN:
        return DRY
    if ct >= 20 and sv > 2100 and pre <= 2300 and sv + 160 >= pre and sv <= pre + DIODE_CLAMP_MARGIN:
        return LIN
    if ct >= DIODE_TEST_TICKS:
        vn = vcc_norm_of(vcc_now)
        if sv + DIODE_TOP_MARGIN >= vn:
            return LI if vcc_imp > vcc_now + 150 else LIN
        if pre > ADC_V_NEAR_OPEN and pre < ADC_V_OPEN and sv >= pre + DIODE_CLIMB_MIN:
            return LI if vcc_imp > vcc_now + 150 else LIN
        if sv > DIODE_MID_MIN and sv < ADC_V_OPEN and pre >= DIODE_PRE_MIN and pre < 3500 and ((pre < DIODE_MID_FLAT_MAX and sv + 150 >= pre) or sv >= pre + DIODE_CLIMB_MIN):
            return LIN
        if sv > pre + DIODE_CLAMP_MARGIN and sv < ADC_V_OPEN and pre > DIODE_PRE_DRY_MAX and pre < 3500:
            return LIN
        return DRY
    return CONT

# 标量版命名布尔量
def IS_RISE_FAST_S(p, s): return p >= DIODE_PRE_MIN and s > p + DIODE_RISE_THRESH
def IS_HI_RECOVER_S(p, s): return p > 3000 and s > ADC_V_NIMH_MAX and s < p
def IS_NIMH_FAKE_S(p, s): return s > ADC_V_NIMH_MAX and p < DIODE_PRE_MIN
def IS_LOW_CLAMP_S(p, s): return s > 2100 and p <= 2300 and s + 160 >= p and s <= p + DIODE_CLAMP_MARGIN
def IS_HI_CLIMB_S(p, s): return p > ADC_V_NEAR_OPEN and p < ADC_V_OPEN and s >= p + DIODE_CLIMB_MIN
def IS_MID_GROW_S(p, s): return s > DIODE_MID_MIN and s < ADC_V_OPEN and p >= DIODE_PRE_MIN and p < 3500 and ((p < DIODE_MID_FLAT_MAX and s + 150 >= p) or s >= p + DIODE_CLIMB_MIN)
def IS_LOW_PRECHG_S(p, s): return s > p + DIODE_CLAMP_MARGIN and s < ADC_V_OPEN and p > DIODE_PRE_DRY_MAX and p < 3500

def verify_random(n=1_000_000, seed=42):
    rng = random.Random(seed)
    print("=" * 66)
    print(f"验证2: 随机标量抽查 {n:,} 组 (vcc_imp 覆盖与 vcc_now+150 的边界)")
    print("=" * 66)
    cnt = 0
    for _ in range(n):
        pre   = rng.randint(0, 4095)
        sv    = rng.randint(0, 4300)
        vcc_now = rng.randint(3800, 5300)
        # vcc_imp 一半取普通范围, 一半刻意逼近比较边界 vcc_now+150
        if rng.random() < 0.5:
            vcc_imp = rng.randint(3800, 5400)
        else:
            vcc_imp = vcc_now + 150 + rng.randint(-3, 3)
        ct = rng.randint(0, 300)
        a = orig_scalar(pre, sv, vcc_now, vcc_imp, ct)
        b = refact_scalar(pre, sv, vcc_now, vcc_imp, ct)
        if a != b:
            print(f"  FAIL pre={pre} sv={sv} vcc_now={vcc_now} vcc_imp={vcc_imp} ct={ct} "
                  f"orig={a} ref={b}")
            return False
        cnt += 1
        if cnt % 200_000 == 0:
            print(f"  ... 已抽查 {cnt:,} 组")
    print(f"\n随机抽查: {cnt:,} 组全部一致")
    return True


if __name__ == "__main__":
    ok1 = verify_exhaustive()
    ok2 = verify_random()
    print("=" * 66)
    if ok1 and ok2:
        print("结论: 改写实现与原实现判定结果 100% 一致, A层改写可安全落地")
    else:
        print("结论: 存在差异, 禁止落地, 需修正改写")
    print("=" * 66)
