import fitz

doc = fitz.open(r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0(1).pdf')

for page_num in range(len(doc)):
    page = doc[page_num]
    print(f'\n===== PAGE {page_num+1} =====')
    
    blocks = page.get_text("blocks")
    for b in blocks:
        x0, y0, x1, y1, text, block_type, block_no = b
        text = text.strip()
        if text and len(text) < 30:
            print(f"  [{x0:.0f},{y0:.0f}] '{text}'")

doc.close()