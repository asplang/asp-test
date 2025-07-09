c = [0,1,2,3,4,5,6,7,8,9]
print(c)
r = 3..:2
s0 = c[r]
print(s0)
del c[r]
print(c)

c = [0,1,2,3,4,5,6,7,8,9]
print(c)
r = -3..:-2
s0 = c[r]
print(s0)
del c[r]
print(c)

del c, r, s0
