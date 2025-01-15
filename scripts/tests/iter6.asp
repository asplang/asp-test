# Iterator equality tests.

rng = 2..7
str = 'xyzzy'
tup = 1, 2, 3, 3, 2
lst = [1, 2, 3, 3, 2]
set = {1, 2, 3, 4, 5}
dict = {1 : 'x', 2 : 'y', 3 : 'z', 4 : 'z', 5 : 'y'}

for iterable in rng, str, tup, lst, set, dict:
    print('%s:' % (repr(iterable),))
    fit = iter(iterable)
    rit = reversed(iterable)
    print(next(fit))
    t1 = fit == rit
    print(next(fit))
    print(next(rit))
    t2 = fit == rit
    print(next(rit))
    t3 = fit == rit
    print(next(fit))
    print(next(fit))
    print(next(fit))
    t4 = fit == rit
    print(next(rit))
    print(next(rit))
    print(next(rit))
    t5 = fit == rit
    print(t1, t2, t3, t4, t5)
