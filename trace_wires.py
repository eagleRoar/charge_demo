import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()
text = data.decode('latin-1')

# MCU is OWNERINDEX=4498. MCU pins (RECORD=2) locations:
mcu_pins = {}  # pin_name -> (x, y)
for m in re.finditer(r'RECORD=2\|OWNERINDEX=4498\|', text):
    start = m.start()
    end = min(len(text), start + 200)
    chunk = text[start:end]
    name_match = re.search(r'NAME=(AN\d+)', chunk)
    pin_match = re.search(r'DESIGNATOR=(\d+)', chunk)
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    if name_match and loc_match:
        mcu_pins[name_match.group(1)] = (int(loc_match.group(1)), int(loc_match.group(2)))

# Also find VDD pin
for m in re.finditer(r'RECORD=2\|OWNERINDEX=4498\|', text):
    start = m.start()
    end = min(len(text), start + 200)
    chunk = text[start:end]
    name_match = re.search(r'NAME=(VDD|VSS)', chunk)
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    if name_match and loc_match:
        mcu_pins[name_match.group(1)] = (int(loc_match.group(1)), int(loc_match.group(2)))

print("=== MCU Pin Map ===")
for name in sorted(mcu_pins.keys(), key=lambda n: (int(n[2:]) if n[2:].isdigit() else 0)):
    print(f"  {name}: {mcu_pins[name]}")

# Now extract all RECORD=27 wires with their OWNERINDEX and coordinates
print("\n=== Extracting Wire Segments ===")
wire_nets = {}  # OWNERINDEX -> list of (x1,y1,x2,y2)
for m in re.finditer(r'RECORD=27\|', text):
    start = m.start()
    end = min(len(text), start + 500)
    chunk = text[start:end]
    oi_match = re.search(r'OWNERINDEX=(\d+)', chunk)
    coords = re.findall(r'X(\d+)=(\d+)\|Y\1=(\d+)', chunk)
    if oi_match and len(coords) >= 2:
        oi = oi_match.group(1)
        points = [(int(x), int(y)) for _, x, y in coords]
        if oi not in wire_nets:
            wire_nets[oi] = []
        wire_nets[oi].extend(points)

print(f"Total nets with wires: {len(wire_nets)}")

# Now find all net labels (RECORD=17 with TEXT or RECORD=25 with TEXT)
# and find their wire OWNERINDEX by proximity
print("\n=== Net Labels and Their Wires ===")
net_labels = []
for m in re.finditer(r'(?:RECORD=17|RECORD=25)\|.*?TEXT=([^|]+)', text):
    net_name = m.group(1)
    start = m.start()
    end = min(len(text), start + 200)
    chunk = text[start:end]
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    if loc_match:
        lx, ly = int(loc_match.group(1)), int(loc_match.group(2))
        # Find nearest wire for this net label
        for oi, points in wire_nets.items():
            for px, py in points:
                if abs(px - lx) < 50 and abs(py - ly) < 50:
                    net_labels.append((net_name, oi, lx, ly, points))
                    break
            else:
                continue
            break

for name, oi, lx, ly, points in sorted(set(net_labels), key=lambda x: x[3]):
    if any(kw in name.upper() for kw in ['B', 'AD', 'NTC', 'AN', 'VDD', 'VCC', 'GND', 'BAT']):
        print(f"  {name} (OI={oi}) @ ({lx},{ly}) -> wire points: {points[:5]}")

# Now for BxAD nets, try to find which MCU pin they connect to
print("\n=== BxAD -> MCU Pin Matching (by wire proximity) ===")
bxad_nets = [(n, oi, lx, ly, pts) for n, oi, lx, ly, pts in net_labels if re.match(r'B\d+AD', n)]
for name, oi, lx, ly, points in bxad_nets:
    # Find if any wire endpoint is near an MCU pin
    matched_pins = []
    for an_name, (px, py) in mcu_pins.items():
        for wx, wy in points:
            if abs(wx - px) < 20 and abs(wy - py) < 20:
                matched_pins.append((an_name, px, py, wx, wy))
    if matched_pins:
        for an, ppx, ppy, wx, wy in matched_pins:
            print(f"  {name} (OI={oi}) -> {an} at MCU({ppx},{ppy}) near wire({wx},{wy})")
    else:
        # Find the closest MCU pin
        closest_pin = None
        closest_dist = 99999
        for an_name, (px, py) in mcu_pins.items():
            for wx, wy in points:
                dist = abs(wx - px) + abs(wy - py)
                if dist < closest_dist:
                    closest_dist = dist
                    closest_pin = (an_name, px, py, wx, wy)
        if closest_pin and closest_dist < 500:
            print(f"  {name} (OI={oi}) -> ? closest: {closest_pin[0]} at dist={closest_dist}")
