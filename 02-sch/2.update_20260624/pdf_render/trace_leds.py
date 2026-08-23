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

# map each node -> list of endpoints (x,y)
node_pts = {}
for s in segs:
    node_pts.setdefault(find(get_node(s["x1"], s["y1"])), []).append((s["x1"], s["y1"]))
    node_pts.setdefault(find(get_node(s["x2"], s["y2"])), []).append((s["x2"], s["y2"]))

# text spans -> (pos, text)
texts_with_pos = []
for t in texts:
    x = (t["bbox"][0]+t["bbox"][2])/2; y = (t["bbox"][1]+t["bbox"][3])/2
    texts_with_pos.append((x, y, t["text"], t["bbox"]))

def nearest_text(x, y, tol=25.0):
    best = None; bd = tol*tol
    for tx, ty, txt, bb in texts_with_pos:
        dd = (tx-x)**2 + (ty-y)**2
        if dd < bd:
            bd = dd; best = (txt, bb)
    return best

# For each LED, find nets touching endpoints within 40pt of designator
LEDs = ["LED1","LED2","LED3","LED4","LED5","LED6","LED7","LED8","LED9","LED10","LED11","LED12"]
for name in LEDs:
    t = next(t for t in texts_with_pos if t[2] == name)
    x, y = t[0], t[1]
    # collect endpoints within 40pt
    nets = {}
    for s in segs:
        for (ex, ey) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
            dd = (ex-x)**2 + (ey-y)**2
            if dd <= 40*40:
                nets.setdefault(find(get_node(ex, ey)), []).append((round(ex,1), round(ey,1)))
    print("===== %s @(%.1f,%.1f) =====" % (name, x, y))
    for net, pts in sorted(nets.items(), key=lambda kv: min(p[1] for p in kv[1])):
        # unique-ish points
        uq = sorted(set(pts))
        # find text labels near the net endpoints
        lab = set()
        for (px, py) in uq:
            nt = nearest_text(px, py)
            if nt and nt[0] != name:
                lab.add(nt[0])
        print("  NET#%s pts=%s labels_near=%s" % (net, uq[:14], sorted(lab)[:12]))
