import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()
text = data.decode('latin-1')

# MCU pins (RECORD=2 with OWNERINDEX=4498)
mcu_pins = {}
for m in re.finditer(r'RECORD=2\|OWNERINDEX=4498\|', text):
    start = m.start()
    chunk = text[start:start+200]
    name_match = re.search(r'NAME=(AN\d+|VDD|VSS)', chunk)
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    if name_match and loc_match:
        mcu_pins[name_match.group(1)] = (int(loc_match.group(1)), int(loc_match.group(2)))

print("=== MCU Pin Map ===")
for name in sorted(mcu_pins.keys(), key=lambda n: (int(n[2:]) if n[2:].isdigit() else 0)):
    print(f"  {name}: {mcu_pins[name]}")

# RECORD=27 format: Xi=value|Yi=value (different indices)
print("\n=== Extracting Wire Segments ===")
wire_nets = {}
for m in re.finditer(r'RECORD=27\|', text):
    start = m.start()
    end = min(len(text), start + 800)
    chunk = text[start:end]
    oi_match = re.search(r'OWNERINDEX=(\d+)', chunk)
    # Extract Xn/Yn pairs with same n
    coord_pairs = re.findall(r'X(\d+)=(\d+)\|Y(\d+)=(\d+)', chunk)
    valid_pairs = [(int(x), int(y)) for n1, x, n2, y in coord_pairs if n1 == n2]
    
    if oi_match and len(valid_pairs) >= 2:
        oi = oi_match.group(1)
        if oi not in wire_nets:
            wire_nets[oi] = []
        wire_nets[oi].extend(valid_pairs)

print(f"Total nets with wires: {len(wire_nets)}")

# Find net labels and match to wires
print("\n=== Net Labels Matched to Wire Segments ===")
net_label_wires = {}
for m in re.finditer(r'(?:RECORD=17|RECORD=25)\|.*?TEXT=([^|]+)', text):
    net_name = m.group(1)
    start = m.start()
    chunk = text[start:start+300]
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    if loc_match:
        lx, ly = int(loc_match.group(1)), int(loc_match.group(2))
        for oi, points in wire_nets.items():
            for px, py in points:
                if abs(px - lx) < 50 and abs(py - ly) < 50:
                    key = (net_name, oi)
                    if key not in net_label_wires:
                        net_label_wires[key] = {
                            'label_loc': (lx, ly),
                            'wire_points': points,
                            'net_oi': oi
                        }
                    break

for (name, oi), info in sorted(net_label_wires.items(), key=lambda x: x[1]['label_loc'][1]):
    if any(kw in name.upper() for kw in ['B', 'AD', 'NTC', 'AN', 'VDD', 'VCC', 'GND', 'BAT']):
        pts = info['wire_points']
        xs = [p[0] for p in pts]
        ys = [p[1] for p in pts]
        print(f"  {name} (OI={oi}) @ {info['label_loc']} -> wires: ({min(xs)},{min(ys)})-({max(xs)},{max(ys)})")

# Match BxAD to MCU pins
print("\n=== BxAD -> MCU Pin Matching ===")
for (name, oi), info in net_label_wires.items():
    if not re.match(r'B\d+AD', name):
        continue
    points = info['wire_points']
    # Find if any wire point is near an MCU pin
    best_match = None
    best_dist = 99999
    for an_name, (px, py) in mcu_pins.items():
        for wx, wy in points:
            dist = abs(wx - px) + abs(wy - py)
            if dist < best_dist:
                best_dist = dist
                best_match = (an_name, px, py, wx, wy, dist)
    
    if best_match and best_match[5] < 100:
        an_name, px, py, wx, wy, dist = best_match
        print(f"  {name} -> {an_name} (MCU pin at {px},{py}, wire at {wx},{wy}, dist={dist})")
    elif best_match:
        an_name, px, py, wx, wy, dist = best_match
        print(f"  {name} -> ? closest={an_name} (dist={dist})")

# Also try to find NTC connection
print("\n=== NTC -> MCU Pin Matching ===")
for (name, oi), info in net_label_wires.items():
    if 'NTC' not in name.upper():
        continue
    points = info['wire_points']
    best_match = None
    best_dist = 99999
    for an_name, (px, py) in mcu_pins.items():
        for wx, wy in points:
            dist = abs(wx - px) + abs(wy - py)
            if dist < best_dist:
                best_dist = dist
                best_match = (an_name, px, py, wx, wy, dist)
    if best_match:
        an_name, px, py, wx, wy, dist = best_match
        print(f"  {name} -> {an_name} (MCU pin at {px},{py}, wire at {wx},{wy}, dist={dist})")
