class A:
    pass
class B(A):
    pass
a = A()
b = B()

print(a <=> a == 0)
print(a <=> b == 0)

print(a < b) # error
