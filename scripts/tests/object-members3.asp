names={`a:'a', `b:'b'}
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
idx = `a if len(args) <= 1 or int(args[1]) == 0 else `b
eo[idx] = 0
print(obj_to_str(eo))
