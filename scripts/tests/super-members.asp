# Lookup of class members in empty base class.

class A:
    def foo(self):
        print('Hello from class A')

class B(A):
    def foo(self):
        print('Calling base foo')
        return super().foo()
    def missing(self):
        print('Calling base missing')
        return super().missing()

b = B()
b.foo()
b.missing() # Should fail
