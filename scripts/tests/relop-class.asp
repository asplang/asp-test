class A:
    pass
class B(A):
    pass

print(A <=> A == 0)
print(A <=> B == 0)

print(A < B) # error
