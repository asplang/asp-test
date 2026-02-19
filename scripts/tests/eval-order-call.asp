# Test evaluation order for function calls.

def foo(a, b): print(a, b)
a = [foo, 13, 42]
it = iter(a)
next(it)(next(it), next(it))
