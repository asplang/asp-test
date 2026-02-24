# Valid assignment expressions, but not recommended.

(y := 5)
(z0 := (z1 := 7))
print(y, z0, z1, sep = ', ')
del y, z0, z1
print('---')

y0 = (y1 := 1)
z0 = (z1 := (z2 := 2))
print(y0, y1, z0, z1, z2, sep = ', ')
del y0, y1, z0, z1, z2
print('---')

print('abc', 'def', sep = (s := '/'))
print(s)
del s
print('---')

def foo(p = (q := 42)):
    print(p, end = '')
    if exists(`q):
        print(',', q, end = '')
    print()
print(q)
print('---')

foo(p = (x := 13))
print(x)
del x
print('---')

del q
foo()
print('---')
