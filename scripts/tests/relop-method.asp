class A:
    def foo(self): pass
class B(A):
    pass
class C(B):
    def foo(self): pass
a = A()
b = B()
c = C()

print(a.foo <=> a.foo == 0)
print(a.foo <=> b.foo == 0)
print(a.foo <=> c.foo == 0)

print(a.foo < b.foo) # error
