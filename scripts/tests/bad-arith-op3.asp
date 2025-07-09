# This should generate a runtime error without undefined behaviour.
j = 0x80000000
print(j - 1)
