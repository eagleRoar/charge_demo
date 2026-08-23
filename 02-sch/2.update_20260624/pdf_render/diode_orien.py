import json, os, sys

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "diode_orien.txt"), "w", encoding="utf-8")
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

# 分析 LED6 的绿(NET#3015/3017)与红(NET#3002/3004)二极管三角形的顶点朝向
# 判定: 三角形3段 + 阴极条1段。顶点y最小者=朝上。
def triangle_info(nid):
    ss = segs_of_net(nid)
    # 收集所有端点
    pts = []
    for s in ss:
        pts.append((round(s["x1"],2), round(s["y1"],2)))
        pts.append((round(s["x2"],2), round(s["y2"],2)))
    pts = sorted(set(pts))
    ys = sorted(set(p[1] for p in pts))
    # 找阴极条: 水平段 (两个端点y相同, 且是某三角形的短边)
    bars = []
    for s in ss:
        if abs(s["y1"]-s["y2"]) < 0.01 and abs(s["x2"]-s["x1"]) > 1.0:
            bars.append((round(s["x1"],2), round(s["x2"],2), round(s["y1"],2)))
    return nid, pts, bars

for nm, nid in (("LED6-绿", 3015), ("LED6-绿-bar", 3017), ("LED6-红", 3002), ("LED6-红-bar", 3004),
                ("LED1-绿", 10209), ("LED1-绿-bar", 10211), ("LED1-红", None)):
    if nid is None:
        print("=== %s: (红三角形需另找) ===" % nm); continue
    n, pts, bars = triangle_info(nid)
    ys = sorted(set(p[1] for p in pts))
    print("=== %s NET#%s 端点=%s 阴极条=%s" % (nm, n, pts, bars))

# LED1 红二极管: 从 NET#10206 区找 x568.8 附近的三角形
# 之前 NET#10209/10211 是 LED1 的绿(x562-566), 红应在 x 更大处或同 x 不同y
print()
print("=== LED1 区所有独立小网络(绿x562-566, 检查红) ===")
for s in segs:
    xm = (s["x1"]+s["x2"])/2; ym = (s["y1"]+s["y2"])/2
    if 560 <= xm <= 576 and 560 <= ym <= 578:
        nid = find(get_node(s["x1"], s["y1"]))
        print("NET#%-6s (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (nid, s["x1"], s["y1"], s["x2"], s["y2"]))
