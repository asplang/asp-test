# Test evaluation order for range components.

a = [1, 13, 2]
it = iter(a)
r = next(it) .. next(it) : next(it)
print(r, list(r))
