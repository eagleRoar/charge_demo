# -*- coding: utf-8 -*-
"""
Parse Altium PcbDoc OLE compound file to extract netlist information.
"""
import struct
import sys

def parse_ole_file(filepath):
    with open(filepath, 'rb') as f:
        data = f.read()

    header = data[:512]
    # Actually header has the second signature that tells sector size
    # Byte 30-31: sector size (power of 2) for v3, or direct value for v4
    byte_order = struct.unpack_from('<H', header, 28)[0]
    ver_major = struct.unpack_from('<H', header, 26)[0]

    sector_shift = struct.unpack_from('<H', header, 30)[0]
    if ver_major == 4:
        sector_size = 4096
    else:
        sector_size = 1 << sector_shift

    mini_sector_shift = struct.unpack_from('<H', header, 32)[0]
    mini_sector_size = 1 << mini_sector_shift

    num_fat_sectors = struct.unpack_from('<I', header, 44)[0]
    dir_start_sec = struct.unpack_from('<I', header, 48)[0]
    mini_stream_cutoff = struct.unpack_from('<I', header, 56)[0]
    mini_fat_start = struct.unpack_from('<I', header, 60)[0]
    num_mini_fat_sectors = struct.unpack_from('<I', header, 64)[0]
    dif_start = struct.unpack_from('<I', header, 68)[0]

    print(f"Sector size: {sector_size}")
    print(f"Mini sector size: {mini_sector_size}")
    print(f"FAT sectors: {num_fat_sectors}")
    print(f"Dir start sector: {dir_start_sec}")
    print(f"Mini stream cutoff: {mini_stream_cutoff}")
    print(f"Mini FAT start: {mini_fat_start}")
    print(f"Mini FAT sectors: {num_mini_fat_sectors}")
    print(f"DIFAT start: {dif_start}")

    # Read FAT
    fat = []
    for i in range(109):
        val = struct.unpack_from('<I', header, 76 + i * 4)[0]
        fat.append(val)

    # Additional FAT sectors
    for i in range(num_fat_sectors):
        sec_offset = sector_size + i * sector_size  # FAT starts at sector 0 (offset sector_size)
        if sec_offset + sector_size > len(data):
            break
        sec_data = data[sec_offset:sec_offset + sector_size]
        for j in range(sector_size // 4):
            val = struct.unpack_from('<I', sec_data, j * 4)[0]
            fat.append(val)

    # DIFAT
    if dif_start < 0xFFFFFFFE:
        while dif_start < 0xFFFFFFFE:
            sec_offset = (dif_start + 1) * sector_size
            if sec_offset + sector_size > len(data):
                break
            sec_data = data[sec_offset:sec_offset + sector_size]
            for j in range(sector_size // 4 - 1):
                val = struct.unpack_from('<I', sec_data, j * 4)[0]
                fat.append(val)
            dif_start = struct.unpack_from('<I', sec_data, (sector_size // 4 - 1) * 4)[0]

    print(f"Total FAT entries: {len(fat)}")

    def get_sector_chain(start):
        chain = []
        s = start
        visited = set()
        while s < 0xFFFFFFFA and s not in visited:
            visited.add(s)
            chain.append(s)
            if s >= len(fat):
                break
            s = fat[s]
            if s == 0xFFFFFFFD:
                break
        return chain

    def read_stream_data(sectors):
        result = bytearray()
        for sec in sectors:
            offset = (sec + 1) * sector_size
            if offset + sector_size <= len(data):
                result.extend(data[offset:offset + sector_size])
        return bytes(result)

    # Read directory
    dir_sectors = get_sector_chain(dir_start_sec)
    dir_data = read_stream_data(dir_sectors)

    # Read mini FAT
    mini_fat_sectors = get_sector_chain(mini_fat_start) if mini_fat_start < 0xFFFFFFFE else []
    mini_fat_data = read_stream_data(mini_fat_sectors) if mini_fat_sectors else b''
    mini_fat = []
    for j in range(len(mini_fat_data) // 4):
        mini_fat.append(struct.unpack_from('<I', mini_fat_data, j * 4)[0])

    # Root storage sectors for mini stream
    root_entry = None
    entries = []
    for i in range(0, len(dir_data), 128):
        entry = dir_data[i:i + 128]
        if len(entry) < 128:
            break
        name_raw = entry[:64]
        name_len = struct.unpack_from('<H', entry, 64)[0]
        if name_len == 0:
            continue
        name = name_raw[:name_len].decode('utf-16-le', errors='replace').rstrip('\x00')
        obj_type = entry[66]
        start_sector = struct.unpack_from('<I', entry, 116)[0]
        stream_size_low = struct.unpack_from('<I', entry, 120)[0]
        stream_size_high = struct.unpack_from('<I', entry, 124)[0] if len(entry) > 124 else 0
        stream_size = stream_size_low

        entries.append({
            'name': name,
            'type': obj_type,
            'start_sector': start_sector,
            'stream_size': stream_size,
        })
        if obj_type == 5:  # root
            root_entry = entries[-1]

    # Print all entries
    print(f"\n=== OLE Streams ({len(entries)}) ===")
    for e in entries:
        t = {1: 'storage', 2: 'stream', 5: 'root'}.get(e['type'], str(e['type']))
        print(f"  [{t:8s}] {e['name']:40s} size={e['stream_size']:>10,} sector={e['start_sector']}")

    # Get root's mini stream
    mini_stream_data = b''
    if root_entry and root_entry['start_sector'] < 0xFFFFFFFE:
        root_sectors = get_sector_chain(root_entry['start_sector'])
        mini_stream_data = read_stream_data(root_sectors)

    def read_stream(name):
        """Read a stream by name"""
        for e in entries:
            if e['name'] == name and e['type'] == 2:
                if e['stream_size'] < mini_stream_cutoff:
                    # Mini stream
                    chain = []
                    s = e['start_sector']
                    visited = set()
                    while s < 0xFFFFFFFA and s not in visited:
                        visited.add(s)
                        chain.append(s)
                        if s >= len(mini_fat):
                            break
                        s = mini_fat[s]
                        if s == 0xFFFFFFFD:
                            break
                    data_out = bytearray()
                    for ms in chain:
                        offset = ms * mini_sector_size
                        if offset + mini_sector_size <= len(mini_stream_data):
                            data_out.extend(mini_stream_data[offset:offset + mini_sector_size])
                    return bytes(data_out)[:e['stream_size']]
                else:
                    sectors = get_sector_chain(e['start_sector'])
                    return read_stream_data(sectors)[:e['stream_size']]
        return b''

    return entries, fat, mini_fat, data, sector_size, mini_sector_size, read_stream


if __name__ == '__main__':
    filepath = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\L1211 TOP V2.0.PcbDoc'
    parse_ole_file(filepath)
