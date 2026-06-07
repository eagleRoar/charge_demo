# -*- coding: utf-8 -*-
"""
===========================================================================
FINAL COMPREHENSIVE ANALYSIS: Altium PCB Net Tracing
Analyzes both PcbDoc (PCB) and SchDoc (Schematic) for net connectivity
===========================================================================
"""
import struct
import re
import sys
import os
sys.stdout.reconfigure(encoding='utf-8')

# =====================================================================
# CONFIGURATION
# =====================================================================
PCBDOC_PATH = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
SCHDOC_PATH = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'

TARGET_NETS = ['VT_PWM1', 'CD IO1', 'CD IO2', 'EN']
J2_PINS = [1, 2, 3, 4]

# =====================================================================
# PART 1: PCB (PcbDoc) Analysis
# =====================================================================
def analyze_pcb():
    print("=" * 78)
    print("PART 1: PCB (PcbDoc) BINARY ANALYSIS")
    print("=" * 78)
    
    with open(PCBDOC_PATH, 'rb') as f:
        data = f.read()
    
    print(f"  File size: {len(data):,} bytes")
    print(f"  Format: OLE Compound Document (CFB)")
    print(f"  Magic: {data[:8].hex()}")
    
    # Find all net names in the PCB binary
    print(f"\n  {'='*70}")
    print(f"  1. VT_PWM1 NET - PCB ROUTING DATA")
    print(f"  {'='*70}")
    
    for net_name in TARGET_NETS:
        print(f"\n  --- {net_name} ---")
        net_bytes = f'NAME={net_name}'.encode('ascii')
        count = 0
        pos = 0
        positions = []
        while True:
            pos = data.find(net_bytes, pos)
            if pos < 0:
                break
            positions.append(pos)
            pos += 1
            count += 1
        
        print(f"  PCB occurrences: {count}")
        
        for p in positions:
            ctx = data[max(0,p-100):min(len(data),p+400)]
            ctx_text = ctx.decode('latin-1', errors='replace')
            
            # Extract key attributes
            layer = re.search(r'LAYER=([^|]+)', ctx_text)
            visible = re.search(r'VISIBLE=([^|]+)', ctx_text)
            uid = re.search(r'UNIQUEID=([A-Z]+)', ctx_text)
            width = re.search(r'TOPLAYER_MRWIDTH=([^|]+)', ctx_text)
            
            attrs = []
            if layer: attrs.append(f"Layer={layer.group(1)}")
            if visible: attrs.append(f"Visible={visible.group(1)}")
            if uid: attrs.append(f"UID={uid.group(1)}")
            if width: attrs.append(f"Width={width.group(1)}")
            
            print(f"    Offset 0x{p:08x}: {', '.join(attrs)}")
            
            # Check for component references nearby
            designators = re.findall(r'SOURCEDESIGNATOR=([A-Z]+\d+)', ctx_text)
            if designators:
                print(f"      Nearby components: {designators}")
    
    # J2 Analysis
    print(f"\n  {'='*70}")
    print(f"  2. J2 CONNECTOR - PCB DATA")
    print(f"  {'='*70}")
    
    j2_pos = data.find(b'SOURCEDESIGNATOR=J2')
    if j2_pos >= 0:
        ctx = data[max(0,j2_pos-50):min(len(data),j2_pos+3000)]
        ctx_text = ctx.decode('latin-1', errors='replace')
        
        # Extract J2 attributes
        pattern = re.search(r'PATTERN=([^|]+)', ctx_text)
        lib = re.search(r'SOURCEFOOTPRINTLIBRARY=([^|]+)', ctx_text)
        comp_ref = re.search(r'SOURCELIBREFERENCE=([^|]+)', ctx_text)
        x = re.search(r'X=([^|]+)', ctx_text)
        y = re.search(r'Y=([^|]+)', ctx_text)
        
        print(f"    Pattern: {pattern.group(1) if pattern else 'N/A'}")
        print(f"    Library: {lib.group(1) if lib else 'N/A'}")
        print(f"    Component Ref: {comp_ref.group(1) if comp_ref else 'N/A'}")
        print(f"    Location: X={x.group(1) if x else 'N/A'}, Y={y.group(1) if y else 'N/A'}")
        
        # Find J2 pad connections to nets
        # Search for records containing BOTH "J2" and a net name
        j2_pads_found = []
        search_region = data[max(0,j2_pos-3000):min(len(data),j2_pos+5000)]
        
        for m in re.finditer(rb'NAME=([A-Za-z0-9 _]+)', search_region):
            name = m.group(1).decode('ascii', errors='replace')
            local_pos = m.start()
            nearby = search_region[max(0,local_pos-400):min(len(search_region),local_pos+100)]
            nearby_text = nearby.decode('latin-1', errors='replace')
            
            if 'J2' in nearby_text[:400]:
                # Check for pad number
                pad_match = re.search(r'(?:^|[|])NAME=(\d+)[|]', nearby_text)
                if pad_match:
                    j2_pads_found.append({
                        'pad': pad_match.group(1),
                        'net': name,
                        'offset': j2_pos - 3000 + local_pos
                    })
        
        print(f"\n    J2 Pin-Net Connections (from PCB):")
        if j2_pads_found:
            for pad_info in j2_pads_found:
                print(f"      Pin {pad_info['pad']}: net = {pad_info['net']} (offset 0x{pad_info['offset']:08x})")
        
        # Search for NetJ2_* nets
        for i in range(1, 5):
            netj2_name = f'NetJ2_{i}'
            npos = data.find(netj2_name.encode('ascii'))
            if npos >= 0:
                nctx = data[max(0,npos-50):min(len(data),npos+200)]
                nctx_text = nctx.decode('latin-1', errors='replace')
                layer_j2 = re.search(r'LAYER=([^|]+)', nctx_text)
                print(f"      {netj2_name}: Layer={layer_j2.group(1) if layer_j2 else 'N/A'} (J2 pin {i})")
    
    # All net names on PCB
    print(f"\n  {'='*70}")
    print(f"  3. ALL PCB NET NAMES")
    print(f"  {'='*70}")
    
    net_set = set()
    for m in re.finditer(rb'NAME=([A-Za-z0-9 _]+)', data):
        name = m.group(1).decode('ascii', errors='replace')
        ctx = data[m.start():min(len(data),m.start()+50)]
        ctx_text = ctx.decode('latin-1', errors='replace')
        if '|' in ctx_text and 1 <= len(name) <= 40:
            # Check for RECORD= pattern nearby
            record_match = re.search(r'RECORD=(\d+)', data[max(0,m.start()-100):m.start()+100].decode('latin-1', errors='replace'))
            if record_match:
                net_set.add(name)
    
    important_nets = sorted([n for n in net_set if any(c.isupper() for c in n) and len(n) <= 20])
    print(f"    Total distinct net names: {len(important_nets)}")
    print(f"    Key nets: {', '.join(important_nets[:30])}")
    if len(important_nets) > 30:
        print(f"    ... and {len(important_nets)-30} more")


# =====================================================================
# PART 2: Schematic (SchDoc) Analysis
# =====================================================================
def analyze_sch():
    print(f"\n\n{'='*78}")
    print("PART 2: SCHEMATIC (SchDoc) LOGICAL CONNECTIONS")
    print("=" * 78)
    
    def parse_records(data):
        """Parse pipe-delimited records from SchDoc"""
        records = []
        for m in re.finditer(rb'\|RECORD=(\d+)\|', data):
            rec_type = int(m.group(1))
            # Find record boundaries
            start = m.start() + 1  # Skip the first |
            # Find the full record
            pipe_count = 0
            end = start
            for i in range(start, min(len(data), start + 2000)):
                if data[i:i+1] == b'|':
                    pipe_count += 1
                if data[i:i+1] == b'\x00' and pipe_count > 2:
                    end = i
                    break
            if end > start:
                raw = data[start:end]
                try:
                    text = raw.decode('latin-1', errors='replace')
                    records.append((rec_type, raw, text))
                except:
                    pass
        return records
    
    def parse_fields(text):
        fields = {}
        for part in text.split('|'):
            if '=' in part:
                key, _, val = part.partition('=')
                fields[key.strip()] = val.strip()
        return fields
    
    with open(SCHDOC_PATH, 'rb') as f:
        data = f.read()
    
    records = parse_records(data)
    print(f"    Parsed {len(records)} schematic records")
    
    # Categorize records
    components = []
    pins = []
    net_labels = []
    wires = []
    
    for rec_type, raw, text in records:
        fields = parse_fields(text)
        fields['_raw'] = text
        if rec_type == 1:  # Component
            components.append(fields)
        elif rec_type == 2:  # Pin
            pins.append(fields)
        elif rec_type == 25:  # Net Label
            net_labels.append(fields)
        elif rec_type == 27:  # Wire
            wires.append(fields)
    
    print(f"    Components: {len(components)}")
    print(f"    Pins: {len(pins)}")
    print(f"    Net Labels: {len(net_labels)}")
    print(f"    Wires: {len(wires)}")
    
    # Build component map
    comp_map = {}
    for c in components:
        idx = c.get('INDEXINSHEET', '')
        if idx:
            comp_map[int(idx)] = c
    
    # Build pin map by OWNERINDEX
    pin_map = {}
    for p in pins:
        owner = p.get('OWNERINDEX', '')
        if owner:
            owner = int(owner)
            if owner not in pin_map:
                pin_map[owner] = []
            pin_map[owner].append(p)
    
    # Helper functions
    def safe_int(v):
        if v is None:
            return None
        try:
            v = v.strip().rstrip('.')
            if v:
                return int(float(v))
        except:
            pass
        return None
    
    # ==========================================
    # 2.1 VT_PWM1
    # ==========================================
    print(f"\n  {'='*70}")
    print(f"  1. VT_PWM1 NET - SCHEMATIC CONNECTIONS")
    print(f"  {'='*70}")
    
    vt_net = None
    for nl in net_labels:
        if nl.get('TEXT', '') == 'VT_PWM1':
            vt_net = nl
            break
    
    if vt_net:
        x = safe_int(vt_net.get('LOCATION.X', vt_net.get('LOCATION_X', '0')))
        y = safe_int(vt_net.get('LOCATION.Y', vt_net.get('LOCATION_Y', '0')))
        print(f"    Net Label: TEXT=VT_PWM1, Location: X={x}, Y={y}")
        print(f"    INDEXINSHEET={vt_net.get('INDEXINSHEET', 'N/A')}")
        print(f"    UniqueID={vt_net.get('UNIQUEID', 'N/A')}")
        
        # Find connected wire - wires use X1,Y1,X2,Y2 format
        for w in wires:
            pts = []
            lc = int(w.get('LOCATIONCOUNT', 0))
            for i in range(1, lc + 1):
                px = safe_int(w.get(f'X{i}'))
                py = safe_int(w.get(f'Y{i}'))
                if px is not None:
                    pts.append((px, py))
            
            if pts and x is not None:
                # Check if the net label is on this wire
                min_x = min(p[0] for p in pts)
                max_x = max(p[0] for p in pts)
                min_y = min(p[1] for p in pts)
                max_y = max(p[1] for p in pts)
                if min_x <= x <= max_x and min_y <= y <= max_y:
                    print(f"    Connected Wire: {[(p[0], p[1]) for p in pts]} (points)")
                    
                    # Find which MCU pin connects to this wire (same X, Y within pin range)
                    for pi in pins:
                        pin_x = safe_int(pi.get('LOCATION.X', pi.get('LOCATION_X', '0')))
                        pin_y = safe_int(pi.get('LOCATION.Y', pi.get('LOCATION_Y', '0')))
                        pin_len = safe_int(pi.get('PINLENGTH', '0'))
                        owner_idx = safe_int(pi.get('OWNERINDEX', '0'))
                        
                        if pin_x and pin_y:
                            for wx, wy in pts:
                                if wx == pin_x:
                                    # Check if wire Y is within pin reach
                                    pin_min_y = min(pin_y, pin_y - pin_len) if pin_len else pin_y
                                    pin_max_y = max(pin_y, pin_y - pin_len) if pin_len else pin_y
                                    if pin_min_y <= wy <= pin_max_y:
                                        owner_comp = comp_map.get(owner_idx, {})
                                        comp_name = owner_comp.get('DESIGNATOR', owner_comp.get('LIBREFERENCE', 'UNKNOWN'))
                                        print(f"    MCU Connection: {comp_name} Pin {pi.get('DESIGNATOR','?')} ({pi.get('NAME','?')})")
                                        print(f"      Pin Location: X={pin_x}, Y={pin_y}, Length={pin_len}")
                                        print(f"      Wire point: Y={wy} (within pin range {pin_min_y}-{pin_max_y})")
                                        break
    else:
        print("    VT_PWM1 net label NOT FOUND in schematic!")
    
    # ==========================================
    # 2.2 CD IO1
    # ==========================================
    print(f"\n  {'='*70}")
    print(f"  2. CD IO1 NET - SCHEMATIC CONNECTIONS")
    print(f"  {'='*70}")
    
    cdio1_locations = []
    for nl in net_labels:
        if nl.get('TEXT', '') == 'CD IO1':
            x = safe_int(nl.get('LOCATION.X', nl.get('LOCATION_X', '0')))
            y = safe_int(nl.get('LOCATION.Y', nl.get('LOCATION_Y', '0')))
            cdio1_locations.append((x, y, nl))
    
    for x, y, nl in cdio1_locations:
        idx = nl.get('INDEXINSHEET', '?')
        uid = nl.get('UNIQUEID', '?')
        print(f"    Net Label at X={x}, Y={y} (INDEX={idx}, UID={uid})")
    print(f"    Total CD IO1 net labels: {len(cdio1_locations)} (multi-location = connected on PCB)")
    
    # Find MCU pin connection
    for pi in pins:
        px = safe_int(pi.get('LOCATION.X', pi.get('LOCATION_X', '0')))
        if px and px in [x for x, y, _ in cdio1_locations if x]:
            py = safe_int(pi.get('LOCATION.Y', pi.get('LOCATION_Y', '0')))
            for lx, ly, _ in cdio1_locations:
                if lx and lx == px:  # Same X column
                    owner_idx = safe_int(pi.get('OWNERINDEX', '0'))
                    owner_comp = comp_map.get(owner_idx, {})
                    comp_name = owner_comp.get('DESIGNATOR', 'UNKNOWN')
                    print(f"    MCU: {comp_name} Pin {pi.get('DESIGNATOR','?')} ({pi.get('NAME','?')}) at X={px}, Y={py}")
                    break
    
    # ==========================================
    # 2.3 CD IO2
    # ==========================================
    print(f"\n  {'='*70}")
    print(f"  3. CD IO2 NET - SCHEMATIC CONNECTIONS")
    print(f"  {'='*70}")
    
    cdio2_locations = []
    for nl in net_labels:
        if nl.get('TEXT', '') == 'CD IO2':
            x = safe_int(nl.get('LOCATION.X', nl.get('LOCATION_X', '0')))
            y = safe_int(nl.get('LOCATION.Y', nl.get('LOCATION_Y', '0')))
            cdio2_locations.append((x, y, nl))
    
    for x, y, nl in cdio2_locations:
        idx = nl.get('INDEXINSHEET', '?')
        uid = nl.get('UNIQUEID', '?')
        print(f"    Net Label at X={x}, Y={y} (INDEX={idx}, UID={uid})")
    print(f"    Total CD IO2 net labels: {len(cdio2_locations)} (multi-location = connected on PCB)")
    
    for pi in pins:
        px = safe_int(pi.get('LOCATION.X', pi.get('LOCATION_X', '0')))
        if px and px in [x for x, y, _ in cdio2_locations if x]:
            py = safe_int(pi.get('LOCATION.Y', pi.get('LOCATION_Y', '0')))
            for lx, ly, _ in cdio2_locations:
                if lx and lx == px:
                    owner_idx = safe_int(pi.get('OWNERINDEX', '0'))
                    owner_comp = comp_map.get(owner_idx, {})
                    comp_name = owner_comp.get('DESIGNATOR', 'UNKNOWN')
                    print(f"    MCU: {comp_name} Pin {pi.get('DESIGNATOR','?')} ({pi.get('NAME','?')}) at X={px}, Y={py}")
                    break
    
    # ==========================================
    # 2.4 EN
    # ==========================================
    print(f"\n  {'='*70}")
    print(f"  4. EN NET - SCHEMATIC CONNECTIONS")
    print(f"  {'='*70}")
    
    en_locations = []
    for nl in net_labels:
        if nl.get('TEXT', '') == 'EN':
            x = safe_int(nl.get('LOCATION.X', nl.get('LOCATION_X', '0')))
            y = safe_int(nl.get('LOCATION.Y', nl.get('LOCATION_Y', '0')))
            en_locations.append((x, y, nl))
    
    for x, y, nl in en_locations:
        idx = nl.get('INDEXINSHEET', '?')
        uid = nl.get('UNIQUEID', '?')
        print(f"    Net Label at X={x}, Y={y} (INDEX={idx}, UID={uid})")
    print(f"    Total EN net labels: {len(en_locations)} (multi-location = connected across schematic)")
    
    # ==========================================
    # 2.5 J2
    # ==========================================
    print(f"\n  {'='*70}")
    print(f"  5. J2 CONNECTOR - SCHEMATIC DATA")
    print(f"  {'='*70}")
    
    j2_comp = None
    for c in components:
        if c.get('DESIGNATOR', '') == 'J2':
            j2_comp = c
            break
    
    if j2_comp:
        print(f"    Component: {j2_comp.get('DESIGNATOR', '?')}")
        print(f"    Library Ref: {j2_comp.get('LIBREFERENCE', '?')}")
        print(f"    Description: {j2_comp.get('DESCRIPTION', '?')}")
        print(f"    Part Count: {j2_comp.get('PARTCOUNT', '?')}")
        
        owner_idx = safe_int(j2_comp.get('INDEXINSHEET', '0'))
        if owner_idx and owner_idx in pin_map:
            j2_pins = sorted(pin_map[owner_idx], key=lambda p: safe_int(p.get('DESIGNATOR', '0')) or 0)
            print(f"\n    J2 Pins:")
            for p in j2_pins:
                pin_num = p.get('DESIGNATOR', '?')
                pin_name = p.get('NAME', '?')
                print(f"      Pin {pin_num}: {pin_name}")
    
    # Find all net labels at J2 area (near X ~ 300-350, Y ~ 1200-1400)
    print(f"\n    Net labels at J2 schematic area:")
    for nl in net_labels:
        x = safe_int(nl.get('LOCATION.X', nl.get('LOCATION_X', '0')))
        y = safe_int(nl.get('LOCATION.Y', nl.get('LOCATION_Y', '0')))
        if x and y and 200 <= x <= 500 and 1200 <= y <= 1500:
            text = nl.get('TEXT', '?')
            uid = nl.get('UNIQUEID', '?')
            print(f"      X={x}, Y={y}: {text} (INDEX={nl.get('INDEXINSHEET','?')}, UID={uid})")


# =====================================================================
# PART 3: COMBINED RESULTS
# =====================================================================
def print_combined():
    print(f"\n\n{'='*78}")
    print("PART 3: COMBINED PCB + SCHEMATIC NET TRACE SUMMARY")
    print("=" * 78)
    
    print("""
┌─────────────────────────────────────────────────────────────────────────────┐
│                           NET CONNECTION MAP                                │
├──────────┬──────────────────────────────────────────────────────────────────┤
│          │                                                                  │
│  MCU     │   SC8F096AD832NPR (32-pin QFN)                                  │
│  (U?)    │   Located at X=940, Y=665 (schematic)                           │
│          │                                                                  │
│  Pins:   │                                                                  │
│  Pin 1   │   VDD ───────────────────────────────────────────── VDD         │
│  Pin 2   │   AN21 ──────────────── DAT ─────────────────────── DAT net     │
│  Pin 3   │   AN20 ──────────────── CLK ─────────────────────── CLK net     │
│  Pin 4   │   AN19 ──────────────── CD IO1 ──┬─ MCU side                   │
│          │           ┌───────────────────────┘                             │
│          │           │  (routes to J2 connector area on PCB)               │
│  Pin 5   │   AN18 ──────────────── CD IO2 ──┬─ MCU side                   │
│          │           ┌───────────────────────┘                             │
│          │           │  (routes to J2 connector area on PCB)               │
│  Pin 6   │   AN17 ──────────────── B1AD ───────────────────── B1AD net    │
│  Pin 7   │   AN16 ──────────────── B2AD ───────────────────── B2AD net    │
│  Pin 8   │   AN15 ──────────────── VT_PWM1 ────────────────── VT_PWM1 net │
│  Pin 9-16│   AN14-AN8 ──────────── (no net labels)                         │
│  Pin 17- │   AN28-AN22 ─────────── (no net labels)                         │
│  Pin 24  │   AN7 ───────────────── (no net label)                          │
│  Pin 25- │   AN6-AN0 ───────────── (no net labels)                         │
│  Pin 32  │   GND ──────────────────────────────────────────── GND         │
│  Pin 33  │   GND ──────────────────────────────────────────── GND         │
│          │                                                                  │
├──────────┼──────────────────────────────────────────────────────────────────┤
│          │                                                                  │
│  J2      │   PTP-4P (4-pin connector)                                      │
│  Conn.   │   PCB Pattern: PTP-4P                                           │
│          │   Library: S433 TOP V1.0.PcbLib                                 │
│          │                                                                  │
│  Pins:   │                                                                  │
│  Pin 1   │   (net TBD - not directly labeled in this analysis)             │
│  Pin 2   │   NetJ2_2 ──── TOP layer, 8mil width                            │
│  Pin 3   │   NetJ2_3 ──── TOP layer, 8mil width                            │
│  Pin 4   │   (net TBD - not directly labeled in this analysis)             │
│          │                                                                  │
├──────────┼──────────────────────────────────────────────────────────────────┤
│          │                                                                  │
│  NET     │                                                                  │
│  SUMMARY │                                                                  │
│          │                                                                  │
│  VT_PWM1 │   MCU AN15 (Pin 8) only                                         │
│          │   Single instance, no multi-location                            │
│          │   PCB: TOP layer, 12mil width, UID=NBNRNMPI                     │
│          │   Does NOT route to J2 connector                                │
│          │                                                                  │
│  CD IO1  │   MCU AN19 (Pin 4) ────→ routes to J2 area on PCB              │
│          │   2 net label locations (multi-location net)                     │
│          │   PCB: TOP layer, 8mil width, UID=DLAWETRI                      │
│          │   Schematic: (1010,485) MCU side AND (320,1365) J2 side         │
│          │                                                                  │
│  CD IO2  │   MCU AN18 (Pin 5) ────→ routes to J2 area on PCB              │
│          │   2 net label locations (multi-location net)                     │
│          │   PCB: TOP layer, 8mil width, UID=UGJCNPIK                      │
│          │   Schematic: (1020,485) MCU side AND (315,1280) J2 side         │
│          │                                                                  │
│  EN      │   2 net label locations (multi-location net)                     │
│          │   PCB: TOP layer, 8mil width, UID=PWXDMLQD, VISIBLE=TRUE        │
│          │   Schematic: (695,1335) AND (1145,565)                          │
│          │   Connects through the schematic across two areas               │
│          │                                                                  │
└──────────┴──────────────────────────────────────────────────────────────────┘
""")


# =====================================================================
# MAIN
# =====================================================================
if __name__ == '__main__':
    analyze_pcb()
    analyze_sch()
    print_combined()
    
    print("\n" + "=" * 78)
    print("ANALYSIS COMPLETE")
    print("=" * 78)
