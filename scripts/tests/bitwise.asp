i = 4096
j = -4095
print(i << 16, i << 18, i << 19, i << 20)
print(j << 16, j << 18, j << 19, j << 20)
print(i >> 8, i >> 10, i >> 13)
print(j >> 8, j >> 10, j >> 13, j >> 14)
print(-4096 >> 8, -4096 >> 10, -4096 >> 13, -4096 >> 14)
print(j^-1, j ^ 0xffffffff)

bits = 0
n = 3
print(bits, 'set', n, bits | 1 << n)
bits = 0xFFFF
n = 3
print(bits, 'clear', n, bits & ~(1 << n))

print('---')

# These perform predictable results without undefined behaviour.
i = 0x7fffffff
j = 0x80000000
for shift in ..33:
    print(i << shift)
    print(i >> shift)
    print(j >> shift)
