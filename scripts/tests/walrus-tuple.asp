# These are okay in Asp, but not in Python.
# The precendence of comma is less than the walrus operator, so, an assignment
# expression can be a tuple element.

t = x := 3, 4
print(x, t)
del x

t = 2, x := 3, 4
print(x, t)
del x

t = 2, x := 3
print(x, t)
del x

t = x := 3,
print(x, t)
del x

t = (x := 5, x + 1, x * 2)
print(x, t)
del x

del t
