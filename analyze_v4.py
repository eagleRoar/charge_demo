import olefile
import re

fpath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.SchDoc'
ole = olefile.OleFileIO(fpath)
data = ole.openstream('FileHeader').read()
text = data.decode('latin-1')

# KEY INSIGHT: In Altium, RECORD=25 (net labels) have OWNERINDEX that identifies the net.
# RECORD=2 (pins) are part of components. 
# When a wire connects a pin to a net, the wire's OWNERINDEX matches the net's.
# RECORD=27: wire on schematic (has OWNERINDEX matching net)
# RECORD=6:  wire/pin line within component symbol

# Let's find the MCU component footprint
# First, find the MCU component (RECORD=1 with LIBREFERENCE containing PIC/dsPIC)
print("=== Finding MCU Component ===")
mcu_ownerindex = None
mcu_location = None
for m in re.finditer(r'RECORD=1\|.*?LIBREFERENCE=([^|]+)', text):
    lib = m.group(1)
    if 'PIC' in lib.upper() or 'DSPIC' in lib.upper() or '16F' in lib.upper() or '18F' in lib.upper() or '24F' in lib.upper() or '33F' in lib.upper():
        ctx = text[max(0,m.start()-10):min(len(text),m.end()+200)]
        oi = re.search(r'OWNERINDEX=(\d+)', ctx)
        loc = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', ctx)
        print(f"  MCU: {lib}")
        if oi: 
            mcu_ownerindex = oi.group(1)
            print(f"  OWNERINDEX: {mcu_ownerindex}")
        if loc:
            mcu_location = (loc.group(1), loc.group(2))
            print(f"  LOCATION: ({loc.group(1)},{loc.group(2)})")

# Now for each BxAD net label (RECORD=25), find its OWNERINDEX  
print("\n=== BxAD Net Label OWNERINDEX Mapping ===")
bxad_nets = {}  # BxAD label -> set of OWNERINDEX values
for label_num in range(1, 13):
    label = f'B{label_num}AD'
    for m in re.finditer(rf'TEXT={label}\|', text):
        # Find the closest RECORD= before this match
        search_start = max(0, m.start() - 300)
        chunk = text[search_start:m.end()]
        # Find the last RECORD=25 before or at this position
        rec25_matches = list(re.finditer(r'RECORD=25\|', chunk))
        if rec25_matches:
            # Get the chunk from the last RECORD=25
            last_rec = rec25_matches[-1]
            rec_chunk = chunk[last_rec.start():]
            oi_match = re.search(r'OWNERINDEX=(\d+)', rec_chunk)
            if oi_match:
                oi = oi_match.group(1)
                if label not in bxad_nets:
                    bxad_nets[label] = set()
                bxad_nets[label].add(oi)
                loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', rec_chunk)
                loc = f"({loc_match.group(1)},{loc_match.group(2)})" if loc_match else '(?,?)'
                uid_match = re.search(r'UNIQUEID=(\S+?)\|', rec_chunk)
                uid = uid_match.group(1) if uid_match else '?'
                if label not in getattr(bxad_nets, '_printed', set()):
                    print(f"  {label}: OWNERINDEX={oi}  LOC={loc}  UNIQUEID={uid}")

# Find NTC net label OWNERINDEX
print("\n=== NTC Net Label ===")
for m in re.finditer(r'TEXT=NTC\|', text):
    search_start = max(0, m.start() - 300)
    chunk = text[search_start:m.end()]
    rec25_matches = list(re.finditer(r'RECORD=25\|', chunk))
    if rec25_matches:
        last_rec = rec25_matches[-1]
        rec_chunk = chunk[last_rec.start():]
        oi_match = re.search(r'OWNERINDEX=(\d+)', rec_chunk)
        if oi_match:
            loc_match = re.search(r'LOCATION\.X=(\d+)\|LOCATION\.Y=(\d+)', rec_chunk)
            loc = f"({loc_match.group(1)},{loc_match.group(2)})" if loc_match else '(?,?)'
            print(f"  NTC: OWNERINDEX={oi_match.group(1)}  LOC={loc}")

# Now find wires (RECORD=27) on the schematic - they connect physical points with OWNERINDEX
print("\n=== Selected Wire Segments (RECORD=27) near BxAD/ANx locations ===")
wire_segments = []
for m in re.finditer(r'RECORD=27\|', text):
    start = m.start()
    end = min(len(text), start + 500)
    chunk = text[start:end]
    oi_match = re.search(r'OWNERINDEX=(\d+)', chunk)
    # Find all X/Y coordinates
    coords = re.findall(r'X(\d+)=(\d+)\|Y\1=(\d+)', chunk)
    if oi_match and len(coords) >= 2:
        oi = oi_match.group(1)
        points = [(int(x), int(y)) for _, x, y in coords]
        wire_segments.append((oi, points))

# Now match: for each BxAD net OWNERINDEX, find wires with the same OWNERINDEX
print("\n=== Matching BxAD Nets to Wire Segments ===")
# First build reverse map: wire OWNERINDEX -> endpoints
wire_by_oi = {}
for oi, points in wire_segments:
    if oi not in wire_by_oi:
        wire_by_oi[oi] = []
    wire_by_oi[oi].extend(points)

for label, ois in bxad_nets.items():
    for oi in ois:
        if oi in wire_by_oi:
            endpoints = wire_by_oi[oi]
            xs = [p[0] for p in endpoints]
            ys = [p[1] for p in endpoints]
            print(f"  {label} (OWNERINDEX={oi}): wires from ({min(xs)},{min(ys)}) to ({max(xs)},{max(ys)})")
        else:
            print(f"  {label} (OWNERINDEX={oi}): no wires found")

# Check NTC
for m in re.finditer(r'TEXT=NTC\|', text):
    search_start = max(0, m.start() - 300)
    chunk = text[search_start:m.end()]
    rec25_matches = list(re.finditer(r'RECORD=25\|', chunk))
    if rec25_matches:
        last_rec = rec25_matches[-1]
        rec_chunk = chunk[last_rec.start():]
        oi_match = re.search(r'OWNERINDEX=(\d+)', rec_chunk)
        if oi_match:
            oi = oi_match.group(1)
            if oi in wire_by_oi:
                endpoints = wire_by_oi[oi]
                xs = [p[0] for p in endpoints]
                ys = [p[1] for p in endpoints]
                print(f"  NTC (OWNERINDEX={oi}): wires from ({min(xs)},{min(ys)}) to ({max(xs)},{max(ys)})")
