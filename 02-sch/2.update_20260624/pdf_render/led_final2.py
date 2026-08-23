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
    out = []
    for s, n1, n2 in seg_net:
        if find(n1) == nid or find(n2) == nid:
            out.append(s)
    return out

def labels_near(x, y, tol=16.0):
    res = []
    for t in texts:
        x0,y0,x1,y1 = t["bbox"]
        cx = (x0+x1)/2; cy = (y0+y1)/2
        if abs(cx-x) < tol and abs(cy-y) < tol:
            res.append((t["text"], round(cx,1), round(cy,1)))
    return sorted(set(res))

def dump_net(nid, title):
    ss = segs_of_net(nid)
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    print("=== %s NET#%s nseg=%d bbox=(%.1f-%.1f, %.1f-%.1f) ==="
          % (title, nid, len(ss), min(xs), max(xs), min(ys), max(ys)))
    # 按 y 分组输出水平/垂直段
    vs = sorted(ss, key=lambda s: (round((s["y1"]+s["y2"])/2), round((s["x1"]+s["x2"])/2)))
    for s in vs[:60]:
        print("  (%8.2f,%8.2f) -> (%8.2f,%8.2f)" % (s["x1"], s["y1"], s["x2"], s["y2"]))
    if len(ss) > 60:
        print("  ... (%d more)" % (len(ss)-60))
    print()

# 1) LED 顶部网络 NET#2999
dump_net(2999, "LED6顶针")

# 2) R22 附近: 找 R22 与 R23 的网络
for (nm, x, y) in (("R22-top", 1103.3, 517.3), ("R22-bot", 1103.3, 510.1),
                   ("B6AD标签", 1112.1, 495.8)):
    nid = None
    best = None; bd = 4.0
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    nid = best
    if nid is not None:
        ss = segs_of_net(nid)
        xs = [v for s in ss for v in (s["x1"], s["x2"])]
        ys = [v for s in ss for v in (s["y1"], s["y2"])]
        # 网内出现的文字标签
        labs = []
        for t in texts:
            cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
            if min(xs)-16 <= cx <= max(xs)+16 and min(ys)-16 <= cy <= max(ys)+16:
                labs.append(t["text"])
        print("%-12s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) nearby=%s" %
              (nm, nid, min(xs), max(xs), min(ys), max(ys), sorted(set(labs))[:12]))
    else:
        print("%-12s -> NO NET" % nm)

# 3) R60/R59 右端网络附近文字(GND?)
for (nm, x, y) in (("R60-right", 1123.0, 598.5), ("R59-right", 1123.0, 634.0)):
    print("%s 附近标签: %s" % (nm, labels_near(x, y)))

# 4) VCC2 总线上 'VCC2' 标签 & Q8/Q11 的 D 极去向
print("\nVCC2@(524.9,589.2) 附近标签:", labels_near(524.9, 589.2))
print("VCC1@(607.7,628.8) 附近标签:", labels_near(607.7, 628.8))

# 5) Q8/Q11 全符号 dump: 找 Q8 区域(上部 y~525)的 D/S/G 引脚段
for (nm, x, y) in (("Q8-S", 440.0, 553.0), ("Q8-D", 440.0, 499.0),
                   ("Q11-S", 440.0, 690.0), ("Q11-D", 440.0, 640.0)):
    nid = None; best = None; bd = 6.0
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    if best is not None:
        ss = segs_of_net(best)
        xs = [v for s in ss for v in (s["x1"], s["x2"])]
        ys = [v for s in ss for v in (s["y1"], s["y2"])]
        print("%-8s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) segs=%d" %
              (nm, best, min(xs), max(xs), min(ys), max(ys), len(ss)))
    else:
        print("%-8s -> NO NET" % nm)
