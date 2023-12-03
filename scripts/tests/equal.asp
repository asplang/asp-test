i = None
print(i == None)
i = ...
print(i == ...)
i = False
print(i == False)
i = True
print(i == True)
i = 0
print(i == 0)
i = 0.0
print(i == 0.0)
i = True
print('bool == int:', i == 0)
i = 0
print('int == float:', i == 0.0)
i = True
print('bool == float:', i == 1.0)
i = ..5
print(i == ..5)
print((..5) == (..5))
i = ''
print(i == '')
i = 'abc'
print(i == 'abc')
print((3,4,5) == (3,4,5))
print([3,4,5] == [3,4,5])
print({3,4,5} == {3,4,5})
print({3:None, 4:0, 5:'xyzzy'} == {3:None, 4:0, 5:'xyzzy'})
def foo(): pass
print(foo == foo)
print(sys == sys)
print(type(None) == type(None))

print('---')

i = None
print(i == ...)
i = False
print(i == True)
i = 0
print(i == 1)
i = 0.0
print(i == 0.1)
i = ..5
print(i == ..5:2)
print((..5) == (1..5))
i = 'a'
print(i == 'ab')
print((3,4,5) == (3,4,6))
print([3,4,5] == [3,4,6])
print({3,4,5} == {3,4,6})
print({3:None, 4:0, 5:'xyzzy'} == {3:None, 4:1, 5:'xyzzy'})
def bar(): pass
print(foo == bar)

print('---')
print('Done')
