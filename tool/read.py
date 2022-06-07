import sys
import struct

path = sys.argv[1]

def unpack(string, file):
    buffer = file.read(struct.calcsize(string))
    return struct.unpack(string, buffer)

with open(path, "rb") as file:
    magic_string_len = -unpack('q', file)[0]
    file.read(magic_string_len)
    s = unpack("10c", file)
    print(s)
    pass

