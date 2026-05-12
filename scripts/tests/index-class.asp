# Using the index operation with a class.

class A:
    pass

A[`x] = 0

def init(self):
    print('init', self)
    self.x = 42
A[`__init__] = init

print(A)
for symbol, value in A:
    print(symbol, A[symbol])

a = A()

print(a)
for symbol, value in a:
    print(symbol, a[symbol])
