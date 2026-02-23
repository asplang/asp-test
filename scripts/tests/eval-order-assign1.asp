# For chained assignment, the assigned value is evaluated first, then the
# targets, left to right, just like Python.

def f(x): print('Eval', x); return x

lst = [0] * 6 + [7]
print(lst)
lst[f(0)] = lst[f(2)] = lst[f(4)] = lst[f(6)]
lst[f(1)], lst[f(3)] = lst[f(5)], lst[f(6)] = f(13), f(42)
print(lst)
