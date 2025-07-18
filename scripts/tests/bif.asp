# Testing built-in library functions (e.g., type, len, bool, int, float, str).

if type(1) == type(5):
    print('1 and 5 are the same type')
else:
    print('1 and 5 are NOT the same type')
if type(1) == type(1.0):
    print('1 and 1.0 are the same type')
else:
    print('1 and 1.0 are NOT the same type')
print(type(None))
print(type(...))
print(type(False))
print(type(1))
print(type(1.0))
print(type(0..1))
print(type('abc'))
print(type((0,)))
print(type([]))
print(type({}))
print(type({:}))
print(type(iter(..0)))
print(type(print))
print(type(sys))
print(type(type(1)))

print()
print(len(2..18:3))
print(len('xyzzy'))
print(len((1,3,5)))
print(len([1,3,5,7]))
print(len({1,3,5,7,9}))
print(len({0:False, 1:True}))

print()
print(bool(False))
print(bool(1))
print(bool(0.0))
print(bool(None))
print(bool(...))
print(bool(''))
print(bool('x'))

print()
print(int(2))
print(int(2.6))
print(int(-2.6))
print(int('-26'))
#print(int('-2.6')) # Invalid integer string

print()
print(float(-2.1))
print(float(-2))
print(type(float(-2)))
print(float(True))
print(float('-2.61e1'))
print(float('-3.14e-3'))

print()
print(str(None))
print(str(...))
print(str(0==1))
print(str(1.0000))
print(str(0..4))
print(str('abc'))
print(str(type('abc')))
