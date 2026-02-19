# Test evaluation order for deleting elements.

a = [1, 2, 3, 4, 5, 6, 7, 8]
i = [a, 2, a, 5]
it = iter(i)
del next(it)[next(it)], next(it)[next(it)]
print(a)
