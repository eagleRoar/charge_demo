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

def net_of_pt(x, y, max_d=2.0):
    k = gk(x, y); best = None; bd = max_d*max_d
    for dx in (-1,0,1):
        for dy in (-1,0,1):
            for (nx, ny) in ep.get((k[0]+dx, k[1]+dy), []):
                dd = (nx-x)**2 + (ny-y)**2
                if dd < bd:
                    bd = dd; best = find(get_node(nx, ny))
    return best

# endpoint index
ep = {}
for s in segs:
    for (nx, ny) in ((s["x1"], s["y1"]), (s["x2"], s["y2"])):
        ep.setdefault(gk(nx, ny), []).append((nx, ny))

def labels_near(x, y, tol=16.0):
    out = []
    for t in texts:
        x0,y0,x1,y1 = t["bbox"]; cx=(x0+x1)/2; cy=(y0+y1)/2
        if abs(cx-x) < tol and abs(cy-y) < tol:
            out.append(t["text"])
    return out

def dump_net(nid, name=""):
    segs_n = [s for s in segs if find(get_node(s["x1"], s["y1"]))==nid and find(get_node(s["x2"], s["y2"]))==nid]
    if not segs_n:
        # also catch partial (one endpoint on net)
        segs_n = [s for s in segs if find(get_node(s["x1"], s["y1"]))==nid or find(get_node(s["x2"], s["y2"]))==nid]
    xs=[s["x1"] for s in segs_n]+[s["x2"] for s in segs_n]
    ys=[s["y1"] for s in segs_n]+[s["y2"] for s in segs_n]
    # unique endpoints cluster
    seen={}; pts=[]
    for s in segs_n:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            k=round(px/3.0), round(py/3.0)
            if k in seen: continue
            seen[k]=True; pts.append((round(px,1),round(py,1)))
    pts.sort()
    labs=set()
    for (px,py) in pts:
        for l in labels_near(px,py):
            if len(l)<18: labs.add(l)
    print("NET#%-6s %s segs=%d x=[%.1f,%.1f] y=[%.1f,%.1f]" % (nid,name,len(segs_n),min(xs),max(xs),min(ys),max(ys)))
    print("   pts(%d): %s" % (len(pts), pts[:40]))
    print("   labels: %s" % sorted(labs))

# ---- part 1: key nets ----
print("=== PART 1: key nets ===")
key_nets = {
    "10232":"VCC2? LED1-6+R60", "10024":"VCC1 bus", "11434":"VCC2@589",
    "3338":"R59 far", "8171":"R11 body", "10241":"LED1", "226":"LED5",
    "3034":"LED6", "2246":"LED12", "17043":"B1AD@499", "10351":"LED7",
}
for nid, name in key_nets.items():
    dump_net(int(nid), name)

# ---- part 2: Q8 / Q11 pins ----
print("\n=== PART 2: Q8/Q11 pins (points near body) ===")
def region_pts(x0,y0,x1,y1,pad=14.0):
    res=[]
    x0-=pad; y0-=pad; x1+=pad; y1+=pad
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if x0<=px<=x1 and y0<=py<=y1:
                nid=find(get_node(px,py))
                res.append((round(px,1),round(py,1),nid))
    # dedupe
    out=[];seen=set()
    for (px,py,nid) in res:
        k=(round(px/2),round(py/2),nid)
        if k in seen: continue
        seen.add(k); out.append((px,py,nid))
    out.sort()
    return out

for name,(x0,y0,x1,y1) in {
    "Q11":(427.32,485.595,484.882,533.88),
    "Q8":(427.32,625.995,484.882,674.28),
}.items():
    print("-- %s body region pts (net):" % name)
    for (px,py,nid) in region_pts(x0,y0,x1,y1):
        labs=[l for l in labels_near(px,py,14) if len(l)<14]
        print("    (%.1f,%.1f) NET#%-6s near=%s" % (px,py,nid,labs))

# ---- part 3: each LED two pins ----
print("\n=== PART 3: LED pins ===")
led_refs = {}
for t in texts:
    tt = t["text"]
    if len(tt)==5 and tt[:3]=="LED" and tt[3:].isdigit():
        x0,y0,x1,y1=t["bbox"]
        led_refs[int(tt[3:])] = ((x0+x1)/2,(y0+y1)/2)
for n in sorted(led_refs):
    x,y = led_refs[n]
    # probe box centered at label
    hits=[]
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if abs(px-x)<22 and abs(py-y)<22:
                nid=find(get_node(px,py))
                hits.append((round(px,1),round(py,1),nid))
    seen=set(); uniq=[]
    for (px,py,nid) in sorted(hits):
        k=(round(px/2),round(py/2),nid)
        if k in seen: continue
        seen.add(k); uniq.append((px,py,nid))
    print("LED%-2d label@(%g,%g):" % (n,x,y))
    for (px,py,nid) in uniq:
        if abs(px-x)>18 and abs(py-y)>18: continue
        labs=[l for l in labels_near(px,py,12) if len(l)<14]
        print("     (%.1f,%.1f) NET#%-6s near=%s" % (px,py,nid,labs))
