print(1)
print(())
print((1,))
print((1,2))
print((1,2,3))
print([])
print([1])
print([1,2])
print([1,2,3])

print('abc')
print(('a\nbc',))
print(('abc','d\xEFe\x00f'))
print(('abc','def','lmn\aop'))

print((((1,),),))
print(((1,),(2,3)))

print({})
print({1})
print({1,2})
print({1,(2,)})

print({:})
print({1:'a'})
print({1:'a',2:'b'})
print({(1,):'\x07\n',2:'\ab'})

def foo(): pass
print(foo)
#print([{(foo,), sys}])
print({(foo,), sys, foo, (sys,)})
del foo

print(1, 2, 3, sep='')
print(1, 2, 3, sep='::', end='---')
print(1, 2, 3, end='', sep='//')
print('Done')
