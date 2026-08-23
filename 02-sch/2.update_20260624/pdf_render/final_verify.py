import json, os, sys

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "final_verify_out.txt"), "w", encoding="utf-8")
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

def segs_of_net(nid):
    return [s for s, n1, n2 in seg_net if find(n1) == nid or find(n2) == nid]

def net_bbox(nid):
    ss = segs_of_net(nid)
    if not ss: return None
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    return (min(xs), max(xs), min(ys), max(ys))

def labels_on_net(nid, tol=14.0):
    res = []
    for s in segs_of_net(nid):
        mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
        for t in texts:
            x0,y0,x1,y1 = t["bbox"]
            cx = (x0+x1)/2; cy = (y0+y1)/2
            if abs(cx-mx) < tol and abs(cy-my) < tol:
                res.append((t["text"], round(cx,1), round(cy,1)))
    return sorted(set(res))

def dump_region(x0, x1, y0, y1, title):
    print("=" * 10, title, "=" * 10)
    # unique segs in region
    seen = set()
    out = []
    for s in segs:
        xm = (s["x1"]+s["x2"])/2; ym = (s["y1"]+s["y2"])/2
        if x0 <= xm <= x1 and y0 <= ym <= y1:
            key = (round(s["x1"],1), round(s["y1"],1), round(s["x2"],1), round(s["y2"],1))
            if key in seen: continue
            seen.add(key)
            nid = find(get_node(s["x1"], s["y1"]))
            out.append((nid, s))
    for nid, s in sorted(out, key=lambda r: (r[0], r[1]["y1"])):
        print("NET#%-6s (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (nid, s["x1"], s["y1"], s["x2"], s["y2"]))
    print()

print("########## 1) LED6 二极管符号区原始线段 (x1060-1115, y520-600) ##########")
dump_region(1060, 1115, 520, 600, "LED6 die area")

print("########## 2) LED1 二极管符号区 (x545-610, y520-600) ##########")
dump_region(545, 610, 520, 600, "LED1 die area")

print("########## 3) LED7 二极管符号区 (x545-610, y645-720) ##########")
dump_region(545, 610, 645, 720, "LED7 die area")

print("########## 4) Q8/Q11 区 (x390-500, y470-730) 全部线段 ##########")
dump_region(390, 500, 470, 730, "Q8/Q11 zone")

print("########## 5) LED 顶针网络去向: LED6 顶针 NET 追踪 ##########")
# LED6 绿针 x1083.6 / 红针 x1105.2 顶针 y~545, 底针 y~582
for (nm, x, y) in (("LED6-绿-顶", 1083.6, 545.0), ("LED6-红-顶", 1105.2, 545.0),
                   ("LED6-绿-底", 1083.6, 582.1), ("LED6-红-底", 1105.2, 582.1)):
    # nearest segment endpoint
    best = None; bd = 4.0
    for s in segs:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is None:
        print("%-14s @(%g,%g) -> NO NET" % (nm, x, y)); continue
    bb = net_bbox(best)
    labs = labels_on_net(best)
    print("%-14s @(%g,%g) -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labels=%s"
          % (nm, x, y, best, bb[0], bb[1], bb[2], bb[3],
             [l for l in labs if len(l[0])<16][:14]))
