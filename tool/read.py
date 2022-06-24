import array
import struct
import sys

path = sys.argv[1]

def unpack(string, file):
    buffer = file.read(struct.calcsize(string))
    return struct.unpack(string, buffer)

with open(path, "rb") as file:
    magic_string_len = -unpack('q', file)[0]
    magic_string = unpack('%ds' % magic_string_len, file)[0].decode('ascii')
    endian, revision, ntimestep, natoms, triclinic, *boundary = unpack('iiqqi6i', file)
    xlo, xhi, ylo, yhi, zlo, zhi = unpack('6d', file)
    if triclinic:
        sys.stderr.write("triclinic is not supported\n")
        sys.exit(1)
    size_one = unpack('i', file)[0]
    if not revision > 1:
        sys.stderr.write("revision %d is not supported\n" % revision)
        sys.exit(1)
    len0 = unpack('i', file)[0]
    unit_style = unpack('%ds' % len0, file)[0].decode('ascii')
    flag = unpack('c', file)[0]
    flag = int.from_bytes(flag, 'little')
    if flag:
        time = unpack('d', file)
    len0 = unpack('i', file)[0]
    columns = unpack('%ds' % len0, file)[0].decode('ascii')
    columns = columns.split()
    nchunk = unpack('i', file)[0]
    for i in range(nchunk):
        n = unpack('i', file)[0]
        buf = file.read(n * struct.calcsize('d'))
        a = array.array('d', buf)
        x = a[columns.index("x")::size_one]
        y = a[columns.index("y")::size_one]
        if "z" in columns:
            z = a[columns.index("z")::size_one]
        id0 = a[columns.index("id")::size_one]
        print("id:", min(id0), max(id0))
