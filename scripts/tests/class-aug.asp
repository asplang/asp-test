class A:
    x = 42

class B(A):
    pass

print(A.x, B.x)
B.x += 1
print(A.x, B.x)
