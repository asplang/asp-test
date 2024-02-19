pi = acos(-1)
s = 'ab\tcd\0ef'
print(pi , type(pi))
print(repr(pi), type(repr(pi)))
print(repr(repr(pi)), type(repr(repr(pi))))
print(s , repr(s))
print('%s' % (s,))
print('%r' % (s,))
print('%a' % (s,))

objs = [None, '', (), [], {}, {:}, ((),), ((),()), ([],), ([],())]
print('%s' % (objs,))
print('%r' % (objs,))
for x in objs:
    print('%r' % (x,))
