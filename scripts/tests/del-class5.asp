# Calling method on temporary object.

class A:
    def foo(self):
        print('foo', self)
A().foo()
del A
