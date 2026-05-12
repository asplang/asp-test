# Valid super.

class C: pass
c1 = C()
s1 = super(C, c1)
print(C, c1, s1, sep='\n')

s2 = super(C, c1)
print(s1 == s2)

c2 = C()
s3 = super(C, c2)
print(s1 == s3)
