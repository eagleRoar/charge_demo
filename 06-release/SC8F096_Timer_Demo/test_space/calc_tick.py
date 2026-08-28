#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""临时: 从 log.txt 推算实际 tick 时间(主循环一轮耗时)。
方法: 对每个槽取 ct 连续单调递增(无重置)的相邻帧, 
      Δt(同槽行时间戳) / Δct = tick 时间; 打印耗时 = 帧内首行→末行时间差。
"""
import re, datetime

def ts_to_sec(s):
    h, m, sec = s.split(":")
    return int(h) * 3600 + int(m) * 60 + float(sec)

frames = []   # {t_first, t_last, slots:{slot:(t, ct, st)}}
cur = None
with open("log.txt", encoding="utf-8", errors="replace") as f:
    for line in f:
        m = re.match(r"(\d\d:\d\d:\d\d\.\d+)\s", line)
        if not m:
            continue
        t = ts_to_sec(m.group(1))
        if "VCC=" in line:
            if cur: frames.append(cur)
            cur = {"t_first": t, "slots": {}}
        mv = re.search(r"B(\d+)=(\d+).*\[([^\]]*)\].*ct=(\d+)", line)
        if mv and cur is not None:
            cur["slots"][int(mv.group(1))] = (t, int(mv.group(4)), mv.group(3).strip())
        if "NTC=" in line and cur is not None:
            cur["t_last"] = t
if cur: frames.append(cur)

print("总帧数: %d" % len(frames))
print("\n--- 帧间隔 / 帧内打印耗时 ---")
for i, fr in enumerate(frames):
    if i + 1 < len(frames):
        gap = frames[i + 1]["t_first"] - fr["t_first"]
        pr = fr.get("t_last", fr["t_first"]) - fr["t_first"]
        print("帧%d→%d: 间隔 %.3fs  帧内打印 %.3fs" % (i, i + 1, gap, pr))

print("\n--- 每槽 tick 时间(ct 连续递增的帧段) ---")
stats = []
for slot in range(1, 13):
    seq = []
    for fi, fr in enumerate(frames):
        if slot in fr["slots"]:
            t, ct, st = fr["slots"][slot]
            seq.append((fi, t, ct, st))
    # 找连续递增段
    seg = []
    prev = None
    for item in seq:
        if prev is not None and item[2] - prev[2] == 100 and prev[3] == item[3]:
            seg.append(item)
        else:
            if len(seg) >= 2:
                t0, c0 = seg[0][1], seg[0][2]
                t1, c1 = seg[-1][1], seg[-1][2]
                stats.append((slot, (t1 - t0) / (c1 - c0), seg[0][3]))
            seg = [item]
        prev = item
    if len(seg) >= 2:
        t0, c0 = seg[0][1], seg[0][2]
        t1, c1 = seg[-1][1], seg[-1][2]
        stats.append((slot, (t1 - t0) / (c1 - c0), seg[0][3]))

for slot, tick, st in sorted(stats):
    print("B%-2d 状态%-20s tick=%.2fms  (%.1f tick/s)" % (slot, st, tick * 1000, 1 / tick))

ticks = [s[1] for s in stats]
if ticks:
    t_avg = sum(ticks) / len(ticks)
    print("\n平均 tick = %.2fms → %.1f tick/s" % (t_avg * 1000, 1 / t_avg))
    print("结论: TICK_PER_SEC 建议设为 ~%d (整数)" % round(1 / t_avg))
