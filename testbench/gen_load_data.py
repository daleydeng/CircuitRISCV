#!/usr/bin/env python
import argparse as ap

if __name__ == "__main__":
    parser = ap.ArgumentParser("generate loading code")
    parser.add_argument("--rodata", default=None)
    parser.add_argument('--data', default=None)
    args = parser.parse_args()

    code = ['''
    #include "riscv_test.h"
    #include "test_macros.h"

    .global init
    init:''']

    if args.rodata:
        fname = args.rodata
        fp = open(fname)
        fp.readline() # skip header
        data = fp.read().strip().split()
        
        code += [f'li TMPREG, 0x{d};\nsw TMPREG, {idx*4}(gp);' for idx, d in enumerate(data)]

    if args.data:
        fname = args.data
        fp = open(fname)
        fp.readline() # skip header
        data = fp.read().strip().split()
        code += ['la TMPREG2, .data;']
        code += [f'li TMPREG, 0x{d};\nsw TMPREG, {idx*4}(TMPREG2);' for idx, d in enumerate(data)]

    code += ['RET']
    print ('\n'.join(code))