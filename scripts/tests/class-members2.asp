# Lookup of class members in class hierarchy.

from classes import D

print(D.count)
print(D.__init__)
print(D.foo)
print(D.missing) # Should fail
