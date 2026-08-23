import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 2.5

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

def net_labels(nid, tol=13.0):
    res = []
    for s in segs_of_net(nid):
        mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
        for t in texts:
            cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
            if abs(cx-mx) < tol and abs(cy-my) < tol:
                res.append((t["text"], round(cx,1), round(cy,1)))
    return sorted(set(res))

def probe(x, y, name, bd=3.0):
    best = None; bd2 = bd*bd
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd2:
                bd2 = dd; best = find(get_node(px, py))
    if best is not None:
        bb = net_bbox(best)
        labs = [l for l in net_labels(best) if len(l[0])<14][:12]
        print("%-24s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labs=%s" %
              (name, best, bb[0], bb[1], bb[2], bb[3], labs))
    else:
        print("%-24s -> NO NET" % name)
    return best

print("### 1) B1AD 链: B1AD标签->R_x->线->R11->线->LED1顶针 ###")
probe(575.7, 499.4, "B1AD标签")
probe(558.0, 510.0, "B1AD下走线(x558)")
probe(558.0, 528.0, "R11体中心(x558)")
probe(558.0, 542.5, "W2(x558,y542.5)")
probe(568.8, 545.0, "LED1顶针(x568.8)")
probe(568.8, 585.0, "LED1底针(x568.8)")

print()
print("### 2) 关键全局探针 ###")
probe(524.9, 589.2, "VCC2标签")
probe(607.7, 628.8, "VCC1标签")
probe(1116.9, 598.5, "R60中心")
probe(1116.9, 634.0, "R59中心")
probe(1168.3, 600.0, "R60旁GND标签")
probe(1175.5, 639.6, "R59旁GND标签")
probe(406.7, 554.6, "R3(R3标签区)")
probe(460.5, 589.2, "VCC标签(上)")
probe(460.5, 726.0, "VCC标签(下)")
probe(467.3, 646.8, "VCC1标签(下)")
probe(467.3, 506.4, "VCC2标签(上)")

print()
print("### 3) LED6 四端 ###")
probe(1083.6, 545.0, "LED6绿顶")
probe(1083.6, 590.0, "LED6绿底")
probe(1105.2, 545.0, "LED6红顶")
probe(1105.2, 590.0, "LED6红底")

print()
print("### 4) Q8/Q11 栅源漏 (TOL=2.5, 大搜索) ###")
for (nm, x, y, r) in (("Q8.G", 436.0, 533.0, 8.0), ("Q8.S", 456.9, 556.3, 8.0),
                      ("Q8.D", 460.8, 510.0, 8.0),
                      ("Q11.G", 436.0, 673.0, 8.0), ("Q11.S", 456.9, 695.0, 8.0),
                      ("Q11.D", 460.8, 650.0, 8.0)):
    probe(nm, x, y, bd=r)
