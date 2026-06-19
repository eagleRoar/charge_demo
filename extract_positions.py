# -*- coding: utf-8 -*-
"""Extract component positions from PcbDoc and generate a visual layout."""
import struct
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
with open(filepath, 'rb') as f:
    data = f.read()

# =====================================================
# Find component records with SOURCEDESIGNATOR and coordinates
# =====================================================
# Each component record typically has:
# SOURCEDESIGNATOR=xxx
# SOURCELIBREFERENCE=xxx
# Nearby (or within) there are X and Y coordinates

# We need to find the structured records for specific components
targets = ['NTC1', 'R48', 'C12']

# Strategy: for each target, find SOURCEDESIGNATOR=<target> and extract the record
for target in targets:
    print(f"\n{'='*60}")
    print(f"COMPONENT: {target}")
    print(f"{'='*60}")
    
    search_pattern = f'SOURCEDESIGNATOR={target}'.encode('ascii')
    idx = data.find(search_pattern)
    
    if idx < 0:
        print(f"  Not found with SOURCEDESIGNATOR")
        continue
    
    # Find record boundaries - search backward for record start, forward for record end
    # Records are roughly 500-2000 bytes
    
    # Search backward for a record start marker
    rec_start = idx
    while rec_start > max(0, idx - 2000) and data[rec_start:rec_start+1] != b'\x00':
        rec_start -= 1
    rec_start += 1  # Start after the null byte
    
    # Search forward for record end
    rec_end = idx
    null_count = 0
    # Look for the end of the record (several consecutive nulls + next component start)
    while rec_end < min(len(data), idx + 2000):
        if data[rec_end:rec_end+1] == b'\x00':
            null_count += 1
            if null_count >= 8:
                break
        else:
            null_count = 0
        rec_end += 1
    
    rec_data = data[rec_start:rec_end]
    print(f"  Record: {rec_start} - {rec_end}, size: {len(rec_data)} bytes")
    
    # Show the record text (pipe-delimited part)
    try:
        text = rec_data.decode('latin-1', errors='replace')
        # Extract pipe-delimited section
        pipe_start = text.find('|')
        pipe_end = text.rfind('|')
        if pipe_start >= 0 and pipe_end > pipe_start:
            pipe_section = text[pipe_start:pipe_end+1]
        else:
            pipe_section = text[:500]
        print(f"  Pipe text: {pipe_section[:1000]}")
    except:
        pass
    
    # Parse key-value pairs from the record
    pairs = {}
    for m in re.finditer(rb'([A-Z]+)=([^|]*)', rec_data):
        key = m.group(1).decode('ascii', errors='ignore')
        val = m.group(2).decode('latin-1', errors='replace')
        if key not in pairs:
            pairs[key] = val
    
    # Show ALL keys found
    print(f"  All keys found:")
    for k, v in sorted(pairs.items()):
        print(f"    {k} = {v[:80]}")

print("\n\n" + "="*60)
print("Extracting ALL component positions for layout visualization")
print("="*60)

# Find all SOURCEDESIGNATOR patterns and try to get coordinates
all_components = {}
pattern = re.compile(rb'SOURCEDESIGNATOR=([A-Z]+\d+)')
for m in pattern.finditer(data):
    designator = m.group(1).decode('ascii')
    
    # Find the start of this record
    rec_start = m.start()
    while rec_start > max(0, m.start() - 1500) and data[rec_start:rec_start+1] != b'\x00':
        rec_start -= 1
    rec_start += 1
    
    rec_end = m.end()
    null_count = 0
    while rec_end < min(len(data), m.end() + 1500):
        if data[rec_end:rec_end+1] == b'\x00':
            null_count += 1
            if null_count >= 8:
                break
        else:
            null_count = 0
        rec_end += 1
    
    rec_data = data[rec_start:rec_end]
    
    # Fast extract X and Y
    # In PcbDoc binary, coordinates are often stored as 8-byte doubles
    # Search for patterns that look like coordinate values in mils
    # Components on this board have typical coordinates between 0 and ~5000 mils
    
    pairs = {}
    for m2 in re.finditer(rb'([A-Z]+)=([^|\x00]+)', rec_data):
        key = m2.group(1).decode('ascii', errors='ignore')
        val = m2.group(2).decode('latin-1', errors='replace')
        if key not in pairs:
            pairs[key] = val
    
    # Also look for binary doubles near the record that might be coordinates
    # Find float values by scanning the record binary
    possible_coords = []
    for j in range(0, len(rec_data) - 7):
        try:
            fval = struct.unpack_from('<d', rec_data, j)[0]
            if 0.0 < fval < 10000.0 and abs(fval - round(fval, 1)) < 0.1:
                if rec_data[j-1:j] == b'\x00' or j == 0:
                    possible_coords.append(fval)
        except:
            pass
    
    all_components[designator] = {
        'pairs': pairs,
        'floats': possible_coords[:4]  # First few likely coordinates
    }

# Print all found components
print(f"\nFound {len(all_components)} components")
for name in sorted(all_components.keys()):
    comp = all_components[name]
    desc = comp['pairs'].get('SOURCEDESCRIPTION', '')
    lib = comp['pairs'].get('SOURCELIBREFERENCE', '')
    layer = comp['pairs'].get('LAYER', '?')
    print(f"  {name:10s} | {lib:15s} | {desc[:30]:30s} | LAYER={layer} | floats={comp['floats']}")

print("\nDONE")
