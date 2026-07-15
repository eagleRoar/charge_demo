import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()

# Convert to latin-1 to preserve byte values as characters
text = data.decode('latin-1')

# Find all ANx pin definitions
print("=" * 80)
print("MCU PIN DEFINITIONS (ANx pins from RECORD=41)")
print("=" * 80)
# Pattern: NAME=ANxx|DESIGNATOR=xx... within records
an_pattern = re.compile(r'NAME=(AN\d+)\|DESIGNATOR=(\d+)')
for m in an_pattern.finditer(text):
    an_name = m.group(1)
    pin_num = m.group(2)
    # Get surrounding context
    start = max(0, m.start() - 20)
    end = min(len(text), m.end() + 80)
    ctx = text[start:end]
    # Find OWNERINDEX if present
    oi_match = re.search(r'OWNERINDEX=(\d+)', ctx)
    oi = oi_match.group(1) if oi_match else '?'
    print(f"  {an_name} -> MCU_PIN={pin_num}  OWNERINDEX={oi}")

print()
print("=" * 80)
print("NET LABELS (BxAD/NTC from RECORD=25)")
print("=" * 80)
# Pattern: TEXT=BxAD|...|RECORD=25
label_pattern = re.compile(r'TEXT=(B\d+AD|NTC)\|')
for m in label_pattern.finditer(text):
    label = m.group(1)
    start = max(0, m.start() - 30)
    end = min(len(text), m.end() + 120)
    ctx = text[start:end]
    uid_match = re.search(r'UNIQUEID=(\S+?)\|', ctx)
    loc_x = re.search(r'LOCATION\.X=(\d+)', ctx)
    loc_y = re.search(r'LOCATION\.Y=(\d+)', ctx)
    rec_match = re.search(r'RECORD=(\d+)', ctx)
    ownerindex = re.search(r'OWNERINDEX=(\d+)', ctx)
    uid = uid_match.group(1) if uid_match else '?'
    x = loc_x.group(1) if loc_x else '?'
    y = loc_y.group(1) if loc_y else '?'
    rec = rec_match.group(1) if rec_match else '?'
    oi = ownerindex.group(1) if ownerindex else '?'
    print(f"  {label}  RECORD={rec}  UNIQUEID={uid}  LOCATION=({x},{y})  OWNERINDEX={oi}")

print()
print("=" * 80)
print("COMPONENT INSTANCES (RECORD=1 with LIBREFERENCE)")
print("=" * 80)
# Find component placements
comp_pattern = re.compile(r'RECORD=1\|.*?LIBREFERENCE=([^|]+)')
seen = set()
for m in comp_pattern.finditer(text):
    lib = m.group(1)
    if lib not in seen and len(lib) > 1:
        seen.add(lib)
        start = max(0, m.start())
        end = min(len(text), m.end() + 80)
        ctx = text[start:end]
        uid_match = re.search(r'UNIQUEID=(\S+?)\|', ctx)
        desc_match = re.search(r'DESIGNATOR=(\S+?)\|', ctx)
        desc = desc_match.group(1) if desc_match else '?'
        uid = uid_match.group(1) if uid_match else '?'
        if any(kw in lib.upper() for kw in ['PIC', 'MCU', 'DSPIC', 'RES', 'CAP', 'NTC', 'BAT', 'CELL']):
            print(f"  LIB={lib}  DESIGNATOR={desc}  UNIQUEID={uid}")

print()
print("=" * 80)
print("RESISTOR VALUES (10K, 100K comments)")
print("=" * 80)
res_pattern = re.compile(r'TEXT=(10K,1%|100K,1%|10K|100K)\|NAME=Comment')
for m in res_pattern.finditer(text):
    val = m.group(1)
    start = max(0, m.start() - 30)
    end = min(len(text), m.end() + 80)
    ctx = text[start:end]
    uid_match = re.search(r'UNIQUEID=(\S+?)\|', ctx)
    uid = uid_match.group(1) if uid_match else '?'
    print(f"  {val}  UNIQUEID={uid}")
    # Only show first 15
    if m.start() > 200000:
        break

print()
print("=" * 80)
print("NTC COMPONENT DETAILS (NTC1)")
print("=" * 80)
ntc_pattern = re.compile(r'TEXT=NTC1.*?RECORD=34')
for m in ntc_pattern.finditer(text):
    start = max(0, m.start() - 10)
    end = min(len(text), m.end() + 200)
    ctx = text[start:end]
    print(f"  {ctx[:300]}")

# Find comment for NTC1 (RECORD=41 with Comment name for NTC1)
print()
print("=" * 80)
print("NTC1 VALUE")
print("=" * 80)
for m in re.finditer(r'TEXT=(CMFA\S+?)\|NAME=Comment', text):
    print(f"  NTC Model: {m.group(1)}")

# Find battery-related texts  
print()
print("=" * 80)
print("BATTERY/VOLTAGE RELATED")
print("=" * 80)
for m in re.finditer(r'TEXT=([^|]*[Bb][Aa][Tt][^|]*)\|', text):
    val = m.group(1)
    if len(val) < 30 and val not in ('BAT54C',):
        print(f"  {val}")

print()
print("=" * 80)
print("DESIGNATORS (R/C/Q components)")
print("=" * 80)
des_pattern = re.compile(r'RECORD=34\|.*?TEXT=([RCQ]\d+)\|NAME=Designator')
seen_des = set()
for m in des_pattern.finditer(text):
    des = m.group(1)
    if des not in seen_des:
        seen_des.add(des)
        start = max(0, m.start() - 10)
        end = min(len(text), m.end() + 80)
        ctx = text[start:end]
        uid_match = re.search(r'UNIQUEID=(\S+?)\|', ctx)
        uid = uid_match.group(1) if uid_match else '?'
        print(f"  {des}  UNIQUEID={uid}")
        if len(seen_des) >= 50:
            break
