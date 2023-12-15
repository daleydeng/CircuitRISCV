#!/usr/bin/env python
import argparse as ap
from elftools.elf.elffile import ELFFile
from elftools.common.utils import bytes2hex

def format_words(d):
    l = len(d)
    assert l % 4 == 0
    l //= 4
    out = []
    for i in range(l):
        i= d[i*4:i*4+4][::-1]
        out += [bytes2hex(i)]
    out = ' '.join(out)
    return out

def format_code(d):
    code = format_words(d)
    return f'v3.0 hex words plain\n{code}'

def get_len(start_sym, end_sym):
    a = symtab.get_symbol_by_name(start_sym)[0].entry.st_value
    b = symtab.get_symbol_by_name(end_sym)[0].entry.st_value
    return b - a

def get_section_bytes(sec, sec_start=None, sec_end=None):
    if not sec_start:
        sec_start = sec + '_start'
    if not sec_end:
        sec_end = sec + '_end'

    l = get_len(sec_start, sec_end)
    if l == 0:
        return b''
    d = elf.get_section_by_name(sec).data()
    return d + b'\x00'*(l-len(d))

if __name__ == "__main__":
    parser = ap.ArgumentParser("generate loading code")
    parser.add_argument("bin")
    args = parser.parse_args()

    fname = args.bin
    elf = ELFFile(open(fname, 'rb'))
    symtab = elf.get_section_by_name('.symtab')

    tot = b''
    tot += get_section_bytes('.text')
    tot += get_section_bytes('.rodata')
    tot += get_section_bytes('.data')

    print (format_code(tot))
    