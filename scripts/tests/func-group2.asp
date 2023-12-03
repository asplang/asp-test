def foo(a, b = 9, *args, z = 99):
    # b can be populated by positional or named argument, but z must be
    # overridden only via named argument because *args will catch all
    # remaining positional args.
    print('a =', a, 'b =', b)
    print('Extras:', *args)
    print('z =', z)

t=(1,2,3)

# Invalid case:
# *3.14 should be caught by compiler as an attempt to pass non-tuple as a
# group argument.
#foo(*t, *3.14, 99)

print('1 ---')
foo(*t, *(10,11), 89)

print('2 ---')
foo(2, z=42)

print('3 ---')
foo(2, 3, 4, 5)

print('4 ---')
foo(*t, *(10,11), *t)

del t, foo
