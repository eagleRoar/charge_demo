import olefile

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()

# Extract all ASCII strings with context
lines = []
current = bytearray()
for b in data:
    if 32 <= b < 127:
        current.append(b)
    else:
        if len(current) >= 1:
            s = current.decode('ascii')
            lines.append(s)
        current = bytearray()
if len(current) >= 1:
    lines.append(current.decode('ascii'))

# Write all ASCII strings to file for manual review
with open(r'e:\1.workspace\7.other\17.charge_demo\charge_demo\all_ascii_strings.txt', 'w', encoding='utf-8') as f:
    for i, line in enumerate(lines):
        f.write(f"{i}: {line}\n")

print(f"Total ASCII fragments: {len(lines)}")

# Now search for BxAD and their connections
# Look for TEXT=BxAD records - these are net labels
print("\n=== Net Label Analysis ===")
for i, line in enumerate(lines):
    if 'TEXT=B' in line and 'AD|' in line:
        # Find context: look at surrounding records
        ctx_start = max(0, i-20)
        ctx_end = min(len(lines), i+20)
        print(f"\n--- Found at line {i}: {line} ---")
        for j in range(ctx_start, ctx_end):
            if 'LOCATION' in lines[j] or 'OWNERINDEX' in lines[j] or 'OWNERPART' in lines[j] or \
               'TEXT=' in lines[j] or 'RECORD=' in lines[j] or 'NAME=' in lines[j] or \
               'DESIGNATOR' in lines[j] or 'UNIQUEID' in lines[j] or 'LIBREFERENCE' in lines[j] or \
               'COMPONENT' in lines[j] or 'PIN' in lines[j] or 'NET' in lines[j]:
                print(f"  [{j}] {lines[j]}")

# Also specifically look for RECORD=41 type connections (wire connections)
print("\n\n=== Wire/Connection Records (RECORD=41) ===")
for i, line in enumerate(lines):
    if 'RECORD=41' in line:
        ctx_start = max(0, i-5)
        ctx_end = min(len(lines), i+5)
        ctx = ' | '.join(lines[ctx_start:ctx_end])
        if any(kw in ctx for kw in ['B1AD', 'B2AD', 'B3AD', 'B4AD', 'B5AD', 'B6AD', 
                                      'B7AD', 'B8AD', 'B9AD', 'B10AD', 'B11AD', 'B12AD', 'NTC',
                                      'AN0', 'AN1', 'AN2', 'AN3', 'AN4', 'AN5', 'AN6', 'AN7',
                                      'AN8', 'AN9', 'AN10', 'AN11', 'AN12', 'AN13', 'AN14', 'AN15',
                                      'AN16', 'AN17', 'AN18', 'AN19', 'AN20', 'AN21', 'AN22', 'AN23',
                                      'AN24', 'AN25', 'AN26', 'AN27', 'AN28', 'AN29']):
            print(f"  [{i}] {ctx}")
