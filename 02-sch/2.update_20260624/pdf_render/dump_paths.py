import fitz, json, os

pdf = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"

doc = fitz.open(pdf)
page = doc[0]
drawings = page.get_drawings()

# Region: LED6 + R22 + R60 (x 1060-1140, y 515-620)
x0, y0, x1, y1 = 1060, 510, 1140, 620
print("paths in region (x %d-%d, y %d-%d):" % (x0, y0, x1, y1))
count = 0
for i, dr in enumerate(drawings):
    r = dr["rect"]
    if r.x1 < x0 or r.x0 > x1 or r.y1 < y0 or r.y0 > y1:
        continue
    count += 1
    print("--- path#%d rect=(%.1f,%.1f,%.1f,%.1f) type=%s fill=%s stroke=%s width=%s items=%d" % (
        i, r.x0, r.y0, r.x1, r.y1, dr["type"], dr.get("fill"), dr.get("color"), dr.get("width"), len(dr["items"])))
    for it in dr["items"][:24]:
        if it[0] == "l":
            print("     l  (%.1f,%.1f)->(%.1f,%.1f)" % (it[1].x, it[1].y, it[2].x, it[2].y))
        elif it[0] == "re":
            rr = it[1]
            print("     re (%.1f,%.1f,%.1f,%.1f)" % (rr.x0, rr.y0, rr.x1, rr.y1))
        elif it[0] == "c":
            print("     c  pts=%s" % [(round(p.x,1), round(p.y,1)) for p in it[1:]])
        elif it[0] == "qu":
            print("     qu pts=%s" % [(round(p.x,1), round(p.y,1)) for p in it[1:]])
print("total paths:", count)
doc.close()
