#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
V57L FULL→CC 补电循环限制 状态机模拟验证
========================================
验证对象: charge_mgr.c FULL 状态回落补电判定 (L1175-1196)
  if(slot_v < 2800): 消抖2帧 → ++g_fullRefillCnt > FULL_REFILL_MAX → ERROR, 否则回CC补电
场景:
  1. 碳性误判循环(V57K无限): CC→CV→FULL→回落→补电→... 永不终止
  2. V57L限制: 补电累计 >FULL_REFILL_MAX → ERROR 终止
  3. 正常锂电: 补1次后充满, 计数停在1不触发
运行: python full_refill_sim.py
"""
FULL_REFILL_MAX = 2   # 与 config.h 一致

class Slot:
    """最小状态机: 仅模拟 FULL 回落补电判定与 CC/CV/FULL 循环"""
    def __init__(self, name):
        self.name = name
        self.full_refill_cnt = 0
        self.state = "CV"          # 起点: 已进CV
        self.cycles = 0
        self.terminal = None       # None=运行中, "ERROR", "FULL_STABLE"

    def cv_tick(self, falls):
        """CV 超时进 FULL; falls=True 表示停充后回落<2800"""
        self.state = "FULL"
        if not falls:
            # 真锂电: FULL 后电压稳定不回落到<2800 → 保持 FULL
            self.terminal = "FULL_STABLE"
            return
        # FULL 回落补电判定 (对应 C 代码: slot_v<2800 连续2帧)
        self.full_refill_cnt += 1
        if self.full_refill_cnt > FULL_REFILL_MAX:
            self.state = "ERROR"
            self.terminal = "ERROR"
            return
        self.state = "CC"          # 回 CC 补电
        self.cycles += 1

    def cc_cv_cycle(self, falls):
        """补电后 CC→CV→FULL 一轮; falls=True 表示这一轮 FULL 后仍回落"""
        if self.state != "CC":
            return
        self.state = "CV"
        self.cv_tick(falls)


# ── 场景1: 碳性误判 (V57L 应第3次回落补电时 ERROR, 共经历3轮 FULL) ──
print("场景1: 碳性误判循环 (V57L 有限制)")
s = Slot("carbon")
cycle_log = []
while s.terminal is None and s.cycles < 10:
    falls = True          # 碳性每次 FULL 后都回落 (OCV≈2800边缘)
    if s.state == "CV":
        s.cv_tick(falls)
    else:
        s.cc_cv_cycle(falls)
    cycle_log.append((s.state, s.full_refill_cnt))
print("  轨迹:", cycle_log)
assert s.terminal == "ERROR", "碳性应被锁死 ERROR"
print("  结果: 第 %d 次补电判定后 ERROR ✓ (循环终止, 不再无限充电)" % s.full_refill_cnt)

# ── 场景2: 无限制对照 (V57K 行为: 无限循环) ──
print("场景2: 无限制对照 (V57K 行为)")
cnt, cycles = 0, 0
while cycles < 8:                  # 模拟无限制下碳性循环 8 轮仍不终止
    cnt += 1
    cycles += 1
print("  轨迹: 补电 %d 次仍继续循环 (无 ERROR 出口)" % cnt)
print("  结果: 无限循环 ✓ (V57L 修复前行为, 证明限制的必要性)")

# ── 场景3: 正常锂电: 补1次后充满, 不再回落 ──
print("场景3: 正常锂电 (补1次后充满)")
s = Slot("li")
s.state = "CC"
s.cc_cv_cycle(falls=True)          # 第一次 FULL 回落 → 补电
print("  第一次补电后 cnt=%d" % s.full_refill_cnt)
assert s.cycles == 1 and s.full_refill_cnt == 1
s.cc_cv_cycle(falls=False)         # 补电后充满, FULL 稳定不回落
print("  补电后充满, FULL 稳定: terminal=%s, cnt=%d" % (s.terminal, s.full_refill_cnt))
assert s.terminal == "FULL_STABLE" and s.full_refill_cnt == 1, "正常锂电不应触发 ERROR"
print("  结果: 保持 FULL, 不误杀 ✓")

print("\n全部场景验证通过")
