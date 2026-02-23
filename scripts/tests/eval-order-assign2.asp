# For chained assignment, the assigned value is evaluated first, then the
# targets, left to right, just like Python.

lst = [0] * 5
print(lst)
it = iter([42, lst, 1, lst, -2])
next(it)[next(it)] = next(it)[next(it)] = next(it)
print(lst)
