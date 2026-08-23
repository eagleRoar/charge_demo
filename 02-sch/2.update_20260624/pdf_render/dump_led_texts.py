import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

# region of interest: LED block
RX0, RY0, RX1, RY1 = 380, 430, 1180, 730
print("===== texts in LED block =====")
for t in sorted(texts, key=lambda t: (t["bbox"][1], t["bbox"][0])):
    x0, y0, x1, y1 = t["bbox"]
    if RX0 <= (x0+x1)/2 <= RX1 and RY0 <= (y0+y1)/2 <= RY1:
        print("(%7.1f,%7.1f) sz=%4.1f %s" % ((x0+x1)/2, (y0+y1)/2, t["size"], t["text"]))
