t1 = (1,2,3)
t2 = ((1,), (2,), (3,)) # problems with tuples in tuples
l1 = [1,2,3]
l2 = [(1,), (2,), (3,)]
s = {1,2,3}
d1 = {1:'one', 2:'two', 3:'three'}
d2 = {1:(1.0, 'one'), 2:(2.0, 'two'), 3:(3.0, 'three')}
d3 = {(1,10):(1.0, 'one'), (2,20):(2.0, 'two'), (3,30):(3.0, 'three')}
for x in t1:
    print(x)
print('---')
for x, in t2:
    print(x)
print('---')
for x in l1:
    print(x)
print('---')
for x, in l2:
    print(x)
print('---')
for x in s:
    print(x)
print('---')
for x,y in d1:
    print(x, y)
print('---')
for x,y in d2:
    print(x, y[0], y[1])
print('---')
for x,(y,z) in d2:
    print(x, y, z)
print('---')
for (x,y),(w,z) in d3:
    print(x, y, w, z)
for (x) in d1:
    print(x[0], x[1])
print('---')
for (x,y) in d1:
    print(x, y)
print('---')
for ((x,y)) in d1:
    print(x, y)
print('---')
for ((x,((y),((z)),))) in d2:
    print(x, y, z)
print('===')
for x in ():
    print(x)
else:
    print('Nothing')
print('---')
for x,y in ():
    print(x,y)
else:
    print('Nothing')
print('---')
for ((x,((y),((z)),))) in ():
    print(x, y, z)
else:
    print('Nothing')
print('Done')
