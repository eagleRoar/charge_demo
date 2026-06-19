# -*- coding: utf-8 -*-
"""Direct binary search for NTC1, R48, C12 in PcbDoc."""
filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
with open(filepath, 'rb') as f:
    data = f.read()

print(f"File size: {len(data):,} bytes")

# Search for ASCII and UTF-16 versions of the terms
terms = ['NTC1', 'R48', 'C12']

for term in terms:
    # ASCII search
    ascii_bytes = term.encode('ascii')
    # UTF-16-LE search (common in Altium)
    utf16_bytes = term.encode('utf-16-le')
    
    print(f"\n{'='*60}")
    print(f"Searching for: {term}")
    print(f"{'='*60}")
    
    # ASCII
    pos = 0
    count = 0
    while True:
        idx = data.find(ascii_bytes, pos)
        if idx < 0:
            break
        count += 1
        if count <= 10:
            ctx_start = max(0, idx - 60)
            ctx_end = min(len(data), idx + 300)
            ctx = data[ctx_start:ctx_end]
            # Try to decode as text
            try:
                text = ctx.decode('latin-1', errors='replace')
                printable = ''.join(c if c.isprintable() or c in '\n\r\t' else '.' for c in text)
                print(f"\n  ASCII #{count} at offset 0x{idx:08x}:")
                print(f"  {printable[:400]}")
            except:
                print(f"\n  ASCII #{count} at offset 0x{idx:08x}: (binary, {len(ctx)} bytes)")
        pos = idx + 1
    
    if count == 0:
        print(f"  Not found in ASCII")
    elif count > 10:
        print(f"  ... ({count - 10} more occurrences)")
    
    # UTF-16-LE (may be used in Altium binary format)
    pos = 0
    count = 0
    while True:
        idx = data.find(utf16_bytes, pos)
        if idx < 0:
            break
        count += 1
        if count <= 5:
            ctx_start = max(0, idx - 40)
            ctx_end = min(len(data), idx + 200)
            ctx = data[ctx_start:ctx_end]
            print(f"\n  UTF-16 #{count} at offset 0x{idx:08x}:")
            print(f"  Hex: {ctx.hex()[:200]}")
            # Try to decode
            try:
                text = ctx.decode('utf-16-le', errors='replace')
                printable = ''.join(c if c.isprintable() or c in '\n\r\t' else '.' for c in text)
                print(f"  Text: {printable[:200]}")
            except:
                pass
        pos = idx + 1
    
    if count == 0:
        print(f"  Not found in UTF-16-LE")
    
    # Also search for just "NTC" without the 1, and "R48" variations
    if term == 'NTC1':
        for var in ['NTC', b'NTC\x00']:
            idx = data.find(var if isinstance(var, bytes) else var.encode('ascii'))
            if idx >= 0:
                ctx = data[max(0,idx-20):min(len(data),idx+100)]
                print(f"\n  Also found 'NTC' at 0x{idx:08x}: {ctx[:100]}")

print("\n\nDONE")
