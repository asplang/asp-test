for func in (tuple, list):
    print(func())
    print(func(..5))
    print(func('abcefghij'))
    print(func((1, 2, 3)))
    print(func([1, 2, 3]))
    print(func({1, 2, 3}))
    print(func({1:'a', 2:'b', 3:'c'}))
del func

s1={}
t1 = (s1,'x')
t2 = tuple(t1)
s1 <- 42
print(t1, t2)

l1 = [1,2,3]
l2 = list(l1)
l1 <- 4
print(l1, l2)
