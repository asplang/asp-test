# Deleting class before object and object before method call.

class A:
    def foo(self):
        print('foo', self)
a = A()
del A
m = a.foo
del a
m()
del m
