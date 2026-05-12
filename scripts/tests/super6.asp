# Tests of super with derived classes.

class A: pass
class B(A): pass
class C(B): pass
a = A()
b = B()
c = C()
print('A:', A, a)
print('B:', B, b)
print('C:', C, c)
s1 = super(A, b)
s2 = super(A, b)
s3 = super(A, c)
print(s1)
print(s2)
print(s3)
print(s1 == s2) # True
print(s1 == s3) # False
print(s1 <=> s2 == 0) # True
print(s1 <=> s3 == 0) # False
print('---')

print(super(B, a)) # error
