import fitz, os, json

pdf = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
os.makedirs(OUT, exist_ok=True)

doc = fitz.open(pdf)
page = doc[0]

# ---- text layer ----
texts = []
d = page.get_text("dict")
for block in d["blocks"]:
    if block["type"] != 0:
        continue
    for line in block["lines"]:
        for span in line["spans"]:
            txt = span["text"].strip()
            if not txt:
                continue
            texts.append({
                "text": txt,
                "bbox": [round(v, 2) for v in span["bbox"]],
                "size": round(span["size"], 1),
                "font": span["font"],
                "color": span["color"],
            })
with open(os.path.join(OUT, "texts.json"), "w", encoding="utf-8") as f:
    json.dump(texts, f, ensure_ascii=False, indent=0)
print("texts:", len(texts))

# ---- vector layer ----
drawings = page.get_drawings()
segs = []
for dr in drawings:
    bbox = dr["rect"]
    for item in dr["items"]:
        typ = item[0]
        if typ == "l":
            p1, p2 = item[1], item[2]
            segs.append({
                "t": "l",
                "x1": round(p1.x, 2), "y1": round(p1.y, 2),
                "x2": round(p2.x, 2), "y2": round(p2.y, 2),
            })
        elif typ == "re":
            r = item[1]
            segs.append({
                "t": "re",
                "x1": round(r.x0, 2), "y1": round(r.y0, 2),
                "x2": round(r.x1, 2), "y2": round(r.y1, 2),
            })
        elif typ in ("c", "qu", "e"):
            # bezier/quad/ellipse: use path rect as bbox
            segs.append({
                "t": typ,
                "x1": round(bbox.x0, 2), "y1": round(bbox.y0, 2),
                "x2": round(bbox.x1, 2), "y2": round(bbox.y1, 2),
            })
with open(os.path.join(OUT, "segs.json"), "w", encoding="utf-8") as f:
    json.dump(segs, f, ensure_ascii=False, indent=0)
print("segs:", len(segs))
doc.close()
