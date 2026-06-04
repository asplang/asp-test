class A:
    x = 42
    def X(self):
        return self.x

class B(A):
    pass

b = B()
print(A.x, `x in A, B.x, `x in B, b.x, b.X(), `x in b)
b.x += 1
print(A.x, `x in A, B.x, `x in B, b.x, b.X(), `x in b)
B.x += 2
print(A.x, `x in A, B.x, `x in B, b.x, b.X(), `x in b)
