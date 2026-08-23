import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6

def gk(x, y): return (round(x/TOL), round(y/TOL))

cell = {}; parent = {}
def get_node(x, y):
    k = gk(x, y)
    n = cell.get(k)
    if n is None:
        n = len(parent); parent[n] = n; cell[k] = n
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

def segs_of_net(nid):
    return [s for s, n1, n2 in seg_net if find(n1) == nid or find(n2) == nid]

def net_bbox(nid):
    ss = segs_of_net(nid)
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    return (min(xs), max(xs), min(ys), max(ys)) if ss else None

def net_labels(nid, tol=14.0):
    res = []
    for s in segs_of_net(nid):
        mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
        for t in texts:
            cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
            if abs(cx-mx) < tol and abs(cy-my) < tol:
                res.append((t["text"], round(cx,1), round(cy,1)))
    return sorted(set(res))

# 1) 检查 y=531.72 附近的所有短水平线 (LED顶针死端区)
print("=== 1) y=531.7±1 水平短线 (x 500-1130) ===")
for s, n1, n2 in seg_net:
    if abs(s["y1"]-s["y2"]) < 0.01 and 530.7 <= s["y1"] <= 532.7 and 500 <= (s["x1"]+s["x2"])/2 <= 1130:
        print("  y=%g x %g->%g NET#%s" % (s["y1"], s["x1"], s["x2"], find(get_node(s["x1"], s["y1"]))))

# 2) 所有 LED 符号引脚网络归属: LED标签位置 -> 找其上下引脚
print()
print("=== 2) 每个 LED 的两引脚网络归属 ===")
leds = [t for t in texts if len(t["text"])==4 and t["text"].startswith("LED")]
for t in leds:
    name = t["text"]
    x = (t["bbox"][0]+t["bbox"][2])/2; y = (t["bbox"][1]+t["bbox"][3])/2
    # 找该LED符号的二极管三角形顶点 (x±10, y±8) 内的 2P 符号
    # 直接: 找 x 处 ±30pt 内的垂直 pin stub
    pins = []
    for s, n1, n2 in seg_net:
        if s["x1"] == s["x2"] and abs(s["x1"] - x) < 30:
            y0 = min(s["y1"], s["y2"]); y1 = max(s["y1"], s["y2"])
            if y0 < y+20 and y1 > y-20 and (y1-y0) > 2:
                nid = find(get_node(s["x1"], s["y1"]))
                pins.append((s["x1"], y0, y1, nid))
    # 去重
    uniq = []
    for p in pins:
        if not any(abs(p[0]-q[0])<0.5 and abs(p[1]-q[1])<0.5 and abs(p[2]-q[2])<0.5 for q in uniq):
            uniq.append(p)
    print("%s @(%g,%g):" % (name, x, y))
    for px, y0, y1, nid in sorted(uniq, key=lambda p: p[0]):
        bb = net_bbox(nid)
        labs = net_labels(nid)
        print("    pin x=%g y %g-%g -> NET#%s bbox=(%.0f-%.0f,%.0f-%.0f) labs=%s" %
              (px, y0, y1, nid, bb[0], bb[1], bb[2], bb[3],
               [l for l in labs if len(l[0])<14][:8]))

# 3) R60/R59 右端与 GND 之间的走线
print()
print("=== 3) R60/R59 右端至 GND 走线 (x 1115-1190, y 585-655) ===")
for s, n1, n2 in seg_net:
    mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
    if 1115 <= mx <= 1190 and 585 <= my <= 655:
        print("  (%8.2f,%8.2f)->(%8.2f,%8.2f) NET#%s" %
              (s["x1"], s["y1"], s["x2"], s["y2"], find(get_node(s["x1"], s["y1"]))))

# 4) VCC 电源符号段 (Q8/Q11 附近, x 390-470)
print()
print("=== 4) Q8/Q11 附近 VCC 电源符号段 (x 390-470, y 495-735) ===")
for s, n1, n2 in seg_net:
    mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
    if 390 <= mx <= 470 and 495 <= my <= 735:
        nid = find(get_node(s["x1"], s["y1"]))
        # 只打印不在 LED 总线上的 (排除 bbox 超过 1200)
        print("  (%8.2f,%8.2f)->(%8.2f,%8.2f) NET#%s" %
              (s["x1"], s["y1"], s["x2"], s["y2"], nid))
