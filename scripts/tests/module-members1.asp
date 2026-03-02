import empty as m

names={`i:'i', `j:'j', `k:'k', `p:'p', `q:'q', }
def mod_to_str(mod):
    s = 'mod:{'
    first = True
    for sym, val in mod:
        if first:
            first = False
        else:
            s += ', '
        s += names[sym] if sym in names else str(sym)
        s += ' = '
        s += str(val)
    if first:
        s += '='
    s += '}'
    return s

print('%s id=0x%X %s' % (m, id(m), mod_to_str(m)))
print('---')

m.i = 13
print(`i in m, `x in m)
print(mod_to_str(m))
m.j = 4
m.i = 42
m.k = 17
print(mod_to_str(m))
print('---')

m <- `i : 10
print(m.i, m[`i])
m[`j] = 11
print(m.j, m[`j])
print(mod_to_str(m))
print('---')

m <- `p : 20
print(m.p, m[`p])
m[`q] = 21
print(m.q, m[`q])
print(mod_to_str(m))
print('---')

del m.i
print(`i in m)
print(mod_to_str(m))
print('---')

import empty as e
print(m == e)
print(m <=> e)
print(e <=> m)

del m, e
