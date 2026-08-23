import json, os, sys

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "cd_zone.txt"), "w", encoding="utf-8")
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

# 1) CD/IO1 标签附近文本(左上 x250-320, y170-230 与 右下 x680-740, y1000-1070)
print("=== 左上区文本 (x240-330, y165-235) ===")
for t in texts:
    cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
    if 240 <= cx <= 330 and 165 <= cy <= 235:
        print("  %-8s @(%7.2f,%7.2f) size=%g" % (t["text"], cx, cy, t.get("size", 0)))

print()
print("=== 右下区文本 (x660-760, y990-1080) ===")
for t in texts:
    cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
    if 660 <= cx <= 760 and 990 <= cy <= 1080:
        print("  %-8s @(%7.2f,%7.2f) size=%g" % (t["text"], cx, cy, t.get("size", 0)))

# 2) CD 标签网络的线段(左上 @288,200)
def dump_net_near(x, y, r=30, label=""):
    # 找最近端点所属网络
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
    for s in ss[:60]:
        print("    (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))

dump_net_near(288.0, 200.585, 30, "CD@left-top")
dump_net_near(299.375, 200.585, 30, "IO1@left-top")
dump_net_near(723.665, 1032.12, 30, "CD@right-bottom")

# 3) CD 网络附近的元件文本(搜索该网络 bbox 内的文本)
print()
print("=== 全页 'CD' 标签上下文 ===")
for t in texts:
    if t["text"] == "CD":
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        print("  'CD' @(%7.2f,%7.2f)" % (cx, cy))
