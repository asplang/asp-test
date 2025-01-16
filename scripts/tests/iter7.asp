# Test of at and del_at functions.

lst = [23, 42, 57, 88, 13]
print(lst)
it = iter(lst)
for i in ..int(len(lst) / 2) - 1:
    print('Keeping %s' % (next(it),))
while it:
    print('Deleting %s' % (at(it),))
    print('Deleted %s' % (del_at(it),))
    print(lst)
print(at(it))
