# Test of iterable function.

lst = [23, 42, 57, 88, 13]
print(lst)
it = iter(lst)
next(it)
next(it)
print(iterable(it))

rng = ..5:2
itr = iter(rng)
while itr:
    next(itr)
print(iterable(itr))
