def foo(module, prefix = '-> '):

    print('%s:' % (module,))
    for x in module:
        print('%s%s' % (prefix, x));

    print('...:')
    for x in ...:
        print('%s%s' % (prefix, x));

print('sys:')
for x in sys:
    print(' ', x);

print('...:')
for x in ...:
    print(' ', x);

del x

foo(sys)
