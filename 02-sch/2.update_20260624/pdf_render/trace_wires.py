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

def net_segs(nid):
    return [s for s in segs if find(get_node(s["x1"],s["y1"]))==nid and find(get_node(s["x2"],s["y2"]))==nid]

def net_of(x, y, max_d=3.0):
    k = gk(x, y); best=None; bd=max_d*max_d
    for dx in (-1,0,1):
        for dy in (-1,0,1):
            for (nx,ny) in ep.get((k[0]+dx,k[1]+dy),[]):
                dd=(nx-x)**2+(ny-y)**2
                if dd<bd: bd=dd; best=find(get_node(nx,ny))
    return best

ep = {}
for s in segs:
    for (nx,ny) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
        ep.setdefault(gk(nx,ny),[]).append((nx,ny))

def labels_near(x, y, tol=16.0):
    out=[]
    for t in texts:
        x0,y0,x1,y1=t["bbox"]; cx=(x0+x1)/2; cy=(y0+y1)/2
        if abs(cx-x)<tol and abs(cy-y)<tol: out.append(t["text"])
    return out

print("=== A: VCC2 bus (NET#10232) full segments ===")
for s in net_segs(10232):
    print("   (%.1f,%.1f)->(%.1f,%.1f)" % (s["x1"],s["y1"],s["x2"],s["y2"]))
print("=== A2: VCC1 bus (NET#7805) full segments ===")
for s in net_segs(7805):
    print("   (%.1f,%.1f)->(%.1f,%.1f)" % (s["x1"],s["y1"],s["x2"],s["y2"]))

print("\n=== B: R59/R60 bodies & far ends ===")
for t in texts:
    if t["text"] in ("R59","R60","R3","R61"):
        x0,y0,x1,y1=t["bbox"]; x=(x0+x1)/2; y=(y0+y1)/2
        print("  REF %s @(%g,%g)" % (t["text"],x,y))
# probe R59/R60 area (x 1100-1125, y 590-660): endpoints by net
print("  probes near R59/R60 (x1100-1125, y590-665):")
hits={}
for s in segs:
    for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
        if 1100<=px<=1125 and 590<=py<=665:
            nid=find(get_node(px,py))
            k=(round(px/2),round(py/2),nid)
            hits.setdefault(nid,[]).append((round(px,1),round(py,1)))
for nid,pts in sorted(hits.items(), key=lambda kv:-len(kv[1])):
    uniq=[]
    for p in pts:
        if (round(p[0]/3),round(p[1]/3)) not in [(round(a[0]/3),round(a[1]/3)) for a in uniq]:
            uniq.append(p)
    ns=len(net_segs(nid))
    print("   NET#%-6s net_segs=%3d pts=%s" % (nid,ns,uniq[:10]))

print("\n=== C: each LED two pins (probe box around body) ===")
def led_pins(n, label_xy, probe):
    x,y = label_xy
    x0,x1 = x-30, x+30
    y0,y1 = probe
    hits={}
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if x0<=px<=x1 and y0<=py<=y1:
                nid=find(get_node(px,py))
                k=(round(px/3),round(py/3),nid)
                hits.setdefault(nid,[]).append((round(px,1),round(py,1)))
    print("  LED%2d probe x[%d,%d] y[%d,%d]:" % (n,x0,x1,y0,y1))
    for nid,pts in sorted(hits.items(), key=lambda kv:-len(kv[1])):
        ns=len(net_segs(nid))
        if ns < 6: continue   # skip symbol-internal fragments
        uniq=[]
        for p in pts:
            if (round(p[0]/4),round(p[1]/4)) not in [(round(a[0]/4),round(a[1]/4)) for a in uniq]:
                uniq.append(p)
        labs=set()
        for (qx,qy) in uniq:
            for l in labels_near(qx,qy,14):
                if len(l)<16: labs.add(l)
        print("     NET#%-6s segs=%3d pts=%s labels=%s" % (nid,ns,uniq[:6],sorted(labs)))

led_pos = {}
for t in texts:
    tt=t["text"]
    if len(tt)==5 and tt[:3]=="LED" and tt[3:].isdigit():
        x0,y0,x1,y1=t["bbox"]
        led_pos[int(tt[3:])] = ((x0+x1)/2,(y0+y1)/2)
for n in range(1,13):
    probe = (540,600) if n<=6 else (655,700)
    led_pins(n, led_pos[n], probe)
