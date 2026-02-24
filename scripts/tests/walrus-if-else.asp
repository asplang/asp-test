# Assignment expressions in if/else statements.

def pos(c, s):
    i = 0
    for sc in s:
        if c == sc:
            return i
        i += 1

for c in 'Aq7#':
    if (p := pos(c, 'abcdefghijklmnopqrstuvwxyz')) is not None:
        print('Lower case %s found at %d' % (c, p))
    elif (p := pos(c, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')) is not None:
        print('Upper case %s found at %d' % (c, p))
    elif (p := pos(c, '0123456789')) is not None:
        print('Digit %s found at %d' % (c, p))
    else:
        print('Character %s not found' % (c,))
