# For augmented assignment, the target is evaluated once (both value and
# address) and then the value, just like Python.

def f(x): print('Eval', x); return x

lst = [5, 2]
print(lst)
lst[f(0)] -= lst[f(1)]
print(lst)
