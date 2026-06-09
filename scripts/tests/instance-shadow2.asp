# Sequence assignment using tuple shadows class members.

class A:
    x = 0
    y = 0

a = A()

a.x, a.y = 1, 2
print(`x in A, A.x, `x in a, a.x)
print(`y in A, A.y, `y in a, a.y)

del a.x, a.y
print(`x in A, A.x, `x in a, a.x)
print(`y in A, A.y, `y in a, a.y)
