# Named argument is not allowed as a base class.

class A:
    pass

class B(A):
    pass

class C(base=B):
    pass
