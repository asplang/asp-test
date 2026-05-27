# Lookup of instance members.

from classes import a1

print(a1.__init__)
print(a1.foo)
print(a1.missing) # Should fail
