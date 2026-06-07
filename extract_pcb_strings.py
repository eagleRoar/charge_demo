# -*- coding: utf-8 -*-
import re
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

FILE_PATH = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc"
OUT_PATH = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\pcb_extract_output.txt"

with open(FILE_PATH, "rb") as f:
    data = f.read()

out_lines = []
def w(s):
    out_lines.append(s)

file_size = len(data)
w(f"File size: {file_size} bytes ({file_size/1024:.1f} KB)")
w("=" * 80)

# ============================================================
# 1. Extract NAME= values from binary (ASCII format, delimited by | or null)
# ============================================================
w("\n### NET NAMES (NAME= from binary, delimited by | or NULL) ###")
w("=" * 80)

nets = set()
pos = 0
pattern = b'NAME='
while pos < len(data):
    pos = data.find(pattern, pos)
    if pos < 0:
        break
    end = pos + 5
    chars = []
    while end < len(data):
        b = data[end]
        if b == ord('|') or b == 0:
            break
        if 0x20 <= b <= 0x7E:
            chars.append(chr(b))
        else:
            break
        end += 1
    name = ''.join(chars)
    if name:
        nets.add(name)
    pos += 5

for n in sorted(nets):
    w(f"  {n}")
w(f"\nTotal NAME= entries: {len(nets)}")

# ============================================================
# 2. Wide-char NAME= (UTF-16LE)  
# ============================================================
w("\n### NET NAMES (UTF-16LE NAME=) ###")
w("=" * 80)

wide_nets = set()
# Search for N\0A\0M\0E\0=\0
pos = 0
target = b'N\x00A\x00M\x00E\x00=\x00'
while pos < len(data) - 10:
    if data[pos:pos+10] == target:
        p = pos + 10
        chars = []
        while p < len(data) - 1:
            if data[p+1] == 0 and 0x20 <= data[p] <= 0x7E:
                chars.append(chr(data[p]))
                p += 2
            else:
                break
        name = ''.join(chars)
        if name:
            wide_nets.add(name)
        pos = p
    else:
        pos += 1

for n in sorted(wide_nets):
    w(f"  {n}")
w(f"\nTotal UTF-16LE NAME= entries: {len(wide_nets)}")

all_nets = nets | wide_nets
w(f"Combined: {len(all_nets)}")

# ============================================================
# 3. PCB-specific net definitions  
# ============================================================
w("\n### PCB NET DEFINITIONS (PRIMITIVELOCK=FALSE|NAME=) ###")
w("=" * 80)

pcb_nets = set()
pos = 0
pattern2 = b'PRIMITIVELOCK=FALSE|NAME='
while pos < len(data):
    pos = data.find(pattern2, pos)
    if pos < 0:
        break
    start = pos + len(pattern2)
    end = start
    chars = []
    while end < len(data):
        b = data[end]
        if b == ord('|') or b == 0:
            break
        if 0x20 <= b <= 0x7E:
            chars.append(chr(b))
        else:
            break
        end += 1
    name = ''.join(chars)
    if name:
        pcb_nets.add(name)
    pos += 10

for n in sorted(pcb_nets):
    w(f"  {n}")
w(f"\nTotal PCB net names: {len(pcb_nets)}")

# ============================================================
# 4. PRIMITIVELOCK=TRUE | NAME=  
# ============================================================
w("\n### PCB NETS (PRIMITIVELOCK=TRUE | NAME=) ###")
w("=" * 80)

pcb_nets2 = set()
pos = 0
pattern3 = b'PRIMITIVELOCK=TRUE|NAME='
while pos < len(data):
    pos = data.find(pattern3, pos)
    if pos < 0:
        break
    start = pos + len(pattern3)
    end = start
    chars = []
    while end < len(data):
        b = data[end]
        if b == ord('|') or b == 0:
            break
        if 0x20 <= b <= 0x7E:
            chars.append(chr(b))
        else:
            break
        end += 1
    name = ''.join(chars)
    if name:
        pcb_nets2.add(name)
    pos += 10

for n in sorted(pcb_nets2):
    w(f"  {n}")
w(f"\nTotal locked PCB net names: {len(pcb_nets2)}")

# ============================================================
# 5. SOURCEDESIGNATOR / DESTDESIGNATOR / PATTERNDESIGNATOR
# ============================================================
w("\n### COMPONENT DESIGNATORS ###")
w("=" * 80)

designators = set()
for tag in [b'SOURCEDESIGNATOR=', b'DESTDESIGNATOR=', b'PATTERNDESIGNATOR=', b'DESIGNATOR=']:
    pos = 0
    while pos < len(data):
        pos = data.find(tag, pos)
        if pos < 0:
            break
        start = pos + len(tag)
        end = start
        chars = []
        while end < len(data):
            b = data[end]
            if b == ord('|') or b == 0:
                break
            if 0x20 <= b <= 0x7E:
                chars.append(chr(b))
            else:
                break
            end += 1
        val = ''.join(chars)
        if val and len(val) >= 2:
            designators.add(val)
        pos += len(tag)

for d in sorted(designators):
    w(f"  {d}")
w(f"\nTotal: {len(designators)}")

# SCOPE expressions
w("\n### SCOPE EXPRESSIONS ###")
scope = set()
for tag in [b'SCOPE1EXPRESSION=', b'SCOPE2EXPRESSION=']:
    pos = 0
    while pos < len(data):
        pos = data.find(tag, pos)
        if pos < 0:
            break
        start = pos + len(tag)
        end = start
        chars = []
        while end < len(data):
            b = data[end]
            if b == ord('|') or b == 0:
                break
            if 0x20 <= b <= 0x7E:
                chars.append(chr(b))
            else:
                break
            end += 1
        val = ''.join(chars)
        if val:
            scope.add(val)
        pos += len(tag)

for s in sorted(scope):
    w(f"  {s}")

# ============================================================
# 6. Keyword targeted search
# ============================================================
w("\n### TARGETED KEYWORD OCCURRENCES ###")
w("=" * 80)

keywords = [
    'VT_PWM1', 'NLVT0PWM1', 'CD IO1', 'CD IO2',
    'LED VCC1', 'LED VCC2', 'VCC1', 'VCC2', 'NTC', 'VCC_SW',
    'GND', 'VBAT', 'VIN', 'VOUT', 'VCC',
    'CHARGE', 'CHG', 'BAT', 'SCL', 'SDA', 'TX', 'RX',
    'SENSE', 'FB', 'ISET', 'PROG', 'STAT', 'TEMP', 'THERM',
    'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'B10', 'B11', 'B12',
    'J1', 'J2', 'J3', 'U1', 'U2', 'U3', 'U4', 'Q1', 'Q2', 'D1', 'D2',
    'R1', 'R2', 'R3', 'R4', 'C1', 'C2', 'C3', 'C4', 'L1', 'L2',
    'CLK', 'DAT', 'EN', 'NC', 'TP', 'TEST', 'PWM', 'LED',
    'NetB',  # Catch NetB* patterns
]

results = {}
for kw in keywords:
    count = 0
    p = 0
    kwb = kw.encode('ascii')
    while p < len(data):
        p = data.find(kwb, p)
        if p < 0:
            break
        # Show context for important matches
        start = max(0, p - 5)
        end = min(len(data), p + len(kw) + 30)
        ctx = ''.join(chr(b) if 0x20 <= b <= 0x7E else '.' for b in data[start:end])
        if kw not in results:
            results[kw] = []
        results[kw].append(f"offs=0x{p:X} ctx=...{ctx}...")
        count += 1
        p += 1

for kw in sorted(results.keys()):
    entries = results[kw]
    w(f"  '{kw}' -> {len(entries)} occurrences:")
    for e in entries[:3]:  # Show first 3
        w(f"    {e}")
    if len(entries) > 3:
        w(f"    ... and {len(entries)-3} more")

w(f"\nKeywords found: {len(results)} out of {len(keywords)}")

# ============================================================
# 7. Unique ASCII strings (4+ chars) - PCB-interesting only
# ============================================================
w("\n### UNIQUE ASCII STRINGS (4+ chars, filtered) ###")
w("=" * 80)

all_strs = set()
current = b""
for byte in data:
    if 0x20 <= byte <= 0x7E:
        current += bytes([byte])
    else:
        if len(current) >= 4:
            all_strs.add(current.decode('ascii', errors='replace'))
        current = b""
if len(current) >= 4:
    all_strs.add(current.decode('ascii', errors='replace'))

# Filter to PCB-interesting
skip_set = {
    'FileHeader', 'FileHeaderSix', 'Root Entry', 'Data', 'Texts', 
    'EmbeddedFonts6', 'Board6', 'Header', 'Arial', 'Regular',
    'TOPOVERLAY', 'BOTTOMOVERLAY', 'TOPLAYER', 'BOTTOMLAYER',
    'LOCKED', 'FALSE', 'TRUE', 'RECORD', 'PCB 6.0 Binary File',
    'PCB 5.0 Binary File', 
    'AdvancedPlacerOptions', 'PLACELARGECLEAR', 'PLACESMALLCLEAR', 
    'PLACEUSEROTATION', 'PLACEUSELAYERSWAP', 'PLACEBYPASSNET',
    'PLACEUSEADVANCEDPLACE', 'PLACEFANOUTDURINGROUTE',
    'Binary File', 'the software',
    'Saving this file will result', 'Close this file immediately',
    'cannot be read correctly', 'into this version of t',
    'in loss of data', 'without saving',
    'SELECTION', 'UNIONINDEX', 'PRIMITIVELOCK', 'POLYGONOUTLINE', 
    'USERROUTED', 'LAYER', 'VISIBLE', 'COLOR', 'LOOPREMOVAL',
    'OVERRIDECOLORFORDRAW', 'JUMPERSVISIBLE',
    'MRVIASIZE', 'MRVIAHOLE', 'UNIQUEID',
    'RULEKIND', 'NETSCOPE', 'LAYERKIND', 'ENABLED', 'PRIORITY', 
    'COMMENT', 'DEFINEDBYLOGICALDOCUMENT',
    'RULEINDEX', 'PRIM1ID', 'PRIM2ID', 'DESCRIPTION',
    'SHELVED', 'RESTORELAYER', 'RESTORENET', 'REMOVEISLANDSBYAREA',
    'REMOVENECKS', 'AREATHRESHOLD', 'ARCRESOLUTION', 
    'NECKWIDTHTHRESHOLD', 'POUROVERSTYLE',
    'POURINDEX', 'IGNOREVIOLATIONS', 'HATCHSTYLE', 
    'USEOCTAGONS', 'MINPRIMLENGTH',
    'POLYGONTYPE', 'POUROVER', 'REMOVEDEAD', 'GRIDSIZE', 'TRACKWIDTH',
    'ROUTINGPRIORITY', 'TOPOLOGY', 'HOLEWIDTH', 'WIDTH', 'VIASTYLE',
    'MINHOLEWIDTH', 'MINWIDTH', 'MAXHOLEWIDTH', 'MAXWIDTH',
    'GAP', 'GENERICCLEARANCE', 'OBJECTCLEARANCES',
    'BGADIR', 'BGAVIAMODE', 'FANOUTSTYLE', 'FANOUTDIRECTION', 'VIAGRID',
    'MAXLIMIT', 'MINLIMIT', 'MOSTFREQGAP', 'MAXUNCOUPLEDLENGTH',
    'MINHEIGHT', 'MAXHEIGHT', 'PREFHEIGHT', 'ENFORCE', 
    'MINSOLDERMASKWIDTH', 'NETANTENNAETOLERANCE', 'EXPANSION',
    'CLEARANCE', 'PLANECONNECTSTYLE', 'RELIEFEXPANSION',
    'RELIEFENTRIES', 'RELIEFCONDUCTORWIDTH', 'RELIEFAIRGAP',
    'CONNECTSTYLE', 'POLYGONRELIEFANGLE', 'AIRGAPWIDTH',
    'CORNERSTYLE', 'MINSETBACK', 'MAXSETBACK', 'ALLOWSTACKEDMICROVIAS',
    'VALID', 'ALLOWMULTIPLE', 'SIDE', 'TESTPOINTUNDERCOMPONENT',
    'MINSIZE', 'MAXSIZE', 'PREFEREDSIZE', 'MINHOLESIZE', 'MAXHOLESIZE',
    'PREFEREDHOLESIZE', 'TESTPOINTGRID', 'USEGRID', 'GRIDTOLERANCE',
    'ALLOWSIDETOP', 'ALLOWSIDEBOTTOM',
    'OUTLINE', 'KEEPOUT', 'SOLDER', 'PASTE', 'MASK', 'OVERLAY',
    'SILKSCREEN', 'DIFFPAIR', 'SIGNAL', 'PLANE', 'MECHANICAL',
    'DRILL', 'REFDES', 'FOOTPRINT', 'LIBREF', 'COMPONENT',
    'REGION', 'ROOM', 'CLASS', 'NET', 'DESIGNATOR', 'PATTERN', 'LIBRARY',
    'SHORTCIRCUIT', 'DIAMETER', 'ORIENTATION', 'LOCATION', 'ROTATION',
    'OFFSET', 'POSITION',
    'FONT', 'STROKE', 'BOLD', 'ITALIC',
}

interesting = set()
for s in all_strs:
    if len(s) > 60:
        continue
    if s in skip_set:
        continue
    # Skip pure numbers or measurements
    if re.match(r'^[\d.]+(mil|mm|inch)?$', s):
        continue
    if re.match(r'^(TOPLAYER_|MIDLAYER\d+_|BOTTOMLAYER_).*$', s):
        continue
    if re.match(r'^(MID LAYER \d+_V5=).*$', s):
        continue
    # Keep strings that look like names/designators
    if re.match(r'^[A-Za-z_][A-Za-z0-9_ +/.-]*$', s):
        interesting.add(s)

for s in sorted(interesting):
    w(f"  {s}")

w(f"\nTotal interesting unique strings: {len(interesting)}")

# ============================================================
# Write to file
# ============================================================
with open(OUT_PATH, "w", encoding="utf-8") as f:
    f.write('\n'.join(out_lines))

print(f"Output written to: {OUT_PATH}")
print(f"Total lines: {len(out_lines)}")
