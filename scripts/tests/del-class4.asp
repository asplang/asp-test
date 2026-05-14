# Deleting class before method lookup and call.

class A:
    def foo(self):
        print('foo', self)
a = A()
del A
a.foo()
del a
