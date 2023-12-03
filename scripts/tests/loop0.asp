# For loop tests with empty collections.

# Empty range.
for x in ..0:
    print(x)

# Tuple.
a=()
for x in a:
    print(x)
del a

# Empty list.
a=[]
for x in a:
    print(x)
del a

# Empty set.
s={}
for x in s:
    print(x)
del s

# Empty dictionary.
d={:}
for x in d:
    print(x[0])
    print(x[1])
del d

# Empty string.
s=''
for x in s:
    print(x)

print('Done')
del s
