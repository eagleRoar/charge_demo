# 追踪 CD 网络(NET#15010) 全page连接, 以及 IO1(NET#15034) 的连接
import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6
def gk(x, y): return (round(x/TOL), round(y/TOL))
cell = {}; parent = []
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

def find_net_near(x, y, r=5.0):
    bd = r*r; best = None
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    return best

def dump_net(nid, name):
    ss = [s for s, n1, n2 in seg_net if find(n1) == nid or find(n2) == nid]
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    print("=== %s NET#%s bbox=(%.0f-%.0f, %.0f-%.0f) segs=%d ===" % (name, nid, min(xs), max(xs), min(ys), max(ys), len(ss)))
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if min(xs)-10 <= cx <= max(xs)+10 and min(ys)-10 <= cy <= max(ys)+10:
            print("    label %-8s @(%7.2f,%7.2f)" % (t["text"], cx, cy))
    for s in ss[:60]:
        print("    (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))

# 左上 CD 与 IO1
dump_net(find_net_near(288.0, 200.6), "CD@left-top")
print()
dump_net(find_net_near(299.4, 200.6), "IO1@left-top")
print()
# 右下 pin4 CD
dump_net(find_net_near(723.7, 1032.1), "CD@pin4")
print()
dump_net(find_net_near(723.7, 1020.7), "IO1@pin4-col")
