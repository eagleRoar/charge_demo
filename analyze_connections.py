import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()

# Extract all ASCII fragments with byte offsets
fragments = []
current = bytearray()
current_start = 0
for i, b in enumerate(data):
    if 32 <= b < 127:
        if len(current) == 0:
            current_start = i
        current.append(b)
    else:
        if len(current) >= 1:
            fragments.append((current_start, current.decode('ascii')))
        current = bytearray()

# Now analyze: find all RECORD=25 with TEXT=BxAD or TEXT=NTC
# Also find all RECORD=41 with NAME=ANx
# Cross-reference by net or location proximity

print("=== Net Labels (RECORD=25, TEXT=BxAD/NTC) ===")
net_labels = []
for offset, frag in fragments:
    if 'RECORD=25' in frag and ('TEXT=B' in frag or 'TEXT=NTC' in frag):
        # Extract the text value
        m = re.search(r'TEXT=(\S+)', frag)
        uid = re.search(r'UNIQUEID=(\S+)', frag)
        loc_x = re.search(r'LOCATION\.X=(\d+)', frag)
        loc_y = re.search(r'LOCATION\.Y=(\d+)', frag)
        text_val = m.group(1) if m else '?'
        uid_val = uid.group(1) if uid else '?'
        x = loc_x.group(1) if loc_x else '?'
        y = loc_y.group(1) if loc_y else '?'
        net_labels.append((text_val, uid_val, x, y))
        print(f"  {text_val}  UNIQUEID={uid_val}  LOCATION=({x},{y})")

print("\n=== MCU Pin Definitions (RECORD=41, NAME=ANx) ===")
mcu_pins = []
for offset, frag in fragments:
    if 'RECORD=41' in frag:
        m_name = re.search(r'NAME=AN(\d+)', frag)
        m_pin = re.search(r'DESIGNATOR=(\d+)', frag)
        m_uid = re.search(r'UNIQUEID=(\S+)', frag)
        m_oi = re.search(r'OWNERINDEX=(\d+)', frag)
        if m_name:
            name = f'AN{m_name.group(1)}'
            pin = m_pin.group(1) if m_pin else '?'
            uid = m_uid.group(1) if m_uid else '?'
            oi = m_oi.group(1) if m_oi else '?'
            mcu_pins.append((name, pin, uid, oi))
            print(f"  {name}  PIN_DESIGNATOR={pin}  UNIQUEID={uid}  OWNERINDEX={oi}")

# Also find RECORD=41 with NAME=VDD
print("\n=== VDD Pin ===")
for offset, frag in fragments:
    if 'RECORD=41' in frag and 'NAME=VDD' in frag:
        m_uid = re.search(r'UNIQUEID=(\S+)', frag)
        m_oi = re.search(r'OWNERINDEX=(\d+)', frag)
        print(f"  VDD  UNIQUEID={m_uid.group(1) if m_uid else '?'}  OWNERINDEX={m_oi.group(1) if m_oi else '?'}")

# Find RECORD=1 (component instances) related to MCU
print("\n=== Component Instances (RECORD=1, LIBREFERENCE) ===")
for offset, frag in fragments:
    if 'RECORD=1' in frag and 'LIBREFERENCE=' in frag:
        m_lib = re.search(r'LIBREFERENCE=(\S+)', frag)
        m_uid = re.search(r'UNIQUEID=(\S+)', frag)
        if m_lib:
            lib = m_lib.group(1)
            if any(kw in lib.upper() for kw in ['PIC', 'MCU', 'DSPIC', 'U1', 'U2', 'U3']):
                print(f"  {lib}  UNIQUEID={m_uid.group(1) if m_uid else '?'}")

# Now try to find wires/nets connecting BxAD labels to pins
# RECORD=17 seems to be net definition with TEXT (net name)
# RECORD=13 might be bus entries
# RECORD=41 with TEXT in wire context - but we saw RECORD=25 for labels

# Let's look at RECORD=17 which seems related to nets
print("\n=== Net Definitions (RECORD=17 with TEXT) ===")
for offset, frag in fragments:
    if 'RECORD=17' in frag and 'TEXT=' in frag:
        m_text = re.search(r'TEXT=(\S+)', frag)
        m_uid = re.search(r'UNIQUEID=(\S+)', frag)
        if m_text:
            text = m_text.group(1)
            if any(kw in text.upper() for kw in ['B', 'AD', 'NTC', 'AN', 'NET']):
                print(f"  TEXT={text}  UNIQUEID={m_uid.group(1) if m_uid else '?'}")

# RECORD=13 might be wire segments with net info
print("\n=== Wire/Bus Entries (RECORD=13 near BxAD context) ===")
for offset, frag in fragments:
    if 'RECORD=13' in frag or 'RECORD=8' in frag:
        if any(kw in frag for kw in ['OWNERINDEX=4746', 'OWNERINDEX=4760']):
            continue  # skip NTC related
        m_oi = re.search(r'OWNERINDEX=(\d+)', frag)
        if m_oi:
            oi = m_oi.group(1)
            # Check if this OWNERINDEX appears near a BxAD label
            # We'll find this later

# Find text objects RECORD=34 (Designator) for battery-related components
print("\n=== Designators (RECORD=34) near battery-related ===")
for offset, frag in fragments:
    if 'RECORD=34' in frag:
        m_text = re.search(r'TEXT=(\S+)', frag)
        if m_text:
            text = m_text.group(1)
            m_uid = re.search(r'UNIQUEID=(\S+)', frag)
            uid = m_uid.group(1) if m_uid else '?'
            print(f"  {text}  UNIQUEID={uid}")
