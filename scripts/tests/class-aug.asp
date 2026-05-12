class A:
    def __init__(self):
        self.x = 42
    def X(self):
        return self.x

class B(A):
    pass

b = B()
b.x += 1

print(b.x, b.X())
