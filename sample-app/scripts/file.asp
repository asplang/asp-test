if len(args) < 2:
    print('Specify an input file, and optionally an output file')
    assert False

finName = args[1]
fin = file_open(finName, 'r')
if fin is None:
    print('Error opening input file')
    assert False
print(fin, type(fin))

foutName = args[2] if len(args) >= 3 else finName + '-copy'

fout = file_open(foutName, 'w')
if fout is None:
    print('Error opening output file')
    assert False
print(fout, type(fout))

while True:
    s = file_get_line(fin)
    if file_at_end(fin):
        break;
    print('Copying line:', s)
    if not file_put_line(fout, s):
        print('Error writing output')
        assert False
