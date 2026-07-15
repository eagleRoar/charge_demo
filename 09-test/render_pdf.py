import fitz  # PyMuPDF

pdf_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\1.Old\L1211 TOP V2.0(1).pdf"

doc = fitz.open(pdf_path)
print(f"Total pages: {doc.page_count}")

for i, page in enumerate(doc):
    # Render page as image
    pix = page.get_pixmap(dpi=200)
    out_path = f"e:/1.workspace/7.other/17.charge_demo/charge_demo/09-test/page_{i+1}.png"
    pix.save(out_path)
    print(f"Saved page {i+1} to {out_path} (size: {pix.width}x{pix.height})")

doc.close()
print("Done!")
