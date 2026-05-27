# Lookup of instance members in class hierarchy.

from classes import d1

print(d1.__init__)
print(d1.foo)
print(d1.missing) # Should fail
