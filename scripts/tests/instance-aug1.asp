class A:
    def __init__(self):
        self.x = 42
    def X(self):
        return self.x

class B(A):
    pass

b = B()
print(b.x, b.X(), `x in b)
b.x += 1
print(b.x, b.X(), `x in b)
