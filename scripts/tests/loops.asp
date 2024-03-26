# Range.
for x in ..-6:-1:
    print(x)
del x

print('---')

# Dictionary.
d={1:11,3:33,2:22}
#print(d[2])
#del d[2]
#d[3]=45
#for x in d:
for x,y in d:# Tuple assignment in for
  #print(x[0])
  #print(x[1])
  print(x)
  print(y)
del x
del y
#del d

print('---')

# Set.
s={6,5,4,7,9,8}
#del s[7]
for x in s:
  print(x)
#del x
#del s

print('---')

# Delete from list + Iterator test with list.
a=[14,12,7,8]
#print(a[1])
#a[1]=1
del a[2]
for x in a:
  print(x)
#del x
#del a

print('---')

# String.
s='abcdefghijklmnopqrstuvwxyz'
for x in s:
  print(x)
#del x
#del s

del d, s, x, a

print('Done')
