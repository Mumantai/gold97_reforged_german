#!/usr/bin/env python3
"""Create a ROM-bank report from RGBDS map and symbol files."""

import re
import sys
from collections import defaultdict
from pathlib import Path


BANK_SIZE = 0x4000
NUM_BANKS = 0x80


def merged_ranges(ranges):
    """Return non-overlapping address ranges, merging adjacent entries."""
    merged = []
    for start, end in sorted(ranges):
        if not merged or start > merged[-1][1] + 1:
            merged.append([start, end])
        else:
            merged[-1][1] = max(merged[-1][1], end)
    return merged


def parse_map(path):
    bank_re = re.compile(r"^(ROM0 bank|ROMX bank) #(\d+):")
    section_re = re.compile(
        r'^\s*SECTION:\s+\$([0-9A-Fa-f]{4})(?:-\$([0-9A-Fa-f]{4}))?.*\["(.*)"\]'
    )
    sections = defaultdict(list)
    bank = None
    for line in path.read_text(encoding="utf-8").splitlines():
        match = bank_re.match(line)
        if match:
            bank = int(match.group(2))
            continue
        match = section_re.match(line)
        if bank is not None and match:
            start = int(match.group(1), 16)
            end = int(match.group(2), 16) if match.group(2) else start
            sections[bank].append((start, end, match.group(3)))
    return sections


def parse_symbols(path):
    symbols = {}
    symbol_re = re.compile(r"^([0-9A-Fa-f]+):([0-9A-Fa-f]{4})\s+(.+)$")
    for line in path.read_text(encoding="utf-8").splitlines():
        match = symbol_re.match(line)
        if match:
            symbols[match.group(3)] = (int(match.group(1), 16), int(match.group(2), 16))
    return symbols


def parse_map_script_includes(path):
    sections = defaultdict(list)
    section = None
    section_re = re.compile(r'^SECTION\s+"(.+?)"\s*,\s*ROMX')
    include_re = re.compile(r'^INCLUDE\s+"(maps/.+?\.asm)"')
    label_re = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)_MapScripts:")

    for line in path.read_text(encoding="utf-8").splitlines():
        match = section_re.match(line)
        if match:
            section = match.group(1)
            continue
        match = include_re.match(line)
        if section and match:
            include_path = Path(match.group(1))
            label = None
            try:
                for source_line in include_path.read_text(encoding="utf-8").splitlines():
                    label_match = label_re.match(source_line)
                    if label_match:
                        label = label_match.group(1) + "_MapScripts"
                        break
            except FileNotFoundError:
                pass
            sections[section].append((include_path.name, label))
    return sections


def free_ranges(bank, sections):
    start, end = (0x0000, 0x3FFF) if bank == 0 else (0x4000, 0x7FFF)
    cursor = start
    free = []
    for section_start, section_end in merged_ranges((s, e) for s, e, _ in sections):
        if cursor < section_start:
            free.append((cursor, section_start - 1))
        cursor = max(cursor, section_end + 1)
    if cursor <= end:
        free.append((cursor, end))
    return free


def main():
    map_file = Path(sys.argv[1] if len(sys.argv) > 1 else "pokegold97.map")
    sym_file = Path(sys.argv[2] if len(sys.argv) > 2 else "pokegold97.sym")
    scripts_file = Path(sys.argv[3] if len(sys.argv) > 3 else "data/maps/scripts.asm")
    sections = parse_map(map_file)
    symbols = parse_symbols(sym_file)
    script_includes = parse_map_script_includes(scripts_file)

    map_script_banks = {
        bank for bank, bank_sections in sections.items()
        if any(name in script_includes for _, _, name in bank_sections)
    }

    print("## 📊 Bank- und Section-Report\n")
    print("Die Map-Größen stammen aus den tatsächlichen Adressen in der `.sym`-Datei. "
          "`free` ist die Summe aller Lücken; `largest block` ist der größte zusammenhängende "
          "Bereich und damit der relevante Wert zum Verschieben einer ganzen Section.\n")
    print("<details>\n<summary><strong>🏦 ROM Bank Übersicht</strong></summary>\n")

    for bank in range(NUM_BANKS):
        bank_sections = sorted(sections.get(bank, []))
        if not bank_sections:
            continue
        occupied = merged_ranges((start, end) for start, end, _ in bank_sections)
        used = sum(end - start + 1 for start, end in occupied)
        free = free_ranges(bank, bank_sections)
        free_total = sum(end - start + 1 for start, end in free)
        largest = max((end - start + 1 for start, end in free), default=0)
        capacity = BANK_SIZE
        pct = used * 100 / capacity
        status = "🔴" if largest == 0 else "🟠" if largest < 512 else "🟢"
        marker = "📜" if bank in map_script_banks else ""
        print(f"<details>\n<summary>{status} {marker} <strong>Bank ${bank:02X}</strong> — "
              f"{pct:.1f}% ({used:5d}/${capacity} bytes) | free: {free_total:5d} | "
              f"largest block: {largest:5d}</summary>\n")

        for start, end, name in bank_sections:
            size = end - start + 1
            includes = script_includes.get(name)
            if not includes:
                print(f"- <code>${start:04X}-${end:04X}</code> — **{name}** ({size} bytes)\n")
                continue

            print(f"<details>\n<summary><code>${start:04X}-${end:04X}</code> — "
                  f"<strong>{name}</strong> ({size} bytes)</summary>\n")
            located = []
            for filename, label in includes:
                address = symbols.get(label) if label else None
                if address and address[0] == bank and start <= address[1] <= end:
                    located.append((address[1], filename, label))
                else:
                    print(f"- `{filename}` — Größe nicht ermittelbar (Label `{label or 'fehlend'}`)\n")
            for index, (address, filename, _) in enumerate(located):
                next_address = located[index + 1][0] if index + 1 < len(located) else end + 1
                size = next_address - address
                print(f"- `{filename}` — {size} bytes (${size:04X}), <code>${address:04X}-${next_address - 1:04X}</code>\n")
            print("</details>\n")

        if free:
            gaps = ", ".join(f"${start:04X}-${end:04X} ({end - start + 1})" for start, end in free)
            print(f"Freie Bereiche: {gaps}\n")
        print("</details>\n")
    print("</details>")


if __name__ == "__main__":
    main()
