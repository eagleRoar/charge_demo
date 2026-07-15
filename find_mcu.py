import olefile, re
fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()
text = data.decode('latin-1')

# Find MCU component instance: RECORD=1 with LIBREFERENCE
print('=== All RECORD=1 with LIBREFERENCE ===')
for m in re.finditer(r'RECORD=1\|.*?LIBREFERENCE=([^|]+)', text):
    lib = m.group(1)
    start = m.start()
    chunk = text[start:start+600]
    loc = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
    oi = re.search(r'OWNERINDEX=(\d+)', chunk)
    desc = re.search(r'COMPONENTDESCRIPTION=([^|]*)', chunk)
    if loc:
        x, y = loc.group(1), loc.group(2)
        oi_val = oi.group(1) if oi else '?'
        desc_val = desc.group(1) if desc else '?'
        print(f'  {lib} @ ({x},{y}) OI={oi_val}')

# Also look for which OWNERINDEX=4498 component is
print()
print('=== Looking for OWNERINDEX=4498 component ===')
idx = text.find('OWNERINDEX=4498')
if idx != -1:
    start = max(0, idx - 200)
    end = min(len(text), idx + 200)
    print(text[start:end])

# Look for RECORD=1 preceding OWNERINDEX=4498
print()
print('=== Component with OWNERINDEX=4498 ===')
# Find RECORD=1 that leads to component with sub-records having OWNERINDEX=4498
for m in re.finditer(r'RECORD=1\|', text):
    start = m.start()
    chunk = text[start:start+500]
    if 'OWNERINDEX=4498' in chunk:
        lib = re.search(r'LIBREFERENCE=([^|]+)', chunk)
        loc = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', chunk)
        print(f'  LIB={lib.group(1) if lib else "?"}  LOC=({loc.group(1)},{loc.group(2)})')
        print(f'  Chunk: {chunk[:400]}')
        break
