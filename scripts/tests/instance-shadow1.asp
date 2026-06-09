# Assignment shadows class member.

class A:
    x = 0

a = A()

a.x = 1
print(`x in A, A.x, `x in a, a.x)

del a.x
print(`x in A, A.x, `x in a, a.x)
