# -*- coding: utf-8 -*-
import fitz

pdf_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0(1).pdf"
out_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\pdf_extracted_text.txt"

with open(out_path, "w", encoding="utf-8") as f:
    f.write("=" * 80 + "\n")
    f.write("PDF 文件: L1211 TOP V2.0(1).pdf\n")
    f.write("=" * 80 + "\n")

    doc = fitz.open(pdf_path)
    f.write(f"\n总页数: {doc.page_count}\n\n")

    for page_num in range(doc.page_count):
        page = doc[page_num]
        f.write("=" * 80 + "\n")
        f.write(f"--- 第 {page_num + 1} 页 ---\n")
        f.write("=" * 80 + "\n")

        text = page.get_text("text")
        if text.strip():
            f.write(text + "\n")
        else:
            f.write("[此页无文本内容]\n")

        images = page.get_images(full=True)
        if images:
            f.write(f"\n[此页包含 {len(images)} 张图片]\n")
            for i, img in enumerate(images):
                bi = doc.extract_image(img[0])
                f.write(f"  图片 {i+1}: xref={img[0]}, 尺寸={bi.get('width','?')}x{bi.get('height','?')}, 格式={bi.get('ext','?')}\n")

        drawings = page.get_drawings()
        if drawings:
            f.write(f"\n[此页包含 {len(drawings)} 个矢量图形/绘图元素]\n")

        links = page.get_links()
        if links:
            f.write(f"\n[此页包含 {len(links)} 个链接]\n")

        # 按块提取文本，获取位置信息
        blocks = page.get_text("blocks")
        if blocks:
            f.write(f"\n[文本块详细信息 ({len(blocks)} 个块)]\n")
            for bi, block in enumerate(blocks):
                x0, y0, x1, y1, text, block_type, block_no = block
                text = text.strip()
                if text:
                    f.write(f"  块{bi+1}: 位置({x0:.0f},{y0:.0f})-({x1:.0f},{y1:.0f}), 类型={block_type}, 文本: {text}\n")
        
        f.write("\n")

    doc.close()
    f.write("=" * 80 + "\n")
    f.write("PDF 提取完成\n")

print(f"提取完成，结果保存到: {out_path}")

# Also print to stdout
with open(out_path, "r", encoding="utf-8") as f:
    print(f.read())
