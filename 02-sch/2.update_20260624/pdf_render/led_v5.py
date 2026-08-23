import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6  # 回到精确容差; 结构用线段本身

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

print("=== A) y=589.2±1 与 y=628.8±1 的所有水平线段 (x 395-1130) ===")
for s, n1, n2 in seg_net:
    if abs(s["y1"]-s["y2"]) < 0.01:
        y = s["y1"]; xa = min(s["x1"], s["x2"]); xb = max(s["x1"], s["x2"])
        if (abs(y-589.2) < 1.2 or abs(y-628.8) < 1.2) and 395 <= xa and xb <= 1130:
            nid = find(get_node(s["x1"], s["y1"]))
            print("y=%7.2f x %8.2f->%8.2f (len %5.1f) NET#%s" % (y, xa, xb, xb-xa, nid))

print()
print("=== B) y=589.2 / y=628.8 附近的垂直短段(连接标签到总线的竖线) ===")
for s, n1, n2 in seg_net:
    if abs(s["x1"]-s["x2"]) < 0.01:
        x = s["x1"]; ya = min(s["y1"], s["y2"]); yb = max(s["y1"], s["y2"])
        if x < 1130 and ((ya < 592 and yb > 586) or (ya < 632 and yb > 625)):
            nid = find(get_node(s["x1"], s["y1"]))
            print("x=%8.2f y %8.2f->%8.2f NET#%s" % (x, ya, yb, nid))

print()
print("=== C) Q8/Q11 全区域网络标注 (x 395-485, y 495-715): 每个网络bbox+标签 ===")
nets = {}
for s, n1, n2 in seg_net:
    mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
    if 395 <= mx <= 485 and 495 <= my <= 715:
        nid = find(get_node(s["x1"], s["y1"]))
        nets.setdefault(nid, []).append(s)
big_nets = []
for nid, ss in nets.items():
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    labs = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if 390 <= cx <= 490 and 490 <= cy <= 720:
            labs.append((t["text"], round(cx,1), round(cy,1)))
    span = max(ys)-min(ys) + max(xs)-min(xs)
    big_nets.append((span, nid, len(ss), min(xs), max(xs), min(ys), max(ys), labs))
for span, nid, n, x0, x1, y0, y1, labs in sorted(big_nets, reverse=True)[:18]:
    print("NET#%-6s segs=%3d span=%6.1f bbox=(%.1f-%.1f,%.1f-%.1f)" % (nid, n, span, x0, x1, y0, y1))
    # 区域内标签(去重)
    print("    labels=%s" % sorted(set(l for l, _, _ in labs))[:12])
