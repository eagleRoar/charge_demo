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

print("=== 1: texts in Q8 region (x420-490,y480-545) and Q11 region (x420-490,y635-700) ===")
for t in texts:
    x0,y0,x1,y1=t["bbox"]; x=(x0+x1)/2; y=(y0+y1)/2
    if (420<=x<=490 and 480<=y<=545) or (420<=x<=490 and 635<=y<=700):
        print("   %-6s @(%6.1f,%6.1f) size=%.1f" % (t["text"],x,y,t["size"]))

print("\n=== 2: R3 (y~552-563) & R61 (y~692-705) endpoint nets ===")
def probe_ends(x0,y0,x1,y1,label):
    # endpoints just outside resistor box (vertical resistor)
    found = {}
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if x0-3<=px<=x1+3 and (y0-8<=py<=y0-2 or y1+2<=py<=y1+8):
                nid=find(get_node(px,py))
                k=(round(px/2),round(py/2),nid)
                found.setdefault(nid,[]).append((round(px,1),round(py,1)))
    print("  -- %s box=(%.1f,%.1f,%.1f,%.1f)" % (label,x0,y0,x1,y1))
    for nid,pts in sorted(found.items(), key=lambda kv:-len(kv[1])):
        ns=len(net_segs(nid))
        uniq=[]
        for p in pts:
            if (round(p[0]/3),round(p[1]/3)) not in [(round(a[0]/3),round(a[1]/3)) for a in uniq]:
                uniq.append(p)
        labs=set()
        for (qx,qy) in uniq:
            for l in labels_near(qx,qy,15):
                if len(l)<16: labs.add(l)
        print("     NET#%-6s segs=%3d pts=%s labels=%s" % (nid,ns,uniq[:8],sorted(labs)))

probe_ends(400,550,412,564,"R3")
probe_ends(396,690,412,706,"R61")

print("\n=== 3: Q8 bottom pins (y>533) and Q11 bottom pins (y>674) external nets ===")
def bottom_pins(x0,x1,y_cut,name):
    found={}
    for s in segs:
        for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
            if x0-6<=px<=x1+6 and y_cut-2<=py<=y_cut+14:
                nid=find(get_node(px,py))
                k=(round(px/2),round(py/2),nid)
                found.setdefault(nid,[]).append((round(px,1),round(py,1)))
    print("  -- %s (below y=%g):" % (name,y_cut))
    for nid,pts in sorted(found.items(), key=lambda kv:-len(kv[1])):
        ns=len(net_segs(nid))
        uniq=[]
        for p in pts:
            if (round(p[0]/3),round(p[1]/3)) not in [(round(a[0]/3),round(a[1]/3)) for a in uniq]:
                uniq.append(p)
        if ns<4 and len(uniq)<2: continue
        labs=set()
        for (qx,qy) in uniq:
            for l in labels_near(qx,qy,15):
                if len(l)<16: labs.add(l)
        print("     NET#%-6s segs=%3d pts=%s labels=%s" % (nid,ns,uniq[:8],sorted(labs)))

bottom_pins(421,490,533.88,"Q8(upper)")
bottom_pins(421,490,674.28,"Q11(lower)")

print("\n=== 4: full trace of Q8/Q11 source/drain nets (biggest nets below) ===")
def trace(nid, max_pts=60):
    seen=set(); pts=set()
    q=[s for s in segs if find(get_node(s["x1"],s["y1"]))==nid or find(get_node(s["x2"],s["y2"]))==nid]
    while q and len(seen)<400:
        s=q.pop()
        for (ax,ay,bx,by) in ((s["x1"],s["y1"],s["x2"],s["y2"]),(s["x2"],s["y2"],s["x1"],s["y1"])):
            na=find(get_node(ax,ay)); nb=find(get_node(bx,by))
            if na==nid and nb not in seen:
                seen.add(nb); pts.add((round(bx,1),round(by,1)))
                q += [t for t in segs if find(get_node(t["x1"],t["y1"]))==nb or find(get_node(t["x2"],t["y2"]))==nb]
    return sorted(pts)[:max_pts], len(seen)

# find the 2 big nets near Q8 bottom (between y 533-545) that are NOT symbol-internal
cand={}
for s in segs:
    for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
        if 421<=px<=490 and 530<=py<=548:
            nid=find(get_node(px,py))
            cand.setdefault(nid,0)
            cand[nid]+=1
for nid,c in sorted(cand.items(), key=lambda kv:-kv[1])[:6]:
    if c<3: continue
    pts, tot = trace(nid)
    labs=set()
    for (qx,qy) in pts:
        for l in labels_near(qx,qy,16):
            if len(l)<16: labs.add(l)
    print("   Q8-zone NET#%-6s local=%-3d total_segs=%d pts=%s" % (nid,c,tot,pts[:10]))
    print("        labels=%s" % sorted(labs))

cand2={}
for s in segs:
    for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
        if 421<=px<=490 and 671<=py<=690:
            nid=find(get_node(px,py))
            cand2.setdefault(nid,0)
            cand2[nid]+=1
for nid,c in sorted(cand2.items(), key=lambda kv:-kv[1])[:6]:
    if c<3: continue
    pts, tot = trace(nid)
    labs=set()
    for (qx,qy) in pts:
        for l in labels_near(qx,qy,16):
            if len(l)<16: labs.add(l)
    print("   Q11-zone NET#%-6s local=%-3d total_segs=%d pts=%s" % (nid,c,tot,pts[:10]))
    print("        labels=%s" % sorted(labs))
