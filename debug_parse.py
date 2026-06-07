# -*- coding: utf-8 -*-
import olefile
import re

path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
ole = olefile.OleFileIO(path)

data = ole.openstream('FileHeader').read()

null_pos = data.index(b'\x00')
body = data[null_pos+1:]

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

# Debug: print first few net labels with raw chunks
print("=== DEBUG: First 5 net labels ===")
nl_matches = find_records(25, body)
for i, m in enumerate(nl_matches[:5]):
    chunk = m.group()
    # Show raw bytes
    print(f"\nMatch {i}:")
    print(f"  Raw hex: {chunk.hex()[:200]}")
    fields = parse_fields(chunk)
    print(f"  Parsed TEXT: '{fields.get('TEXT')}'")
    print(f"  Parsed X: '{fields.get('LOCATION.X')}'")
    print(f"  Parsed Y: '{fields.get('LOCATION.Y')}'")

# Now debug wire parsing
print(f"\n=== DEBUG: First 3 wires ===")
w_matches = find_records(27, body)
for i, m in enumerate(w_matches[:3]):
    chunk = m.group()
    print(f"\nWire {i}:")
    print(f"  Raw hex: {chunk.hex()[:200]}")
    fields = parse_fields(chunk)
    print(f"  LOCATIONCOUNT: '{fields.get('LOCATIONCOUNT')}'")
    print(f"  X1: '{fields.get('X1')}', Y1: '{fields.get('Y1')}'")

# Check if any wire coordinate matches a net label coordinate
net_labels = []
for m in nl_matches:
    fields = parse_fields(m.group())
    try:
        x = int(float(fields.get('LOCATION.X', '0')))
        y = int(float(fields.get('LOCATION.Y', '0')))
        net_labels.append({'text': fields.get('TEXT', '?'), 'x': x, 'y': y})
    except Exception as e:
        print(f"Parse error for net label: {e} - fields: {fields}")

print(f"\nNet labels parsed: {len(net_labels)}")
print(f"First 3: {net_labels[:3]}")

wires = []
for m in w_matches:
    fields = parse_fields(m.group())
    count = int(fields.get('LOCATIONCOUNT', '0'))
    coords = []
    for i in range(1, count+1):
        x_str = fields.get(f'X{i}', None)
        y_str = fields.get(f'Y{i}', None)
        if x_str and y_str:
            try:
                x = int(float(x_str))
                y = int(float(y_str))
                coords.append((x, y))
            except Exception as e:
                print(f"Wire coord parse error: {e} - x={x_str}, y={y_str}")
    wires.append({'coords': coords, 'count': count})

# Build coordinate maps
coord_to_net = {(nl['x'], nl['y']): nl['text'] for nl in net_labels}
coord_to_wire = {}
for wi, w in enumerate(wires):
    for coord in w['coords']:
        if coord not in coord_to_wire:
            coord_to_wire[coord] = []
        coord_to_wire[coord].append(wi)

# Check which net labels are at wire vertices
print(f"\n=== Net labels matching wire coordinates ===")
matched = 0
for nl in net_labels:
    key = (nl['x'], nl['y'])
    if key in coord_to_wire:
        print(f"  '{nl['text']}' @ {key} -> wire indices: {coord_to_wire[key]}")
        matched += 1
print(f"Matched {matched}/{len(net_labels)}")

# If no matches, check nearest
if matched == 0:
    print(f"\n=== Checking nearest wire to each net label ===")
    for nl in net_labels[:5]:
        min_dist = float('inf')
        nearest = None
        for coord, wire_list in coord_to_wire.items():
            dist = abs(nl['x'] - coord[0]) + abs(nl['y'] - coord[1])
            if dist < min_dist:
                min_dist = dist
                nearest = coord
        print(f"  '{nl['text']}' @ ({nl['x']},{nl['y']}) -> nearest wire coord: {nearest} dist={min_dist}")

ole.close()
