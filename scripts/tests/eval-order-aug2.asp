# For augmented assignment, the target is evaluated once (both value and
# address) and then the value, just like Python.

lst = [13, 2]
print(lst)
it = iter([lst, 0, lst, 1])
next(it)[next(it)] /= next(it)[next(it)]
print(lst)
