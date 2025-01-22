# Test of iterable function.

rng = ..5:2
print(rng)
it = iter(rng)
while it:
    next(it)
print(iterable(it))

str = 'abc'
print(str)
it = iter(str)
print(iterable(it))

tup = [-23, -42, -57, -88, -13]
print(tup)
it = iter(tup)
next(it)
next(it)
print(iterable(it))

lst = [23, 42, 57, 88, 13]
print(lst)
it = iter(lst)
next(it)
next(it)
print(iterable(it))

set = {23, 42, 57, 88, 13}
print(set)
it = iter(set)
next(it)
next(it)
print(iterable(it))

dict = {23 : None, 42 : False, 57 : True, 88 : ..., 13 : None}
print(dict)
it = iter(dict)
next(it)
next(it)
print(iterable(it))

print(sys)
it = iter(sys)
next(it)
print(iterable(it))

ellip = ...
print(ellip)
it = iter(ellip)
next(it)
print(iterable(it))
