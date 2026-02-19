# Test evaluation order for insertions.

lst = []
a = [lst] + list(..5)
it = iter(a)
next(it) <- next(it) <- next(it) <- next(it)
print(lst)
