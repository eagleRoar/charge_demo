import json, os, sys

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "led_cd_map.txt"), "w", encoding="utf-8")
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6
cell = {}; parent = []
def gk(x, y): return (round(x/TOL), round(y/TOL))
def get_node(x, y):
    k = gk(x, y)
    n = cell.get(k)
    if n is None:
        n = len(parent); parent.append(n); cell[k] = n
    return n
def find(x):
    while parent[x] != x:
        parent[x] = parent[parent[x]]; x = parent[x]
    return x
def union(a, b):
    ra, rb = find(a), find(b)
    if ra != rb: parent[rb] = ra

seg_net = []
for s in segs:
    n1 = get_node(s["x1"], s["y1"]); n2 = get_node(s["x2"], s["y2"])
    union(n1, n2)
    seg_net.append((s, n1, n2))

def dump_net_near(x, y, r=40, label=""):
    best = None; bd = 9.0
    for s in segs:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is None:
        print("=== %s @(%g,%g): NO NET ===" % (label, x, y)); return
    ss = [s for s, n1, n2 in seg_net if find(n1) == best or find(n2) == best]
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    print("=== %s @(%g,%g) -> NET#%s bbox=(%.0f-%.0f, %.0f-%.0f) segs=%d ==="
          % (label, x, y, best, min(xs), max(xs), min(ys), max(ys), len(ss)))
    # 区域内文本
    txs = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if min(xs)-8 <= cx <= max(xs)+8 and min(ys)-8 <= cy <= max(ys)+8:
            txs.append((round(cx,1), round(cy,1), t["text"]))
    print("   labels: %s" % sorted(txs)[:40])
    for s in ss[:40]:
        print("    (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))

# 1) 左上区 CD IO1 网络(CD@284.4,197.93 / IO1@294.92,197.93)
dump_net_near(288.0, 200.585, 40, "CD IO1@left-top")
# 2) Q8/Q11 栅极区: IO2@(412.49,525.36) IO1@(408.89,665.76)
dump_net_near(412.49, 525.36, 40, "IO2@Q8-area")
dump_net_near(408.89, 665.76, 40, "IO1@Q11-area")
# 3) 右下引脚排: 引脚2=DAT/IO1/LED(709.26,1027-1056) 引脚3=CLK/IO2/LED(716.46) 引脚4=CD/IO1(723.66)
dump_net_near(709.26, 1043.0, 40, "pin2-DAT-LED_IO1")
dump_net_near(716.46, 1047.0, 40, "pin3-CLK-LED_IO2")
dump_net_near(723.66, 1028.0, 40, "pin4-CD_IO1")
# 4) 中间 CLK/DAT @(817.2,1050) 与 @(946.8,920)
dump_net_near(817.2, 1050.0, 40, "CLK/DAT@817")
dump_net_near(946.8, 920.0, 40, "CLK/DAT@946")

# 5) 全页 'CD' 与 'IO1'/'IO2' 上下文汇总
print("\n=== 全页相关标签 ===")
for t in texts:
    if t["text"] in ("CD", "IO1", "IO2", "DAT", "CLK", "VCC1", "VCC2", "LED"):
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        print("  %-5s @(%7.2f,%7.2f)" % (t["text"], cx, cy))
