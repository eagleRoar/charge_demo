# -*- coding: utf-8 -*-
"""Generate PCB component layout visualization with coordinates."""
import re
import struct
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
with open(filepath, 'rb') as f:
    data = f.read()

# Extract ALL components with X, Y, LAYER, PATTERN
components = []
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
    
    x_str = pairs.get('X', '')
    y_str = pairs.get('Y', '')
    layer = pairs.get('LAYER', '?')
    pattern_name = pairs.get('PATTERN', '?')
    rotation = pairs.get('ROTATION', '0')
    libref = pairs.get('SOURCELIBREFERENCE', '')
    description = pairs.get('SOURCEDESCRIPTION', '')
    
    try:
        x = float(x_str.replace('mil', '').strip())
        y = float(y_str.replace('mil', '').strip())
    except:
        continue
    
    # Determine component type for color coding
    if designator.startswith('R'):
        ctype = 'Resistor'
    elif designator.startswith('C'):
        ctype = 'Capacitor'
    elif designator.startswith('Q'):
        ctype = 'Transistor'
    elif designator.startswith('U'):
        ctype = 'IC'
    elif designator.startswith('J'):
        ctype = 'Connector'
    elif designator.startswith('LED'):
        ctype = 'LED'
    elif designator.startswith('B'):
        ctype = 'LED/Bead'
    elif designator.startswith('NTC'):
        ctype = 'NTC'
    else:
        ctype = 'Other'
    
    components.append({
        'designator': designator,
        'x': x,
        'y': y,
        'layer': layer,
        'pattern': pattern_name,
        'type': ctype,
        'libref': libref,
        'description': description,
        'rotation': rotation.strip(),
    })

print(f"Extracted {len(components)} components with coordinates")

# ============================================================
# Create the plot
# ============================================================
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(28, 14))

# Color map
color_map = {
    'Resistor': '#E74C3C',
    'Capacitor': '#3498DB',
    'Transistor': '#2ECC71',
    'IC': '#9B59B6',
    'Connector': '#F39C12',
    'LED': '#E91E63',
    'LED/Bead': '#00BCD4',
    'NTC': '#FF5722',
    'Other': '#95A5A6',
}

# Separate TOP and BOTTOM
top_comps = [c for c in components if c['layer'] == 'TOP']
bottom_comps = [c for c in components if c['layer'] == 'BOTTOM']

def plot_layer(ax, comps, title):
    for c in comps:
        color = color_map.get(c['type'], '#95A5A6')
        marker_size = 120 if c['type'] in ('IC', 'Connector') else 60
        marker = 's' if c['type'] == 'IC' else 'o'
        
        ax.scatter(c['x'], c['y'], c=color, s=marker_size, marker=marker, 
                   edgecolors='black', linewidth=0.5, zorder=5, alpha=0.85)
        
        # Label for highlighted components
        if c['designator'] in ('NTC1', 'R48', 'C12', 'R39', 'R49', 'R50', 'C5', 'R17', 'Q13', 'Q14', 'Q15', 'Q16'):
            font_weight = 'bold'
            font_size = 7
            ax.annotate(c['designator'], (c['x'], c['y']),
                       textcoords="offset points", xytext=(0, 8),
                       ha='center', fontsize=font_size, fontweight=font_weight,
                       color='darkred',
                       bbox=dict(boxstyle='round,pad=0.2', facecolor='yellow', alpha=0.8))
        else:
            ax.annotate(c['designator'], (c['x'], c['y']),
                       textcoords="offset points", xytext=(0, 6),
                       ha='center', fontsize=4, alpha=0.7)
    
    ax.set_title(title, fontsize=14, fontweight='bold')
    ax.set_xlabel('X (mil)', fontsize=11)
    ax.set_ylabel('Y (mil)', fontsize=11)
    ax.set_aspect('equal')
    ax.grid(True, alpha=0.3, linestyle='--')
    ax.invert_yaxis()  # PCB convention: Y increases downward

plot_layer(ax1, top_comps, f'TOP Layer ({len(top_comps)} components)')
plot_layer(ax2, bottom_comps, f'BOTTOM Layer ({len(bottom_comps)} components)')

# Legend
legend_elements = [mpatches.Patch(color=v, label=k) for k, v in color_map.items()]
fig.legend(handles=legend_elements, loc='upper center', ncol=len(color_map), 
           fontsize=9, bbox_to_anchor=(0.5, 0.97))

fig.suptitle('L1211 TOP V2.0 - PCB Component Layout', fontsize=16, fontweight='bold', y=0.99)

plt.tight_layout(rect=[0, 0, 1, 0.93])
out_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\pcb_layout.png'
plt.savefig(out_path, dpi=200, bbox_inches='tight')
print(f"\nLayout saved to: {out_path}")

# ============================================================
# ZOOM-IN: Area around NTC1, R48, C12
# ============================================================
fig2, ax_zoom = plt.subplots(1, 1, figsize=(16, 12))

# NTC/R48/C12 area
cx = 9280  # center X
cy = 3140  # center Y
zoom_range = 200  # mils

for c in top_comps:
    if abs(c['x'] - cx) < zoom_range and abs(c['y'] - cy) < zoom_range:
        color = color_map.get(c['type'], '#95A5A6')
        marker_size = 200
        ax_zoom.scatter(c['x'], c['y'], c=color, s=marker_size, 
                       edgecolors='black', linewidth=1, zorder=5)
        ax_zoom.annotate(c['designator'], (c['x'], c['y']),
                        textcoords="offset points", xytext=(0, 10),
                        ha='center', fontsize=9, fontweight='bold')

# Highlight NTC1, R48, C12
for name, x, y, note in [
    ('NTC1', 9219.0829, 3093.9115, 'X=9219 Y=3094\n0603L'),
    ('R48', 9282.074, 3087.0648, 'X=9282 Y=3087\nR0402'),
    ('C12', 9282.6315, 3185.2473, 'X=9283 Y=3185\nC0603'),
]:
    ax_zoom.scatter(x, y, c='red', s=400, marker='*', edgecolors='darkred', 
                   linewidth=1.5, zorder=10)
    ax_zoom.annotate(f'{name}\n{note}', (x, y),
                    textcoords="offset points", xytext=(15, 15),
                    ha='left', fontsize=10, fontweight='bold',
                    color='darkred',
                    bbox=dict(boxstyle='round,pad=0.3', facecolor='lightyellow', 
                             edgecolor='red', alpha=0.9),
                    arrowprops=dict(arrowstyle='->', color='red', lw=1.5))

ax_zoom.set_xlim(cx - zoom_range, cx + zoom_range)
ax_zoom.set_ylim(cy + zoom_range, cy - zoom_range)  # inverted
ax_zoom.set_xlabel('X (mil)', fontsize=12)
ax_zoom.set_ylabel('Y (mil)', fontsize=12)
ax_zoom.set_title(f'Zoom: NTC1 / R48 / C12 Area (TOP Layer)', fontsize=14, fontweight='bold')
ax_zoom.grid(True, alpha=0.4)
ax_zoom.set_aspect('equal')

zoom_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\pcb_zoom_ntc_r48_c12.png'
plt.savefig(zoom_path, dpi=200, bbox_inches='tight')
print(f"Zoom layout saved to: {zoom_path}")

plt.close('all')

# ============================================================
# PRINT KEY COMPONENT INFO
# ============================================================
print("\n" + "="*70)
print("KEY COMPONENT DETAILS")
print("="*70)
for target in ['NTC1', 'R48', 'C12', 'R39', 'R49', 'R50', 'R17', 'Q13', 'Q14', 'Q15', 'Q16']:
    for c in components:
        if c['designator'] == target:
            print(f"\n{target}:")
            print(f"  Position: X={c['x']:.1f} mil, Y={c['y']:.1f} mil")
            print(f"  Layer: {c['layer']}")
            print(f"  Pattern: {c['pattern']}")
            print(f"  Rotation: {c['rotation']}")
            print(f"  Library Ref: {c['libref']}")
            print(f"  Description: {c['description']}")
            break

print("\nDONE!")
