# Derived class expression.

class A:
    def foo(self):
        print('A::foo', self)

class B(A):
    def bar(self):
        print('B::bar', self)

clsList = [A, B]

class C(clsList[0]):
    pass

class D(clsList[-1]):
    pass

c = C()
print(c)
c.foo()

d = D()
print(d)
d.bar()
