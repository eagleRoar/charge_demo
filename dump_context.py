import olefile

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()

# Find first B1AD occurrence and dump surrounding raw bytes
idx = data.find(b'B1AD')
print(f"First B1AD at offset {idx}")
# Look backwards for RECORD=
search_back = max(0, idx - 500)
chunk = data[search_back:idx+500]

# Convert to readable ASCII, replacing non-printable with .
ascii_view = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
print(f"\n=== ASCII view (offset {search_back}-{idx+500}) ===")
print(ascii_view)

# Now find the MCU pins  
print("\n\n=== MCU AN Pins ===")
for an_num in range(32):
    pattern = f'AN{an_num}'.encode()
    idx = data.find(pattern)
    if idx != -1:
        # Find RECORD= context
        search_back = max(0, idx - 300)
        chunk = data[search_back:idx+200]
        ascii_view = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
        print(f"\n  AN{an_num} @ offset {idx}:")
        print(f"  {ascii_view}")
