"""
Simple script for converting fuzz tester crash report to .aspe file that is runnable with asps

Usage: python convert_fuzz_crash_to_aspe.py <input_crash_file> [<output_aspe_file>]
"""

import os
import sys

ASPE_STANDALONE_HEADER = bytes([0x41, 0x73, 0x70, 0x45, 0x00, 0x07, 0x00, 0x00, 0xF5, 0xF1, 0x63, 0x99])

def convert_to_aspe(in_f, out_f):
    data = in_f.read()
    print("Fuzz test used memory size: ", data[0] + data[1] << 8)
    converted_data = ASPE_STANDALONE_HEADER + data[2:]
    out_f.write(converted_data)

def main():
    if len(sys.argv) < 2:
        print("Expecting one or two arguments")
        return 1

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
