import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()

print(f"FileHeader size: {len(data)} bytes")
print(f"First 128 bytes (hex): {data[:128].hex()}")

# Try UTF-16BE
try:
    text_be = data.decode('utf-16-be', errors='ignore')
    printable_be = ''.join(c if c.isprintable() or c in '\n\r\t' else ' ' for c in text_be)
    print(f"\nUTF-16BE first 500 chars:")
    print(printable_be[:500])
except Exception as e:
    print(f"UTF-16BE error: {e}")

# Try UTF-8
try:
    text_u8 = data.decode('utf-8', errors='ignore')
    printable_u8 = ''.join(c if c.isprintable() or c in '\n\r\t' else ' ' for c in text_u8)
    print(f"\nUTF-8 first 500 chars:")
    print(printable_u8[:500])
except Exception as e:
    print(f"UTF-8 error: {e}")

# Extract long ASCII strings from raw bytes
print("\n=== ASCII strings (len>=8) from raw bytes ===")
current = []
for b in data:
    if 32 <= b < 127:
        current.append(chr(b))
    else:
        if len(current) >= 8:
            s = ''.join(current)
            print(f"  {s}")
        current = []
if len(current) >= 8:
    s = ''.join(current)
    print(f"  {s}")

# Also search for the specific patterns in raw data
print("\n=== Pattern search in raw bytes ===")
patterns = [b'B1AD', b'B2AD', b'B3AD', b'B4AD', b'B5AD', b'B6AD', b'B7AD', b'B8AD', b'B9AD', b'B10AD', b'B11AD', b'B12AD',
            b'NTC', b'ADC', b'AN0', b'AN1', b'AN2', b'AN3', b'AN4', b'AN5', b'AN6', b'AN7', b'AN8', b'AN9',
            b'AN10', b'AN11', b'AN12', b'AN13', b'AN14', b'AN15', b'AN16', b'AN17', b'AN18', b'AN19',
            b'AN20', b'AN21', b'AN22', b'AN23', b'AN24', b'AN25', b'AN26', b'AN27', b'AN28', b'AN29', b'AN30', b'AN31',
            b'RC0', b'RC1', b'RC2', b'RC3', b'RC4', b'RC5', b'RC6', b'RC7',
            b'RA0', b'RA1', b'RA2', b'RA3', b'RA4', b'RA5', b'RA6', b'RA7',
            b'RB0', b'RB1', b'RB2', b'RB3', b'RB4', b'RB5', b'RB6', b'RB7',
            b'RD0', b'RD1', b'RD2', b'RD3', b'RD4', b'RD5', b'RD6', b'RD7',
            b'VDD', b'VSS', b'10K', b'100K', b'BATTERY', b'VOLTAGE', b'SENSE',
            b'BAT', b'CHG', b'CELL', b'VCAP', b'VREF']

for pat in patterns:
    idx = 0
    while True:
        idx = data.find(pat, idx)
        if idx == -1:
            break
        start = max(0, idx - 5)
        end = min(len(data), idx + len(pat) + 40)
        ctx = data[start:end]
        # Show as both hex and ASCII
        ascii_ctx = ''.join(chr(b) if 32 <= b < 127 else '.' for b in ctx)
        print(f"  [{pat.decode()}] @{idx}: ...{ascii_ctx}...")
        idx += 1
