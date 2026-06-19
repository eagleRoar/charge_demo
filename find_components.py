# -*- coding: utf-8 -*-
"""Find NTC1, R48, C12 in PCB data."""
import sys
sys.path.insert(0, r'e:\1.workspace\7.other\17.charge_demo\charge_demo')
from parse_pcb2 import parse_ole

filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
entries, read_stream, cutoff = parse_ole(filepath)

print("=" * 60)
print("SEARCHING FOR NTC1, R48, C12 in PCB Streams")
print("=" * 60)

search_terms = ['NTC1', 'NTC', 'R48', 'C12']

for e in entries:
    if e.type == 2 and e.name != 'FileHeader':
        stream = read_stream(e.name)
        if len(stream) > 0:
            text = stream.decode('latin-1', errors='replace')
            found_any = any(term in text for term in search_terms)
            if found_any or ('RECORD=' in text and len(stream) < 200000):
                print(f'\n=== Stream: {e.name} ({len(stream)} bytes) ===')
                
                for keyword in search_terms:
                    idx = text.find(keyword)
                    if idx >= 0:
                        # Find all occurrences
                        pos = 0
                        count = 0
                        while True:
                            idx = text.find(keyword, pos)
                            if idx < 0:
                                break
                            count += 1
                            start = max(0, idx - 100)
                            end = min(len(text), idx + 400)
                            snippet = text[start:end]
                            # Clean up for display
                            printable = ''.join(c if c.isprintable() or c in '\n\r\t' else '.' for c in snippet)
                            print(f'\n--- "{keyword}" occurrence #{count} at byte {idx} ---')
                            print(printable)
                            pos = idx + 1
                            if count >= 5:
                                print(f'    ... (truncated after 5 occurrences)')
                                break

print("\n" + "=" * 60)
print("DONE")
