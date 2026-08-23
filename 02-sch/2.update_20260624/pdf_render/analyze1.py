import json, os, math

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

TOL = 0.6  # snap tolerance (pt), schematic grid

def gk(x, y):
    return (round(x / TOL), round(y / TOL))

cell = {}   # gridkey -> node id
parent = {}

def get_node(x, y):
    k = gk(x, y)
    nid = cell.get(k)
    if nid is None:
        nid = len(parent)
        parent[nid] = nid
        cell[k] = nid
    return nid

def find(x):
    while parent[x] != x:
        parent[x] = parent[parent[x]]
        x = parent[x]
    return x

def union(a, b):
    ra, rb = find(a), find(b)
    if ra != rb:
        parent[rb] = ra

# register endpoints; union segment endpoints
pts_net = []   # (node_id, x, y) per endpoint
for s in segs:
    n1 = get_node(s["x1"], s["y1"]); n2 = get_node(s["x2"], s["y2"])
    union(n1, n2)
    pts_net.append((n1, s["x1"], s["y1"]))
    pts_net.append((n2, s["x2"], s["y2"]))

# spatial index of endpoints: gridkey -> list of (netid, x, y)
ep_cell = {}
for (n, x, y) in pts_net:
    ep_cell.setdefault(gk(x, y), []).append((find(n), x, y))

def nearest_net(x, y, tol=8.0):
    kx, ky = gk(x, y)
    best = None; bd = tol * tol
    for dx in range(-int(tol/TOL)-1, int(tol/TOL)+2):
        for dy in range(-int(tol/TOL)-1, int(tol/TOL)+2):
            for (nid, ex, ey) in ep_cell.get((kx+dx, ky+dy), []):
                dd = (ex-x)**2 + (ey-y)**2
                if dd < bd:
                    bd = dd; best = nid
    return best

net_labels = {}
for t in texts:
    x = (t["bbox"][0] + t["bbox"][2]) / 2
    y = (t["bbox"][1] + t["bbox"][3]) / 2
    nid = nearest_net(x, y)
    net_labels.setdefault(nid, []).append({"text": t["text"], "x": x, "y": y, "bbox": t["bbox"]})

import re
rx = re.compile(r"(LED|IO|VCC|GND|CD|CLK|DAT|EN|VBUS|5V|B[0-9]+AD|VT_PWM|PWMA|PWMD|RA[0-7]|RB[0-7]|RC[0-7]|RD[0-7]|AN[0-9]+|NTC)", re.I)
out = []
for nid, labs in net_labels.items():
    names = [L["text"] for L in labs]
    if any(rx.search(n) for n in names):
        out.append((nid, names, labs))

with open(os.path.join(OUT, "nets_led.txt"), "w", encoding="utf-8") as f:
    for nid, names, labs in sorted(out, key=lambda r: min(len(x) for x in r[1])):
        f.write("NET#%s: %s\n" % (nid, " | ".join(sorted(set(names), key=len))))
        for L in labs:
            f.write("    '%s' @(%s,%s)\n" % (L["text"], L["x"], L["y"]))
print("nets dumped:", len(out))
