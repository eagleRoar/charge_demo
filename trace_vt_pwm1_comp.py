"""Find component mapping and trace VT_PWM1 connection to MCU pin."""
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

# Print all unique record types
rtype_counts = {}
for rec_type, raw, text in records:
    rtype_counts[rec_type] = rtype_counts.get(rec_type, 0) + 1
print("=== RECORD TYPE COUNTS ===")
for rt, cnt in sorted(rtype_counts.items()):
    print(f"  RECORD={rt}: {cnt}")

# For record type 2 (pins), look at a sample to understand OWNERINDEX mapping
print("\n=== SAMPLE RECORD=2 (pins) ===")
pcount = 0
for rec_type, raw, text in records:
    if rec_type == 2:
        fields = parse_fields(text)
        if pcount < 5:
            print(f"  {text[:200]}")
        pcount += 1

# Find what component corresponds to OWNERINDEX=4462
print("\n=== COMPONENTS (RECORD=1) with all index fields ===")
comp_indices = {}  # INDEXINSHEET -> component fields
for rec_type, raw, text in records:
    if rec_type == 1:
        fields = parse_fields(text)
        idx = fields.get('INDEXINSHEET', '')
        lib = fields.get('LIBREFERENCE', '')
        loc_x = safe_int(fields.get('LOCATION.X'))
        loc_y = safe_int(fields.get('LOCATION.Y'))
        if idx:
            comp_indices[idx] = (lib, loc_x, loc_y, fields.get('UNIQUEID'))
            if lib and 'SC' in lib:
                print(f"  INDEXINSHEET={idx} LIB={lib} X={loc_x} Y={loc_y}")

# Find the MCU component
print("\n=== Components near MCU pin area (X=1000, Y=540) ===")
for rec_type, raw, text in records:
    if rec_type == 1:
        fields = parse_fields(text)
        x = safe_int(fields.get('LOCATION.X'))
        y = safe_int(fields.get('LOCATION.Y'))
        if x and y and 900 <= x <= 1200 and 400 <= y <= 700:
            print(f"  LIB={fields.get('LIBREFERENCE')} X={x} Y={y} "
                  f"INDEXINSHEET={fields.get('INDEXINSHEET')} "
                  f"UNIQUEID={fields.get('UNIQUEID')} "
                  f"PARTCOUNT={fields.get('PARTCOUNT')}"
                  f"  _raw={text[:150]}")

print("\n=== ALL PINS with OWNERINDEX and their component lookup ===")
pins_by_owner = {}
for rec_type, raw, text in records:
    if rec_type == 2:
        fields = parse_fields(text)
        owner = fields.get('OWNERINDEX', '')
        if owner not in pins_by_owner:
            pins_by_owner[owner] = []
        pins_by_owner[owner].append(fields)

# Show which owners have pins
print(f"\n  Total unique OWNERINDEX values: {len(pins_by_owner)}")
for owner, plist in sorted(pins_by_owner.items(), key=lambda x: len(x[1]), reverse=True)[:20]:
    designators = [p.get('DESIGNATOR','?') for p in plist[:5]]
    names = [p.get('NAME','?') for p in plist[:5]]
    print(f"  OWNERINDEX={owner}: {len(plist)} pins, "
          f"designators={designators[:5]}, names={names[:5]}")

# Now for OWNERINDEX=4462, show all pins  
print("\n=== All pins for OWNERINDEX=4462 ===")
for pin in pins_by_owner.get('4462', []):
    px = safe_int(pin.get('LOCATION.X'))
    py = safe_int(pin.get('LOCATION.Y'))
    designator = pin.get('DESIGNATOR', '?')
    name = pin.get('NAME', '?')
    print(f"  DESIGNATOR={designator} NAME={name} X={px} Y={py} "
          f"_raw={pin.get('_raw','')[:150]}")

# Check if any component has a UNIQUEID that matches some index
print("\n=== Components sorted by LIBREFERENCE ===")
all_comps = []
for rec_type, raw, text in records:
    if rec_type == 1:
        fields = parse_fields(text)
        all_comps.append(fields)
all_comps.sort(key=lambda c: c.get('LIBREFERENCE', 'ZZZZ'))
for c in all_comps:
    lib = c.get('LIBREFERENCE', '?')
    idx = c.get('INDEXINSHEET', '')
    uid = c.get('UNIQUEID', '')
    if lib and len(lib) > 2 and 'R' not in lib and 'C' not in lib:
        print(f"  LIB={lib} INDEXINSHEET={idx} UNIQUEID={uid}")
