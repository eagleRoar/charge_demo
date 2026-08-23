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

# collect segments, endpoints, and per-seg net
seg_net = []
for s in segs:
    n1 = get_node(s["x1"], s["y1"]); n2 = get_node(s["x2"], s["y2"])
    union(n1, n2)
    seg_net.append((s, n1, n2))

# endpoint spatial index
ep = {}
for s, n1, n2 in seg_net:
    for (nx, ny) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
        ep.setdefault(gk(nx, ny), []).append((nx, ny))

def net_of(x, y, tol=1.8):
    k = gk(x, y)
    best = None; bd = tol*tol
    r = int(tol/TOL)+1
    for dx in range(-r, r+1):
        for dy in range(-r, r+1):
            for (nx, ny) in ep.get((k[0]+dx, k[1]+dy), []):
                dd = (nx-x)**2 + (ny-y)**2
                if dd < bd:
                    bd = dd; best = find(get_node(nx, ny))
    return best

def segs_of_net(nid):
    out = []
    for s, n1, n2 in seg_net:
        if find(n1) == nid or find(n2) == nid:
            out.append(s)
    return out

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

def net_bbox(nid):
    ss = segs_of_net(nid)
    if not ss: return None
    xs = [v for s in ss for v in (s["x1"], s["x2"])]
    ys = [v for s in ss for v in (s["y1"], s["y2"])]
    return (min(xs), max(xs), min(ys), max(ys))

print("========== 1) LED6 阳极(上)/阴极(下) 走线归属 ==========")
# LED6 阴极向下并入 VCC2 总线 y=600.1; 阳极向上
for (name, x) in (("LED6-绿阳极x1083.6", 1083.6), ("LED6-红阳极x1105.2", 1105.2),
                  ("LED6-绿阴极x1083.6", 1083.6), ("LED6-红阴极x1105.2", 1105.2)):
    for y in (538.9, 582.1):
        nid = net_of(x, y)
        if nid is None:
            print("%-20s @(%.1f,%.1f) -> NO NET" % (name, x, y))
            continue
        bb = net_bbox(nid)
        labs = labels_on_net(nid)
        print("%-20s @(%.1f,%.1f) -> NET#%-6s bbox=(%.0f-%.0f, %.0f-%.0f) labels=%s"
              % (name, x, y, nid, bb[0], bb[1], bb[2], bb[3],
                 [l for l in labs if len(l[0])<16][:14]))

print()
print("========== 2) LED6 阳极区域 净垂直走线 (y<560, x in 1050-1130) ==========")
# 列出所有经过 y=500~560 且 x in 1050-1130 的线段
anode_segs = []
for s, n1, n2 in seg_net:
    xm = (s["x1"]+s["x2"])/2; ym = (s["y1"]+s["y2"])/2
    if 1050 <= xm <= 1130 and 495 <= ym <= 565:
        anode_segs.append(s)
# 去重显示
seen = set(); out = []
for s in anode_segs:
    nid = find(get_node(s["x1"], s["y1"]))
    key = nid
    if key in seen: continue
    seen.add(key)
    out.append((nid, s))
for nid, s in sorted(out):
    bb = net_bbox(nid)
    labs = labels_on_net(nid)
    print("NET#%-6s seg(%g,%g)->(%g,%g) bbox=(%.0f-%.0f,%.0f-%.0f) labels=%s"
          % (nid, s["x1"], s["y1"], s["x2"], s["y2"], bb[0], bb[1], bb[2], bb[3],
             [l for l in labs if len(l[0])<16][:12]))

print()
print("========== 3) R60 / R59 另一端(右侧) 网络归属 ==========")
# R60 text 中心约 (1116.9, 598.5); R59 中心约 (1116.9, 633.9)
# 电阻符号右侧端点在 x>1122 区域
for (name, xr, yr) in (("R60-right", 1123.0, 598.5), ("R59-right", 1123.0, 634.0),
                       ("R60-left(接VCC2bus)", 1112.4, 600.1), ("R59-left(接VCC1bus)", 1112.9, 649.5)):
    nid = net_of(xr, yr)
    if nid is None:
        print("%-24s -> NO NET" % name)
        continue
    bb = net_bbox(nid)
    labs = labels_on_net(nid)
    print("%-24s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labels=%s"
          % (name, nid, bb[0], bb[1], bb[2], bb[3], [l for l in labs if len(l[0])<16][:16]))

print()
print("========== 4) 顶部供电标签 (LED 阳极上方区域 y<540, x 500-1150) ==========")
# 找区域内所有标签文本
top_labels = []
for t in texts:
    cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
    if 500 <= cx <= 1150 and cy < 540:
        nid = net_of(cx, cy)
        top_labels.append((t["text"], round(cx,1), round(cy,1), nid))
for tt in sorted(top_labels, key=lambda r: (r[3] is None, r[1])):
    print("%-10s @(%g,%g) net=%s" % tt)
