# -*- coding: utf-8 -*-
"""
Comprehensive Altium PcbDoc parser to trace net connections.
Searches the raw binary for net data and connection information.
"""
import struct
import re
import os
import sys

# Force UTF-8 output
sys.stdout.reconfigure(encoding='utf-8')

PCB_FILE = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'

def find_all_pipe_records(data):
    """Find all pipe-delimited records in the binary data.
    Records look like: |KEY=VALUE|KEY=VALUE|KEY=VALUE|
    Some may be embedded within binary structures.
    """
    records = []
    # Search for pipe sequences that look like key=value pairs
    # Pattern: | followed by KEY=VALUE
    pattern = re.compile(b'\\|[A-Z][A-Z0-9_]*=[^|]*')
    
    i = 0
    while i < len(data):
        # Find the start of a potential record
        pipe_pos = data.find(b'|RECORD=', i)
        if pipe_pos < 0:
            pipe_pos = data.find(b'|NAME=', i)
        if pipe_pos < 0:
            pipe_pos = data.find(b'|OWNERINDEX=', i)
        if pipe_pos < 0:
            break
        
        # Search backwards for the true start
        rec_start = pipe_pos - 1
        while rec_start > 0 and data[rec_start:rec_start+1] != b'\x00':
            rec_start -= 1
        rec_start = max(rec_start, pipe_pos - 200)
        if data[rec_start:rec_start+1] == b'\x00':
            rec_start += 1
        
        # Find the end of the record
        rec_end = pipe_pos + 500
        # Look for end marker - null bytes followed by different data
        null_seq = data.find(b'\x00\x00\x00', pipe_pos + 10)
        if 0 < null_seq < rec_end:
            rec_end = null_seq
        
        chunk = data[rec_start:min(rec_end, len(data))]
        
        # Decode and check if it looks like a valid record
        try:
            text = chunk.decode('latin-1')
            # Count pipes - records typically have many
            pipe_count = text.count('|')
            if pipe_count >= 2 and '=' in text:
                records.append((rec_start, text[:500]))
        except:
            pass
        
        i = pipe_pos + 1
    
    return records


def extract_pcb_net_data(data):
    """Extract net connection data from the PcbDoc binary.
    
    Altium PcbDoc format uses a record-based format. Each record has:
    - Binary header with size and type info
    - Pipe-delimited text fields
    
    We'll search for patterns that indicate net connections.
    """
    results = {
        'nets': {},        # net_name -> {components: [{designator, pin}]}
        'components': {},  # designator -> {pins: [{pin_num, net}]}  
    }
    
    # Find all text-looking segments
    # Search for pipe-delimited records
    all_pipes = []
    for m in re.finditer(b'\\|[A-Z][A-Za-z0-9_]*=[^|]*', data):
        if len(m.group()) > 5:
            all_pipes.append((m.start(), m.group()))
    
    print(f"Found {len(all_pipes)} pipe-delimited pieces")
    
    # Look for records that contain NAME= (net names)
    # Group nearby pipes into records
    records = []
    used_positions = set()
    
    for pos, pipe in all_pipes:
        if pos in used_positions:
            continue
        
        # Search backwards and forwards for a complete record
        start = pos
        while start > 0 and data[start-1:start] != b'\x00' and data[start-1:start] != b'|' and start > pos - 50:
            start -= 1
        # Go further back to find |RECORD= start
        record_keyword = data.rfind(b'|RECORD=', max(0, pos-300), pos)
        if record_keyword > 0:
            start = record_keyword + 1
        
        end = pos + len(pipe)
        while end < len(data) and data[end:end+1] != b'\x00' and end < pos + 300:
            end += 1
        
        chunk = data[start:end]
        try:
            text = chunk.decode('latin-1', errors='replace')
            if '|' in text and '=' in text:
                records.append((start, text.strip('\x00')))
                for j in range(start, min(end, len(data))):
                    used_positions.add(j)
        except:
            pass
    
    print(f"Grouped into {len(records)} records")
    
    # Parse each record
    for offset, text in records:
        if 'NAME=' not in text:
            continue
        
        # Parse key=value pairs
        fields = {}
        for part in text.split('|'):
            if '=' in part:
                key, _, value = part.partition('=')
                fields[key.strip()] = value.strip()
        
        name = fields.get('NAME', '')
        if not name:
            continue
        
        # Check if this is a component or pad record
        if 'PATTERN' in fields:
            # This is a component definition
            designator = fields.get('SOURCEDESIGNATOR', fields.get('DESIGNATOR', name))
            results['components'][designator] = {
                'pattern': fields.get('PATTERN', ''),
                'name': name,
                'offset': offset
            }
        
        if 'OWNERINDEX' in fields or 'INDEXINSHEET' in fields:
            # Could be a pad record - need to find what net it connects to
            pass
    
    # Now search specifically for net name definitions
    # In PcbDoc, nets are stored with their connections
    # Look for sequences: [binary header][net name text][pad refs]
    
    # Search for all NAME= occurrences and analyze surrounding binary data
    for target_net in ['VT_PWM1', 'CD IO1', 'CD IO2', 'EN']:
        net_name_bytes = f'NAME={target_net}'.encode('ascii')
        pos = data.find(net_name_bytes)
        if pos < 0:
            print(f"\n  {target_net}: NOT FOUND in binary")
            continue
        
        print(f"\n=== {target_net} at offset 0x{pos:08x} ===")
        
        # Show surrounding binary context
        ctx_start = max(0, pos - 100)
        ctx_end = min(len(data), pos + 500)
        ctx = data[ctx_start:ctx_end]
        
        # Look for component/pin references nearby
        # Component designators look like "C1", "R2", "U3", "J2" etc.
        # Pin references look like "1", "2", etc. near designators
        
        # Show the pipe-delimited text
        text_start = ctx.find(b'|')
        if text_start < 0:
            text_start = 0
        else:
            text_start = max(0, text_start - 20)
        
        # Find end of text region
        text_end = ctx.find(b'\x00\x00', text_start + 10)
        if text_end < 0:
            text_end = min(len(ctx), 400)
        
        text_chunk = ctx[text_start:text_end].decode('latin-1', errors='replace')
        print(f"  Pipe text: {text_chunk[:300]}")
        
        # Look for component designators nearby (C1, R2, U3, J1, etc.)
        # Typical pattern: SOURCEDESIGNATOR=C1 or DESIGNATOR=C1
        for pattern_name in ['SOURCEDESIGNATOR', 'DESIGNATOR', 'OWNERPARTNAME']:
            pattern = re.compile(rf'{pattern_name}=([A-Z]+\d+)'.encode('ascii'))
            for m in pattern.finditer(ctx):
                print(f"  Found {pattern_name}={m.group(1).decode('ascii')}")
        
        # Search nearby for other NAME= patterns to find connected nets
        all_nearby_names = []
        for m in re.finditer(b'NAME=([A-Za-z0-9 _]+)', ctx):
            all_nearby_names.append(m.group(1).decode('ascii', errors='replace'))
        if all_nearby_names:
            print(f"  Nearby names: {all_nearby_names}")
        
        # Show hex dump of key area
        hex_start = pos - 20
        hex_end = pos + 200
        hex_chunk = data[max(0, hex_start):min(len(data), hex_end)]
        print(f"  Hex around NAME={target_net}:")
        for i in range(0, len(hex_chunk), 32):
            line = hex_chunk[i:i+32]
            hexstr = ' '.join(f'{b:02x}' for b in line)
            ascstr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in line)
            print(f"    {hex_start+i:08x}: {hexstr:96s} {ascstr}")

    return results


def find_j2_connections(data):
    """Find all J2 connector pin connections."""
    print(f"\n\n{'='*60}")
    print("J2 CONNECTOR ANALYSIS")
    print(f"{'='*60}")
    
    # Search for J2 designator references
    results = []
    
    # Find all occurrences of "J2" that might be component references
    # In the PcbDoc format, component references appear in pipe-delimited records
    # like SOURCEDESIGNATOR=J2 or near OWNERPARTNAME
    
    # Also search for "-J2" or "J2-" patterns which might indicate pins
    # Search for "J2" in pipe-delimited context
    for m in re.finditer(b'\\|[A-Z]+=J2\\b', data):
        pos = m.start()
        ctx_start = max(0, pos - 200)
        ctx_end = min(len(data), pos + 300)
        ctx = data[ctx_start:ctx_end]
        
        # Find the complete record
        text_start = ctx.rfind(b'\x00', 0, 200)
        if text_start < 0:
            text_start = 0
        text_end = ctx.find(b'\x00\x00', 200)
        if text_end < 0:
            text_end = len(ctx)
        
        try:
            text = ctx[text_start:text_end].decode('latin-1', errors='replace')
            if 'J2' in text:
                results.append((pos, text[:400]))
        except:
            pass
    
    print(f"\nFound {len(results)} J2-related records")
    for pos, text in results:
        print(f"\n  Offset 0x{pos:08x}:")
        print(f"  {text}")
    
    # Also search for J2-1, J2-2, etc. pin patterns
    for pin_num in range(1, 21):
        pin_patterns = [
            f'J2-{pin_num}'.encode(),
            f'J2_{pin_num}'.encode(),
        ]
        for pat in pin_patterns:
            pos = data.find(pat)
            if pos >= 0:
                # Get context
                ctx = data[max(0,pos-100):min(len(data),pos+200)]
                try:
                    text = ctx.decode('latin-1', errors='replace')
                    # Show any pipe text nearby
                    for line in text.split('\x00'):
                        if '|' in line and '=' in line:
                            print(f"\n  J2 Pin {pin_num} at 0x{pos:08x}:")
                            print(f"  {line[:200]}")
                except:
                    pass
    
    # Search specifically in the context where NAME=J2 is found
    j2_name_pos = data.find(b'NAME=J2')
    if j2_name_pos > 0:
        print(f"\nFound NAME=J2 at offset 0x{j2_name_pos:08x}")
        ctx = data[max(0,j2_name_pos-200):min(len(data),j2_name_pos+1000)]
        
        # Dump the area
        try:
            text = ctx.decode('latin-1', errors='replace')
            # Split by null
            sections = text.split('\x00')
            for s in sections:
                if '|' in s and len(s) > 5:
                    print(f"  Section: {s[:300]}")
        except:
            pass
    
    # Also search for J2 component with pads
    # Look for record type that defines pads for J2
    # Pad records often have OWNERPARTNAME=J2 or similar
    
    return results


def main():
    print(f"Reading: {PCB_FILE}")
    with open(PCB_FILE, 'rb') as f:
        data = f.read()
    print(f"File size: {len(data):,} bytes\n")
    
    # Extract net data
    net_data = extract_pcb_net_data(data)
    
    # Find J2 connections
    j2_results = find_j2_connections(data)
    
    # ======================
    # SUMMARY
    # ======================
    print(f"\n\n{'='*60}")
    print("SUMMARY OF FINDINGS")
    print(f"{'='*60}")
    
    # Search for all distinct net names
    all_nets = set()
    for m in re.finditer(b'NAME=([A-Za-z0-9 _]+)', data):
        name = m.group(1).decode('ascii', errors='replace')
        # Filter out likely garbage (very long names, names with special chars)
        if 1 <= len(name) <= 50 and not any(c in name for c in ['\x00', '\r', '\n']):
            # Look at context to determine if it's a net name
            ctx = data[m.start():min(len(data), m.start()+100)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            if '|' in ctx_text:
                all_nets.add(name)
    
    print(f"\nTotal distinct net names found: {len(all_nets)}")
    print("\nAll net names:")
    for name in sorted(all_nets):
        print(f"  - {name}")
    
    # Now try to parse the OLE and extract the main data stream
    print(f"\n\n{'='*60}")
    print("OLE STREAM DATA")
    print(f"{'='*60}")
    
    # Quick OLE header parsing
    header = data[:512]
    sector_size = 1 << struct.unpack_from('<H', header, 30)[0]
    dir_start = struct.unpack_from('<I', header, 48)[0]
    
    # Find specific pipe-delimited records in the raw binary
    # Look for records near where we found the net names
    target_offsets = {
        'VT_PWM1': 0x12acab,
        'CD IO1': 0x11ff34,
        'CD IO2': 0x11fb2a,
    }
    
    print("\n=== Detailed context around each net name ===")
    for name, offset in target_offsets.items():
        print(f"\n--- {name} (offset 0x{offset:08x}) ---")
        # Look at larger context
        ctx = data[max(0,offset-200):min(len(data),offset+800)]
        
        # Find component/pin references in the area
        # Pattern: SOUREDESIGNATOR=C?, DESIGNATOR=R?, etc.
        refs = set()
        for m in re.finditer(rb'([A-Z]+DESIGNATOR=[A-Z]+\d+)', ctx):
            refs.add(m.group(1).decode('ascii'))
        for m in re.finditer(rb'OWNERPARTNAME=([A-Z]+\d+)', ctx):
            refs.add(f'OWNERPARTNAME={m.group(1).decode("ascii")}')
        for m in re.finditer(rb'NAME=([A-Za-z0-9 _]+)', ctx):
            refs.add(f'NAME={m.group(1).decode("ascii")}')
        
        if refs:
            print(f"  References found: {refs}")
        
        # Hex dump
        for i in range(0, min(len(ctx), 300), 32):
            line = ctx[i:i+32]
            hexstr = ' '.join(f'{b:02x}' for b in line)
            ascstr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in line)
            print(f"    {(offset-200)+i:08x}: {hexstr:96s} {ascstr}")
    
    # Also look for EN net specifically (filtering out false positives)
    print("\n\n=== EN net search ===")
    for m in re.finditer(b'NAME=EN\\b', data):
        pos = m.start()
        ctx = data[max(0,pos-60):min(len(data),pos+100)]
        ctx_text = ctx.decode('latin-1', errors='replace')
        # Check that it's a standalone NAME=EN (not part of a longer word)
        if '|' in ctx_text[:200]:
            print(f"\n  EN net at offset 0x{pos:08x}:")
            print(f"  {ctx_text[:200]}")
    
    # Find EN with surrounding components
    print("\n\n=== EN connection details ===")
    en_positions = []
    for m in re.finditer(b'NAME=EN\\|', data):
        en_positions.append(m.start())
    
    if en_positions:
        # Use the first occurrence
        pos = en_positions[0]
        # Look at larger context
        ctx = data[max(0,pos-300):min(len(data),pos+500)]
        
        # Hex dump
        print(f"Context around first EN net at 0x{pos:08x}:")
        for i in range(0, min(len(ctx), 400), 32):
            line = ctx[i:i+32]
            hexstr = ' '.join(f'{b:02x}' for b in line)
            ascstr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in line)
            print(f"    {(pos-300)+i:08x}: {hexstr:96s} {ascstr}")
        
        # Look for component references
        ctx_text = ctx.decode('latin-1', errors='replace')
        refs = re.findall(r'[A-Z]+DESIGNATOR=[A-Z]+\d+', ctx_text)
        refs += re.findall(r'OWNERPARTNAME=[A-Z]+\d+', ctx_text)
        if refs:
            print(f"  Component references: {refs}")
    else:
        print("  EN net not found as NAME=EN|")


if __name__ == '__main__':
    main()
