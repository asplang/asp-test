# This should generate a runtime value out of range error.
j = 0x80000000
print(j >> -1)
