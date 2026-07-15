import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()
text = data.decode('latin-1')

# Strategy: RECORD=17 often defines nets with TEXT (net name)
# RECORD=13 often links pins to nets via OWNERINDEX 
# RECORD=6 = wires between pins (X/Y endpoints)
# RECORD=41 = pins on components

# First, find ALL RECORD=17 entries that have TEXT (these are net definitions)
print("=" * 80)
print("NET DEFINITIONS (RECORD=17 with TEXT)")
print("=" * 80)
nets = {}  # OWNERINDEX -> net name
for m in re.finditer(r'RECORD=17\|.*?TEXT=(\S+)', text):
    net_name = m.group(1)
    start = max(0, m.start() - 5)
    end = min(len(text), m.end() + 40)
    ctx = text[start:end]
    oi_match = re.search(r'OWNERINDEX=(\d+)', ctx)
    oi = oi_match.group(1) if oi_match else '?'
    nets[oi] = net_name
    if any(kw in net_name.upper() for kw in ['B', 'AD', 'NTC', 'NET', 'BAT']):
        print(f"  Net: {net_name}  OWNERINDEX={oi}")

# Look for RECORD=13 entries which connect component pins to nets
# They reference OWNERINDEX (net) and OWNERPART (component pin)
print("\n" + "=" * 80)
print("RECORD=13 ENTRIES (connections to nets)")
print("=" * 80)

# Find all RECORD=13 that reference any of our net OWNERINDEXes
for m in re.finditer(r'RECORD=13\|(.*?)(?=RECORD=\d)', text):
    ctx = m.group(1)
    oi_match = re.search(r'OWNERINDEX=(\d+)', ctx)
    if oi_match:
        oi = oi_match.group(1)
        if oi in nets:
            net_name = nets[oi]
            # Find what this connects to - look at nearby context for pin info
            # Complete the record
            full_start = m.start()
            full_end = min(len(text), m.end() + 120)
            full_ctx = text[full_start:full_end]
            print(f"  Net: {net_name} (OWNERINDEX={oi})")
            print(f"    Record: {ctx[:200]}")

print("\n" + "=" * 80)
print("ALL RECORD TYPES FOR BxAD LABELS")
print("=" * 80)

# For each BxAD label, find ALL occurrences and their record types
for label_num in range(1, 13):
    label = f'B{label_num}AD'
    print(f"\n  --- {label} ---")
    for m in re.finditer(re.escape(label), text):
        # Find enclosing record
        # Go backwards to find RECORD=X
        search_start = max(0, m.start() - 200)
        search_end = min(len(text), m.end() + 200)
        chunk = text[search_start:search_end]
        rec_match = re.findall(r'RECORD=(\d+)', chunk)
        oi_match = re.findall(r'OWNERINDEX=(\d+)', chunk)
        loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
        uid_match = re.search(r'UNIQUEID=(\S+?)\|', chunk)
        
        recs = list(set(rec_match)) if rec_match else ['?']
        ois = list(set(oi_match)) if oi_match else ['?']
        loc = f"({loc_match.group(1)},{loc_match.group(2)})" if loc_match else '(?,?)'
        uid = uid_match.group(1) if uid_match else '?'
        
        print(f"    RECORD={recs}  OWNERINDEX={ois}  LOCATION={loc}  UNIQUEID={uid}")

print("\n" + "=" * 80)
print("NTC CONNECTIONS")
print("=" * 80)
for m in re.finditer(r'NTC', text):
    search_start = max(0, m.start() - 200)
    search_end = min(len(text), m.end() + 200)
    chunk = text[search_start:search_end]
    if 'RECORD=' in chunk:
        rec_match = re.findall(r'RECORD=(\d+)', chunk)
        oi_match = re.findall(r'OWNERINDEX=(\d+)', chunk)
        uid_match = re.search(r'UNIQUEID=(\S+?)\|', chunk)
        print(f"  Found NTC at offset {m.start()}")
        print(f"    RECORD types: {set(rec_match)}")
        print(f"    OWNERINDEX: {set(oi_match)}")
        if uid_match:
            print(f"    UNIQUEID: {uid_match.group(1)}")
        print()

# Also look for resistor divider networks - find 100K and 10K resistors near Battery ADC nets
print("\n" + "=" * 80)
print("RESISTORS NEAR BxAD/BATTERY NETS (by location)")
print("=" * 80)
# Find resistors with 10K or 100K values and their designators
res_info = []
for m in re.finditer(r'RECORD=34\|.*?TEXT=(R\d+)\|NAME=Designator', text):
    des = m.group(1)
    start = max(0, m.start() - 5)
    end = min(len(text), m.end() + 300)
    ctx = text[start:end]
    loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', ctx)
    # Find comment (value)
    val_match = re.search(r'TEXT=(10K,1%|100K,1%|10K|100K)\|NAME=Comment', ctx)
    if val_match and loc_match:
        res_info.append((des, val_match.group(1), int(loc_match.group(1)), int(loc_match.group(2))))
        print(f"  {des} = {val_match.group(1)} @ ({loc_match.group(1)},{loc_match.group(2)})")
