# This should generate a runtime error without undefined behaviour.
i = 0x7fffffff
j = 0x80000000
print(i << -1)
