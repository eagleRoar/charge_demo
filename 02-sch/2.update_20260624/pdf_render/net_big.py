import json, os
from collections import Counter

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

def labels_near(x, y, tol=16.0):
    out = []
    for t in texts:
        x0,y0,x1,y1 = t["bbox"]; cx=(x0+x1)/2; cy=(y0+y1)/2
        if abs(cx-x) < tol and abs(cy-y) < tol:
            out.append(t["text"])
    return out

def dump_net(nid, name="", segs_limit=60, lab_tol=18.0):
    sn = [s for s in segs if find(get_node(s["x1"], s["y1"]))==nid or find(get_node(s["x2"], s["y2"]))==nid]
    xs=[s["x1"] for s in sn]+[s["x2"] for s in sn]
    ys=[s["y1"] for s in sn]+[s["y2"] for s in sn]
    pts=[]
    for s in sn:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if (round(px/4),round(py/4)) not in [(round(a/4),round(b/4)) for (a,b) in pts]:
                pts.append((round(px,1),round(py,1)))
    labs=set()
    for (px,py) in pts:
        for l in labels_near(px,py,lab_tol):
            if len(l)<18: labs.add(l)
    print("NET#%-6s %-18s segs=%3d x=[%7.1f,%7.1f] y=[%7.1f,%7.1f]" % (nid,name,len(sn),min(xs),max(xs),min(ys),max(ys)))
    print("    pts(%d): %s" % (len(pts), pts[:segs_limit]))
    print("    labels: %s" % sorted(labs))

# ============ PART A: biggest nets in LED region ============
print("=== PART A: big nets in LED region (x 380-1180, y 430-730) ===")
x0,y0,x1,y1 = 380,430,1180,730
cnt = Counter()
bbox = {}
for s in segs:
    if not (x0<=s["x1"]<=x1 and y0<=s["y1"]<=y1 and x0<=s["x2"]<=x1 and y0<=s["y2"]<=y1):
        continue
    n1 = find(get_node(s["x1"],s["y1"]))
    if n1 == find(get_node(s["x2"],s["y2"])):
        cnt[n1]+=1
        b = bbox.setdefault(n1,[9999,9999,-9999,-9999])
        b[0]=min(b[0],s["x1"]); b[1]=min(b[1],s["y1"]); b[2]=max(b[2],s["x2"]); b[3]=max(b[3],s["y2"])
for nid, c in cnt.most_common(30):
    if c < 4: continue
    b = bbox[nid]
    labs=set()
    for (px,py) in [(b[0],b[1]),(b[2],b[3])]:
        pass
    # collect labels from a coarse scan of segment midpoints
    for s in segs:
        if find(get_node(s["x1"],s["y1"]))==nid:
            for l in labels_near((s["x1"]+s["x2"])/2,(s["y1"]+s["y2"])/2,14):
                if len(l)<18: labs.add(l)
    print("NET#%-6s segs=%3d bbox=[%7.1f,%7.1f,%7.1f,%7.1f] labels=%s" % (nid,c,b[0],b[1],b[2],b[3],sorted(labs)[:18]))

# ============ PART B: Q8/Q11 pins external trace ============
print("\n=== PART B: Q8/Q11 pin nets (trace wires leaving body) ===")
def trace_pin(px, py, nid, max_steps=200):
    # follow the net from the pin point, collecting segments and endpoints
    seen=set([nid]); pts=[]
    q=[s for s in segs if find(get_node(s["x1"],s["y1"]))==nid or find(get_node(s["x2"],s["y2"]))==nid]
    while q and len(seen)<max_steps:
        s=q.pop()
        for (ax,ay,bx,by) in ((s["x1"],s["y1"],s["x2"],s["y2"]),(s["x2"],s["y2"],s["x1"],s["y1"])):
            na=find(get_node(ax,ay)); nb=find(get_node(bx,by))
            if na not in seen or nb not in seen:
                if na in seen and nb not in seen:
                    seen.add(nb); pts.append((round(bx,1),round(by,1)))
                    q += [t for t in segs if find(get_node(t["x1"],t["y1"]))==nb or find(get_node(t["x2"],t["y2"]))==nb]
                elif nb in seen and na not in seen:
                    seen.add(na); pts.append((round(ax,1),round(ay,1)))
                    q += [t for t in segs if find(get_node(t["x1"],t["y1"]))==na or find(get_node(t["x2"],t["y2"]))==na]
    return seen, pts

for name,(x0,y0,x1,y1) in {
    "Q11":(427.32,485.595,484.882,533.88),
    "Q8":(427.32,625.995,484.882,674.28),
}.items():
    print("-- %s:" % name)
    # find pin endpoints on body edge (within 6pt of box edges)
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            on_edge = (abs(px-x0)<6 or abs(px-x1)<6 or abs(py-y0)<6 or abs(py-y1)<6)
            if not on_edge: continue
            nid=find(get_node(px,py))
            seen, pts = trace_pin(px,py,nid)
            if len(seen) < 3:  # only symbol-internal, skip
                continue
            labs=set()
            for (qx,qy) in pts:
                for l in labels_near(qx,qy,16):
                    if len(l)<16: labs.add(l)
            # endpoints unique
            uniq=[]
            for p in pts:
                if (round(p[0]/5),round(p[1]/5)) not in [(round(a[0]/5),round(a[1]/5)) for a in uniq]:
                    uniq.append(p)
            print("    pin@(%7.1f,%7.1f) NET#%-6s net_segs=%-3d far_pts=%s" % (px,py,nid,len(seen),uniq[:6]))
            print("        labels=%s" % sorted(labs))

# ============ PART C: specific nets ============
print("\n=== PART C: key nets ===")
for nid, name in [(10232,"R60-net(VCC2+LED1-6)"), (10024,"VCC1 bus"), (11434,"VCC2@589"),
                  (3338,"R59-net"), (17043,"B1AD@499"), (7805,"LED pad?")]:
    dump_net(nid, name)
