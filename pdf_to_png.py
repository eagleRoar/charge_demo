# -*- coding: utf-8 -*-
"""Convert PDF pages to PNG images."""
import pymupdf

pdf_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0(1).pdf'
doc = pymupdf.open(pdf_path)
print(f'PDF has {len(doc)} pages')

for i, page in enumerate(doc):
    pix = page.get_pixmap(dpi=300)
    out_path = rf'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\pcb_page_{i}.png'
    pix.save(out_path)
    print(f'Saved page {i} -> {out_path}')

doc.close()
print('Done!')
