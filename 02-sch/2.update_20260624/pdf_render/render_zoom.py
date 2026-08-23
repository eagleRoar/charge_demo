import fitz, os

PDF = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.pdf"
OUT = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"

doc = fitz.open(PDF)
print("pages:", doc.page_count)
page = doc[0]
print("page rect:", page.rect)

# 整页渲染(低倍)看布局
mat = fitz.Matrix(2.0, 2.0)
pix = page.get_pixmap(matrix=mat)
pix.save(os.path.join(OUT, "page_full.png"))
print("full saved", pix.width, pix.height)

# LED区域高清渲染: x 390-1130, y 470-730
clip = fitz.Rect(390, 470, 1130, 730)
mat = fitz.Matrix(6.0, 6.0)   # 6x zoom
pix = page.get_pixmap(matrix=mat, clip=clip)
pix.save(os.path.join(OUT, "led_zoom.png"))
print("led_zoom saved", pix.width, pix.height)

# Q8/Q11 区域
clip2 = fitz.Rect(380, 470, 520, 730)
pix2 = page.get_pixmap(matrix=mat, clip=clip2)
pix2.save(os.path.join(OUT, "q8q11_zoom.png"))
print("q8q11 saved", pix2.width, pix2.height)

# LED1-6 单个 LED (LED1: x 540-600, y 550-620) 高清看二极管方向与引脚
clip3 = fitz.Rect(535, 555, 1120, 590)
pix3 = page.get_pixmap(matrix=fitz.Matrix(10, 10), clip=clip3)
pix3.save(os.path.join(OUT, "led_row_top.png"))
print("led_row_top saved", pix3.width, pix3.height)
