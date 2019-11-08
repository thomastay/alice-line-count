#/bin/env/python3
from functools import partial
import sys

buffer_size = 1024*1024

def rawincount(filename):
    with open(filename, 'rb') as f:
        return sum(buf.count(b'\n') for buf in iter(partial(f.raw.read, buffer_size), b''))

print(rawincount(sys.argv[1]))
