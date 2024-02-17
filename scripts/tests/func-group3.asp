# Valid function definition.
def foo(a, *args, b):
    print(a)
    print(b)
    print('Extras:')
    for arg in args:
        print(arg)
    else:
        print('(No extras)')

# Invalid call; "keyword only parameter" b must always be specified.
foo(1, 2, 3)
