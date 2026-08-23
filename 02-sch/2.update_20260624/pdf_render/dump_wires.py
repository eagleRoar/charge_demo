import fitz

pdf = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
doc = fitz.open(pdf)
page = doc[0]
drawings = page.get_drawings()

# Wire color: (0.517647, 0, 0) i.e. dark red. Region: LED5/LED6 area + R17/R22 + R60
x0, y0, x1, y1 = 900, 500, 1180, 620
WIRE = (0.5176470279693604, 0.0, 0.0)
print("WIRE paths (color ~0.518,0,0) in region:")
for i, dr in enumerate(drawings):
    r = dr["rect"]
    if r.x1 < x0 or r.x0 > x1 or r.y1 < y0 or r.y0 > y1:
        continue
    if dr.get("color") != WIRE:
        continue
    pts = []
    for it in dr["items"]:
        if it[0] == "l":
            pts.append((round(it[1].x,1), round(it[1].y,1)))
            pts.append((round(it[2].x,1), round(it[2].y,1)))
        elif it[0] == "re":
            rr = it[1]
            pts.append((round(rr.x0,1), round(rr.y0,1)))
            pts.append((round(rr.x1,1), round(rr.y1,1)))
    print("  path#%d rect=(%.1f,%.1f,%.1f,%.1f) pts=%s" % (i, r.x0, r.y0, r.x1, r.y1, pts[:30]))
doc.close()
