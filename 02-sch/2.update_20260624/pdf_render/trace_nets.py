import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6
cell = {}; parent = {}
def gk(x, y): return (round(x/TOL), round(y/TOL))
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

for s in segs:
    n1 = get_node(s["x1"], s["y1"]); n2 = get_node(s["x2"], s["y2"])
    union(n1, n2)

# endpoint index
ep = {}
for s in segs:
    for (nx, ny) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
        ep.setdefault(gk(nx, ny), []).append((nx, ny))

def net_of(x, y):
    # nearest endpoint within tol*2
    k = gk(x, y)
    best = None; bd = (TOL*3)**2
    for dx in (-1,0,1):
        for dy in (-1,0,1):
            for (nx, ny) in ep.get((k[0]+dx, k[1]+dy), []):
                dd = (nx-x)**2 + (ny-y)**2
                if dd < bd:
                    bd = dd; best = find(get_node(nx, ny))
    return best

# find text labels near given net's segments
def labels_on_net(nid, tol=14.0):
    res = []
    for s in segs:
        n1 = find(get_node(s["x1"], s["y1"])); n2 = find(get_node(s["x2"], s["y2"]))
        if n1 != nid and n2 != nid:
            continue
        mx = (s["x1"]+s["x2"])/2; my = (s["y1"]+s["y2"])/2
        for t in texts:
            x0,y0,x1,y1 = t["bbox"]
            cx = (x0+x1)/2; cy = (y0+y1)/2
            if abs(cx-mx) < tol and abs(cy-my) < tol:
                res.append(t["text"])
    return sorted(set(res))

# report nets of key points
points = {
    "R11-top(~567,510)": (566.9, 510.1),
    "R11-bot(~567,539)": (566.9, 538.9),
    "R12-top": (678.5, 510.1),
    "R13-top": (800.9, 510.1),
    "R8-top": (907.1, 510.1),
    "R17-top": (998.9, 510.1),
    "R22-top": (1103.3, 510.1),
    "R14-top(~567,690)": (566.9, 689.0),
    "R16-top": (678.5, 689.0),
    "R24-top": (800.9, 689.0),
    "R27-top": (908.9, 689.0),
    "R28-top": (998.9, 689.0),
    "R33-top": (1103.3, 689.0),
    "R60-left": (1112.4, 600.1),
    "R59-left": (1112.9, 649.5),
    "Q8-G(net IO2)": (433.0, 540.0),
    "Q11-G(net IO1)": (433.0, 680.0),
    "LEDVCC2bus@589": (524.9, 589.2),
    "LEDVCC1bus@629": (607.7, 628.8),
}
for name, (x, y) in points.items():
    nid = net_of(x, y)
    if nid is None:
        print("%-22s -> NO NET" % name)
        continue
    labs = labels_on_net(nid)
    print("%-22s -> NET#%-6s labels=%s" % (name, nid, [l for l in labs if len(l)<16][:16]))

print()
print("== labels per BxAD-net ==")
for i in range(1, 13):
    t = next((t for t in texts if t["text"] == "B%dAD" % i), None)
    if not t: continue
    x = (t["bbox"][0]+t["bbox"][2])/2; y = (t["bbox"][1]+t["bbox"][3])/2
    nid = net_of(x, y)
    labs = labels_on_net(nid) if nid is not None else []
    print("B%dAD @(%g,%g) NET#%s labels=%s" % (i, x, y, nid, [l for l in labs if len(l)<16][:20]))
