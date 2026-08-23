# MCU区域信号标签布局: 列出x650-950,y850-1080所有标签, 按x列分组
import json, os

OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
texts = json.load(open(os.path.join(OUT, "texts.json"), encoding="utf-8"))

print("=== MCU区域全部标签 (x640-960, y850-1100) ===")
rows = []
for t in texts:
    x0,y0,x1,y1 = t["bbox"]
    cx = (x0+x1)/2; cy = (y0+y1)/2
    if 640 <= cx <= 960 and 850 <= cy <= 1100:
        rows.append((cx, cy, t["text"], t["size"]))
# 按y坐标分带
bands = {}
for cx, cy, txt, sz in sorted(rows, key=lambda r: (r[1], r[0])):
    band = round(cy / 15) * 15
    bands.setdefault(band, []).append((cx, txt, sz))

for band in sorted(bands):
    items = sorted(bands[band])
    line = "y=%4d: " % band
    for cx, txt, sz in items:
        line += "%s@%d " % (txt, cx)
    print(line)
