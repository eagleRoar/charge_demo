import fitz, os

pdf = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
os.makedirs(OUT, exist_ok=True)

doc = fitz.open(pdf)
print("pages:", doc.page_count)
for i, page in enumerate(doc):
    r = page.rect
    print("page", i, "size pt:", r.width, "x", r.height)
    # render at 4x zoom (~300dpi for 72dpi base)
    mat = fitz.Matrix(4, 4)
    pix = page.get_pixmap(matrix=mat)
    fn = os.path.join(OUT, "page%d.png" % (i+1))
    pix.save(fn)
    print("  saved:", fn, pix.width, "x", pix.height, os.path.getsize(fn), "bytes")
doc.close()
