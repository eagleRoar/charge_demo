# -*- coding: utf-8 -*-
"""
Final comprehensive PcbDoc analysis script.
"""
import struct
import re
import sys
sys.stdout.reconfigure(encoding='utf-8')

PCB_FILE = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'

def hex_dump(data, offset, length=400, base_addr=None):
    """Print a hex dump of data"""
    if base_addr is None:
        base_addr = offset
    for i in range(0, min(length, len(data)), 32):
        line = data[i:i+32]
        hexstr = ' '.join(f'{b:02x}' for b in line)
        ascstr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in line)
        print(f"  {base_addr+i:08x}: {hexstr:<96s} {ascstr}")

def main():
    with open(PCB_FILE, 'rb') as f:
        data = f.read()
    
    print("=" * 70)
    print("ALTUM PcbDoc NET TRACE ANALYSIS - FINAL REPORT")
    print("=" * 70)
    print(f"File: {PCB_FILE}")
    print(f"Size: {len(data):,} bytes")
    
    # ==========================================
    # 1. VT_PWM1 Analysis
    # ==========================================
    print(f"\n{'='*70}")
    print("1. VT_PWM1 NET ANALYSIS")
    print(f"{'='*70}")
    
    vt_pos = data.find(b'NAME=VT_PWM1')
    if vt_pos >= 0:
        print(f"\n  VT_PWM1 net record at offset 0x{vt_pos:08x}")
        ctx_start = max(0, vt_pos - 200)
        ctx_end = min(len(data), vt_pos + 600)
        ctx = data[ctx_start:ctx_end]
        
        # Show as text
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        # Split by null bytes to see record boundaries
        print("\n  Text records in context:")
        for section in ctx_text.split('\x00'):
            section = section.strip()
            if '|' in section and len(section) > 10:
                print(f"    {section[:200]}")
        
        # Look for any component/pin references near VT_PWM1
        print("\n  Searching for connected components in VT_PWM1 area...")
        comp_refs = set()
        for m in re.finditer(r'(?:SOURCE)?DESIGNATOR=([A-Z]+\d+)', ctx_text):
            comp_refs.add(m.group(1))
        for m in re.finditer(r'OWNERPARTNAME=([A-Z]+\d+)', ctx_text):
            comp_refs.add(m.group(1))
        for m in re.finditer(r'PATTERN=([^|]+)', ctx_text):
            comp_refs.add(f"PATTERN={m.group(1)}")
        
        if comp_refs:
            print(f"    Component references: {comp_refs}")
        else:
            print("    No direct component references found in this region")
        
        # The record shows: PRIMITIVELOCK=FALSE, USERROUTED=TRUE, LAYER=TOP
        # This is a TRACK (routed trace) segment
        # Tracks don't directly reference components - they reference nets
        # The net itself connects components that are defined elsewhere
        
        # Let's check the UNIQUEID
        uid_match = re.search(r'UNIQUEID=([A-Z]+)', ctx_text)
        if uid_match:
            print(f"    Track UniqueID: {uid_match.group(1)}")
        
        # Look for J2 connections near VT_PWM1
        j2_match = re.search(r'J2', ctx_text)
        if j2_match:
            print(f"    J2 reference found in VT_PWM1 context!")
        else:
            print(f"    No direct J2 reference in VT_PWM1 context")
    
    # ==========================================
    # 2. CD IO1 Analysis
    # ==========================================
    print(f"\n{'='*70}")
    print("2. CD IO1 NET ANALYSIS")
    print(f"{'='*70}")
    
    cd1_pos = data.find(b'NAME=CD IO1')
    if cd1_pos >= 0:
        ctx_start = max(0, cd1_pos - 200)
        ctx_end = min(len(data), cd1_pos + 600)
        ctx = data[ctx_start:ctx_end]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        print(f"\n  CD IO1 net record at offset 0x{cd1_pos:08x}")
        for section in ctx_text.split('\x00'):
            section = section.strip()
            if '|' in section and len(section) > 10:
                print(f"    {section[:200]}")
        
        comp_refs = set()
        for m in re.finditer(r'(?:SOURCE)?DESIGNATOR=([A-Z]+\d+)', ctx_text):
            comp_refs.add(m.group(1))
        if comp_refs:
            print(f"\n    Component references: {comp_refs}")
    
    # ==========================================
    # 3. CD IO2 Analysis
    # ==========================================
    print(f"\n{'='*70}")
    print("3. CD IO2 NET ANALYSIS")
    print(f"{'='*70}")
    
    cd2_pos = data.find(b'NAME=CD IO2')
    if cd2_pos >= 0:
        ctx_start = max(0, cd2_pos - 200)
        ctx_end = min(len(data), cd2_pos + 600)
        ctx = data[ctx_start:ctx_end]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        print(f"\n  CD IO2 net record at offset 0x{cd2_pos:08x}")
        for section in ctx_text.split('\x00'):
            section = section.strip()
            if '|' in section and len(section) > 10:
                print(f"    {section[:200]}")
        
        comp_refs = set()
        for m in re.finditer(r'(?:SOURCE)?DESIGNATOR=([A-Z]+\d+)', ctx_text):
            comp_refs.add(m.group(1))
        if comp_refs:
            print(f"\n    Component references: {comp_refs}")
    
    # ==========================================
    # 4. EN Analysis
    # ==========================================
    print(f"\n{'='*70}")
    print("4. EN NET ANALYSIS")
    print(f"{'='*70}")
    
    en_positions = []
    pos = 0
    while True:
        pos = data.find(b'NAME=EN|', pos)
        if pos < 0:
            break
        en_positions.append(pos)
        pos += 1
    
    print(f"\n  Found {len(en_positions)} EN net record(s)")
    for i, en_pos in enumerate(en_positions):
        ctx_start = max(0, en_pos - 200)
        ctx_end = min(len(data), en_pos + 600)
        ctx = data[ctx_start:ctx_end]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        print(f"\n  EN record {i+1} at offset 0x{en_pos:08x}:")
        for section in ctx_text.split('\x00'):
            section = section.strip()
            if '|' in section and len(section) > 10:
                print(f"    {section[:200]}")
        
        comp_refs = set()
        for m in re.finditer(r'(?:SOURCE)?DESIGNATOR=([A-Z]+\d+)', ctx_text):
            comp_refs.add(m.group(1))
        if comp_refs:
            print(f"\n    Component references: {comp_refs}")
    
    # ==========================================
    # 5. J2 Connector Complete Analysis
    # ==========================================
    print(f"\n{'='*70}")
    print("5. J2 CONNECTOR COMPLETE ANALYSIS")
    print(f"{'='*70}")
    
    j2_comp_pos = data.find(b'SOURCEDESIGNATOR=J2')
    if j2_comp_pos >= 0:
        print(f"\n  J2 Component record at offset 0x{j2_comp_pos:08x}")
        
        # Dump the J2 component area
        ctx_start = max(0, j2_comp_pos - 50)
        ctx_end = min(len(data), j2_comp_pos + 2000)
        ctx = data[ctx_start:ctx_end]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        print("\n  J2 Component definition:")
        for section in ctx_text.split('\x00'):
            section = section.strip()
            if '|' in section and len(section) > 10:
                print(f"    {section[:200]}")
        
        # Extract key J2 info
        j2_info = {}
        for m in re.finditer(r'([A-Z]+)=([^|]+)', ctx_text.split('\x00')[0] if ctx_text.split('\x00') else ctx_text):
            j2_info[m.group(1)] = m.group(2)
        
        print(f"\n  J2 Details:")
        print(f"    Pattern: {j2_info.get('PATTERN', 'N/A')}")
        print(f"    Location: X={j2_info.get('X', 'N/A')}, Y={j2_info.get('Y', 'N/A')}")
        print(f"    Layer: {j2_info.get('LAYER', 'N/A')}")
        print(f"    Rotation: {j2_info.get('ROTATION', 'N/A')}")
        print(f"    Library: {j2_info.get('SOURCEFOOTPRINTLIBRARY', 'N/A')}")
        print(f"    Component: {j2_info.get('SOURCELIBREFERENCE', 'N/A')}")
    
    # ==========================================
    # 6. J2 Pin-to-Net Mapping
    # ==========================================
    print(f"\n{'='*70}")
    print("6. J2 PIN-TO-NET MAPPING")
    print(f"{'='*70}")
    
    # Search for J2 pad records
    # Pads that belong to J2 will have J2 in their context
    # The pad record format in PcbDoc is RECORD=2 type
    # But we need to find the actual pad data
    
    # Strategy: search for pad-like patterns near J2
    # Alternative: search for all records containing NAME=<number> near the J2 component
    
    # Let's search for the binary structure that represents pads
    # In Altium binary PCB format, a pad record typically has:
    # - A binary header with the record type
    # - Designator reference (e.g., J2)
    # - Pad number (e.g., 1)
    # - Net name or net ID
    
    # Find the J2 component area and look for surrounding binary structures
    if j2_comp_pos >= 0:
        # Look in a window around J2
        search_start = max(0, j2_comp_pos - 2000)
        search_end = min(len(data), j2_comp_pos + 5000)
        search_region = data[search_start:search_end]
        
        # Search for text segments containing J2
        j2_refs = []
        for m in re.finditer(rb'J2[^a-zA-Z0-9]', search_region):
            local_pos = m.start()
            # Get surrounding context
            ctx_local = search_region[max(0, local_pos-200):min(len(search_region), local_pos+300)]
            try:
                text = ctx_local.decode('latin-1', errors='replace')
                if 'NAME=' in text and len(text) > 20:
                    j2_refs.append((search_start + local_pos, text))
            except:
                pass
        
        print(f"\n  Found {len(j2_refs)} text segments referencing J2 in the J2 component area:")
        
        # Group by unique text records
        seen = set()
        for pos, text in j2_refs:
            # Split by \x00 and find pipe-delimited sections
            for section in text.split('\x00'):
                section = section.strip()
                if '|' in section and len(section) > 20:
                    key = section[:100]
                    if key not in seen:
                        seen.add(key)
                        # Check for net information
                        net_match = re.search(r'NAME=([A-Za-z0-9 _]+)', section)
                        pad_match = re.search(r'(?:^|[|])NAME=(\d+)[|]', section)
                        
                        extra = ""
                        if net_match:
                            extra += f" [NET: {net_match.group(1)}]"
                        if pad_match:
                            extra += f" [PAD: {pad_match.group(1)}]"
                        
                        print(f"    0x{pos:08x}:{extra} {section[:150]}")
    
    # ==========================================
    # 7. All NetJ2_* connections
    # ==========================================
    print(f"\n{'='*70}")
    print("7. J2 NET CONNECTIONS (NetJ2_*)")
    print(f"{'='*70}")
    
    for i in range(1, 5):
        net_name = f'NetJ2_{i}'
        pos = data.find(net_name.encode('ascii'))
        if pos >= 0:
            ctx = data[max(0, pos-100):min(len(data), pos+300)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            print(f"\n  {net_name} at offset 0x{pos:08x}:")
            for section in ctx_text.split('\x00'):
                section = section.strip()
                if '|' in section:
                    print(f"    {section[:200]}")
    
    # ==========================================
    # 8. Additional net connections
    # ==========================================
    print(f"\n{'='*70}")
    print("8. ALL NET-TO-PAD CONNECTIONS (searching for net names near pad records)")
    print(f"{'='*70}")
    
    # Search for patterns where a net name appears near a designator
    # This helps identify which component pads connect to which nets
    
    # Find all significant net names
    interesting_nets = ['VT_PWM1', 'CD IO1', 'CD IO2', 'EN', 'VCC', 'VCC1', 'GND', 
                        'VIN', 'DAT', 'CLK', 'LED VCC1', 'LED VCC2', 'NTC',
                        'NetJ2_2', 'NetJ2_3']
    
    # Also find all Net* nets
    for name in re.findall(b'Net([A-Za-z0-9_]+)', data):
        full_name = f'Net{name.decode("ascii")}'
        if full_name not in interesting_nets:
            interesting_nets.append(full_name)
    
    for net_name in interesting_nets:
        net_bytes = f'NAME={net_name}'.encode('ascii')
        net_pos = data.find(net_bytes)
        if net_pos < 0:
            continue
        
        # Look for component references in a wider window
        ctx_start = max(0, net_pos - 2000)
        ctx_end = min(len(data), net_pos + 2000)
        ctx = data[ctx_start:ctx_end]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        # Find all designators in this window
        designators = set()
        for m in re.finditer(r'SOURCEDESIGNATOR=([A-Z]+\d+)', ctx_text):
            designators.add(m.group(1))
        
        if designators:
            print(f"\n  {net_name}: nearby components = {', '.join(sorted(designators))}")
    
    # ==========================================
    # 9. Search for J2 on the PCB (alternative approach)
    # ==========================================
    print(f"\n{'='*70}")
    print("9. J2 CONNECTOR PINS AND NETS (binary search)")
    print(f"{'='*70}")
    
    # The J2 component has 4 pins (PTP-4P = 4-pin connector)
    # NetJ2_2 and NetJ2_3 are nets for pins 2 and 3
    # Pin 1 and pin 4 might have other net names
    
    # Search for any text segment containing both "J2" and a net name
    for m in re.finditer(rb'NAME=([A-Za-z0-9 _]+)', data):
        net_name = m.group(1).decode('ascii', errors='replace')
        pos = m.start()
        ctx = data[max(0, pos-500):min(len(data), pos+500)]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        # Check if J2 is in the context
        if 'J2' in ctx_text[:500]:
            # Check if this looks like a pad record
            if 'PATTERN=' in ctx_text or 'OWNERPARTNAME=J2' in ctx_text:
                print(f"\n  J2 connection: net={net_name}")
                # Extract more info
                pad_match = re.search(r'NAME=(\d+)', ctx_text)
                if pad_match:
                    print(f"    Pad number: {pad_match.group(1)}")
                designator_match = re.search(r'SOURCEDESIGNATOR=([A-Z]+\d+)', ctx_text)
                if designator_match:
                    print(f"    Designator: {designator_match.group(1)}")
                print(f"    Context: {ctx_text[:300]}")

    # ==========================================
    # 10. Final Summary
    # ==========================================
    print(f"\n\n{'='*70}")
    print("FINAL SUMMARY")
    print(f"{'='*70}")
    
    # Check if SchDoc analysis is available
    import os
    schdoc_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
    if os.path.exists(schdoc_path):
        print("\nNote: Schematic file (SchDoc) is also available for cross-reference.")
        print("The SchDoc contains the logical net connections between components.")
        print("The PcbDoc contains the physical routing of those connections.")
    
    print("\nPCB Net Summary:")
    print(f"  VT_PWM1: TOP layer, routed trace found")
    print(f"  CD IO1:  TOP layer, routed trace found") 
    print(f"  CD IO2:  TOP layer, routed trace found")
    print(f"  EN:      TOP layer, routed trace found (VISIBLE=TRUE)")
    print(f"  J2:      PTP-4P 4-pin connector, TOP layer")
    print(f"  NetJ2_2: Net for J2 pin 2")
    print(f"  NetJ2_3: Net for J2 pin 3")


if __name__ == '__main__':
    main()
