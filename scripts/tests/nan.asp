print((-1) ** 0.5)
print(acos(-1.1))
print('---')

nnan = float('-nan')
pnan = float('nan')
pi = acos(-1)
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
