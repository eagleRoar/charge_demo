# 完整MCU引脚映射: 从每个AN标签追踪到整条网络, 收集全部信号标签
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

def find_net_near(x, y, r=5.0):
    bd = r*r; best = None
    for s, n1, n2 in seg_net:
        for (px, py) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (px-x)**2 + (py-y)**2
            if dd < bd:
                bd = dd; best = find(get_node(px, py))
    return best

def net_labels(nid, tol=16.0):
    bb = net_bbox(nid)
    res = []
    for t in texts:
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        if bb and min(bb[0],bb[2])-tol <= cx <= max(bb[0],bb[2])+tol and \
           min(bb[1],bb[3])-tol <= cy <= max(bb[1],bb[3])+tol:
            res.append((t["text"], round(cx,1), round(cy,1)))
    return sorted(set(res))

# MCU引脚: AN标签位置
pins = {
    "AN0/RA0": (0,0), "AN1/RA1": (0,0), "AN2/RA2": (0,0), "AN3/RA3": (0,0),
    "AN4/RA4": (0,0), "AN5/RA5": (0,0), "AN6/RA6": (0,0), "AN7/RA7": (705.5, 913.3),
    "AN8/RB0": (781.2, 934.8), "AN9/RB1": (781.2, 942.0), "AN10/RB2": (779.5, 949.2),
    "AN11/RB3": (779.5, 956.4), "AN12/RB4": (779.5, 963.6), "AN13/RB5": (779.5, 970.8),
    "AN14/RB6": (779.5, 978.0), "AN15/RB7": (755.9, 987.8),
    "AN16/RC0": (748.7, 987.8), "AN17/RC1": (741.5, 987.8), "AN18/RC2": (734.3, 987.8),
    "AN19/RC3": (727.1, 987.8), "AN20/RC4": (719.9, 987.8), "AN21/RC5": (712.7, 987.8),
    "AN22/RD0": (712.7, 915.0), "AN23/RD1": (719.9, 915.0), "AN24/RD2": (727.1, 915.0),
    "AN25/RD3": (734.3, 915.0), "AN26/RD4": (741.5, 915.0), "AN27/RD5": (748.7, 915.0),
    "AN28/RD6": (755.9, 915.0), "AN29/RD7": (779.5, 927.6),
}

print("=== 全引脚 → 网络 → 信号标签 ===")
for name, (x, y) in pins.items():
    if x == 0 and y == 0:
        # 左侧引脚未定位, 搜索AN0-AN6文本
        continue
    nid = find_net_near(x, y)
    if nid is None:
        print("%-10s @(%g,%g): NO NET" % (name, x, y)); continue
    bb = net_bbox(nid)
    labs = net_labels(nid)
    sig = [l for l in labs if l[0] not in ("AN0","AN1","AN2","AN3","AN4","AN5","AN6",
           "AN7","AN8","AN9","AN10","AN11","AN12","AN13","AN14","AN15",
           "AN16","AN17","AN18","AN19","AN20","AN21","AN22","AN23","AN24",
           "AN25","AN26","AN27","AN28","AN29","VDD","VSS","GND","1","2","3",
           "4","5","6","7","8","9","10","11","12","13","14","15","16","17","18",
           "19","20","21","22","23","24","25","26","27","28","29","30","31","32",
           "MCLR","ICSP","VPP","PGD","PGC","RA0","RA1","RA2","RA3","RA4","RA5",
           "RA6","RA7","RB0","RB1","RB2","RB3","RB4","RB5","RB6","RB7",
           "RC0","RC1","RC2","RC3","RC4","RC5","RD0","RD1","RD2","RD3","RD4",
           "RD5","RD6","RD7","SC8F096","AD832","U1","U2","Q1","Q2","Q3","Q4",
           "Q5","Q6","Q7","Q8","Q9","Q10","Q11","Q12","Q13","Q14","R1","R2",
           "R3","R4","R5","R6","R7","R8","R9","R10","R11","R12","R13","R14",
           "R15","R16","R17","R18","R19","R20","R21","R22","R23","R24","R25",
           "R26","R27","R28","R29","R30","R31","R32","R33","R34","R35","R36",
           "R37","R38","R39","R40","R41","R42","R43","R44","R45","R46","R47",
           "R48","R49","R50","R51","R52","R53","R54","R55","R56","R57","R58",
           "R59","R60","R61","R62","R63","R64","R65","R66","C1","C2","C3","C4",
           "C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","D1","D2",
           "D3","D4","D5","D6","D7","D8","D9","D10","D11","D12","D13","D14",
           "L1","L2","J1","J2","J3","J4","J5","J6","P1","P2","P3","P4","P5",
           "P6","JP1","JP2","JP3","SW1","F1","F2","Q8","Q11") and l[0] != "5.1k" and l[0] != "1K,1%" and l[0] != "104" and l[0] != "0.2R"]
    print("%-10s -> NET#%-6s bbox=(%.0f-%.0f,%.0f-%.0f)" % (name, nid, bb[0], bb[1], bb[2], bb[3]))
    for l in sig[:20]:
        print("      label %-8s @(%7.2f,%7.2f)" % l)
    if not sig:
        print("      (无信号标签, 仅有: %s)" % [l[0] for l in labs][:12])

# 左侧引脚 AN0-AN6 位置搜索
print()
print("=== AN0~AN6 文本位置 ===")
for t in texts:
    if t["text"] in ("AN0","AN1","AN2","AN3","AN4","AN5","AN6"):
        cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
        print("  %s @(%7.2f,%7.2f)" % (t["text"], cx, cy))
