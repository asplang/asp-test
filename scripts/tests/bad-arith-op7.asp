# These generate runtime errors without undefined behaviour.
j = 0x80000000
print(j >> -1)
