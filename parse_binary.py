import olefile
import struct

path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.SchDoc'
ole = olefile.OleFileIO(path)

data = ole.openstream('FileHeader').read()

# Find the SC8F096 string
idx = data.find(b'SC8F096')
print(f"SC8F096 at offset: {idx}")

# Look at hex around that offset
for offset in [idx-60, idx-20, idx, idx+50]:
    if offset >= 0:
        chunk = data[offset:offset+80]
        print(f"\n--- Offset {offset} ---")
        print(f"Hex: {chunk.hex()}")
        # Try to show ASCII
        ascii_text = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
        print(f"ASCII: {ascii_text}")

# Let me look at the record boundaries more carefully
# The PIPE character '|' is 0x7C
# Let's find the pipe locations near the MCU
print("\n\n=== Record boundaries near MCU ===")
for offset in range(idx-500, min(idx+500, len(data))):
    if data[offset] == 0x7C:  # pipe
        # Look at context
        start = max(0, offset-10)
        end = min(len(data), offset+50)
        chunk = data[start:end]
        # Show the text before and after pipe
        before = data[max(0,offset-30):offset]
        after = data[offset:min(len(data),offset+80)]
        # Check if this is a record start
        try:
            ascii_before = before.decode('ascii', errors='replace')
            ascii_after = after.decode('ascii', errors='replace')
            # Check if this could be a record separator
            if 'RECORD' in ascii_after or 'OWNER' in ascii_after or 'INDEXINSHEET' in ascii_after:
                print(f"\nOffset {offset}:")
                print(f"  Before: {ascii_before[-60:]}")
                print(f"  After: {ascii_after[:100]}")
                # Show the bytes just before
                pre_bytes = data[offset-6:offset]
                print(f"  Pre bytes (6): {pre_bytes.hex()} => {struct.unpack('<H', pre_bytes[4:6]) if len(pre_bytes)>=6 else 'N/A'}")
        except:
            pass

ole.close()
