# Testing built-in library functions with classes.

class X:
    def foo(self): pass
x = X()
print(type(x))
print(type(X))
print(type(x.foo))
print(type(super(X, x)))
