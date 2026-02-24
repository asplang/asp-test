# Standard use of assignment expression inside a larger expression.

a = 2 ** (x := log(8, 2)) + x * 2
print(x, a)
del x

def four(): return 4
a = 2 ** (x := four()) + x + 1
print(x, a)
del four, x

del a
