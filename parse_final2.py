# -*- coding: utf-8 -*-
import olefile
import re
import struct

path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
ole = olefile.OleFileIO(path)

data = ole.openstream('FileHeader').read()

# Split on null byte
null_pos = data.index(b'\x00')
body = data[null_pos+1:]

# Pattern for records
def find_records(rec_type, body):
    pattern = f'RECORD={rec_type}\\|.*?(?=\\x00\\x00|\\x00[\\x01-\\x08])'.encode()
    return list(re.finditer(pattern, body, re.DOTALL))

def parse_fields(chunk):
    """Extract key=value pairs from a record chunk"""
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

# Find MCU pins
mcu_owner_index = '4462'
mcu_pins = []

pin_matches = find_records(2, body)
for m in pin_matches:
    fields = parse_fields(m.group())
    ownerindex = fields.get('OWNERINDEX', '')
    if ownerindex == mcu_owner_index:
        pin = {
            'designator': fields.get('DESIGNATOR', '?'),
            'name': fields.get('NAME', '?'),
            'x': fields.get('LOCATION.X', '?'),
            'y': fields.get('LOCATION.Y', '?'),
        }
        mcu_pins.append(pin)

print(f"=== MCU Pins ({len(mcu_pins)}) ===")
for pin in sorted(mcu_pins, key=lambda p: int(p['designator']) if p['designator'].isdigit() else 999):
    print(f"  Pin {pin['designator']}: {pin['name']} @ ({pin['x']}, {pin['y']})")

# Find net labels
nl_matches = find_records(25, body)
net_labels = []
for m in nl_matches:
    fields = parse_fields(m.group())
    net_labels.append({
        'text': fields.get('TEXT', '?'),
        'x': fields.get('LOCATION.X', '?'),
        'y': fields.get('LOCATION.Y', '?'),
    })

print(f"\nTotal net labels: {len(net_labels)}")

# Find wires - parse coordinates, handling potential decimal points
w_matches = find_records(27, body)
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
                # Handle values like "1370." by stripping trailing dot
                x = int(float(x_str))
                y = int(float(y_str))
                coords.append((x, y))
            except:
                pass
    wires.append({
        'count': count,
        'coords': coords,
        'index': fields.get('INDEXINSHEET', '?'),
    })

print(f"Total wires: {len(wires)}")

# Build coordinate lookups
coord_to_wire = {}
for wi, w in enumerate(wires):
    for coord in w['coords']:
        if coord not in coord_to_wire:
            coord_to_wire[coord] = []
        coord_to_wire[coord].append(wi)

coord_to_net = {}
for nl in net_labels:
    try:
        x = int(float(nl['x']))
        y = int(float(nl['y']))
        coord_to_net[(x, y)] = nl['text']
    except:
        pass

# For each MCU pin, find the connected net
# A pin connects to a net via a wire that starts/passes through the pin coordinate
# The net name is determined by net labels on the connected wire, or on wires that intersect
print(f"\n=== MCU Pin to Net Mapping ===")

# Build a wire connectivity graph: which wires share coordinates
# Also, a net label at a coordinate assigns that net name to all wires passing through that coord

# First, for each wire, find its net name (from net labels on any of its vertices)
wire_to_net = {}
for wi, w in enumerate(wires):
    net_name = None
    for coord in w['coords']:
        n = coord_to_net.get(coord)
        if n:
            net_name = n
            break
    if net_name:
        wire_to_net[wi] = net_name

print(f"Wires with net labels: {len(wire_to_net)}")

# Now, propagate net names through connected wires (wires sharing coordinates)
# Build wire adjacency
wire_adj = {}
for coord, wire_list in coord_to_wire.items():
    for wi in wire_list:
        if wi not in wire_adj:
            wire_adj[wi] = set()
        for wj in wire_list:
            if wi != wj:
                wire_adj[wi].add(wj)

# Propagate net names along connected wires (BFS)
changed = True
while changed:
    changed = False
    for wi in list(wire_to_net.keys()):
        net = wire_to_net[wi]
        for neighbor in wire_adj.get(wi, set()):
            if neighbor not in wire_to_net:
                wire_to_net[neighbor] = net
                changed = True

print(f"Wires with net labels after propagation: {len(wire_to_net)}")

# Now map MCU pins to nets
for pin in sorted(mcu_pins, key=lambda p: int(p['designator']) if p['designator'].isdigit() else 999):
    try:
        px = int(float(pin['x']))
        py = int(float(pin['y']))
    except:
        print(f"  Pin {pin['designator']} ({pin['name']}): [invalid coords]")
        continue
    
    wire_indices = coord_to_wire.get((px, py), [])
    if wire_indices:
        nets = set()
        for wi in wire_indices:
            net = wire_to_net.get(wi)
            if net:
                nets.add(net)
        if nets:
            net_str = ', '.join(sorted(nets))
            print(f"  Pin {pin['designator']} ({pin['name']}): {net_str}")
        else:
            print(f"  Pin {pin['designator']} ({pin['name']}): [wire but no net label]")
    else:
        # Check if pin is directly at a net label
        net = coord_to_net.get((px, py))
        if net:
            print(f"  Pin {pin['designator']} ({pin['name']}): {net} (direct)")
        else:
            print(f"  Pin {pin['designator']} ({pin['name']}): [no connection found]")

# Also find which MCU pins the key signals connect to
print(f"\n=== Key Signal to MCU Pin Mapping ===")
key_signals = ['CD IO1', 'CD IO2', 'VT_PWM1', 'EN', 'VCC_SW', 'CLK', 'DAT', 'LED IO1', 'LED IO2', 'NTC']
for signal in key_signals:
    found = False
    for pin in sorted(mcu_pins, key=lambda p: int(p['designator']) if p['designator'].isdigit() else 999):
        try:
            px = int(float(pin['x']))
            py = int(float(pin['y']))
        except:
            continue
        wire_indices = coord_to_wire.get((px, py), [])
        for wi in wire_indices:
            net = wire_to_net.get(wi)
            if net == signal:
                print(f"  {signal}: Pin {pin['designator']} ({pin['name']})")
                found = True
    if not found:
        print(f"  {signal}: [not found on MCU]")

ole.close()
