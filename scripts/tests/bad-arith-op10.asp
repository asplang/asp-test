# This should generate a runtime arithmetic overflow error.
a = 0
print(a--2147483648)
