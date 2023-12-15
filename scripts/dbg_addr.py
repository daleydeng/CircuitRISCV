#!/usr/bin/env python
import sys

arg = sys.argv[1]
print (hex(int(arg, 16) * 4 + 0x1000))

