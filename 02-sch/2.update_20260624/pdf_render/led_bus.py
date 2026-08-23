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

def labels_in_box(x0, x1, y0, y1):
    res = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if x0 <= cx <= x1 and y0 <= cy <= y1:
            res.append((t["text"], round(cx,1), round(cy,1)))
    return res

# ============ A) 长水平走线 (y 530-700, 长度>40pt) ============
print("=== A) 长水平走线 (len>40pt) 在 y=530-700 ===")
horiz = []
for s, n1, n2 in seg_net:
    if abs(s["y1"] - s["y2"]) < 0.01:
        y = s["y1"]; xa = min(s["x1"], s["x2"]); xb = max(s["x1"], s["x2"])
        if 530 <= y <= 700 and xb - xa > 40 and 390 <= (xa+xb)/2 <= 1130:
            nid = find(get_node(s["x1"], s["y1"]))
            horiz.append((y, xa, xb, nid, s))
for y, xa, xb, nid, s in sorted(horiz):
    print("y=%7.2f  x %7.2f -> %7.2f  (len %5.1f)  NET#%s" % (y, xa, xb, xb-xa, nid))

# ============ B) 各长总线的网络标签 ============
print()
print("=== B) 长总线网络标签 ===")
seen_net = set()
for y, xa, xb, nid, s in sorted(horiz):
    if nid in seen_net: continue
    seen_net.add(nid)
    ss = segs_of_net(nid)
    xs = [v for s2 in ss for v in (s2["x1"], s2["x2"])]
    ys = [v for s2 in ss for v in (s2["y1"], s2["y2"])]
    labs = labels_in_box(min(xs)-8, max(xs)+8, min(ys)-8, max(ys)+8)
    print("NET#%-6s bbox=(%.1f-%.1f, %.1f-%.1f) nseg=%d labels=%s" %
          (nid, min(xs), max(xs), min(ys), max(ys), len(ss),
           [l for l in labs if len(l[0])<14][:14]))

# ============ C) VCC/VCC1/VCC2 标签归属 ============
print()
print("=== C) 所有 VCC*/GND 标签及其网络 ===")
for t in texts:
    tt = t["text"]
    if tt in ("VCC", "VCC1", "VCC2", "GND", "VCC5V") or tt.startswith("VCC"):
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if 300 <= cx <= 1200 and 300 <= cy <= 800:
            print("%-6s @(%8.1f, %7.1f)" % (tt, cx, cy))
