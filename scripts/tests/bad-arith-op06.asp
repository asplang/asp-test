# This should generate a runtime value out of range error.
i = 0x7fffffff
j = 0x80000000
print(i << -1)
