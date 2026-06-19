# -*- coding: utf-8 -*-
"""Smarter annotation: detect board boundaries in the photo, then map PCB coords."""
import re
import math
from PIL import Image, ImageDraw, ImageFont, ImageFilter
import numpy as np

# ============================================================
# Load new photo
# ============================================================
photo_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\实拍.jpg'
img = Image.open(photo_path)
w, h = img.size
print(f"Photo size: {w} x {h}")
img_array = np.array(img)

# ============================================================
# Extract PCB component positions
# ============================================================
pcb_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
with open(pcb_path, 'rb') as f:
    data = f.read()

components_top = []
components_bottom = []
pattern = re.compile(rb'SOURCEDESIGNATOR=([A-Z]+\d+)')
for m in pattern.finditer(data):
    designator = m.group(1).decode('ascii')
    rec_start = m.start()
    while rec_start > max(0, m.start() - 1500) and data[rec_start:rec_start+1] != b'\x00':
        rec_start -= 1
    rec_start += 1
    rec_end = m.end()
    null_count = 0
    while rec_end < min(len(data), m.end() + 1500):
        if data[rec_end:rec_end+1] == b'\x00':
            null_count += 1
            if null_count >= 8:
                break
        else:
            null_count = 0
        rec_end += 1
    rec_data = data[rec_start:rec_end]
    pairs = {}
    for m2 in re.finditer(rb'([A-Z]+)=([^|\x00]+)', rec_data):
        key = m2.group(1).decode('ascii', errors='ignore')
        val = m2.group(2).decode('latin-1', errors='replace')
        if key not in pairs:
            pairs[key] = val
    try:
        x = float(pairs.get('X', '').replace('mil', '').strip())
        y = float(pairs.get('Y', '').replace('mil', '').strip())
    except:
        continue
    comp = {'designator': designator, 'x': x, 'y': y}
    if pairs.get('LAYER', '?') == 'TOP':
        components_top.append(comp)
    else:
        components_bottom.append(comp)

all_comp = components_top + components_bottom
all_x = [c['x'] for c in all_comp]
all_y = [c['y'] for c in all_comp]
pcb_min_x, pcb_max_x = min(all_x), max(all_x)
pcb_min_y, pcb_max_y = min(all_y), max(all_y)
pcb_w = pcb_max_x - pcb_min_x
pcb_h = pcb_max_y - pcb_min_y
pcb_aspect = pcb_w / pcb_h  # width/height ratio of PCB

print(f"PCB bounds: X[{pcb_min_x:.0f}, {pcb_max_x:.0f}] Y[{pcb_min_y:.0f}, {pcb_max_y:.0f}] mil")
print(f"PCB size: {pcb_w:.0f} x {pcb_h:.0f} mil, aspect ratio: {pcb_aspect:.3f}")
print(f"TOP components: {len(components_top)}, BOTTOM components: {len(components_bottom)}")

# ============================================================
# Try to detect board in photo using edge detection
# ============================================================
# Convert to grayscale
gray = np.mean(img_array, axis=2).astype(np.uint8)

# Apply edge detection using simple gradient
from PIL import ImageFilter
gray_img = Image.fromarray(gray)
edges = gray_img.filter(ImageFilter.FIND_EDGES)
edges_arr = np.array(edges)

# Find board boundaries: look for large rectangular region
# Simple approach: find bounding box of high-contrast region
# The board should be the main subject in the photo

# Threshold edges
edge_mask = edges_arr > 40
edge_mask_int = edge_mask.astype(np.uint8)

# Find non-zero (edge) pixel coordinates
edge_rows, edge_cols = np.where(edge_mask_int > 0)

if len(edge_rows) > 100:
    # Use 1st and 99th percentile to find board bounds (robust to noise)
    board_top = int(np.percentile(edge_rows, 1))
    board_bottom = int(np.percentile(edge_rows, 99))
    board_left = int(np.percentile(edge_cols, 1))
    board_right = int(np.percentile(edge_cols, 99))
    
    # Clamp to image bounds
    board_top = max(0, board_top)
    board_bottom = min(h, board_bottom)
    board_left = max(0, board_left)
    board_right = min(w, board_right)
    
    detected_w = board_right - board_left
    detected_h = board_bottom - board_top
    detected_aspect = detected_w / detected_h
    
    print(f"\nDetected board region: left={board_left}, top={board_top}, right={board_right}, bottom={board_bottom}")
    print(f"Detected size: {detected_w} x {detected_h}, aspect: {detected_aspect:.3f}")
    
    # Compare aspect ratio to PCB design
    # If the detected aspect doesn't match PCB aspect, the photo might be rotated
    aspect_diff_normal = abs(detected_aspect - pcb_aspect)
    aspect_diff_rotated = abs((1/detected_aspect) - pcb_aspect)  # 90-degree rotation
    
    print(f"Aspect match (normal): delta={aspect_diff_normal:.3f}")
    print(f"Aspect match (rotated 90): delta={aspect_diff_rotated:.3f}")
    
    # Use the better matching orientation
    use_rotated = aspect_diff_rotated < aspect_diff_normal
else:
    # Fallback: use entire image with margin
    board_left = int(w * 0.05)
    board_right = int(w * 0.95)
    board_top = int(h * 0.05)
    board_bottom = int(h * 0.95)
    use_rotated = False
    print("\nCould not detect board edges, using full image")

# ============================================================
# Map PCB coordinates to photo pixels
# ============================================================
def pcb_to_img(px, py, rotated=False):
    """Map PCB coordinate (mils) to image pixel."""
    if rotated:
        # Rotated 90 degrees: PCB X -> image Y, PCB Y -> image X (reversed)
        ix = board_left + (board_right - board_left) * (1 - (py - pcb_min_y) / pcb_h)
        iy = board_top + (board_bottom - board_top) * (px - pcb_min_x) / pcb_w
    else:
        ix = board_left + (board_right - board_left) * (px - pcb_min_x) / pcb_w
        iy = board_top + (board_bottom - board_top) * (py - pcb_min_y) / pcb_h
    return int(ix), int(iy)

# ============================================================
# Generate BOTH orientation versions
# ============================================================
for orientation_name, rotated in [("normal", False), ("rotated90", True)]:
    img_copy = img.copy()
    draw = ImageDraw.Draw(img_copy, 'RGBA')
    
    try:
        font_large = ImageFont.truetype("arial.ttf", 36)
        font_med = ImageFont.truetype("arial.ttf", 22)
        font_small = ImageFont.truetype("arial.ttf", 16)
    except:
        font_large = ImageFont.load_default()
        font_med = ImageFont.load_default()
        font_small = ImageFont.load_default()
    
    # Draw board boundary
    draw.rectangle([board_left, board_top, board_right, board_bottom], 
                   outline=(0, 255, 255), width=2)
    
    # Draw key reference components
    ref_components = ['U1', 'J2', 'J1', 'Q17']
    for name in ref_components:
        comp = next((c for c in all_comp if c['designator'] == name), None)
        if comp:
            cx, cy = pcb_to_img(comp['x'], comp['y'], rotated)
            draw.ellipse([cx-8, cy-8, cx+8, cy+8], fill=(0, 255, 255, 160))
            draw.text((cx-10, cy-20), name, fill=(0, 255, 255), font=font_small)
    
    # Draw C12 prominently
    c12 = next((c for c in all_comp if c['designator'] == 'C12'), None)
    ntc1 = next((c for c in all_comp if c['designator'] == 'NTC1'), None)
    r48 = next((c for c in all_comp if c['designator'] == 'R48'), None)
    
    if c12:
        cx, cy = pcb_to_img(c12['x'], c12['y'], rotated)
        r = 50
        
        # Thick red circle
        for offset in range(4):
            draw.ellipse([cx-r-offset, cy-r-offset, cx+r+offset, cy+r+offset],
                        outline='red', width=2)
        
        # Yellow semi-transparent fill
        draw.ellipse([cx-r+4, cy-r+4, cx+r-4, cy+r-4],
                    fill=(255, 255, 0, 50))
        
        # Label box
        label_w, label_h = 180, 75
        bx, by = cx + 40, cy - label_h//2 - 35
        draw.rectangle([bx, by, bx + label_w, by + label_h],
                      fill=(255, 255, 0, 230), outline='red', width=3)
        draw.text((bx + 8, by + 5), "C12", fill='red', font=font_large)
        draw.text((bx + 8, by + 38), "(22uF 0603)", fill='darkred', font=font_med)
        
        # Arrow
        draw.line([cx + 30, cy, cx + r + 10, cy], fill='red', width=3)
    
    if ntc1:
        nx, ny = pcb_to_img(ntc1['x'], ntc1['y'], rotated)
        draw.ellipse([nx-18, ny-18, nx+18, ny+18], outline='orange', width=2)
        draw.text((nx-15, ny-40), "NTC1", fill='orange', font=font_small)
    
    if r48:
        rx, ry = pcb_to_img(r48['x'], r48['y'], rotated)
        draw.ellipse([rx-18, ry-18, rx+18, ry+18], outline='blue', width=2)
        draw.text((rx-30, ry-40), "R48", fill='blue', font=font_small)
    
    # Title
    title = f"C12 Location - {orientation_name} orientation"
    draw.rectangle([5, 5, 500, 50], fill=(0, 0, 0, 190))
    draw.text((15, 10), title, fill='white', font=font_med)
    
    # Legend
    y_legend = 55
    for label, color in [("RED circle = C12", 'red'), 
                          ("ORANGE = NTC1", 'orange'),
                          ("BLUE = R48", 'blue'),
                          ("CYAN = reference (U1, J2, etc.)", 'cyan')]:
        draw.text((15, y_legend), label, fill=color, font=font_small)
        y_legend += 22
    
    out_name = f'实拍_C12标注_{orientation_name}.jpg'
    out_path = rf'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\{out_name}'
    img_copy.save(out_path, quality=95)
    print(f"Saved: {out_name}")

# ============================================================
# Also generate a version showing ALL component positions on the photo
# for the user to verify
# ============================================================
img_all = img.copy()
draw_all = ImageDraw.Draw(img_all, 'RGBA')
try:
    font_tiny = ImageFont.truetype("arial.ttf", 12)
except:
    font_tiny = ImageFont.load_default()

# Show components on both layers (TOP in green, BOTTOM in magenta)
for c in components_top:
    if c['designator'] in ('C12', 'NTC1', 'R48'):
        continue  # skip, will draw them specially
    cx, cy = pcb_to_img(c['x'], c['y'], use_rotated)
    draw_all.ellipse([cx-4, cy-4, cx+4, cy+4], fill=(0, 255, 0, 150))
    if c['designator'] in ('U1', 'J2', 'J1', 'Q17', 'R17', 'Q13'):
        draw_all.text((cx+6, cy-6), c['designator'], fill=(0, 255, 0), font=font_tiny)

for c in components_bottom[:20]:  # show first 20 bottom components
    cx, cy = pcb_to_img(c['x'], c['y'], use_rotated)
    draw_all.ellipse([cx-4, cy-4, cx+4, cy+4], fill=(255, 0, 255, 100))

# C12, NTC1, R48 again
c12 = next((c for c in all_comp if c['designator'] == 'C12'), None)
if c12:
    cx, cy = pcb_to_img(c12['x'], c12['y'], use_rotated)
    draw_all.ellipse([cx-50, cy-50, cx+50, cy+50], outline='red', width=3)
    draw_all.text((cx+55, cy-10), "C12", fill='red', font=font_med)

ntc1 = next((c for c in all_comp if c['designator'] == 'NTC1'), None)
if ntc1:
    cx, cy = pcb_to_img(ntc1['x'], ntc1['y'], use_rotated)
    draw_all.text((cx+5, cy-20), "NTC1", fill='orange', font=font_small)

r48 = next((c for c in all_comp if c['designator'] == 'R48'), None)
if r48:
    cx, cy = pcb_to_img(r48['x'], r48['y'], use_rotated)
    draw_all.text((cx+5, cy-20), "R48", fill='blue', font=font_small)

out_all = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\实拍_全部元件.jpg'
img_all.save(out_all, quality=95)
print(f"Saved all-components overlay: 实拍_全部元件.jpg")

print("\n=== DONE ===")
print("Generated 3 annotated versions. Check which orientation matches your photo.")
print("Look for U1 (main IC), J2 (connector) as reference points.")
