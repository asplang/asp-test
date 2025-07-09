def foo(a, b = 9, *args, **kwargs):
    print(a)
    print(b)
    print('Extras:')
    for arg in args:
        print(arg)
    else:
        print('(No extra args)')
    for k, v in kwargs:
        print('key: %s, value: %s' % (k, v))
    else:
        print('(No extra kwargs)')

print('1 ---')
foo(1)
print('2 ---')
foo(1, 2)
print('3 ---')
foo(1, 2, 3)
print('4 ---')
foo(1, 2, 3, 4)
print('5 ---')
foo(*(1,))
print('6 ---')
foo(*(1,2))
print('7 ---')
foo(*(1,2,3))
print('8 ---')
foo(*(1,2,3,4))
print('9 ---')
foo(1, *(2,))
print('10 ---')
foo(1, *(2,3))
print('11 ---')
foo(b=2, a=1)
#print('12 ---')
#foo(3, b=2, a=1) # Invalid; tested in bad-call*.asp
print('13 ---')
t1=('a',)
foo(*t1)
print('14 ---')
t2=('a', 'b')
foo(*t2)
print('15 ---')
t3=('a', 'b', 'c')
foo(*t3)
print('16 ---')
t4=('a', 'b', 'c', 'd')
foo(*t4)
d1={`x: 10, `y: 11}
print('17 ---')
foo(1, p=6, q=7)
print('18 ---')
foo(1, **d1)
print('19 ---')
foo(1, **d1, p=6, q=7)
print('20 ---')
foo(1, p=5, **d1, q=8)

del t1, t2, t3
del d1
del foo
