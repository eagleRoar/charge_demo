"""Detailed analysis of VT_PWM1 circuit."""
import re

SCHDOC_PATH = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc"

def parse_records(data):
    records = []
    pattern = re.compile(b'RECORD=(\\d+)\\|')
    for m in pattern.finditer(data):
        rec_type = int(m.group(1))
        start = m.start()
        next_match = pattern.search(data, start + 1)
        end = next_match.start() if next_match else len(data)
        raw = data[start:end]
        try:
            text = raw.decode('latin-1', errors='replace')
        except:
            text = str(raw[:200])
        records.append((rec_type, raw, text))
    return records

def clean_value(v):
    v = v.replace('\x00', '')
    v = re.sub(r'[^\x20-\x7E]+$', '', v)
    return v.strip()

def parse_fields(text):
    fields = {}
    parts = text.split('|')
    for part in parts:
        if '=' not in part:
            continue
        if part.startswith('%UTF8%'):
            eq_idx = part.find('=', 6)
            if eq_idx > 0:
                key = part[6:eq_idx]
                value = part[eq_idx + 1:]
            else:
                continue
        else:
            eq_idx = part.find('=')
            key = part[:eq_idx].strip()
            value = part[eq_idx + 1:].strip()
        fields[key] = clean_value(value)
    return fields

def safe_int(v):
    if v is None:
        return None
    try:
        v = v.strip().rstrip('.')
        if v:
            return int(float(v))
    except:
        pass
    return None

with open(SCHDOC_PATH, 'rb') as f:
    data = f.read()

records = parse_records(data)

wires, net_labels, pins, components = [], [], [], []
for rec_type, raw, text in records:
    fields = parse_fields(text)
    fields['_raw'] = text
    if rec_type == 27:
        wires.append(fields)
    elif rec_type == 25:
        net_labels.append(fields)
    elif rec_type == 2:
        pins.append(fields)
    elif rec_type == 1:
        components.append(fields)

# Find all wires near X=1050 area
print("=== ALL WIRES (RECORD=27) sorted by X coordinate ===")
all_wire_pts = []
for wi, w in enumerate(wires):
    lc = int(w.get('LOCATIONCOUNT', 0))
    pts = [(safe_int(w.get(f'X{j}')), safe_int(w.get(f'Y{j}'))) for j in range(1, lc+1)]
    all_wire_pts.append((wi, pts, w.get('INDEXINSHEET'), w.get('UNIQUEID')))

# Sort by min X
all_wire_pts.sort(key=lambda x: min(p[0] or 0 for p in x[1]))
print(f"Total wires: {len(wires)}")
print()

# Show wires in X range [900, 1200]
print("=== WIRES with X in [900, 1200] DXP units ===")
for wi, pts, idx, uid in all_wire_pts:
    xs = [p[0] for p in pts if p[0]]
    ys = [p[1] for p in pts if p[1]]
    if xs and min(xs) <= 1200 and max(xs) >= 900:
        print(f"Wire#{wi}: pts={pts} INDEXINSHEET={idx}")
print()

# Show COMPONENTS near X=1050, Y=500 area  
print("=== COMPONENTS (RECORD=1) near X=[900,1200], Y=[300,800] ===")
for comp in components:
    x = safe_int(comp.get('LOCATION.X'))
    y = safe_int(comp.get('LOCATION.Y'))
    if x and y and 900 <= x <= 1200 and 300 <= y <= 800:
        print(f"  LIBREFERENCE={comp.get('LIBREFERENCE')} X={x} Y={y} "
              f"INDEXINSHEET={comp.get('INDEXINSHEET')}")
print()

# Show PINS near the VT_PWM1 wire area
print("=== PINS (RECORD=2) near X=[1040,1060], Y=[460,520] ===")
comp_index = {}
for comp in components:
    idx = comp.get('INDEXINSHEET', '')
    if idx:
        comp_index[idx] = comp

for pin in pins:
    px = safe_int(pin.get('LOCATION.X'))
    py = safe_int(pin.get('LOCATION.Y'))
    if px and py and 1040 <= px <= 1060 and 460 <= py <= 520:
        owner_idx = pin.get('OWNERINDEX', '?')
        comp = comp_index.get(owner_idx, {})
        print(f"  Pin: OWNERINDEX={owner_idx} LIB={comp.get('LIBREFERENCE','?')} "
              f"DESIGNATOR={pin.get('DESIGNATOR','?')} NAME={pin.get('NAME','?')} "
              f"X={px} Y={py}")
print()

# Also show pins with wider tolerance
print("=== PINS near X=[1000,1100], Y=[450,550] ===")
for pin in pins:
    px = safe_int(pin.get('LOCATION.X'))
    py = safe_int(pin.get('LOCATION.Y'))
    if px and py and 1000 <= px <= 1100 and 450 <= py <= 550:
        owner_idx = pin.get('OWNERINDEX', '?')
        comp = comp_index.get(owner_idx, {})
        print(f"  Pin: OWNERINDEX={owner_idx} LIB={comp.get('LIBREFERENCE','?')} "
              f"DESIGNATOR={pin.get('DESIGNATOR','?')} NAME={pin.get('NAME','?')} "
              f"X={px} Y={py} PINLENGTH={pin.get('PINLENGTH','?')}")
print()

# Check if the wire at X=1050 connects to another wire via any coordinate
print("=== WIRES connected to endpoints (1050,470) or (1050,510) ===")
for wi, pts, idx, uid in all_wire_pts:
    for pt in pts:
        if pt[0] and pt[1]:
            if (abs(pt[0] - 1050) <= 5 and abs(pt[1] - 470) <= 5) or \
               (abs(pt[0] - 1050) <= 5 and abs(pt[1] - 510) <= 5):
                if wi != 83:  # exclude the VT_PWM1 wire itself
                    print(f"Wire#{wi}: pts={pts} INDEXINSHEET={idx}")
                    break
print()

# Show ALL wires in the entire file for reference
print("=== ALL net labels near VT_PWM1 area (INDEX 120-135) in order ===")
for nl in sorted(net_labels, key=lambda n: int(n.get('INDEXINSHEET', '0') or '0')):
    idx = int(nl.get('INDEXINSHEET', '0'))
    if 118 <= idx <= 135:
        text = nl.get('TEXT', '')
        x = nl.get('LOCATION.X', '?')
        y = nl.get('LOCATION.Y', '?')
        uid = nl.get('UNIQUEID', '')
        print(f"  INDEX={idx} TEXT={text:<12s} X={x:>5s} Y={y:>5s}")
