# -*- coding: utf-8 -*-
"""
Final comprehensive SchDoc parser for SC8F096AD832 MCU pin-to-net mapping.
Key improvements:
- Connected components (Union-Find) instead of BFS overwriting
- Power ports (RECORD=17) handling for VDD/GND
- ALL net labels collected per connected component
- Proximity matching with threshold=35 for MCU pin connections
"""
import olefile
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
ole = olefile.OleFileIO(path)
data = ole.openstream('FileHeader').read()
null_pos = data.index(b'\x00')
body = data[null_pos+1:]

# ============================================================================
# Utility functions
# ============================================================================
def clean_int(s):
    if not s:
        return None
    s = s.strip()
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
    pattern = f'RECORD={rec_type}\\|.*?(?=\\x00\\x00|\\x00[\\x01-\\x08])'.encode()
    return list(re.finditer(pattern, body, re.DOTALL))

def parse_fields(chunk):
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

def point_to_seg_dist(px, py, x1, y1, x2, y2):
    dx = x2 - x1
    dy = y2 - y1
    if dx == 0 and dy == 0:
        return abs(px - x1) + abs(py - y1)
    t = max(0, min(1, ((px - x1) * dx + (py - y1) * dy) / (dx * dx + dy * dy)))
    proj_x = x1 + t * dx
    proj_y = y1 + t * dy
    return abs(px - proj_x) + abs(py - proj_y)

# ============================================================================
# 1. Parse MCU Pins
# ============================================================================
MCU_OWNER = '4462'
mcu_pins = []

for m in find_records(2, body):
    fields = parse_fields(m.group())
    if fields.get('OWNERINDEX', '') == MCU_OWNER:
        x = clean_int(fields.get('LOCATION.X', ''))
        y = clean_int(fields.get('LOCATION.Y', ''))
        if x is not None and y is not None:
            mcu_pins.append({
                'designator': fields.get('DESIGNATOR', '?'),
                'name': fields.get('NAME', '?'),
                'x': x, 'y': y,
            })

mcu_pins.sort(key=lambda p: clean_int(p['designator']) or 999)

# ============================================================================
# 2. Parse Net Labels (RECORD=25)
# ============================================================================
net_labels = {}
for m in find_records(25, body):
    fields = parse_fields(m.group())
    x = clean_int(fields.get('LOCATION.X', ''))
    y = clean_int(fields.get('LOCATION.Y', ''))
    text = fields.get('TEXT', '?')
    if x is not None and y is not None and text != '?':
        key = (x, y)
        if key not in net_labels:
            net_labels[key] = []
        net_labels[key].append(text)

# Flatten: one entry per label (duplicate coords get multiple labels)
all_net_label_entries = []
for (x, y), texts in net_labels.items():
    for t in texts:
        all_net_label_entries.append({'text': t, 'x': x, 'y': y})

# ============================================================================
# 3. Parse Wires (RECORD=27)
# ============================================================================
wires = []
for m in find_records(27, body):
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
    if coords:
        wires.append({'coords': coords})

# ============================================================================
# 4. Parse Power Ports (RECORD=17) 
# ============================================================================
power_ports = []
for m in find_records(17, body):
    fields = parse_fields(m.group())
    x = clean_int(fields.get('LOCATION.X', ''))
    y = clean_int(fields.get('LOCATION.Y', ''))
    text = fields.get('TEXT', '')
    if x is not None and y is not None and text:
        power_ports.append({'text': text, 'x': x, 'y': y})

# ============================================================================
# 5. Build Connected Components via Union-Find
# ============================================================================
parent = list(range(len(wires)))

def find(i):
    while parent[i] != i:
        parent[i] = parent[parent[i]]
        i = parent[i]
    return i

def union(i, j):
    ri, rj = find(i), find(j)
    if ri != rj:
        parent[ri] = rj

# Map coordinate to wire indices for junction detection
coord_to_wire_indices = {}
for wi, w in enumerate(wires):
    for coord in w['coords']:
        coord_to_wire_indices.setdefault(coord, []).append(wi)

# Union wires that share a coordinate
for coord, wire_list in coord_to_wire_indices.items():
    for i in range(len(wire_list)):
        for j in range(i + 1, len(wire_list)):
            union(wire_list[i], wire_list[j])

# ============================================================================
# 6. Assign Net Labels to Wire Components
# ============================================================================
THRESHOLD = 30

# Build wire segments for proximity checking
segments = []  # (wire_idx, x1, y1, x2, y2)
for wi, w in enumerate(wires):
    for i in range(len(w['coords']) - 1):
        x1, y1 = w['coords'][i]
        x2, y2 = w['coords'][i + 1]
        segments.append((wi, x1, y1, x2, y2))

# Map component root -> set of net names
comp_nets = {}

for nl in all_net_label_entries:
    nx, ny = nl['x'], nl['y']
    best_dist = THRESHOLD + 1
    best_wi = None
    
    # Check vertex proximity
    for (cx, cy), wire_list in coord_to_wire_indices.items():
        dist = abs(nx - cx) + abs(ny - cy)
        if dist < best_dist:
            best_dist = dist
            best_wi = wire_list[0]
    
    # Check segment proximity
    for wi, sx1, sy1, sx2, sy2 in segments:
        dist = point_to_seg_dist(nx, ny, sx1, sy1, sx2, sy2)
        if dist < best_dist:
            best_dist = dist
            best_wi = wi
    
    if best_wi is not None and best_dist <= THRESHOLD:
        root = find(best_wi)
        comp_nets.setdefault(root, set()).add(nl['text'])

# Also assign power port net names (use larger threshold - power ports can be further from wire endpoints)
PP_THRESHOLD = 45
for pp in power_ports:
    nx, ny = pp['x'], pp['y']
    best_dist = PP_THRESHOLD + 1
    best_wi = None
    
    for (cx, cy), wire_list in coord_to_wire_indices.items():
        dist = abs(nx - cx) + abs(ny - cy)
        if dist < best_dist:
            best_dist = dist
            best_wi = wire_list[0]
    
    for wi, sx1, sy1, sx2, sy2 in segments:
        dist = point_to_seg_dist(nx, ny, sx1, sy1, sx2, sy2)
        if dist < best_dist:
            best_dist = dist
            best_wi = wi
    
    if best_wi is not None and best_dist <= PP_THRESHOLD:
        root = find(best_wi)
        comp_nets.setdefault(root, set()).add(pp['text'])

# ============================================================================
# 7. Map MCU Pins to Connected Components
# ============================================================================
PIN_THRESHOLD = 35

results = []
for pin in mcu_pins:
    px, py = pin['x'], pin['y']
    designator = pin['designator']
    name = pin['name']
    
    # Find nearest wire within PIN_THRESHOLD
    best_dist = PIN_THRESHOLD + 1
    best_wi = None
    
    for (cx, cy), wire_list in coord_to_wire_indices.items():
        dist = abs(px - cx) + abs(py - cy)
        if dist < best_dist:
            best_dist = dist
            best_wi = wire_list[0]
    
    # Also check segment proximity
    for wi, sx1, sy1, sx2, sy2 in segments:
        dist = point_to_seg_dist(px, py, sx1, sy1, sx2, sy2)
        if dist < best_dist:
            best_dist = dist
            best_wi = wi
    
    if best_wi is not None and best_dist <= PIN_THRESHOLD:
        root = find(best_wi)
        nets = comp_nets.get(root, set())
        if nets:
            net_str = ', '.join(sorted(nets))
        else:
            net_str = '[wires, no net label]'
        results.append({'designator': designator, 'name': name, 'net': net_str,
                       'nets_set': nets, 'dist': best_dist})
    else:
        # Check power port proximity
        pp_match = None
        for pp in power_ports:
            dist = abs(px - pp['x']) + abs(py - pp['y'])
            if dist <= PIN_THRESHOLD:
                pp_match = pp['text']
                break
        if pp_match:
            results.append({'designator': designator, 'name': name, 'net': pp_match,
                           'nets_set': {pp_match}, 'dist': dist})
        else:
            # Check net label proximity directly
            nl_match = None
            for nl in all_net_label_entries:
                dist = abs(px - nl['x']) + abs(py - nl['y'])
                if dist <= PIN_THRESHOLD:
                    nl_match = nl['text']
                    break
            if nl_match:
                results.append({'designator': designator, 'name': name, 'net': nl_match,
                               'nets_set': {nl_match}, 'dist': dist})
            else:
                results.append({'designator': designator, 'name': name, 'net': '[no connection]',
                               'nets_set': set(), 'dist': best_dist})

# ============================================================================
# 8. Output: Complete Mapping Table
# ============================================================================
print(f"{'='*75}")
print(f"SC8F096AD832 QFN32 MCU - COMPLETE PIN CONNECTION MAP")
print(f"{'='*75}")
print(f"\n{'QFN#':<6} {'MCU Pin':<8} {'Connected Net(s)/Signal(s)':<45} {'Dist'}")
print(f"{'-'*6} {'-'*8} {'-'*45} {'-'*4}")
for r in results:
    print(f"  {r['designator']:<4} {r['name']:<8} {r['net']:<45} {r.get('dist', '-'):>4}")

# ============================================================================
# 9. Key Signal Summary
# ============================================================================
print(f"\n{'='*75}")
print(f"KEY SIGNAL MAPPING")
print(f"{'='*75}")

key_signals = [
    ('CD IO1', 'MOSFET gate drive for charge/discharge'),
    ('CD IO2', 'MOSFET gate drive for charge/discharge'),
    ('VT_PWM1', 'Voltage PWM output'),
    ('EN', 'Enable signal'),
    ('CLK', 'ICSP clock'),
    ('DAT', 'ICSP data'),
    ('LED IO1', 'LED indicator output 1'),
    ('LED IO2', 'LED indicator output 2'),
    ('NTC', 'Temperature sensor (NTC thermistor)'),
    ('VDD', 'MCU power supply (VDD)'),
    ('GND', 'Ground'),
]

for signal, desc in key_signals:
    found_pins = []
    for r in results:
        if signal in r['nets_set']:
            found_pins.append(f"Pin {r['designator']} ({r['name']})")
    if found_pins:
        print(f"  {signal:<12} -> {', '.join(found_pins)}")
        print(f"  {'':12}    ({desc})")
    else:
        # Check if signal is part of a compound net string
        found_pins2 = []
        for r in results:
            if signal in r['net']:
                found_pins2.append(f"Pin {r['designator']} ({r['name']})")
        if found_pins2:
            print(f"  {signal:<12} -> {', '.join(found_pins2)} [substring match]")
            print(f"  {'':12}    ({desc})")
        else:
            print(f"  {signal:<12} -> [NOT FOUND]")

# ============================================================================
# 10. Battery Channel Mapping
# ============================================================================
print(f"\n{'='*75}")
print(f"BATTERY CHANNEL MAPPING (B1-B12 / B1AD-B12AD)")
print(f"{'='*75}")

print(f"\n{'Channel':<8} {'MCU Pin':<16} {'ADC Pin':<16}")
print(f"{'-'*8} {'-'*16} {'-'*16}")

for bnum in range(1, 13):
    bname = f'B{bnum}'
    bad_name = f'B{bnum}AD'
    b_pin = None
    bad_pin = None
    for r in results:
        if bname in r['nets_set']:
            b_pin = f"Pin {r['designator']} ({r['name']})"
        if bad_name in r['nets_set']:
            bad_pin = f"Pin {r['designator']} ({r['name']})"
    print(f"  {bname:<8} {b_pin or '[NOT FOUND]':<16} {bad_pin or '[NOT FOUND]':<16}")

# ============================================================================
# 11. Power pins VDD/GND detail
# ============================================================================
print(f"\n{'='*75}")
print(f"POWER PINS (VDD / GND)")
print(f"{'='*75}")

for r in results:
    if r['name'] in ['VDD', 'GND']:
        print(f"  Pin {r['designator']} ({r['name']}): {r['net']}")

# Check power ports found
if power_ports:
    print(f"\nPower ports found: {len(power_ports)}")
    for pp in power_ports:
        print(f"  {pp['text']} @ ({pp['x']}, {pp['y']})")

# ============================================================================
# 12. Statistics
# ============================================================================
connected = sum(1 for r in results if r['nets_set'])
print(f"\n{'='*75}")
print(f"STATISTICS")
print(f"{'='*75}")
print(f"  Total MCU pins: {len(mcu_pins)}")
print(f"  Pins with identified nets: {connected}")
print(f"  Pins without identified nets: {len(mcu_pins) - connected}")
print(f"  Total net labels: {len(all_net_label_entries)}")
print(f"  Total wires: {len(wires)}")
print(f"  Connected components with nets: {len(comp_nets)}")
print(f"  Unique net names across all components: {len(set().union(*comp_nets.values())) if comp_nets else 0}")

ole.close()
