# Lookup of class members.

from classes import A

print(A.count)
print(A.__init__)
print(A.foo)
print(A.missing) # Should fail
