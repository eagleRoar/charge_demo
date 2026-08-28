#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
12槽充电器日志分析: 读取串口日志, 生成一张 12 槽合并对比长图
(各槽垂直堆叠、共享时间轴, 曲线按状态分段着色)

用法:
    python plot_log.py                     # 默认读同目录 log.txt, 输出到 charts/ 子目录
    python plot_log.py 日志文件.txt         # 指定输入文件
    python plot_log.py 日志文件.txt 输出目录 # 指定输出目录

日志格式(串口打印的每一行):
    08:26:04.205  B1=1522 [Dry/NiMH ERR] ct=30 ty=3
    08:26:04.243  B2=1201 [Dry/NiMH ERR] ct=30 ty=3
    ...

可选: 在 log.txt 末尾追加电池配置, 脚本会核对检测结果与预期是否一致,
不一致的槽位在图上标红并列出原因:
    B1 碱性
    B2 镍氢
    B3 碳性电池
    B4 线性锂电池
    ...
预期规则: 含"锂"的类型应进入充电(CC/CV); 碱性/镍氢/碳性应被拒充(ERR)
"""
import os
import re
import sys

# 向上查找本工程 pylibs(matplotlib 本地安装目录), 避免系统包冲突/沙箱限制
_BASE = os.path.dirname(os.path.abspath(__file__))
_p = _BASE
for _ in range(8):
    _c = os.path.join(_p, 'pylibs')
    if os.path.isdir(_c):
        sys.path.insert(0, _c)
        break
    _parent = os.path.dirname(_p)
    if _parent == _p:
        break
    _p = _parent

import matplotlib

matplotlib.use('Agg')  # 无GUI后端, 直接保存图片
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D

# 中文字体(Windows 常见字体), 失败则回退默认
for _f in ('Microsoft YaHei', 'SimHei', 'SimSun'):
    try:
        plt.rcParams['font.sans-serif'] = [_f]
        break
    except Exception:
        continue
plt.rcParams['axes.unicode_minus'] = False

# 匹配: 时间  B槽号=AD值 [状态] ct=xx ty=xx
LINE_RE = re.compile(r'^(\d{2}:\d{2}:\d{2}\.\d+)\s+B(\d+)=(\d+)\s+\[([^\]]+)\]')

# 匹配日志尾部的电池配置行, 如 "B1 碱性" / "B12 恒压锂电池"
# (排除日志行: 日志行含 '=', 配置行不含)
CONFIG_RE = re.compile(r'^B(\d+)\s+([^=\[]+?)\s*$')

# 匹配固件版本行: "== L1211 12CH CHARGER V51C =="
VER_RE = re.compile(r'12CH\s+CHARGER\s+(\S+)')

# 状态→颜色映射(按状态段给曲线分段着色, 直观显示状态切换时刻)
STATE_INFO = [
    ('DET', '0.60'),          # 检测(灰)
    ('IMP', 'tab:blue'),      # IMP_CHECK(蓝)
    ('DIO', 'tab:cyan'),      # 二极管测试(青)
    ('CC', 'tab:orange'),     # 恒流充电(橙)
    ('CV', 'tab:green'),      # 恒压充电(绿)
    ('ERR', 'tab:red'),       # 拒充/错误(红)
    ('FULL', 'tab:purple'),   # 充满(紫)
    ('IDLE', 'tab:brown'),    # 空闲(棕)
]

# 状态颜色图例(供各图右上角复用)
LEGEND_HANDLES = [Line2D([0], [0], color=c, lw=2.5, label=n) for n, c in STATE_INFO]


def state_color(state):
    """根据日志状态名返回绘图颜色(含ERR的状态统一红色)"""
    if 'ERR' in state:
        return 'tab:red'
    for name, color in STATE_INFO:
        if state.startswith(name):
            return color
    return '0.30'


def draw_state_curve(ax, pts):
    """按状态分段绘制曲线: 相邻两帧之间用前帧状态的颜色连线"""
    for i in range(len(pts) - 1):
        ax.plot([pts[i][0], pts[i + 1][0]], [pts[i][1], pts[i + 1][1]],
                color=state_color(pts[i][2]), linewidth=1.3,
                solid_capstyle='round')
    if pts:
        ax.plot([pts[-1][0]], [pts[-1][1]], marker='o', markersize=3,
                color=state_color(pts[-1][2]))


def parse(path):
    """解析日志, 返回 {槽号: [(相对秒, AD值, 状态), ...]}"""
    slots = {}
    t0 = None
    total = 0
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            m = LINE_RE.match(line.strip())
            if not m:
                continue
            ts, slot, adc, state = m.groups()
            hh, mm, ss = ts.split(':')
            sec = int(hh) * 3600 + int(mm) * 60 + float(ss)
            if t0 is None:
                t0 = sec
            slots.setdefault(int(slot), []).append((sec - t0, int(adc), state))
            total += 1
    return slots, total


def parse_config(path):
    """解析log.txt尾部的电池配置(如 "B1 碱性"), 返回 {槽号: 类型名}"""
    cfg = {}
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            m = CONFIG_RE.match(line.strip())
            if m:
                cfg[int(m.group(1))] = m.group(2).strip()
    return cfg


def parse_version(path):
    """解析日志中的固件版本(如 "V51C"), 找不到返回 None"""
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            m = VER_RE.search(line)
            if m:
                return m.group(1)
    return None


def judge_slot(pts, chargeable):
    """根据状态序列判定检测结果是否符合预期
    chargeable=True(锂电): 预期进入充电(CC/CV), 被拒充或一直未充电→异常
    chargeable=False(碱性/镍氢/碳性): 预期被拒充(ERR), 出现CC/CV→异常
    返回 (是否正常, 原因描述)"""
    states = [p[2] for p in pts]
    if not states:
        return True, '无数据'
    charged = any(s.startswith('CC') or s.startswith('CV') for s in states)
    final_err = 'ERR' in states[-1]
    if chargeable:
        if final_err:
            return False, '锂电被拒充'
        if not charged:
            return False, '锂电未进入充电'
        return True, '充电正常'
    else:
        if charged:
            return False, '不可充被充电'
        return True, '拒充正常'


def main():
    log = sys.argv[1] if len(sys.argv) > 1 else os.path.join(_BASE, 'log.txt')
    outdir = sys.argv[2] if len(sys.argv) > 2 else os.path.join(_BASE, 'charts')

    if not os.path.exists(log):
        print('文件不存在:', log)
        sys.exit(1)

    slots, total = parse(log)
    if not slots:
        print('未解析到 B 槽数据, 请确认日志格式:', log)
        sys.exit(1)

    os.makedirs(outdir, exist_ok=True)

    # 解析固件版本(如 V51C)与电池配置(log.txt尾部 "B1 碱性" 等)
    version = parse_version(log)
    config = parse_config(log)
    problems = {}  # 槽号 -> 原因
    for slot, name in config.items():
        if slot not in slots:
            continue
        ok, reason = judge_slot(slots[slot], '锂' in name)
        if not ok:
            problems[slot] = reason

    max_t = max(pts[-1][0] for pts in slots.values())
    print('解析完成: 共 %d 条记录, %d 槽, 时长 %.1fs' % (total, len(slots), max_t))
    if config:
        if problems:
            print('异常槽位(%d): %s' % (
                len(problems),
                '  '.join('B%d %s(%s)' % (s, config[s], r)
                          for s, r in sorted(problems.items()))))
        else:
            print('电池配置核对: 全部符合预期')

    # 合并为一张长图: 12槽垂直堆叠, 共享时间轴, 便于一次性对比
    comb = os.path.join(outdir, 'combined_adc.png')
    fig, axes = plt.subplots(len(slots), 1, figsize=(12, 2.0 * len(slots)),
                             sharex=True, squeeze=False)
    for i, slot in enumerate(sorted(slots)):
        ax = axes[i][0]
        pts = slots[slot]
        draw_state_curve(ax, pts)          # 按状态分段着色
        # y轴标签: 槽号 + 真实电池类型(来自log.txt尾部配置)
        ylbl = 'B%d %s' % (slot, config[slot]) if slot in config else 'B%d' % slot
        if slot in problems:               # 异常槽: 背景淡红 + 标签标红
            ax.axvspan(0, max_t + 1, color='red', alpha=0.12)
            ax.set_ylabel(ylbl + ' *', rotation=0, labelpad=58, fontsize=8)
            ax.yaxis.label.set_color('red')
        else:
            ax.set_ylabel(ylbl, rotation=0, labelpad=58, fontsize=8)
        ax.set_xlim(0, max_t + 1)
        ax.grid(True, alpha=0.3)
        ax.tick_params(labelbottom=(i == len(slots) - 1))
    title = ('%s | ' % version) if version else ''
    title += '各槽 ADC 值对比长图 (共 %d 条记录)' % total
    if config:
        if problems:
            title += '  异常: ' + ' '.join('B%d %s' % (s, r)
                                          for s, r in sorted(problems.items()))
        else:
            title += '  全部符合预期'
    axes[0][0].set_title(title)
    axes[0][0].legend(handles=LEGEND_HANDLES, ncol=4, fontsize=7,
                      loc='upper left', framealpha=0.5)
    axes[-1][0].set_xlabel('时间 (s)')
    fig.tight_layout()
    fig.subplots_adjust(hspace=0.15)
    fig.savefig(comb, dpi=130)
    plt.close(fig)
    print('已生成长图: %s' % os.path.abspath(comb))


if __name__ == '__main__':
    main()
