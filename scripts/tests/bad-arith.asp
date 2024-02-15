# These should generate compile errors.
#print(-0x80000000)
#print(0x7fffffff + 1)
#print(0x80000000 - 1)
#print(0x7fffffff * 2)
#print(0x80000000 // -1)
#print(0x80000000 % -1)
#print(0x7fffffff << -1)
#print(0x80000000 >> -1)

# These foldable expressions should generate compile errors.
#neg = - -2147483648
#sum = 2147483647 + 1
#diff = -2147483648 - 1
#prod = 2147483647 * 2
#quot = -2147483648 // -1
#quot = 1 // 0
#rem = 1 % 0
#lsr = 1 << -1
#rsr = 1 >> -1

# These generate runtime errors without undefined behaviour.
i = 0x7fffffff
j = 0x80000000
#print(-j)
#print(i + 1)
#print(j - 1)
#print(i * 2)
#print(j // -1)
#print(j % -1)
#print(i << -1)
#print(j >> -1)

# These perform predictable results without undefined behaviour.
for shift in ..33:
    print(i << shift)
    print(i >> shift)
    print(j >> shift)
