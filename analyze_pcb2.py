# -*- coding: utf-8 -*-
"""
Final PcbDoc net tracing script.
Extracts all pad-to-net connections and traces specific nets.
"""
import struct
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

PCB_FILE = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'

def main():
    with open(PCB_FILE, 'rb') as f:
        data = f.read()
    
    print(f"File size: {len(data):,} bytes\n")
    print("=" * 70)
    print("ALTUM PCB NET TRACE ANALYSIS")
    print("=" * 70)
    
    # ========================================
    # PART 1: Find all pad records with net connections
    # ========================================
    # In PcbDoc, pads are stored with pipe-delimited text containing:
    # PATTERN=, DESIGNATOR=, NAME=<pad number>, and they are part of a component
    # The net connection for a pad is in the pad's attributes
    
    # Strategy: Find all pipe-delimited records, categorize them,
    # and build the net->pad mapping
    
    # First, let's find all complete pipe-delimited records
    # Records start with |RECORD= or are delimited by null bytes
    
    records_by_type = {}
    all_records = []
    
    # Find all segments of pipe-delimited text between null bytes
    for m in re.finditer(b'RECORD=\\d+\\|', data):
        rec_start = m.start()
        # Find the beginning of this pipe segment
        pipe_start = data.rfind(b'\x00', max(0, rec_start - 5), rec_start)
        if pipe_start < 0:
            pipe_start = rec_start - 50
        else:
            pipe_start += 1
        
        # Check if it starts with |
        if data[pipe_start:pipe_start+1] != b'|':
            # Look for | before RECORD
            prev_pipe = data.rfind(b'|', pipe_start, rec_start)
            if prev_pipe > 0:
                pipe_start = prev_pipe
        
        # Find end
        pipe_end = data.find(b'\x00\x00', rec_start + 10)
        if pipe_end < 0:
            pipe_end = min(rec_start + 1000, len(data))
        
        chunk = data[pipe_start:pipe_end]
        try:
            text = chunk.decode('latin-1', errors='replace')
            # Get record type
            rec_match = re.search(r'RECORD=(\d+)', text)
            if rec_match:
                rec_type = int(rec_match.group(1))
                if rec_type not in records_by_type:
                    records_by_type[rec_type] = []
                records_by_type[rec_type].append((pipe_start, text[:500]))
                all_records.append((rec_type, pipe_start, text[:500]))
        except:
            pass
    
    print(f"\nTotal records found: {len(all_records)}")
    print("\nRecord types and counts:")
    for rec_type in sorted(records_by_type.keys()):
        print(f"  RECORD={rec_type}: {len(records_by_type[rec_type])} instances")
    
    # Show examples of each record type
    print("\n" + "=" * 70)
    print("RECORD TYPE EXAMPLES")
    print("=" * 70)
    for rec_type in sorted(records_by_type.keys()):
        print(f"\n--- RECORD={rec_type} ({len(records_by_type[rec_type])} instances) ---")
        for offset, text in records_by_type[rec_type][:2]:
            print(f"  Offset 0x{offset:08x}: {text[:300]}")
    
    # ========================================
    # PART 2: Extract all NAME= fields from pipe records
    # ========================================
    print("\n" + "=" * 70)
    print("NET NAME EXTRACTION")
    print("=" * 70)
    
    # Find all unique NAME= values in records
    net_names = {}
    for offset, text in records_by_type.get(1, []) + records_by_type.get(2, []):
        # These might be component/pad records
        pass
    
    # Search for all NAME= in the raw binary, categorize
    all_names = {}
    for m in re.finditer(b'NAME=([A-Za-z0-9 _]+)', data):
        name = m.group(1).decode('ascii', errors='replace')
        # Get surrounding context to determine record type
        ctx = data[max(0,m.start()-50):min(len(data),m.start()+200)]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        # Determine if this is a net, component, pad, or other
        rec_match = re.search(r'RECORD=(\d+)', ctx_text)
        rec_type = int(rec_match.group(1)) if rec_match else 0
        
        if name not in all_names:
            all_names[name] = []
        all_names[name].append({
            'offset': m.start(),
            'rec_type': rec_type,
            'ctx': ctx_text[:200]
        })
    
    # Focus on the nets we care about
    target_nets = ['VT_PWM1', 'CD IO1', 'CD IO2', 'EN']
    
    for net_name in target_nets:
        print(f"\n{'='*70}")
        print(f"NET: {net_name}")
        print(f"{'='*70}")
        
        if net_name not in all_names:
            print(f"  NOT FOUND in PCB data!")
            continue
        
        occurrences = all_names[net_name]
        print(f"  Found {len(occurrences)} occurrences")
        
        for i, occ in enumerate(occurrences):
            print(f"\n  Occurrence {i+1} at offset 0x{occ['offset']:08x}:")
            print(f"  Record type: {occ['rec_type']}")
            print(f"  Context: {occ['ctx'][:300]}")
        
        # Now search for connected pads
        # Pads that connect to this net will have NAME={net_name} in their record
        # and also have designator/pad info
        
        # Look for records containing both the net name and SOURCEDESIGNATOR or OWNERPARTNAME
        print(f"\n  Connected components/pads (searching nearby context):")
        
        net_pos = data.find(f'NAME={net_name}'.encode('ascii'))
        if net_pos >= 0:
            # Look at a larger context window
            ctx = data[max(0, net_pos - 500):min(len(data), net_pos + 500)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            
            # Find all component designator references in this window
            designators = re.findall(r'SOURCEDESIGNATOR=([A-Z]+\d+)', ctx_text)
            designators += re.findall(r'DESIGNATOR=([A-Z]+\d+)', ctx_text)
            designators += re.findall(r'OWNERPARTNAME=([A-Z]+\d+)', ctx_text)
            
            if designators:
                print(f"    Designators found in context: {designators}")
            
            # Check if this is a net record itself or a pad record
            if 'RECORD=1' in ctx_text or 'RECORD=2' in ctx_text:
                print(f"    This appears to be a component/pad record")
                # Extract pad number
                pad_match = re.search(r'NAME=(\d+)', ctx_text)
                if pad_match:
                    print(f"    Pad number: {pad_match.group(1)}")
            
            # Check if there are other nets referenced nearby
            other_nets = re.findall(r'NAME=([A-Za-z0-9 _]+)', ctx_text)
            other_nets = [n for n in other_nets if n != net_name]
            if other_nets:
                print(f"    Other nets in same context: {other_nets[:5]}")
    
    # ========================================
    # PART 3: J2 Connector Analysis
    # ========================================
    print(f"\n\n{'='*70}")
    print("J2 CONNECTOR ANALYSIS")
    print(f"{'='*70}")
    
    # Find J2 component definition
    j2_patterns = [
        b'SOURCEDESIGNATOR=J2',
        b'DESIGNATOR=J2',
        b'NAME=J2',
    ]
    
    for pattern in j2_patterns:
        pos = data.find(pattern)
        if pos >= 0:
            ctx = data[max(0, pos-200):min(len(data), pos+3000)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            print(f"\n  Found '{pattern.decode()}' at offset 0x{pos:08x}")
            print(f"  Context: {ctx_text[:500]}")
            
            # Now find all pads/pins of J2 and their nets
            # Pads typically have OWNERPARTNAME=J2
            print(f"\n  Searching for J2 pad records...")
            
            # Find all occurrences of OWNERPARTNAME=J2 or similar
            for m in re.finditer(b'OWNERPARTNAME=J2\\b', data):
                pad_pos = m.start()
                pad_ctx = data[max(0, pad_pos-200):min(len(data), pad_pos+500)]
                pad_text = pad_ctx.decode('latin-1', errors='replace')
                
                # Extract pad number and net
                pad_match = re.search(r'NAME=(\d+)', pad_text)
                net_match = re.search(r'NET=([^|]+)', pad_text)
                # Or the pad's net might be referenced differently
                # Look for the net name in the pad record
                
                print(f"\n    J2 Pad at offset 0x{pad_pos:08x}:")
                print(f"    {pad_text[:300]}")
            break
    
    # Also search for J2-1, J2-2 etc in pad records
    print("\n\n  Searching for J2 pin connections by pad records...")
    for i in range(1, 9):
        # Find records where the pad number is i and component is J2
        # This requires finding records that contain both patterns
        # A pad record would have NAME=<pad_number> and reference J2
        
        # Alternative: search in the J2 component record area
        # The pads of a component are typically stored in sequence
        
        # Let's search for pad records near the J2 component record
        j2_comp_pos = data.find(b'SOURCEDESIGNATOR=J2')
        if j2_comp_pos < 0:
            j2_comp_pos = data.find(b'NAME=J2')
        
        if j2_comp_pos > 0:
            # Look within 5000 bytes after J2 component
            search_start = j2_comp_pos
            search_end = min(len(data), j2_comp_pos + 5000)
            search_region = data[search_start:search_end]
            
            # Find pad records: RECORD=2 with OWNERPARTNAME or similar
            # Pad records have NAME=<pad_number>
            pad_pattern = f'RECORD=2|'.encode() + b'[^|]*' * 5 + f'NAME={i}|'.encode()
            
            # Simpler: just find all NAME=<pad_num> in the region
            for m in re.finditer(f'NAME={i}\\b'.encode('ascii'), search_region):
                local_pos = m.start()
                ctx = search_region[max(0, local_pos-200):min(len(search_region), local_pos+200)]
                ctx_text = ctx.decode('latin-1', errors='replace')
                if 'PATTERN=' in ctx_text or 'RECORD=2' in ctx_text:
                    print(f"\n  J2 Pin {i} context:")
                    # Get net for this pad
                    # The pad record should have a NET= or the connection
                    # might be stored in the binary structure
                    net_refs = re.findall(r'NET=([^|]+)', ctx_text)
                    if net_refs:
                        print(f"    Net: {net_refs}")
                    print(f"    {ctx_text[:300]}")
            break  # Only search once after finding J2
    
    # ========================================
    # PART 4: Summary of all net connections
    # ========================================
    print(f"\n\n{'='*70}")
    print("NET CONNECTION SUMMARY")
    print(f"{'='*70}")
    
    # From the PCB binary, try to build a complete picture
    # by finding all tracks/pads that reference each target net
    
    for net_name in target_nets:
        net_bytes = f'NAME={net_name}'.encode('ascii')
        positions = []
        pos = 0
        while True:
            pos = data.find(net_bytes, pos)
            if pos < 0:
                break
            positions.append(pos)
            pos += 1
        
        print(f"\n  {net_name}: found at {len(positions)} locations in PCB binary")
        
        for pos in positions:
            # Show context
            ctx = data[max(0, pos-100):min(len(data), pos+300)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            
            # Extract key info
            rec_type_match = re.search(r'RECORD=(\d+)', ctx_text)
            layer_match = re.search(r'LAYER=([^|]+)', ctx_text)
            visible_match = re.search(r'VISIBLE=([^|]+)', ctx_text)
            
            info = []
            if rec_type_match:
                info.append(f"RECORD={rec_type_match.group(1)}")
            if layer_match:
                info.append(f"LAYER={layer_match.group(1)}")
            if visible_match:
                info.append(f"VISIBLE={visible_match.group(1)}")
            
            # Check for component references
            comp_refs = re.findall(r'(?:SOURCE)?DESIGNATOR=([A-Z]+\d+)', ctx_text)
            part_refs = re.findall(r'OWNERPARTNAME=([A-Z]+\d+)', ctx_text)
            
            if comp_refs or part_refs:
                info.append(f"Components: {comp_refs + part_refs}")
            
            print(f"    Offset 0x{pos:08x}: {', '.join(info) if info else 'no metadata'}")

    # Final: search specifically for pad records (RECORD=2) and build net mapping
    print(f"\n\n{'='*70}")
    print("PAD-TO-NET MAPPING (from RECORD=2 records)")
    print(f"{'='*70}")
    
    # For each RECORD=2 (pad), extract OWNERPARTNAME, NAME (pad number), and find which net it connects to
    pad_records = records_by_type.get(2, [])
    print(f"\nTotal pad records (RECORD=2): {len(pad_records)}")
    
    pad_connections = {}
    for offset, text in pad_records:
        # Parse fields
        owner_match = re.search(r'OWNERPARTNAME=([A-Z]+\d+)', text)
        pad_num_match = re.search(r'NAME=(\d+)', text)
        
        if owner_match and pad_num_match:
            owner = owner_match.group(1)
            pad_num = pad_num_match.group(1)
            key = f"{owner}:{pad_num}"
            
            # The pad's net connection is NOT directly in this record typically.
            # In Altium PCB format, pads are connected to nets through the
            # component footprint definition + routing.
            # The actual connection is stored in track/arc objects that have the net name.
            
            if owner not in pad_connections:
                pad_connections[owner] = {}
            pad_connections[owner][pad_num] = {
                'offset': offset,
                'text': text[:200]
            }
    
    print(f"\nComponents with pads:")
    for comp in sorted(pad_connections.keys()):
        pins = sorted(pad_connections[comp].keys(), key=lambda x: int(x) if x.isdigit() else x)
        print(f"  {comp}: {len(pins)} pads - pins: {', '.join(pins[:20])}")
    
    # ========================================
    # PART 5: Track-based net connection tracing
    # ========================================
    print(f"\n\n{'='*70}")
    print("TRACK/ARC RECORDS WITH NET NAMES")
    print(f"{'='*70}")
    
    # Tracks and arcs (RECORD=4 for tracks, RECORD=5 for arcs) contain net names
    # These are the actual routed connections
    
    for net_name in target_nets:
        print(f"\n{'='*50}")
        print(f"Tracing {net_name}")
        print(f"{'='*50}")
        
        net_bytes = f'NAME={net_name}'.encode('ascii')
        
        # Search for this net name across all record types
        found_tracks = []
        found_pads = []
        
        # Check each record type
        for rec_type in sorted(records_by_type.keys()):
            for offset, text in records_by_type[rec_type]:
                if net_name in text:
                    # Check if it's a NAME=<net_name> match (exact)
                    if f'NAME={net_name}|' in text or f'NAME={net_name}\x00' in text:
                        found_tracks.append((rec_type, offset, text[:300]))
        
        if found_tracks:
            for rec_type, offset, text in found_tracks:
                print(f"\n  RECORD={rec_type} at 0x{offset:08x}:")
                print(f"  {text}")
        else:
            print(f"\n  No track/arc records found for {net_name}")


if __name__ == '__main__':
    main()
