# Assignment expression in called function.

def foo(f): print(f)
(g := foo)(g)
print(g)
