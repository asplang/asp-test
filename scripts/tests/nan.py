#!/usr/bin/env python3

import math

def comps(a, b):
        print('%s is %s' % (a, b), a is b)
        print('%s is not %s' % (a, b), a is not b)
        print('%s == %s' % (a, b), a == b)
        print('%s != %s' % (a, b), a != b)
        print('%s < %s' % (a, b), a < b)
        print('%s <= %s' % (a, b), a <= b)
        print('%s > %s' % (a, b), a > b)
        print('%s >= %s' % (a, b), a >= b)
        print('---')

print((-1) ** 0.5)
print((-1) ** (-0.5))
print('---')

nnan = float('-nan')
pnan = float('nan')
pi = math.acos(-1)
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
print(id(b),id(c))
print(id(b[1]),id(c[1]))
comps(b, c) # Python yiels unexpected normal comparison results, as if NaNs are not compared
