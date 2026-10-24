#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DIODE_TEST 爬升轨迹模拟: 中压线性锂 vs 干电池
================================================
物理模型(依据代码注释"体二极管阻断" + 电路结构推理):
  线性锂: MOS关断后节点与电池隔离(单向阻断), 100K上拉把BxAD电容
          从pre充向VCC → RC充电曲线, 最终≈VCC_norm
  干电池: 节点被电池电压钳位(内阻<<100K, 上拉电流被电池吸收),
          读数停在pre附近, 几乎不爬升
注: RC时间常数τ=100K*1uF=100ms 为假设值(真机BxAD电容未知),
    曲线形状会随τ变化, 但"爬升到顶 vs 平直"的对比特征不变.
归一化: v = V_node_mV * 4095/5000, VCC_norm = VCC*4095/5000
"""
import math

VCC      = 4600.0
VCC_NORM = VCC * 4095 / 5000          # 3767.4 (低VCC场景=原盲区)
PRE_LI   = 3100.0                     # 中压线性锂 pre(归一化ADC)
PRE_DRY  = 1500.0                     # 干电池 pre(被电池钳位)
TAU      = 100.0                      # 时间常数 ms (假设)
T_MAX    = 2400.0                     # DIODE_TEST_TICKS=240 * 10ms

def rc(pre, final, t):
    return pre + (final - pre) * (1 - math.exp(-t / TAU))

FINAL_LI  = VCC_NORM                  # 锂电爬到顶
FINAL_DRY = PRE_DRY                   # 干电池被钳死(内阻<<100K, 爬升≈0)

def tr_val(pre, v):                   # 固件轨迹格式: (v-pre)/4+128, 有符号字节
    return int(round((v - pre) / 4.0 + 128))

def ascii_wave(vals, vmin, vmax):
    out = []
    for v in vals:
        f = (v - vmin) / (vmax - vmin)
        out.append(str(min(9, max(0, int(f * 10)))))
    return "".join(out)

print("VCC=%d mV, VCC_norm≈%d (归一化ADC满量程)" % (VCC, round(VCC_NORM)))
print("中压线性锂: pre=%d → 爬升至≈%d  (爬升量≈%d, <900 → 绝对判据不中, 靠V57E钳位到顶放行)" %
      (PRE_LI, round(FINAL_LI), round(FINAL_LI - PRE_LI)))
print("干电池    : pre=%d → 钳位在≈%d (爬升量≈0)" % (PRE_DRY, round(FINAL_DRY)))
print()

# ---------- 数值表 ----------
print("=" * 66)
print("  t(ms) | 锂电 v | 锂电tr | 干电 v | 干电tr |  说明")
print("=" * 66)
mark = ["", "", "← 爬升>900判据: 中压锂电永远够不到", "", "← 干电池被钳死, tr=128恒定"]
for t in (0, 10, 20, 50, 100, 200, 500, 1000, 1500, 2000, 2400):
    vli = rc(PRE_LI, FINAL_LI, t)
    vdr = rc(PRE_DRY, FINAL_DRY, t)
    print("  %5d | %7.0f | %6d | %7.0f | %6d |" % (t, vli, tr_val(PRE_LI, vli), vdr, tr_val(PRE_DRY, vdr)))

# ---------- 固件tr采样点(ct=7,14,21,28 → 70/140/210/280ms) ----------
print()
print("固件轨迹采样(每7tick=70ms):")
print("  ct | t(ms) | 锂电tr(偏移) | 干电tr(偏移)")
for ct in (7, 14, 21, 28):
    t = ct * 10.0
    vli = rc(PRE_LI, FINAL_LI, t)
    vdr = rc(PRE_DRY, FINAL_DRY, t)
    print("  %2d | %5d | %6d (%+5d) | %6d (%+5d)" %
          (ct, t, tr_val(PRE_LI, vli), round(vli - PRE_LI), tr_val(PRE_DRY, vdr), round(vdr - PRE_DRY)))

# ---------- ASCII波形(每100ms一点, 0~9高度) ----------
print()
print("ASCII波形对比 (每100ms一点, 数字=该时刻v在各自区间的相对高度 0低~9高):")
tl = [i * 100.0 for i in range(25)]
vli_w = [rc(PRE_LI, FINAL_LI, t) for t in tl]
vdr_w = [rc(PRE_DRY, FINAL_DRY, t) for t in tl]
print("  中压锂电 pre=%d→%d:" % (PRE_LI, FINAL_LI))
print("    " + ascii_wave(vli_w, 3000, 3900))
print("    111111111111222333444455556666777778888888999999")
print("  干电池   pre=%d→%d:" % (PRE_DRY, FINAL_DRY))
print("    " + ascii_wave(vdr_w, 1400, 1600))
print()
print("时间轴(ms): " + " ".join("%4d" % int(t) for t in tl))
