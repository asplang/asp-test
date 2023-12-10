def comps(a, b):
    print('%s == %s' % (a, b), a == b)
    print('%s != %s' % (a, b), a != b)
    print('%s < %s' % (a, b), a < b)
    print('%s <= %s' % (a, b), a <= b)
    print('%s > %s' % (a, b), a > b)
    print('%s >= %s' % (a, b), a >= b)
    print('---')

print((-1) ** 0.5)
print(acos(-1.1))
print('---')

nnan = float('-nan')
pnan = float('nan')
pi = acos(-1)
nums = (nnan, pnan, pi)
for i in nums:
    for j in nums:
        comps(i, j)

a = (1, 2, 3)
b = (1, 2, pnan)
comps(a, b)

a = (5, (2, 0), 3)
b = (5, (2, pnan), 4)
c = (5, (2, pnan), 4)
comps(a, a)
comps(a, b)
comps(b, b) # Identical objects compare normally, even if containing NaNs.
comps(b, c) # Different objects with same values compare according to contained NaNs.
