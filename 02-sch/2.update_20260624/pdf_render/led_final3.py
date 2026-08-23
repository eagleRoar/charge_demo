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

def dump_region(x0, x1, y0, y1, title):
    print("===== %s (x %d-%d, y %d-%d) =====" % (title, x0, x1, y0, y1))
    nets = {}
    for s, n1, n2 in seg_net:
        mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
        if x0 <= mx <= x1 and y0 <= my <= y1:
            nid = find(get_node(s["x1"], s["y1"]))
            nets.setdefault(nid, []).append(s)
    for nid in sorted(nets):
        ss = nets[nid]
        xs = [v for s in ss for v in (s["x1"], s["x2"])]
        ys = [v for s in ss for v in (s["y1"], s["y2"])]
        # labels inside region
        labs = []
        for t in texts:
            cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
            if x0-6 <= cx <= x1+6 and y0-6 <= cy <= y1+6:
                labs.append(t["text"])
        print("NET#%-6s segs=%3d bbox=(%.1f-%.1f,%.1f-%.1f) labels=%s" %
              (nid, len(ss), min(xs), max(xs), min(ys), max(ys),
               sorted(set(labs))[:10]))
        if len(ss) <= 12:
            for s in sorted(ss, key=lambda s: (s["y1"]+s["y2"])/2):
                print("    (%8.2f,%8.2f)->(%8.2f,%8.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))
    print()

# 1) R22 区域: 找 R22 本体与终端网络
dump_region(1085, 1115, 498, 545, "R22/B6AD分压区")
# 2) LED7 (左下) 区域
dump_region(540, 640, 620, 700, "LED7区")
# 3) Q8/Q11 区域 (x 400-490, y 480-710)
dump_region(395, 495, 480, 710, "Q8/Q11区")
