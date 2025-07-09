def foo(a, b = 9, *args, **kwargs):
    pass

# Invalid: double assignment to a
foo(3, b=2, a=1)
