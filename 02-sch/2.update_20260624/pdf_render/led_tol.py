import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 2.0  # 大容差: 合并符号引脚与走线重叠

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

print("=== A) LED6 引脚网络 (TOL=2.0) ===")
for (nm, x, y) in (("绿-顶(阳极侧)", 1083.6, 545.0), ("红-顶(阳极侧)", 1105.2, 545.0),
                   ("绿-底(总线侧)", 1083.6, 585.0), ("红-底(总线侧)", 1105.2, 585.0)):
    nid = None; best = None; bd = 3.0
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is not None:
        bb = net_bbox(best)
        labs = [l for l in net_labels(best) if len(l[0])<14][:10]
        print("%-12s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labs=%s" % (nm, best, bb[0], bb[1], bb[2], bb[3], labs))
    else:
        print("%-12s -> NO NET" % nm)

print()
print("=== B) B1AD 区域完整 dump (x 540-620, y 460-545) ===")
region_segs = []
for s, n1, n2 in seg_net:
    mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
    if 540 <= mx <= 620 and 460 <= my <= 545:
        region_segs.append(s)
nets = {}
for s in region_segs:
    nid = find(get_node(s["x1"], s["y1"]))
    nets.setdefault(nid, []).append(s)
for nid in sorted(nets):
    ss = nets[nid]
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    labs = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if 534 <= cx <= 626 and 454 <= cy <= 551:
            labs.append(t["text"])
    print("NET#%-6s segs=%2d bbox=(%.1f-%.1f,%.1f-%.1f) region-labs=%s" %
          (nid, len(ss), min(xs), max(xs), min(ys), max(ys), sorted(set(labs))[:8]))
    if len(ss) <= 10:
        for s in sorted(ss, key=lambda s: (s["y1"]+s["y2"])/2):
            print("    (%8.2f,%8.2f)->(%8.2f,%8.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))

print()
print("=== C) Q8 区 VCC 与 S/D 归属 (TOL=2.0, x 395-470, y 495-600) ===")
for (nm, x, y) in (("VCC标签@460.5,589.2", 460.5, 589.2), ("Q8S标签", 456.9, 556.3),
                   ("R3-top", 406.7, 554.6), ("R3-bot", 408.5, 561.8)):
    nid = None; best = None; bd = 3.0
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is not None:
        bb = net_bbox(best)
        print("%-16s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f)" % (nm, best, bb[0], bb[1], bb[2], bb[3]))
    else:
        print("%-16s -> NO NET" % nm)

print()
print("=== D) R60/R59 右端(GND方向) (TOL=2.0, x 1115-1195, y 585-660) ===")
for (nm, x, y) in (("R60-right", 1123.0, 598.5), ("R59-right", 1123.0, 634.0),
                   ("GND@1168.3,600", 1168.3, 600.0), ("GND@1175.5,639.6", 1175.5, 639.6)):
    nid = None; best = None; bd = 3.0
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is not None:
        bb = net_bbox(best)
        labs = [l for l in net_labels(best) if len(l[0])<14][:8]
        print("%-16s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labs=%s" % (nm, best, bb[0], bb[1], bb[2], bb[3], labs))
    else:
        print("%-16s -> NO NET" % nm)
