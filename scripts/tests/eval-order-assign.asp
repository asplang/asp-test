# Test evaluation order for assignments.
# Note that the assigned value is evaluated first, followed by the target(s),
# right to left. This is done to make efficient use of the stack.

lst = [0] * 5
a = [42, lst, 1, lst, -2]
it = iter(a)
next(it)[next(it)] = next(it)[next(it)] = next(it)
print(lst)
