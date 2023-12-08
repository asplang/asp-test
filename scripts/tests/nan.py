import math
print((-1) ** 0.5)
print((-1) ** (-0.5))
print('---')

nnan = float('-nan')
pnan = float('nan')
pi = math.acos(-1)
nums = (nnan, pnan, pi)
for i in nums:
    for j in nums:
        print('%s == %s' % (i, j), i == j)
        print('%s != %s' % (i, j), i != j)
        print('%s < %s' % (i, j), i < j)
        print('%s <= %s' % (i, j), i <= j)
        print('%s > %s' % (i, j), i > j)
        print('%s >= %s' % (i, j), i >= j)
        print('---')
