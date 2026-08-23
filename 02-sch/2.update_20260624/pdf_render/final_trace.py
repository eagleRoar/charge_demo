import json, os, fitz

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

def dump(nid, name, maxp=40):
    sn = [s for s in segs if find(get_node(s["x1"],s["y1"]))==nid and find(get_node(s["x2"],s["y2"]))==nid]
    print("NET#%-6s %-16s segs=%d:" % (nid, name, len(sn)))
    for s in sn[:maxp]:
        print("    (%.1f,%.1f)->(%.1f,%.1f)" % (s["x1"],s["y1"],s["x2"],s["y2"]))

print("=== 1: Q8 drain / Q11 drain nets ===")
dump(12984, "Q8 D pin")
dump(11228, "Q11 D pin")

# find nets attached to R14 (LED1 5.1k, box 555-574, 456-487)
print("\n=== 2: R14/LED1 5.1k ends (x545-585, y440-500) ===")
hits = {}
for s in segs:
    for (px,py) in ((s["x1"],s["y1"]),(s["x2"],s["y2"])):
        if 540<=px<=590 and 440<=py<=500:
            nid=find(get_node(px,py))
            hits.setdefault(nid,[]).append((round(px,1),round(py,1)))
for nid,pts in sorted(hits.items(), key=lambda kv:-len(kv[1])):
    uniq=[]
    for p in pts:
        if (round(p[0]/3),round(p[1]/3)) not in [(round(a[0]/3),round(a[1]/3)) for a in uniq]:
            uniq.append(p)
    sn = [s for s in segs if find(get_node(s["x1"],s["y1"]))==nid and find(get_node(s["x2"],s["y2"]))==nid]
    if len(sn) < 3: continue
    print("   NET#%-6s segs=%3d pts=%s" % (nid,len(sn),uniq[:8]))

print("\n=== 3: LED6 body vectors (x1060-1120, y550-585) ===")
pdf = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
doc = fitz.open(pdf); page = doc[0]
for dr in page.get_drawings():
    r = dr["rect"]
    if r.x1 < 1060 or r.x0 > 1120 or r.y1 < 550 or r.y0 > 585:
        continue
    print("path rect=(%.1f,%.1f,%.1f,%.1f) fill=%s items=%d" % (r.x0,r.y0,r.x1,r.y1,dr.get("fill"),len(dr["items"])))
    for it in dr["items"][:10]:
        if it[0]=="l":
            print("   l (%.1f,%.1f)->(%.1f,%.1f)" % (it[1].x,it[1].y,it[2].x,it[2].y))
        elif it[0]=="c":
            print("   c pts=%s" % [(round(p.x,1),round(p.y,1)) for p in it[1:]])
doc.close()
