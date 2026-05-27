# Lookup of instance members of empty base class.

class A: pass

a = A()

print(a.__init__) # Should succeed
print(a.missing) # Should fail
