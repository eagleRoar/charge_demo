# -*- coding: utf-8 -*-
"""
Complete SchDoc parser for SC8F096AD832 MCU pin-to-net mapping.
Parses Altium Schematic binary format to extract:
- MCU pins (RECORD=2, OWNERINDEX=4462)
- Net labels (RECORD=25)
- Wires/polylines (RECORD=27)
- Junctions (RECORD=26)
Then builds connectivity graph via proximity matching and BFS propagation.
"""
import olefile
import re
import sys

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding='utf-8')

path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
ole = olefile.OleFileIO(path)
data = ole.openstream('FileHeader').read()

# Split on first null byte - the body starts after the header
null_pos = data.index(b'\x00')
body = data[null_pos+1:]

def clean_int(s):
    """Clean and parse an integer from a string that may have trailing garbage (., letters, quotes)."""
    if not s:
        return None
    s = s.strip()
    # Remove trailing non-digit characters
    result = ''
    for c in s:
        if c == '-' or c == '.' or c.isdigit():
            result += c
        else:
            break
    if not result:
        return None
    try:
        return int(float(result))
    except:
        return None

def find_records(rec_type, body):
    """Find all records of a given type using regex."""
    pattern = f'RECORD={rec_type}\\|.*?(?=\\x00\\x00|\\x00[\\x01-\\x08])'.encode()
    return list(re.finditer(pattern, body, re.DOTALL))

def parse_fields(chunk):
    """Extract key=value pairs from a record chunk, keeping only printable ASCII."""
    clean = bytes(b for b in chunk if 32 <= b < 127 or b in (0x7c, 0x3d))
    text = clean.decode('ascii', errors='ignore')
    fields = {}
    for part in text.split('|'):
        eq_pos = part.find('=')
        if eq_pos > 0:
            key = part[:eq_pos]
            value = part[eq_pos+1:]
            fields[key] = value
    return fields

# ============================================================================
# 1. Parse MCU Pins (RECORD=2, OWNERINDEX=4462)
# ============================================================================
MCU_OWNER = '4462'

pin_matches = find_records(2, body)
mcu_pins = []
for m in pin_matches:
    fields = parse_fields(m.group())
    if fields.get('OWNERINDEX', '') == MCU_OWNER:
        x = clean_int(fields.get('LOCATION.X', ''))
        y = clean_int(fields.get('LOCATION.Y', ''))
        if x is not None and y is not None:
            mcu_pins.append({
                'designator': fields.get('DESIGNATOR', '?'),
                'name': fields.get('NAME', '?'),
                'x': x, 'y': y,
                'electrical': fields.get('ELECTRICAL', '?'),
            })

mcu_pins.sort(key=lambda p: clean_int(p['designator']) or 999)

print(f"=== MCU Pins (OWNERINDEX={MCU_OWNER}): {len(mcu_pins)} ===")
for p in mcu_pins:
    print(f"  Pin {p['designator']:>3}: {p['name']:<6} @ ({p['x']:>4}, {p['y']:>3})")

# ============================================================================
# 2. Parse Net Labels (RECORD=25)
# ============================================================================
nl_matches = find_records(25, body)
net_labels = []
for m in nl_matches:
    fields = parse_fields(m.group())
    x = clean_int(fields.get('LOCATION.X', ''))
    y = clean_int(fields.get('LOCATION.Y', ''))
    text = fields.get('TEXT', '?')
    if x is not None and y is not None and text != '?':
        net_labels.append({'text': text, 'x': x, 'y': y})

print(f"\n=== Net Labels: {len(net_labels)} ===")
for nl in sorted(net_labels, key=lambda n: n['text']):
    print(f"  '{nl['text']}' @ ({nl['x']}, {nl['y']})")

# ============================================================================
# 3. Parse Wires (RECORD=27) - Polylines
# ============================================================================
w_matches = find_records(27, body)
wires = []
parse_errors = 0
for m in w_matches:
    fields = parse_fields(m.group())
    count_str = fields.get('LOCATIONCOUNT', '0')
    try:
        count = int(count_str)
    except:
        continue
    coords = []
    for i in range(1, count + 1):
        xs = fields.get(f'X{i}', None)
        ys = fields.get(f'Y{i}', None)
        if xs and ys:
            x = clean_int(xs)
            y = clean_int(ys)
            if x is not None and y is not None:
                coords.append((x, y))
            else:
                parse_errors += 1
    if coords:
        wires.append({
            'index': fields.get('INDEXINSHEET', '?'),
            'coords': coords,
            'color': fields.get('COLOR', '?'),
        })

print(f"\n=== Wires: {len(wires)} (parse errors: {parse_errors}) ===")

# ============================================================================
# 4. Parse Junctions (RECORD=26)
# ============================================================================
junc_matches = find_records(26, body)
junctions = []
for m in junc_matches:
    fields = parse_fields(m.group())
    x = clean_int(fields.get('LOCATION.X', ''))
    y = clean_int(fields.get('LOCATION.Y', ''))
    if x is not None and y is not None:
        junctions.append((x, y))

print(f"\n=== Junctions: {len(junctions)} ===")

# ============================================================================
# 5. Build Wire Connectivity Graph
# ============================================================================
# Map: coordinate -> list of wire indices
coord_to_wires = {}
for wi, w in enumerate(wires):
    for coord in w['coords']:
        coord_to_wires.setdefault(coord, []).append(wi)

# Also add junctions to the coord_to_wires map (junctions connect wires)
# Wire adjacency: for each wire, what other wires share coordinates with it
wire_adj = {}
for coord, wire_list in coord_to_wires.items():
    for wi in wire_list:
        wire_adj.setdefault(wi, set())
        for wj in wire_list:
            if wi != wj:
                wire_adj[wi].add(wj)

# Also, two wire segments that share a common vertex (even from different wires)
# are already connected via coord_to_wires

print(f"Wire adj entries: {len(wire_adj)}")

# ============================================================================
# 6. Assign Net Labels to Wires via Proximity Matching
# ============================================================================
# For each net label, find the nearest wire vertex within threshold
# Also check line segment proximity
THRESHOLD = 30

# Build a list of all wire line segments for fast proximity checking
segments = []  # (wire_idx, x1, y1, x2, y2)
for wi, w in enumerate(wires):
    for i in range(len(w['coords']) - 1):
        x1, y1 = w['coords'][i]
        x2, y2 = w['coords'][i + 1]
        segments.append((wi, x1, y1, x2, y2))

def point_to_seg_dist(px, py, x1, y1, x2, y2):
    """Minimum distance from point to line segment."""
    dx = x2 - x1
    dy = y2 - y1
    if dx == 0 and dy == 0:
        return abs(px - x1) + abs(py - y1)
    # Project point onto line
    t = max(0, min(1, ((px - x1) * dx + (py - y1) * dy) / (dx * dx + dy * dy)))
    proj_x = x1 + t * dx
    proj_y = y1 + t * dy
    return abs(px - proj_x) + abs(py - proj_y)

# Assign net labels to wires
wire_to_net = {}  # wire_idx -> net_name
for nl in net_labels:
    nx, ny = nl['x'], nl['y']
    best_dist = THRESHOLD + 1
    best_wi = None
    
    # Check vertex proximity
    for (cx, cy), wire_list in coord_to_wires.items():
        dist = abs(nx - cx) + abs(ny - cy)
        if dist < best_dist:
            best_dist = dist
            best_wi = wire_list[0]  # first wire at this coordinate
    
    # Check segment proximity
    for wi, sx1, sy1, sx2, sy2 in segments:
        dist = point_to_seg_dist(nx, ny, sx1, sy1, sx2, sy2)
        if dist < best_dist:
            best_dist = dist
            best_wi = wi
    
    if best_wi is not None and best_dist <= THRESHOLD:
        wire_to_net[best_wi] = nl['text']

print(f"\nWires with direct net labels: {len(wire_to_net)}")

# ============================================================================
# 7. BFS Propagate Net Names Through Connected Wires
# ============================================================================
# Priority: wires that already have a net label keep their name
# Continue BFS until no more wires get a net name
from collections import deque
changed = True
iteration = 0
while changed:
    changed = False
    iteration += 1
    for wi in list(wire_to_net.keys()):
        net = wire_to_net[wi]
        for neighbor in wire_adj.get(wi, set()):
            if neighbor not in wire_to_net:
                wire_to_net[neighbor] = net
                changed = True
    if iteration > 1000:
        break

print(f"Wires with net labels after BFS: {len(wire_to_net)}")
total_mapped = len(wire_to_net)
print(f"Total wires: {len(wires)}, mapped: {total_mapped} ({100*total_mapped/len(wires):.1f}%)")

# ============================================================================
# 8. Map MCU Pins to Nets
# ============================================================================
print(f"\n{'='*70}")
print(f"MCU PIN TO NET MAPPING")
print(f"{'='*70}")

# For each MCU pin, find the net via connected wires
results = []
for pin in mcu_pins:
    px, py = pin['x'], pin['y']
    designator = pin['designator']
    name = pin['name']
    
    # Check if pin coordinate is exactly at a wire vertex
    wire_indices = coord_to_wires.get((px, py), [])
    
    # Also check proximity (within THRESHOLD) for the pin itself
    if not wire_indices:
        for (cx, cy), wlist in coord_to_wires.items():
            if abs(px - cx) + abs(py - cy) <= THRESHOLD:
                wire_indices = wlist
                break
    
    if wire_indices:
        nets = set()
        for wi in wire_indices:
            net = wire_to_net.get(wi)
            if net:
                nets.add(net)
        if nets:
            net_str = ', '.join(sorted(nets))
            results.append((designator, name, net_str))
        else:
            results.append((designator, name, '[wire connected, no net label]'))
    else:
        # Directly at a net label?
        found = False
        for nl in net_labels:
            if abs(px - nl['x']) + abs(py - nl['y']) <= THRESHOLD:
                results.append((designator, name, nl['text']))
                found = True
                break
        if not found:
            results.append((designator, name, '[no connection found]'))

# Print formatted table
print(f"\n{'Pin#':<6} {'Name':<8} {'Connected Net/Signal':<30}")
print(f"{'-'*6} {'-'*8} {'-'*30}")
for d, n, net in results:
    print(f"  {d:<4} {n:<8} {net:<30}")

# ============================================================================
# 9. Key Signal Summary
# ============================================================================
print(f"\n{'='*70}")
print(f"KEY SIGNAL TO MCU PIN SUMMARY")
print(f"{'='*70}")

key_signals = [
    'CD IO1', 'CD IO2', 'VT_PWM1', 'EN', 'VCC_SW',
    'CLK', 'DAT', 'LED IO1', 'LED IO2', 'NTC',
    'VDD', 'GND',
]

for signal in key_signals:
    found_pins = []
    for d, n, net in results:
        if signal in net:
            found_pins.append(f"Pin {d} ({n})")
    if found_pins:
        print(f"  {signal:<12} -> {', '.join(found_pins)}")
    else:
        print(f"  {signal:<12} -> [NOT FOUND matching '{signal}']")

# Also list B1-B12 connections
print(f"\n{'='*70}")
print(f"BATTERY CHANNEL (B1-B12) TO MCU PIN SUMMARY")
print(f"{'='*70}")
for bnum in range(1, 13):
    bname = f'B{bnum}'
    found_pins = []
    for d, n, net in results:
        # Match exact B name (e.g. B1 but not B10 when checking B1)
        nets = net.split(', ')
        for net_name in nets:
            if net_name.strip() == bname:
                found_pins.append(f"Pin {d} ({n})")
                break
    if found_pins:
        print(f"  {bname:<6} -> {', '.join(found_pins)}")
    else:
        print(f"  {bname:<6} -> [NOT FOUND]")

# Also check B1AD-B12AD
print(f"\n{'='*70}")
print(f"BATTERY ADC (B1AD-B12AD) TO MCU PIN SUMMARY")
print(f"{'='*70}")
for bnum in range(1, 13):
    bname = f'B{bnum}AD'
    found_pins = []
    for d, n, net in results:
        nets = net.split(', ')
        for net_name in nets:
            if net_name.strip() == bname:
                found_pins.append(f"Pin {d} ({n})")
                break
    if found_pins:
        print(f"  {bname:<8} -> {', '.join(found_pins)}")
    else:
        print(f"  {bname:<8} -> [NOT FOUND]")

# ============================================================================
# 10. Debug: Show all unique net names found across all wires
# ============================================================================
all_nets = sorted(set(wire_to_net.values()))
print(f"\n=== All {len(all_nets)} unique net names propagated across wires ===")
for net in all_nets:
    print(f"  {net}")

ole.close()
