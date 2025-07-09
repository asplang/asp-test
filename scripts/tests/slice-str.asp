#              1111111111222222
#    01234567890123456789012345
s = 'abcdefghijklmnopqrstuvwxyz'

for start in [0, 1, 2, 3, -28, -27, -26, -25, -24]:
    for end in [-1, -2, -3, 24, 25, 26, 27, 28]:
        print('%d..%d =>' % (start, end), s[start..end])
        print('%d..%d:2 =>' % (start, end), s[start..end:2])
        print('%d..%d:-1 =>' % (start, end), s[start..end:-1])
        print('%d..%d:-2 =>' % (start, end), s[start..end:-2])

for start in [-1, -2, -3, 24, 25, 26, 27, 28]:
    for end in [0, 1, 2, 3, -28, -27, -26, -25, -24]:
        print('%d..%d =>' % (start, end), s[start..end])
        print('%d..%d:2 =>' % (start, end), s[start..end:2])
        print('%d..%d:-1 =>' % (start, end), s[start..end:-1])
        print('%d..%d:-2 =>' % (start, end), s[start..end:-2])

print('---')
print('3..15:', s[3..15])
print('-4..-16:-1', s[-4..-16:-1])
print('1..:2', s[1..:2])
print('-2..:-2', s[-2..:-2])
print('-5..', s[-5..])
