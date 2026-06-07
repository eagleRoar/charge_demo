# -*- coding: utf-8 -*-
"""
Parse Altium PcbDoc OLE compound file to extract netlist information.
Version 2 - proper OLE traversal and stream reading.
"""
import struct
import sys
import re

def parse_ole(filepath):
    with open(filepath, 'rb') as f:
        data = f.read()

    header = data[:512]
    ver_major = struct.unpack_from('<H', header, 26)[0]

    sector_shift = struct.unpack_from('<H', header, 30)[0]
    sector_size = 4096 if ver_major == 4 else (1 << sector_shift)

    mini_sector_shift = struct.unpack_from('<H', header, 32)[0]
    mini_sector_size = 1 << mini_sector_shift

    num_fat_sectors = struct.unpack_from('<I', header, 44)[0]
    dir_start_sec = struct.unpack_from('<I', header, 48)[0]
    mini_stream_cutoff = struct.unpack_from('<I', header, 56)[0]
    mini_fat_start = struct.unpack_from('<I', header, 60)[0]
    num_mini_fat_sectors = struct.unpack_from('<I', header, 64)[0]
    dif_start = struct.unpack_from('<I', header, 68)[0]

    # Read FAT
    fat = []
    for i in range(109):
        fat.append(struct.unpack_from('<I', header, 76 + i * 4)[0])

    # Additional FAT sectors (the DIFAT entries in header point to them)
    # Actually DIFAT entries beyond 109 are in FAT sectors, but let's be more careful
    # For now, read FAT sectors sequentially from the ones pointed to in the header
    fat_sectors_read = set()
    for i in range(109):
        sec = fat[i]
        if sec < 0xFFFFFFFA and sec not in fat_sectors_read:
            fat_sectors_read.add(sec)

    for fat_sec in sorted(fat_sectors_read):
        offset = (fat_sec + 1) * sector_size
        if offset + sector_size > len(data):
            continue
        sec_data = data[offset:offset + sector_size]
        for j in range(sector_size // 4):
            val = struct.unpack_from('<I', sec_data, j * 4)[0]
            fat.append(val)

    # DIFAT chain
    if dif_start < 0xFFFFFFFE:
        while dif_start < 0xFFFFFFFE:
            offset = (dif_start + 1) * sector_size
            if offset + sector_size > len(data):
                break
            sec_data = data[offset:offset + sector_size]
            for j in range(sector_size // 4 - 1):
                fat.append(struct.unpack_from('<I', sec_data, j * 4)[0])
            dif_start = struct.unpack_from('<I', sec_data, (sector_size // 4 - 1) * 4)[0]

    def get_sector_chain(start):
        chain = []
        s = start
        visited = set()
        while s < 0xFFFFFFFA and s not in visited and s < len(fat):
            visited.add(s)
            chain.append(s)
            s = fat[s]
            if s == 0xFFFFFFFD:
                break
        return chain

    def read_stream_from_sectors(sectors):
        result = bytearray()
        for sec in sectors:
            offset = (sec + 1) * sector_size
            if offset + sector_size <= len(data):
                result.extend(data[offset:offset + sector_size])
        return bytes(result)

    # Read directory
    dir_sectors = get_sector_chain(dir_start_sec)
    dir_data = read_stream_from_sectors(dir_sectors)

    # Parse directory entries - walk red-black tree
    class DirEntry:
        def __init__(self, raw, index):
            self.raw = raw
            self.index = index
            name_raw = raw[:64]
            name_len = struct.unpack_from('<H', raw, 64)[0]
            if name_len > 0:
                self.name = name_raw[:name_len].decode('utf-16-le', errors='replace').rstrip('\x00')
            else:
                self.name = ''
            self.type = raw[66]
            self.left_sib = struct.unpack_from('<I', raw, 68)[0]
            self.right_sib = struct.unpack_from('<I', raw, 72)[0]
            self.child = struct.unpack_from('<I', raw, 76)[0]
            self.start_sector = struct.unpack_from('<I', raw, 116)[0]
            self.stream_size = struct.unpack_from('<I', raw, 120)[0]

    all_entries = {}
    for i in range(0, len(dir_data), 128):
        raw = dir_data[i:i + 128]
        if len(raw) < 128:
            break
        e = DirEntry(raw, i // 128)
        if e.name:  # Only non-empty entries
            all_entries[e.index] = e

    # Walk tree from root (index 0)
    def walk_tree(idx, depth=0):
        if idx < 0 or idx >= len(dir_data) // 128 or idx not in all_entries:
            return []
        e = all_entries[idx]
        result = [(depth, e)]
        # Children first
        if e.child < 0xFFFFFFFE and e.child in all_entries:
            result.extend(walk_tree(e.child, depth + 1))
        # Then right sibling
        if e.right_sib < 0xFFFFFFFE and e.right_sib in all_entries:
            result.extend(walk_tree(e.right_sib, depth))
        return result

    tree = walk_tree(0)
    entries = [e for _, e in tree]

    # Read mini stream
    root_entry = entries[0] if entries else None
    mini_stream_data = b''
    if root_entry and root_entry.start_sector < 0xFFFFFFFE:
        root_sectors = get_sector_chain(root_entry.start_sector)
        mini_stream_data = read_stream_from_sectors(root_sectors)

    # Read mini FAT
    mini_fat = []
    if mini_fat_start < 0xFFFFFFFE:
        mfat_sectors = get_sector_chain(mini_fat_start)
        mfat_data = read_stream_from_sectors(mfat_sectors)
        for j in range(len(mfat_data) // 4):
            mini_fat.append(struct.unpack_from('<I', mfat_data, j * 4)[0])

    def get_mini_sector_chain(start):
        chain = []
        s = start
        visited = set()
        while s < 0xFFFFFFFA and s not in visited and s < len(mini_fat):
            visited.add(s)
            chain.append(s)
            s = mini_fat[s]
            if s == 0xFFFFFFFD:
                break
        return chain

    def read_stream(name):
        for e in entries:
            if e.type == 2 and e.name == name:
                if e.stream_size < mini_stream_cutoff:
                    chain = get_mini_sector_chain(e.start_sector)
                    data_out = bytearray()
                    for ms in chain:
                        offset = ms * mini_sector_size
                        if offset + mini_sector_size <= len(mini_stream_data):
                            data_out.extend(mini_stream_data[offset:offset + mini_sector_size])
                    return bytes(data_out)[:e.stream_size]
                else:
                    chain = get_sector_chain(e.start_sector)
                    return read_stream_from_sectors(chain)[:e.stream_size]
        return b''

    return entries, read_stream, mini_stream_cutoff


if __name__ == '__main__':
    filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
    entries, read_stream, cutoff = parse_ole(filepath)

    print(f"=== OLE Entries ({len(entries)}) ===")
    for e in entries:
        t = {1: 'storage', 2: 'stream', 5: 'root'}.get(e.type, str(e.type))
        indent = '  ' * 0  # all at root
        print(f"  {indent}[{t:8s}] {e.name:50s} size={e.stream_size:>10,} sector={e.start_sector}")

    # Read FileHeader stream
    fh = read_stream('FileHeader')
    print(f"\n=== FileHeader stream ({len(fh)} bytes) ===")
    print(fh[:200].hex())
    print(fh[:200])

    # Also read any other stream
    for e in entries:
        if e.type == 2 and e.name != 'FileHeader':
            stream = read_stream(e.name)
            if len(stream) > 0 and len(stream) < 100000:
                text = stream.decode('latin-1', errors='replace')
                if 'RECORD=' in text or 'NAME=' in text:
                    print(f"\n=== {e.name} ({len(stream)} bytes) ===")
                    print(text[:500])
