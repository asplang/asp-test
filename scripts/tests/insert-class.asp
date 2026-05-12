# Using the insert operation with a class.

class A:
    pass

A <- `x : 0

def init(self):
    print('init', self)
    self.x = 42
A <- `__init__ : init

print(A)
for member in A:
    print(member)

a = A()

print(a)
for member in a:
    print(member)
