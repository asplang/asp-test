names={`a:'a', `b:'b', `c:'c', `d:'d', `e:'e', }
def obj_to_str(obj):
    s = '{'
    first = True
    for sym, val in obj:
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

eo = {=}
print('%s id=0x%X %s' % (eo, id(eo), obj_to_str(eo)))
print('---')

o = {a=1,b=2,a=3}
print(`a in o, `x in o)
print(o.a, o.b)
print(obj_to_str(o))
o.b = 4
o.c = 5
print(o.b, o.c)
print(obj_to_str(o))
print('---')

o <- `a : 10
print(o.a, o[`a])
o[`b] = 11
print(o.b, o[`b])
print(obj_to_str(o))
print('---')

o <- `d : 20
print(o.d, o[`d])
o[`e] = 21
print(o.e, o[`e])
print(obj_to_str(o))
print('---')

del o.a
print(`a in o)
print(obj_to_str(o))
print('---')

print(o == eo)
print(o == o)
print(o == {=})
print({=} == {=})
print(eo <=> o)
print(o <=> eo)

del o
