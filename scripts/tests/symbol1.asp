vs = `var
var = 42
s = {}
s <- vs <- `print <- `vs <- var <- None
print(var, vs, s)
print('symbols compare', 'EQUAL' if `var == vs else 'NOT equal')
print('symbols compare', 'EQUAL' if `var == `print else 'NOT equal')
print('objects compare', 'EQUAL' if `var == var else 'NOT equal')
print('symbol is', 'IN' if `args in s else 'NOT in')
print('symbol is', 'IN' if `vs in s else 'NOT in')
