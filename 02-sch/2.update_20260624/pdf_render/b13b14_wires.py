import json, os, sys
from collections import defaultdict

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
sys.stdout = open(os.path.join(OUT, "b13b14_wires.txt"), "w", encoding="utf-8")
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))
segs = json.load(open(os.path.join(OUT, "segs.json"), encoding="utf-8"))

# B13/B14 区全部线段 (x170-270, y95-255)
print("=== B13/B14 区线段 (x170-270, y95-255) ===")
cnt = 0
for s in segs:
    x1,y1,x2,y2 = s["x1"],s["y1"],s["x2"],s["y2"]
    if (170 <= x1 <= 270 and 95 <= y1 <= 255) or (170 <= x2 <= 270 and 95 <= y2 <= 255):
        print("  (%8.2f,%7.2f)->(%8.2f,%7.2f)" % (x1,y1,x2,y2))
        cnt += 1
print("  共 %d 条" % cnt)

# 全页 B13/B14 文本坐标
print("\n=== 全页 B13/B14 文本 ===")
for t in texts:
    if t["text"] in ("B13", "B14"):
        print("  %s @ bbox=%s" % (t["text"], t["bbox"]))

# 左上区其他网标 (x150-320, y80-270)
print("\n=== 左上区网标/元件文本 (x150-320, y80-270) ===")
for t in texts:
    cx = (t["bbox"][0]+t["bbox"][2])/2; cy = (t["bbox"][1]+t["bbox"][3])/2
    if 150 <= cx <= 320 and 80 <= cy <= 270:
        print("  %-8s @(%7.2f,%7.2f)" % (t["text"], cx, cy))
