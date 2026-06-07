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

# Clean approach: convert the WHOLE body to text, replacing non-printable with 
# null bytes, then split on null bytes to get clean record chunks
# But actually the pipe characters already delimit the records

# Let me try a completely different approach:
# Just search the body for all RECORD=2 entries and extract their field values
# using a simpler regex that handles the binary garbage

# Pattern: RECORD=2 followed by pipe-delimited key=value pairs
# Each field is |KEY=VALUE or just |KEY
pattern = rb'RECORD=2\|.*?(?=\x00\x00|\x00[\x01-\x08])'

matches = list(re.finditer(pattern, body, re.DOTALL))
print(f"Total RECORD=2 entries: {len(matches)}")

# For each match, extract fields
mcu_owner_index = '4462'
mcu_pins = []

for m in matches:
    chunk = m.group()
    # Clean the chunk - keep only printable ASCII and | and =
    clean = bytes(b for b in chunk if 32 <= b < 127 or b in (0x7c, 0x3d))
    text = clean.decode('ascii', errors='ignore')
    
    fields = {}
    for part in text.split('|'):
        eq_pos = part.find('=')
        if eq_pos > 0:
            key = part[:eq_pos]
            value = part[eq_pos+1:]
            fields[key] = value
    
    ownerindex = fields.get('OWNERINDEX', '')
    if ownerindex == mcu_owner_index:
        pin = {
            'designator': fields.get('DESIGNATOR', '?'),
            'name': fields.get('NAME', '?'),
            'x': fields.get('LOCATION.X', '?'),
            'y': fields.get('LOCATION.Y', '?'),
            'part': fields.get('OWNERPARTID', '?'),
            'electrical': fields.get('ELECTRICAL', '?'),
        }
        mcu_pins.append(pin)

print(f"\n=== MCU Pins (OWNERINDEX={mcu_owner_index}) ===")
for pin in sorted(mcu_pins, key=lambda p: int(p['designator']) if p['designator'].isdigit() else 999):
    print(f"  Pin {pin['designator']}: {pin['name']} @ ({pin['x']}, {pin['y']}) [part={pin['part']}, elec={pin['electrical']}]")

print(f"\nTotal MCU pins: {len(mcu_pins)}")

# Now let's find net connections
# Approach: Look for RECORD=25 (net label) records and RECORD=27 (wire) records
# A pin connects to a net if there's a wire at the pin's coordinates
# The net name is from the nearest net label on that wire

# Extract net labels
pattern_nl = rb'RECORD=25\|.*?(?=\x00\x00|\x00[\x01-\x08])'
nl_matches = list(re.finditer(pattern_nl, body, re.DOTALL))
print(f"\nTotal RECORD=25 (net labels): {len(nl_matches)}")

net_labels = []
for m in nl_matches:
    chunk = m.group()
    clean = bytes(b for b in chunk if 32 <= b < 127 or b in (0x7c, 0x3d))
    text = clean.decode('ascii', errors='ignore')
    
    fields = {}
    for part in text.split('|'):
        eq_pos = part.find('=')
        if eq_pos > 0:
            key = part[:eq_pos]
            value = part[eq_pos+1:]
            fields[key] = value
    
    net_labels.append({
        'text': fields.get('TEXT', '?'),
        'x': fields.get('LOCATION.X', '?'),
        'y': fields.get('LOCATION.Y', '?'),
    })

for nl in net_labels:
    print(f"  '{nl['text']}' @ ({nl['x']}, {nl['y']})")

# Extract wires (RECORD=27) - each wire is a polyline with X1,Y1...Xn,Yn
pattern_w = rb'RECORD=27\|.*?(?=\x00\x00|\x00[\x01-\x08])'
w_matches = list(re.finditer(pattern_w, body, re.DOTALL))
print(f"\nTotal RECORD=27 (wires): {len(w_matches)}")

wires = []
for m in w_matches:
    chunk = m.group()
    clean = bytes(b for b in chunk if 32 <= b < 127 or b in (0x7c, 0x3d))
    text = clean.decode('ascii', errors='ignore')
    
    fields = {}
    for part in text.split('|'):
        eq_pos = part.find('=')
        if eq_pos > 0:
            key = part[:eq_pos]
            value = part[eq_pos+1:]
            fields[key] = value
    
    # Extract coordinates
    count = int(fields.get('LOCATIONCOUNT', '0'))
    coords = []
    for i in range(1, count+1):
        x = fields.get(f'X{i}', None)
        y = fields.get(f'Y{i}', None)
        if x and y:
            coords.append((int(x), int(y)))
    
    wires.append({
        'count': count,
        'coords': coords,
        'index': fields.get('INDEXINSHEET', '?'),
    })

# Now for each MCU pin, find which wire it connects to
# and which net label is on that wire
# Pin locations are in mils (or the schematic grid unit)
# Wire segments connect points
# A pin connects to a wire if its (x, y) matches any wire vertex

# Build a lookup from coordinate to wire index
coord_to_wire = {}
for wi, w in enumerate(wires):
    for coord in w['coords']:
        coord_to_wire[coord] = wi

# Build a lookup from coordinate to net label
coord_to_net = {}
for nl in net_labels:
    try:
        x, y = int(nl['x']), int(nl['y'])
        coord_to_net[(x, y)] = nl['text']
    except:
        pass

print(f"\n=== MCU Pin to Net Mapping (by wire connectivity) ===")
for pin in sorted(mcu_pins, key=lambda p: int(p['designator']) if p['designator'].isdigit() else 999):
    try:
        px, py = int(pin['x']), int(pin['y'])
    except:
        print(f"  Pin {pin['designator']}: {pin['name']} -> [no valid coordinates]")
        continue
    
    # Find wire at this pin location
    wire_idx = coord_to_wire.get((px, py))
    if wire_idx is not None:
        wire = wires[wire_idx]
        # Check ALL wire vertices for net labels
        net_name = None
        for coord in wire['coords']:
            nl = coord_to_net.get(coord)
            if nl:
                net_name = nl
                break
        if net_name:
            print(f"  Pin {pin['designator']} ({pin['name']}) @ ({px},{py}) -> Net: {net_name}")
        else:
            print(f"  Pin {pin['designator']} ({pin['name']}) @ ({px},{py}) -> Wire#{wire_idx} [no net label found]")
    else:
        print(f"  Pin {pin['designator']} ({pin['name']}) @ ({px},{py}) -> [no wire at pin location]")

# Also look for net connections through RECORD=44 (which seems to be for components)
# Actually pin could also connect to a component pin directly
# Let me check if any other component pin is at the same wire vertices

# Also dump all unique net label texts
unique_nets = sorted(set(nl['text'] for nl in net_labels if nl['text'] != '?'))
print(f"\n=== All unique net label texts ===")
for n in unique_nets:
    print(f"  {n}")

ole.close()
