c = [0,1,2,3,4,5,6,7,8,9]
s0 = c[3..5]
s1 = c[-3..-5:-1]
s2 = c[1..:2]

print(s0)
print(s1)
print(s2)

for start in [0, 1, 2, 3, -11, -10, -9, -8, -7]:
    for end in [-1, -2, -3, 7, 8, 9, 10, 11]:
        print('%d..%d =>' % (start, end), c[start..end])
        print('%d..%d:2 =>' % (start, end), c[start..end:2])
        print('%d..%d:-1 =>' % (start, end), c[start..end:-1])
        print('%d..%d:-2 =>' % (start, end), c[start..end:-2])

for start in [-1, -2, -3, 7, 8, 9, 10, 11]:
    for end in [0, 1, 2, 3, -11, -10, -9, -8, -7]:
        print('%d..%d =>' % (start, end), c[start..end])
        print('%d..%d:2 =>' % (start, end), c[start..end:2])
        print('%d..%d:-1 =>' % (start, end), c[start..end:-1])
        print('%d..%d:-2 =>' % (start, end), c[start..end:-2])

print('---')
c[3..7] = [-1] * 4
##c[1..] = [-1] * (len(c) - 1) # works too
print(c)

print('---')
t=(1,2,3)
print(t[0..2])

# t[1:] = (0,0) # Invalid because t is a tuple
