# Dictionary group argument is not allowed as a base class

class A:
    pass

class B(A):
    pass

bases = {'b': B}
class C(**bases):
    pass
