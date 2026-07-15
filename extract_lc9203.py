import fitz, glob, os

dirpath = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\12-lithium battery\01-Linear"
matches = glob.glob(os.path.join(dirpath, "*"))
for m in matches:
    print(f"File: {repr(m)}")
    doc = fitz.open(m)
    for pn in range(doc.page_count):
        text = doc[pn].get_text("text")
        if text.strip():
            print(f"=== Page {pn+1} ===")
            print(text)
    doc.close()
