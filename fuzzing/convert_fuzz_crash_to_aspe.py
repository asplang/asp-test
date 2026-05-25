#!/bin/env python3

"""
Simple script for converting fuzz tester crash report to .aspe file that is runnable with asps

Usage: python convert_fuzz_crash_to_aspe.py <input_crash_file> [<output_aspe_file>]
"""

import os
import sys
import glob

ASPE_STANDALONE_HEADER = bytes \
    ([0x41, 0x73, 0x70, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])

def convert_to_aspe(in_f, out_f):
    data = in_f.read()
    print("Fuzz test used memory size: ", data[0] + data[1] << 8)
    converted_data = ASPE_STANDALONE_HEADER + data[2:]
    out_f.write(converted_data)

def main():
    if len(sys.argv) < 2:
        print("Expecting one or two arguments")
        return 1

    global ASPE_STANDALONE_HEADER

    # Update the header with the version of Asp.
    try:
        version_file_names = glob.glob('../*/asp-build/version.txt')
        if len(version_file_names) != 1:
            raise None
        with open(version_file_names[0]) as version_file:
            version_string = version_file.read()
            parts = version_string.split('.')
            if len(parts) != 4:
                raise None
            ASPE_STANDALONE_HEADER = \
                ASPE_STANDALONE_HEADER[:4] + \
                bytes([int(part) for part in version_string.split('.')]) + \
                ASPE_STANDALONE_HEADER[8:]
    except:
        print('Error: Cannot determine version of Asp')
        exit(1)

    # Update the header with the spec check value.
    spec_name = 'standalone-oo'
    try:
        spec_file_names = glob.glob \
            ('../*/asp-build/standalone/%s.aspec' % (spec_name,))
        if len(spec_file_names) != 1:
            raise None
        with open(spec_file_names[0], 'rb') as spec_file:
            spec = spec_file.read()
            check_value = spec[5:9]
            ASPE_STANDALONE_HEADER = \
                ASPE_STANDALONE_HEADER[:8] + \
                check_value + \
                ASPE_STANDALONE_HEADER[12:]
    except:
        print('Error: Cannot determine app spec check value')
        exit(1)

    in_file_path = sys.argv[1]
    out_file_path = in_file_path + ".aspe"

    if len(sys.argv) >= 3:
        out_file_path = sys.argv[2]

    with open(in_file_path, "rb") as in_f:
        with open(out_file_path, "wb") as out_f:
            convert_to_aspe(in_f, out_f)

    return 0

if __name__ == "__main__":
    sys.exit(main())
