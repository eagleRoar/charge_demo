import fitz

pdf_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\1.Old\L1211 TOP V2.0(1).pdf"
doc = fitz.open(pdf_path)

# Extract all text from page 2
all_text = []
page = doc[1]  # page 2 (0-indexed)
blocks = page.get_text("dict")["blocks"]
for b in blocks:
    if "lines" in b:
        for l in b["lines"]:
            text = "".join([s["text"] for s in l["spans"]])
            if text.strip():
                x0, y0, x1, y1 = l["bbox"]
                all_text.append((y0, x0, text.strip()))

all_text.sort(key=lambda t: (t[0], t[1]))

print("=== PAGE 2 ALL TEXT (sorted by position) ===\n")
for y, x, text in all_text:
    upper = text.upper()
    marker = "<<<" if any(kw in upper for kw in ['B1', 'B2', '100K', '10K', 'VCC', 'AO3401', '104K', 'NLB', 'BAT', '3401', 'B1AD']) else "   "
    print(f"{marker} y={y:.0f} x={x:.0f} | {text}")

doc.close()
