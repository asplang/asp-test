# For loop tests.

# Range.
for x in ..5:
    print(x)

# Range in negative direction.
for x in ..-6:-1:
    print(x)

# Dictionary.
d={1:11,3:33,2:22}
for x in d:
  print(x[0])
  print(x[1])
del d

# Set.
s={6,5,4,7,9,8}
for x in s:
  print(x)
del s

# List.
a=[14,12,7,8]
for x in a:
  print(x)
del a

# String.
s='abcde'
for x in s:
  print(x)
del s

del x

print('Done')
