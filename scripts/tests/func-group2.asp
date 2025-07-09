def foo(a, b = 9, *args, z = 99):
    # b can be populated by positional or named argument, but z must be
    # overridden only via named argument because *args will catch all
    # remaining positional args.
    print('a =', a, 'b =', b)
    print('Extras:', *args)
    print('z =', z)

t=(1,2,3)
l=[4,5,6]
s={'a', 'b', 'c'}
d={`a:1, `b:2, `c:4}

# Invalid case (covered in bad-call*.asp).
# *3.14 should be caught by the compiler as an attempt to pass an invalid type
# of object as a group argument.
#foo(*t, *3.14, 99)

print('1 ---')
foo(*t, *(10,11), 89)
foo(*t, *[10,11], 89)

print('2 ---')
foo(2, z=42)

print('3 ---')
foo(2, 3, 4, 5)

print('4 ---')
foo(*t, *(10,11), *t)
foo(*t, *[10,11], *l)
foo(*t, *(10,11), *l)
foo(*d, *[10,11], *t)
foo(*s, *d)
foo(*l, *{`z:10, `y:9}, *d, *t, *s)
foo(*'abc')

print('5 ---')
foo(*..10)

del t, foo
