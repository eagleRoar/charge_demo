import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
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

for s in segs:
    union(get_node(s["x1"], s["y1"]), get_node(s["x2"], s["y2"]))

def dump(nid, name):
    sn = [s for s in segs if find(get_node(s["x1"],s["y1"]))==nid and find(get_node(s["x2"],s["y2"]))==nid]
    print("NET#%-6s %-14s segs=%d:" % (nid, name, len(sn)))
    for s in sn:
        print("    (%.1f,%.1f)->(%.1f,%.1f)" % (s["x1"],s["y1"],s["x2"],s["y2"]))

# IO nets & gate nets
for nid,name in [(10606,"IO1 net"),(13061,"IO2 net"),(12938,"Q8 G+R3 top"),
                 (12940,"R3 bot+Q8 S?"),(11189,"Q11 G?+R61 top"),(11191,"R61 bot"),
                 (11161,"Q11 G sym"),(12910,"Q8 G sym")]:
    dump(nid,name)
