import json, os, sys

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "b1_slot_zone.txt"), "w", encoding="utf-8")
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

# B1 槽区文本 (x280-430, y300-440)
print("=== B1 槽区文本 (x280-430, y300-440) ===")
for t in texts:
    cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
    if 280 <= cx <= 430 and 300 <= cy <= 440:
        print("  %-8s @(%7.2f,%7.2f)" % (t["text"], cx, cy))

# 追踪 B1 网标网络
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

def dump_net_near(x, y, label=""):
    best = None; bd = 9.0
    for s in segs:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is None:
        print("\n=== %s @(%g,%g): NO NET ===" % (label, x, y)); return
    ss = [s for s, n1, n2 in seg_net if find(n1) == best or find(n2) == best]
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    print("\n=== %s @(%g,%g) -> NET#%s bbox=(%.0f-%.0f, %.0f-%.0f) segs=%d ==="
          % (label, x, y, best, min(xs), max(xs), min(ys), max(ys), len(ss)))
    txs = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if min(xs)-10 <= cx <= max(xs)+10 and min(ys)-10 <= cy <= max(ys)+10:
            txs.append((round(cx,1), round(cy,1), t["text"]))
    print("   labels: %s" % sorted(txs)[:40])
    for s in ss[:45]:
        print("    (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))

dump_net_near(331.0, 339.0, "B1-net")
dump_net_near(332.0, 360.0, "DC1-near-B1")
