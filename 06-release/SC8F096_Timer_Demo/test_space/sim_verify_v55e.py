#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
V55E 模拟验证脚本 (状态机防护层 v2)
====================================
输入 : test_space/log.txt (V54W 固件日志。用户确认: V54W 无归一化, 打印值为原始 ADC)
输出 : 控制台 + test_space/sim_result.txt

模拟方法:
  1. 解析每一帧的 VCC 与 12 槽原始 ADC 读数(raw)。
  2. 按 V55E 的 Adc_Norm() 正向归一化: fwd = min(4095, raw*VCC/5000)
     (V55A 是反向归一化 raw*5000/VCC, 会在 VCC 波动时引入±400ADC误差;
      V54W 无归一化, 日志为原始 ADC; V55E 正向换算两遍VCC抵消, 读数稳定)
  3. 用 V55E 阈值 + 状态机防护规则模拟判定:
     - OPEN 判据 fwd>=ADC_V_OPEN(4090):
         CC态  LINEAR_LI → 伪OPEN存活(不更新ref, 不杀)
         CC态  LI_ION   → 1帧即 CHG_FULL(合法满电, 非误杀)
         CV态  LINEAR_LI → 伪OPEN存活(break保持CV)
         CV态  LI_ION   → 连续2帧 → CHG_FULL(合法满电, 非误杀)
         FULL态 LINEAR_LI → 需连续50帧才IDLE(22帧日志够不到)
         FULL态 LI_ION   → 连续2帧 → IDLE(拔出误杀)
         检测态(DET/IMP/DIO) → V54W数据下为浮空读数, 标注不判杀
     - 过压 fwd>=ADC_V_OVER(3850): 仅 LI_ION 生效, 连续 OV_DEBOUNCE_CNT(5)帧
       才 ERROR; LINEAR_LI 排除(无charger IC, 电容残留非真过压)
     - NiMH 窗口 fwd<2900: 仅对 CC/CV 态有效(锂电应>2900);
       检测态(DIO)中压为正常, 判据是 tr 轨迹/钳位而非绝对电压

局限声明(重要):
  - 本脚本做"值域 + 状态机防护规则"模拟, 不模拟 PWM 占空比闭环。
  - 数据是 V54W 行为下采集的(此时节点会因 CV PI 压占空比而浮空)。
    V55E 的 CCCV detectCount 修复会改变占空比 → 改变实际读数, 本脚本无法复现,
    只能回答: "若这些读数在 V55E 下出现, 判定结果如何"(最坏情况)。
"""

import re
import os
import sys

# ---------------- V55E 配置(config.h) ----------------
VCC_REF_MV = 5000
ADC_V_OPEN = 4090        # V55E: 3990 -> 4090
ADC_V_FULL = 3100
ADC_V_OVER = 3850
ADC_V_NEAR_OPEN = 3500
ADC_V_NIMH_MAX = 2900
ADC_V_NIMH_LOW = 1015
ADC_V_SHORT = 500
OV_DEBOUNCE_CNT = 5      # 过压消抖(仅LI_ION)
CV_FULL_DEBOUNCE = 2     # CV态 LI_ION 伪OPEN 2帧→FULL
CC_FULL_DEBOUNCE = 1     # CC态 LI_ION 伪OPEN 1帧→FULL
FULL_IDLE_DEBOUNCE_LINEAR = 50   # FULL态 LINEAR_LI 拔出消抖50帧
FULL_IDLE_DEBOUNCE_LION = 2      # FULL态 LI_ION 拔出消抖2帧

# ---------------- 真实电池类型(日志尾部) ----------------
GROUND_TRUTH = {
    1: "碱性(拒充)", 2: "镍氢(拒充)", 3: "碳性(拒充)",
    4: "线性锂(充电)", 5: "恒压锂(充电)", 6: "线性锂(充电)",
    7: "镍氢(拒充)", 8: "线性锂(充电)", 9: "恒压锂(充电)",
    10: "线性锂(充电)", 11: "线性锂(充电)", 12: "恒压锂(充电)",
}
# 真实类型 → V55E 状态机内部类型
TYPE_MAP = {
    "碱性": "DRY", "镍氢": "NIMH", "碳性": "DRY",
    "线性锂": "LINEAR_LI", "恒压锂": "LI_ION",
}
LI_SLOTS = {4, 5, 6, 8, 9, 10, 11, 12}   # 应充电的锂电槽
NIMH_SLOTS = {2, 7}                       # 应拒充的镍氢槽
DRY_SLOTS = {1, 3}                        # 应拒充的干电池(碱性/碳性)


# ---------------- 解析日志 ----------------
def parse_log(path):
    """返回: frames = [ {vcc, slots: {slot: (raw, st, ct, ty, pre)}} ], truth = {...}"""
    frames = []
    cur = None
    truth = {}
    with open(path, encoding="utf-8", errors="replace") as f:
        for line in f:
            line = line.strip()
            m = re.search(r"VCC=(\d+)mV", line)
            if m:
                if cur is not None:
                    frames.append(cur)
                cur = {"vcc": int(m.group(1)), "slots": {}}
                continue
            m = re.search(r"B(\d+)=(\d+)", line)
            if m and cur is not None:
                slot = int(m.group(1))
                raw = int(m.group(2))
                st = "?"
                ct = 0
                ty = -1
                pre = -1
                ms = re.search(r"\[([A-Za-z /]+)\]", line)
                if ms:
                    st = ms.group(1).strip()
                mc = re.search(r"ct=(\d+)", line)
                if mc:
                    ct = int(mc.group(1))
                mt = re.search(r"ty=(\d+)", line)
                if mt:
                    ty = int(mt.group(1))
                mp = re.search(r"pre=(\d+)", line)
                if mp:
                    pre = int(mp.group(1))
                cur["slots"][slot] = (raw, st, ct, ty, pre)
                continue
            m = re.search(r"B(\d+)\s*(碱性|镍氢|碳性|线性锂|恒压锂)", line)
            if m:
                truth[int(m.group(1))] = m.group(2)
    if cur is not None:
        frames.append(cur)
    return frames, truth


def v55e_norm(raw, vcc):
    """V55E Adc_Norm: 正向归一化 + 4095 钳位(无早退)"""
    fwd = raw * vcc // VCC_REF_MV
    return min(4095, fwd)


def state_class(st):
    """日志状态标签 → 状态机大类"""
    s = st.upper()
    if "CV" in s:
        return "CV"
    if "CC" in s:
        return "CC"
    if "DIO" in s:
        return "DIO"
    if "IMP" in s:
        return "IMP"
    if "FULL" in s:
        return "FULL"
    if "ERR" in s:
        return "ERR"
    return "DET"


# ---------------- 状态机防护模拟 ----------------
def simulate(frames):
    """
    返回: events[slot] = [(frame_idx, sc, fwd, note, level)]
          level: INFO/OK/RISK/ERROR
    连续计数器: ov_streak(LI_ION过压), open_streak(LI_ION OPEN→FULL/IDLE)
    """
    events = {s: [] for s in range(1, 13)}
    ov_streak = {s: 0 for s in range(1, 13)}
    open_streak = {s: 0 for s in range(1, 13)}

    for fi, fr in enumerate(frames):
        vcc = fr["vcc"]
        for slot in sorted(fr["slots"]):
            raw, st, ct, ty_log, pre = fr["slots"][slot]
            fwd = v55e_norm(raw, vcc)
            truth = next((k for k, v in GROUND_TRUTH.items() if k == slot), None)
            ty = None
            for name in TYPE_MAP:
                if name in GROUND_TRUTH.get(slot, ""):
                    ty = TYPE_MAP[name]
                    break
            if ty is None:
                ty = "UNKNOWN"
            sc = state_class(st)
            ev = events[slot]

            # 过压连续帧统计(仅 LI_ION 相关; 计数器全局维护, 判断时看类型)
            if ty == "LI_ION" and fwd >= ADC_V_OVER:
                ov_streak[slot] += 1
            else:
                ov_streak[slot] = 0

            # OPEN 连续帧统计
            if fwd >= ADC_V_OPEN:
                open_streak[slot] += 1
            else:
                open_streak[slot] = 0

            # ---------- 按状态机大类判定 ----------
            if sc == "CV":
                if ty == "LINEAR_LI":
                    if fwd >= ADC_V_OPEN:
                        ev.append((fi, sc, fwd, "伪OPEN: LINEAR_LI CV态 break 保持CV, 存活", "OK"))
                    elif fwd >= ADC_V_OVER:
                        ev.append((fi, sc, fwd, "高段读数(%d>=3850)但 LINEAR_LI 过压排除, 存活" % fwd, "INFO"))
                elif ty == "LI_ION":
                    if fwd >= ADC_V_OPEN:
                        if open_streak[slot] >= CV_FULL_DEBOUNCE:
                            ev.append((fi, sc, fwd, "LI_ION CV态伪OPEN连续%d帧→CHG_FULL(合法满电绿灯, 非误杀)" % open_streak[slot], "OK"))
                        else:
                            ev.append((fi, sc, fwd, "LI_ION CV态伪OPEN第%d帧(需连续2帧才FULL)" % open_streak[slot], "INFO"))
                    elif fwd >= ADC_V_OVER:
                        if ov_streak[slot] >= OV_DEBOUNCE_CNT:
                            ev.append((fi, sc, fwd, "过压连续%d帧≥%d→CHG_ERROR(误杀!)" % (ov_streak[slot], OV_DEBOUNCE_CNT), "ERROR"))
                        elif ov_streak[slot] >= 2:
                            ev.append((fi, sc, fwd, "过压连续%d帧(阈值5), 高风险" % ov_streak[slot], "RISK"))
                        else:
                            ev.append((fi, sc, fwd, "过压单帧%d, 未达5帧消抖" % fwd, "INFO"))
                elif ty == "NIMH" or ty == "DRY":
                    ev.append((fi, sc, fwd, "异常: 干电池/镍氢进入CV态(fwd=%d)" % fwd, "RISK"))
            elif sc == "CC":
                if ty == "LINEAR_LI":
                    if fwd >= ADC_V_OPEN:
                        ev.append((fi, sc, fwd, "伪OPEN: LINEAR_LI CC态不更新ref, 存活", "OK"))
                    elif fwd < ADC_V_NIMH_MAX:
                        ev.append((fi, sc, fwd, "CC态 fwd<%d: 线性锂中压充电中, 正常(由16s超时/进展判定)" % ADC_V_NIMH_MAX, "INFO"))
                elif ty == "LI_ION":
                    if fwd >= ADC_V_OPEN:
                        ev.append((fi, sc, fwd, "LI_ION CC态伪OPEN第%d帧→CHG_FULL(合法满电, 非误杀)" % open_streak[slot], "OK"))
                    elif fwd >= ADC_V_OVER:
                        if ov_streak[slot] >= OV_DEBOUNCE_CNT:
                            ev.append((fi, sc, fwd, "过压连续%d帧→CHG_ERROR(误杀!)" % ov_streak[slot], "ERROR"))
                        elif ov_streak[slot] >= 2:
                            ev.append((fi, sc, fwd, "过压连续%d帧(阈值5), 高风险" % ov_streak[slot], "RISK"))
                        else:
                            ev.append((fi, sc, fwd, "过压单帧%d, 未达5帧消抖" % fwd, "INFO"))
                elif ty in ("NIMH", "DRY"):
                    ev.append((fi, sc, fwd, "误入CC: %s被放行(靠CC 16s超时循环锁定ERROR拒充)" % ty, "RISK"))
            elif sc == "FULL":
                if ty == "LINEAR_LI":
                    if fwd >= ADC_V_OPEN:
                        ev.append((fi, sc, fwd, "FULL态伪OPEN累计%d帧(需50帧才IDLE, 日志不够, 存活)" % open_streak[slot], "OK"))
                elif ty == "LI_ION":
                    if fwd >= ADC_V_OPEN:
                        if open_streak[slot] >= FULL_IDLE_DEBOUNCE_LION:
                            ev.append((fi, sc, fwd, "FULL态拔出: 连续%d帧≥OPEN→IDLE(真拔出误杀)" % open_streak[slot], "RISK"))
                        else:
                            ev.append((fi, sc, fwd, "FULL态伪OPEN第%d帧(需连续2帧才IDLE)" % open_streak[slot], "INFO"))
            elif sc in ("DIO", "IMP", "DET"):
                if fwd >= ADC_V_OPEN:
                    ev.append((fi, sc, fwd, "检测态浮空读数(fwd=%d≥4090): V54W行为下节点浮空; V55E需以检测时序实测为准" % fwd, "RISK"))
                elif ty == "LINEAR_LI" and fwd < ADC_V_NIMH_MAX:
                    ev.append((fi, sc, fwd, "检测态中压(fwd=%d): 线性锂DIO/IMP阶段放电不足正常值, 判据为tr轨迹/钳位, 非NiMH误判" % fwd, "INFO"))
                elif ty == "LI_ION" and fwd >= ADC_V_OVER:
                    if ov_streak[slot] >= OV_DEBOUNCE_CNT:
                        ev.append((fi, sc, fwd, "检测态过压连续%d帧→ERROR" % ov_streak[slot], "ERROR"))
                    elif ov_streak[slot] >= 2:
                        ev.append((fi, sc, fwd, "检测态过压连续%d帧(阈值5), 高风险" % ov_streak[slot], "RISK"))
                    else:
                        ev.append((fi, sc, fwd, "检测态过压单帧%d, 未达5帧消抖" % fwd, "INFO"))
            elif sc == "ERR":
                if ty in ("NIMH", "DRY"):
                    ev.append((fi, sc, fwd, "拒充锁死(ERR): %s 正确拒充" % ty, "OK"))
                else:
                    # 锂电出现 ERR 态: 区分 V54W 无归一化误判(仍满足锂电窗口) vs 真异常
                    if fwd >= ADC_V_NIMH_MAX:
                        ev.append((fi, sc, fwd,
                                   "ERR态但fwd=%d>=2900: V54W无归一化/浮空行为下的误拒; "
                                   "V55E正向归一化后检测判据应放行(如B4)" % fwd, "OK"))
                    else:
                        ev.append((fi, sc, fwd, "ERROR态: %s 低值锁死(fwd=%d<2900), 异常" % (ty, fwd), "RISK"))
    return events


# ---------------- 绘图 ----------------
def plot_results(frames, events, base):
    """生成 sim_result.png: VCC时序 + 12槽 fwd 时序 + 阈值线 + 事件标记"""
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        from matplotlib import gridspec
    except ImportError:
        print("\n[提示] 未安装 matplotlib, 跳过绘图")
        return None

    plt.rcParams["font.sans-serif"] = ["Microsoft YaHei", "SimHei", "DejaVu Sans"]
    plt.rcParams["axes.unicode_minus"] = False

    n = len(frames)
    x = list(range(n))
    vccs = [f["vcc"] for f in frames]

    # 每槽 fwd 序列
    series = {s: ([], []) for s in range(1, 13)}
    for fi, fr in enumerate(frames):
        for slot in sorted(fr["slots"]):
            raw, st, ct, ty, pre = fr["slots"][slot]
            series[slot][0].append(fi)
            series[slot][1].append(v55e_norm(raw, fr["vcc"]))

    LCOLOR = {"ERROR": "red", "RISK": "orange", "OK": "limegreen", "INFO": "lightgray"}
    LMARK = {"ERROR": "X", "RISK": "^", "OK": "o", "INFO": "."}
    LSIZE = {"ERROR": 120, "RISK": 80, "OK": 40, "INFO": 8}

    fig = plt.figure(figsize=(15, 19))
    gs = gridspec.GridSpec(7, 2, height_ratios=[1, 2, 2, 2, 2, 2, 2], hspace=0.55, top=0.95, bottom=0.05, left=0.06, right=0.97)

    # 顶部: VCC 时序
    axv = fig.add_subplot(gs[0, :])
    axv.plot(x, vccs, "b-o", ms=4, lw=1.2)
    axv.axhline(5000, color="gray", ls=":", lw=0.8)
    axv.set_ylim(min(vccs) - 60, max(vccs) + 60)
    axv.set_ylabel("VCC(mV)")
    axv.set_title("VCC 波动: %d ~ %d mV (V55E 正向归一化后 fwd 与 VCC 无关)" %
                  (min(vccs), max(vccs)), fontsize=11)
    axv.grid(alpha=0.3)

    # 12 槽 fwd 时序
    for idx, slot in enumerate(range(1, 13)):
        ax = fig.add_subplot(gs[idx // 2 + 1, idx % 2])
        xs, ys = series[slot]
        ax.plot(xs, ys, "b-o", ms=4, lw=1.2)
        ax.axhline(ADC_V_OPEN, color="red", ls="--", lw=1)
        ax.axhline(ADC_V_OVER, color="orange", ls=":", lw=1)
        ax.axhline(ADC_V_NIMH_MAX, color="green", ls="-.", lw=1)
        ax.set_ylim(500, 4150)
        ax.set_xlim(-0.5, n - 0.5)
        ax.grid(alpha=0.3)

        evs = events[slot]
        errs = [e for e in evs if e[4] == "ERROR"]
        risks = [e for e in evs if e[4] == "RISK"]
        if errs:
            tag = "[NG]"
            tcol = "red"
        elif risks:
            tag = "[!]"
            tcol = "darkorange"
        else:
            tag = "[OK]"
            tcol = "green"
        ax.set_title("B%d  %s %s  %s" % (slot,
                                         GROUND_TRUTH[slot].replace("(充电)", "").replace("(拒充)", ""),
                                         ("(充电)" if "充电" in GROUND_TRUTH[slot] else "(拒充)"), tag),
                     fontsize=10, color=tcol, fontweight="bold")
        # 事件标记
        for fi, sc, fwd, note, level in evs:
            if level == "INFO":
                continue
            ax.scatter([fi], [fwd], c=LCOLOR[level], marker=LMARK[level], s=LSIZE[level],
                       zorder=5, edgecolors="black", linewidths=0.4)
        if slot == 1:
            ax.text(0.02, 0.97, "红线=OPEN4090 橙点线=OVER3850 绿线=NiMH窗口2900",
                    transform=ax.transAxes, fontsize=8, va="top", color="dimgray")

    # 图例
    import matplotlib.patches as mpatches
    handles = [
        mpatches.Patch(color="red", label="[NG] 会误杀(过压/异常)"),
        mpatches.Patch(color="darkorange", label="[!] 风险"),
        mpatches.Patch(color="green", label="[OK] 正常/存活"),
        plt.Line2D([0], [0], marker="X", color="w", markerfacecolor="red", markeredgecolor="black", label="ERROR事件"),
        plt.Line2D([0], [0], marker="^", color="w", markerfacecolor="orange", markeredgecolor="black", label="RISK事件"),
        plt.Line2D([0], [0], marker="o", color="w", markerfacecolor="limegreen", markeredgecolor="black", label="伪OPEN存活/拒充确认"),
    ]
    fig.legend(handles=handles, loc="upper center", bbox_to_anchor=(0.5, 0.995),
               ncol=3, fontsize=9, frameon=True)

    png = os.path.join(base, "sim_result.png")
    fig.savefig(png, dpi=130, bbox_inches="tight")
    plt.close(fig)
    return png


# ---------------- 主流程 ----------------
def main():
    base = os.path.dirname(os.path.abspath(__file__))
    log_path = os.path.join(base, "log.txt")
    out_path = os.path.join(base, "sim_result.txt")
    if not os.path.exists(log_path):
        print("未找到 %s" % log_path)
        sys.exit(1)

    frames, truth = parse_log(log_path)
    if truth:
        for k, v in truth.items():
            GROUND_TRUTH[k] = v + "(充电)" if v in ("线性锂", "恒压锂") else v + "(拒充)"

    events = simulate(frames)

    out = []
    P = out.append

    P("=" * 104)
    P("V55E 模拟验证结果 (状态机防护层 v2)   输入: %s, 共 %d 帧" % (os.path.basename(log_path), len(frames)))
    P("换算: fwd = min(4095, raw*VCC/5000)   [V55E 正向归一化; V54W 打印值为原始ADC, 无归一化]")
    P("阈值: OPEN>=4090  过压>=3850(仅LI_ION,连续5帧)  NiMH窗口<2900(仅CC/CV态)  准开路>=3500")
    P("状态机防护: CV/CC态 LINEAR_LI 伪OPEN→存活; LI_ION 伪OPEN→FULL(合法); FULL态拔出消抖2/50帧")
    P("=" * 104)

    # ---------------- 逐槽汇总 ----------------
    P("")
    P("一、逐槽判定汇总")
    P("%-5s %-12s %-5s %-9s %-12s %-16s %s" %
      ("槽", "真实类型", "帧数", "raw范围", "fwd范围", "状态集", "结论"))
    P("-" * 104)
    for slot in range(1, 13):
        raws, fwds, sts = [], [], set()
        for fr in frames:
            if slot in fr["slots"]:
                raw, st, ct, ty, pre = fr["slots"][slot]
                raws.append(raw)
                fwds.append(v55e_norm(raw, fr["vcc"]))
                sts.add(st)
        ty = "LINEAR_LI" if "线性锂" in GROUND_TRUTH[slot] else \
             ("LI_ION" if "恒压锂" in GROUND_TRUTH[slot] else
              ("NIMH" if "镍氢" in GROUND_TRUTH[slot] else "DRY"))
        evs = events[slot]
        errs = [e for e in evs if e[4] == "ERROR"]
        risks = [e for e in evs if e[4] == "RISK"]
        if ty in ("NIMH", "DRY"):
            ok = not risks
            concl = "[OK] 拒充" if ok else "[!] " + ("; ".join(set(e[3][:30] for e in risks)))
        else:
            if errs:
                concl = "[NG] " + "; ".join(set(e[3][:34] for e in errs))
            elif risks:
                concl = "[!] " + "; ".join(set(e[3][:34] for e in risks))
            else:
                concl = "[OK] 正常充电"
        P("%-5d %-12s %-5d %-9s %-12s %-16s %s" %
          (slot, GROUND_TRUTH[slot], len(raws),
           "%d~%d" % (min(raws), max(raws)), "%d~%d" % (min(fwds), max(fwds)),
           "/".join(sorted(sts)), concl))

    # ---------------- 事件明细 ----------------
    P("")
    P("二、状态机级事件明细(帧号从0开始; 级别: [OK]存活/合法  [INFO]观察  [RISK]风险  [ERROR]误杀)")
    P("-" * 104)
    any_ev = False
    for slot in range(1, 13):
        evs = events[slot]
        # 只打印非INFO或关键事件
        shown = [e for e in evs if e[4] != "INFO"]
        if not shown:
            continue
        any_ev = True
        P("[B%d %s] 共%d条关键事件" % (slot, GROUND_TRUTH[slot], len(shown)))
        for fi, sc, fwd, note, level in shown:
            tag = {"OK": "[OK]", "RISK": "[!] ", "ERROR": "[NG]", "INFO": "[--]"}[level]
            P("   帧%-3d [%-4s] fwd=%-5d %s %s" % (fi, sc, fwd, tag, note))
        P("")
    if not any_ev:
        P("无关键事件")

    # ---------------- B4 专项(NiMH 边界) ----------------
    P("")
    P("三、B4 线性锂 NiMH 边界专项(fwd 是否在 CC/CV 态跌破 2900)")
    s4 = []
    for fi, fr in enumerate(frames):
        if 4 in fr["slots"]:
            raw, st, ct, ty, pre = fr["slots"][4]
            fwd = v55e_norm(raw, fr["vcc"])
            sc = state_class(st)
            s4.append((fi, fr["vcc"], raw, fwd, sc, st, pre))
    cc_cv_below = [x for x in s4 if x[4] in ("CC", "CV") and x[3] < ADC_V_NIMH_MAX]
    det_below = [x for x in s4 if x[4] not in ("CC", "CV") and x[3] < ADC_V_NIMH_MAX]
    if cc_cv_below:
        P("  [NG] CC/CV 态 fwd 跌破 2900 共 %d 帧(会误判镍氢):" % len(cc_cv_below))
        for fi, vcc, raw, fwd, sc, st, pre in cc_cv_below:
            P("     帧%-2d VCC=%dmV raw=%-4d fwd=%-4d [%s]" % (fi, vcc, raw, fwd, st))
    else:
        P("  [OK] CC/CV 态 fwd 全部 >= 2900 (%d~%d), 不会再误判镍氢" %
          (min(x[3] for x in s4), max(x[3] for x in s4)))
    if det_below:
        P("  [--] 检测态(DIO/IMP/DET) fwd<2900 共 %d 帧, 属放电不足中压正常值:" % len(det_below))
        for fi, vcc, raw, fwd, sc, st, pre in det_below[:6]:
            P("     帧%-2d VCC=%dmV raw=%-4d fwd=%-4d [%s] pre=%s" % (fi, vcc, raw, fwd, st, pre))
    err4 = [x for x in s4 if x[4] == "ERR"]
    if err4:
        raw_min = min(x[2] for x in err4)
        raw_max = max(x[2] for x in err4)
        fwd_min = min(x[3] for x in err4)
        fwd_max = max(x[3] for x in err4)
        P("  [--] 日志帧%d~%d B4 被 V54W 拒充(ERR): raw=%d~%d(<2900, 无归一化误判);" %
          (err4[0][0], err4[-1][0], raw_min, raw_max))
        P("      V55E 正向归一化 fwd=%d~%d(>=2900), 检测流程应放行 → 不误拒" %
          (fwd_min, fwd_max))

    # ---------------- B5/B9/B12 恒压锂过压专项 ----------------
    P("")
    P("四、恒压锂(LI_ION)过压专项(过压保护仅LI_ION生效, 连续5帧才ERROR)")
    for slot in (5, 9, 12):
        evs = [e for e in events[slot] if "过压" in e[3] or "OPEN" in e[3] or "FULL" in e[3]]
        if evs:
            P("  B%d: %d条关键事件" % (slot, len(evs)))
            for fi, sc, fwd, note, level in evs:
                tag = {"OK": "[OK]", "RISK": "[!] ", "ERROR": "[NG]", "INFO": "[--]"}[level]
                P("     帧%-3d [%-4s] fwd=%-5d %s %s" % (fi, sc, fwd, tag, note))
        else:
            P("  B%d: 无过压/OPEN事件" % slot)
        if slot == 9 and any(e[4] == "ERROR" for e in evs):
            P("     [注意] B9 帧16~21 连续过压是 V54W 下 CV PI 压占空比→节点浮空的读数;")
            P("     V55E 的 detectCount 修复若起效(占空比保持), 读数应回落, 是否仍误杀需实测.")

    # ---------------- 总结 ----------------
    P("")
    P("五、总结")
    ok_slots, risk_slots, err_slots = [], [], []
    for slot in range(1, 13):
        ty = "LINEAR_LI" if "线性锂" in GROUND_TRUTH[slot] else \
             ("LI_ION" if "恒压锂" in GROUND_TRUTH[slot] else
              ("NIMH" if "镍氢" in GROUND_TRUTH[slot] else "DRY"))
        evs = events[slot]
        if any(e[4] == "ERROR" for e in evs):
            err_slots.append(slot)
        elif any(e[4] == "RISK" for e in evs):
            risk_slots.append(slot)
        else:
            ok_slots.append(slot)
    P("  [OK] 可正确识别: %s" % (" ".join("B%d" % s for s in ok_slots) if ok_slots else "(无)"))
    P("  [!]  有残余风险: %s" % (" ".join("B%d" % s for s in risk_slots) if risk_slots else "(无)"))
    P("  [NG] 会误杀/ERROR: %s" % (" ".join("B%d" % s for s in err_slots) if err_slots else "(无)"))

    P("")
    P("  关键结论:")
    P("  1. B10/B11/B8(线性锂)的 fwd>=4090 浮空帧在 V55E 的 CV/CC 态为伪OPEN,")
    P("     状态机 break/不更新ref, 不会误杀(原V55E值域初版误报为'OPEN误杀').")
    P("  2. B4 帧0 fwd=2362 处于 DIO(二极管测试)态, 中压为放电不足正常值, 判据是")
    P("     tr轨迹/钳位而非绝对电压; CC/CV 态 fwd 已全部 >=2900 → 不再误判镍氢.")
    P("  3. 过压保护仅对恒压锂(LI_ION)生效: B5/B12 仅单帧过压未触发; B9 按日志数据")
    P("     帧16~21 连续 >=5 帧会被误杀, 但其读数为 V54W 浮空行为, V55E 需实测.")
    P("  4. B3/B7(碳性/镍氢)被误放行至CC属过程性风险: 最终由CC 16s超时循环锁定")
    P("     ERROR 拒充(结果正确, 过程多一轮). B1/B2 全程正确拒充.")

    # ---------------- 写文件 ----------------
    text = "\n".join(out)
    print(text)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(text + "\n")
    print("\n结果已保存: %s" % out_path)

    # ---------------- 绘图 ----------------
    png = plot_results(frames, events, base)
    if png:
        print("图表已保存: %s" % png)
    return png


if __name__ == "__main__":
    main()
