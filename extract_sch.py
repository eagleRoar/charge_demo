import re
import sys
import io

file_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc"
output_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\sch_extract_output.txt"

# Collect all output lines
output_lines = []

def p(*args, **kwargs):
    """Print to both stdout and capture for file output."""
    line = ' '.join(str(a) for a in args)
    output_lines.append(line + '\n')
    # Try to print to stdout, ignore encoding errors
    try:
        print(*args, **kwargs)
    except UnicodeEncodeError:
        print(line.encode('ascii', errors='replace').decode('ascii'))

# 1. Read binary file
with open(file_path, "rb") as f:
    raw_data = f.read()

p(f"=== File size: {len(raw_data):,} bytes ===\n")

# 2. Extract all readable ASCII/UTF-8 strings (4+ printable chars)
min_len = 4

def extract_readable_strings(data, encoding='utf-8'):
    """Extract all sequences of 4+ printable characters from binary data."""
    results = []
    text = data.decode(encoding, errors='ignore')
    pattern = re.compile(r'[\x20-\x7E\u4e00-\u9fff\u3000-\u303f\uff00-\uffef\u00c0-\u024f\u03a9\u00b5\u2126\u2103\u00b0]{4,}')
    for match in pattern.finditer(text):
        s = match.group()
        if len(s) >= min_len:
            results.append(s)
    return results

def extract_binary_strings(data, min_len=4):
    """Extract printable ASCII sequences directly from bytes."""
    results = []
    current = []
    for byte in data:
        if 0x20 <= byte <= 0x7E:
            current.append(chr(byte))
        else:
            if len(current) >= min_len:
                s = ''.join(current)
                if len(set(s)) > 1 or len(s) < 10:
                    results.append(s)
            current = []
    if len(current) >= min_len:
        s = ''.join(current)
        if len(set(s)) > 1 or len(s) < 10:
            results.append(s)
    return results

utf8_strings = extract_readable_strings(raw_data, 'utf-8')
ascii_strings = extract_binary_strings(raw_data)
latin1_text = raw_data.decode('latin-1', errors='ignore')
pipe_segments = re.findall(r'[\x20-\x7E\u4e00-\u9fff\u00c0-\u024f\u2126\u03a9\u00b5]+', latin1_text)
pipe_segments = [s for s in pipe_segments if len(s) >= min_len]

all_candidates = list(set(utf8_strings + ascii_strings + pipe_segments))
p(f"=== Total unique candidate strings (4+ chars): {len(all_candidates)} ===\n")

keywords_of_interest = [
    "VT_PWM1", "NLVT0PWM1", "CD IO1", "CD IO2", "PWM", 
    "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12",
    "J2", "LED", "NTC", "EN", "VCC_SW", "VT", "NLVT", "CD"
]

# Parse the structured data (pipe-delimited records)
p("=" * 80)
p("SECTION 1: STRUCTURED RECORDS (pipe-delimited key=value data)")
p("=" * 80)

record_pattern = re.compile(r'\|RECORD=\d+.*?(?=\|RECORD=\d+|\Z)')
records = record_pattern.findall(latin1_text)

parsed_records = []
for rec in records:
    kv_pairs = {}
    parts = rec.split('|')
    for part in parts:
        if '=' in part:
            key, value = part.split('=', 1)
            kv_pairs[key.strip()] = value.strip()
    if kv_pairs:
        parsed_records.append(kv_pairs)

p(f"Total parsed records: {len(parsed_records)}\n")

designators = set()
pin_names = set()
pin_designators = set()
component_librefs = set()
comments = set()
texts = set()
net_labels = set()
unique_ids = set()
component_descriptions = set()
source_lib_names = set()
pcb_models = set()
suppliers = set()
datasheets = set()
parameter_names = set()
parameter_values = set()

for rec in parsed_records:
    if 'TEXT' in rec:
        txt = rec['TEXT']
        if txt:
            texts.add(txt)
            if re.match(r'^[A-Z]+\d+$', txt):
                designators.add(txt)
            elif re.match(r'^[A-Z_][A-Z0-9_]*$', txt) and len(txt) >= 2:
                net_labels.add(txt)
    
    if 'NAME' in rec:
        name = rec['NAME']
        names_to_check = ['Designator', 'Comment', 'PinUniqueId', 'Datasheet', 
                         'Supplier', 'Type', 'Add into BOM', 'Convert to PCB']
        if name not in names_to_check and len(name) >= 2:
            pin_names.add(name)
    
    if 'DESIGNATOR' in rec:
        d = rec['DESIGNATOR']
        if d and len(d) >= 1:
            pin_designators.add(d)
    
    if 'LIBREFERENCE' in rec:
        component_librefs.add(rec['LIBREFERENCE'])
    
    if 'COMMENT' in rec or 'Comment' == rec.get('NAME', ''):
        if 'TEXT' in rec:
            comments.add(rec['TEXT'])
    
    if 'COMPONENTDESCRIPTION' in rec:
        component_descriptions.add(rec['COMPONENTDESCRIPTION'])
    
    if 'SOURCELIBRARYNAME' in rec:
        source_lib_names.add(rec['SOURCELIBRARYNAME'])
    
    if 'MODELNAME' in rec:
        pcb_models.add(rec['MODELNAME'])
    
    if 'UNIQUEID' in rec:
        unique_ids.add(rec['UNIQUEID'])
    
    if rec.get('NAME') == 'Supplier' and 'TEXT' in rec:
        suppliers.add(rec['TEXT'])
    
    if rec.get('NAME') == 'Datasheet' and 'TEXT' in rec:
        datasheets.add(rec['TEXT'])
    
    name = rec.get('NAME', '')
    if name and not name.startswith('Pin') and name not in ('Designator', 'Comment', 'Type', 'Supplier', 'Datasheet', 'Add into BOM', 'Convert to PCB'):
        if len(name) > 2 and not name.isupper() or '(' in name:
            parameter_names.add(name)
            if 'TEXT' in rec:
                parameter_values.add(rec['TEXT'])

p("\n--- Component Library References ---")
for item in sorted(component_librefs):
    p(f"  {item}")

p(f"\n--- Component Designators (RefDes) [{len(designators)}] ---")
for item in sorted(designators):
    p(f"  {item}")

p(f"\n--- Pin Names [{len(pin_names)}] ---")
for item in sorted(pin_names):
    p(f"  {item}")

p(f"\n--- Pin Designators [{len(pin_designators)}] ---")
for item in sorted(pin_designators):
    p(f"  {item}")

p(f"\n--- Comments [{len(comments)}] ---")
for item in sorted(comments):
    p(f"  {item}")

p(f"\n--- Component Descriptions ---")
for item in sorted(component_descriptions):
    p(f"  {item}")

p(f"\n--- Source Library Names ---")
for item in sorted(source_lib_names):
    p(f"  {item}")

p(f"\n--- PCB Footprint Models ---")
for item in sorted(pcb_models):
    p(f"  {item}")

p(f"\n--- Supplier Info ---")
for item in sorted(suppliers):
    p(f"  {item}")

p(f"\n--- Parameter Names ---")
for item in sorted(parameter_names):
    p(f"  {item}")

p(f"\n--- Parameter Values ---")
for item in sorted(parameter_values):
    p(f"  {item}")

p(f"\n--- Unique IDs [{len(unique_ids)}] ---")
for item in sorted(unique_ids):
    p(f"  {item}")

# SECTION 2: Keyword search
p("\n" + "=" * 80)
p("SECTION 2: KEYWORD SEARCH IN RAW DATA")
p("=" * 80)

for kw in keywords_of_interest:
    matches = []
    for m in re.finditer(re.escape(kw), latin1_text, re.IGNORECASE):
        start = max(0, m.start() - 50)
        end = min(len(latin1_text), m.end() + 80)
        context = latin1_text[start:end].replace('\x00', ' ').replace('\r', ' ').replace('\n', ' ')
        matches.append(context)
    
    if matches:
        p(f"\n--- '{kw}' found {len(matches)} time(s) ---")
        for i, ctx in enumerate(matches[:10]):
            p(f"  [{i+1}] ...{ctx}...")
    else:
        p(f"\n--- '{kw}' NOT FOUND ---")

# SECTION 3: All text strings
p("\n" + "=" * 80)
p("SECTION 3: ALL UNIQUE TEXT STRINGS (from TEXT/UTF8 TEXT fields)")
p("=" * 80)

all_texts = set()
for rec in parsed_records:
    if 'TEXT' in rec:
        all_texts.add(rec['TEXT'])
    for key in rec:
        if key.startswith('%UTF8%') and 'TEXT' in key:
            all_texts.add(rec[key])

for item in sorted(all_texts):
    p(f"  {item}")

# SECTION 4: Signal/Net names
p("\n" + "=" * 80)
p("SECTION 4: POTENTIAL SIGNAL/NET NAMES (all-caps alphanumeric 3+)")
p("=" * 80)

signal_pattern = re.compile(r'\b([A-Z][A-Z0-9_]{2,}(?:_[A-Z0-9]+)*)\b')
signal_candidates = set()
for s in all_candidates:
    for m in signal_pattern.finditer(s):
        candidate = m.group(1)
        if candidate not in ('RECORD', 'UTF8', 'TEXT', 'NAME', 'UNIQUEID', 'OWNERINDEX', 
                            'INDEXINSHEET', 'OWNERPARTID', 'LOCATION', 'COLOR', 'FONTID',
                            'ISHIDDEN', 'ISMIRRORED', 'LIBREFERENCE', 'LIBRARYPATH',
                            'AREACOLOR', 'PARTCOUNT', 'DISPLAYMODECOUNT', 'CURRENTPARTID',
                            'PARTIDLOCKED', 'DESIGNITEMID', 'TARGETFILENAME', 'READONLYSTATE',
                            'MODELNAME', 'MODELTYPE', 'DATAFILECOUNT', 'ISCURRENT',
                            'FORMALTYPE', 'ELECTRICAL', 'PINCONGLOMERATE', 'PINLENGTH',
                            'LINEWIDTH', 'LOCATIONCOUNT', 'ISNOTACCESIBLE', 'ISSOLID',
                            'CORNER', 'DESIGNATOR', 'COMMENT', 'SUPPLIER', 'DATASHEET',
                            'COMPONENTDESCRIPTION', 'SOURCELIBRARYNAME', 'DESCRIPTION',
                            'MODELDATAFILEENTITY', 'MODELDATAFILEKIND',
                            'RECORD', 'TRUE', 'FALSE', 'NULL'):
            if 3 <= len(candidate) <= 30:
                signal_candidates.add(candidate)

for item in sorted(signal_candidates):
    p(f"  {item}")

# SECTION 5: XML-like content
p("\n" + "=" * 80)
p("SECTION 5: XML-LIKE OR STRUCTURED CONTENT")
p("=" * 80)

xml_pattern = re.compile(r'<[^>]+>')
xml_matches = xml_pattern.findall(latin1_text)
if xml_matches:
    p(f"Found {len(xml_matches)} XML-like tags:")
    for tag in sorted(set(xml_matches))[:50]:
        p(f"  {tag}")
else:
    p("No XML-like tags found.")

json_pattern = re.compile(r'\{[^{}]*\}')
json_matches = json_pattern.findall(latin1_text)
if json_matches:
    p(f"\nFound {len(json_matches)} JSON-like structures:")
    for j in sorted(set(json_matches))[:20]:
        p(f"  {j}")

# SECTION 6: Date/URL/Version
p("\n" + "=" * 80)
p("SECTION 6: DATE/URL/VERSION STRINGS")
p("=" * 80)

url_pattern = re.compile(r'https?://[^\s|]+')
urls = url_pattern.findall(latin1_text)
for u in sorted(set(urls)):
    p(f"  URL: {u}")

date_pattern = re.compile(r'\b\d{4}[-/]\d{2}[-/]\d{2}\b')
dates = date_pattern.findall(latin1_text)
for d in sorted(set(dates)):
    p(f"  Date: {d}")

ver_pattern = re.compile(r'\b[vV]\d+\.\d+\b')
versions = ver_pattern.findall(latin1_text)
for v in sorted(set(versions)):
    p(f"  Version: {v}")

# SECTION 7: Record type summary
p("\n" + "=" * 80)
p("SECTION 7: RECORD TYPE SUMMARY")
p("=" * 80)

record_types = {}
for rec in parsed_records:
    rt = rec.get('RECORD', 'Unknown')
    record_types[rt] = record_types.get(rt, 0) + 1

for rt, count in sorted(record_types.items(), key=lambda x: -x[1]):
    p(f"  RECORD={rt}: {count} entries")

p("\n" + "=" * 80)
p("EXTRACTION COMPLETE")
p("=" * 80)

# Write output to file
with open(output_path, 'w', encoding='utf-8') as f_out:
    f_out.writelines(output_lines)

print(f"\nOutput saved to: {output_path}")
print(f"Total output lines: {len(output_lines)}")
