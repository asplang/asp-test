# Test of super comparison (invalid).

class A: pass
a = A()
s1 = super(A, a)
s2 = super(A, a)
print(s1, s2, sep='\n')
print(s1 <= s2) # error
