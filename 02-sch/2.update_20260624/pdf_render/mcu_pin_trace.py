# 追踪MCU右下引脚区: 从各AN标签位置向下(或沿线段)追踪到信号标签(DAT/CLK/CD/IO1/IO2/LED)
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

def find_net_near(x, y, r=5.0):
    bd = r*r; best = None
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    return best

# MCU引脚区: AN标签位置 (x, y) -> 引脚名
pins = {
    "AN21": (712.70, 987.825), "AN20": (719.90, 987.825), "AN19": (727.10, 987.825),
    "AN18": (734.30, 987.825), "AN17": (741.50, 987.825), "AN16": (748.70, 987.825),
    "AN15": (755.90, 987.825), "AN22": (712.70, 914.995), "AN23": (719.90, 914.995),
    "AN24": (727.10, 914.995), "AN25": (734.30, 914.995), "AN26": (741.50, 914.995),
    "AN27": (748.70, 914.995), "AN28": (755.90, 914.995), "AN14": (779.53, 978.025),
    "AN13": (779.53, 970.825), "AN12": (779.53, 963.625), "AN11": (779.53, 956.425),
    "AN10": (779.53, 949.225), "AN29": (779.53, 927.625),
}

print("=== MCU引脚 -> 网络归属 ===")
for name, (x, y) in pins.items():
    nid = find_net_near(x, y)
    if nid is None:
        print("%-6s @(%g,%g): NO NET" % (name, x, y)); continue
    bb = net_bbox(nid)
    labs = net_labels(nid)
    short = [l for l in labs if len(l[0]) < 14]
    print("%-6s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labels=%s" %
          (name, nid, bb[0], bb[1], bb[2], bb[3], short[:14]))

print()
print("=== 底部信号标签区(连接器y1007-1060) 各标签归属 ===")
sig = {
    "pin2": (709.54, 1007.21), "pin3": (716.74, 1007.21), "pin4": (723.93, 1007.21),
    "DAT@1027": (709.265, 1027.41), "IO1@1043": (709.265, 1043.375), "LED@1056": (709.265, 1056.035),
    "CLK@1027": (716.465, 1027.065), "IO2@1047": (716.465, 1046.975), "LED@1060": (716.465, 1059.635),
    "IO1@1021": (723.665, 1020.745), "CD@1032": (723.665, 1032.12),
    "B1AD@1032": (738.065, 1032.355), "NTC@1031": (730.865, 1030.665),
    "B2AD@1032": (745.265, 1032.355), "VT_PWM1@1034": (752.465, 1033.815),
}
for name, (x, y) in sig.items():
    nid = find_net_near(x, y, 6.0)
    if nid is None:
        print("%-12s @(%g,%g): NO NET" % (name, x, y)); continue
    bb = net_bbox(nid)
    labs = net_labels(nid)
    short = [l for l in labs if len(l[0]) < 14]
    print("%-12s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f) labels=%s" %
          (name, nid, bb[0], bb[1], bb[2], bb[3], short[:14]))
