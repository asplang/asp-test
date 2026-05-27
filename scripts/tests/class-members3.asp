# Lookup of class members in empty base class.

class A: pass

print(A.__init__) # Should succeed
print(A.missing) # Should fail
