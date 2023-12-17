ri = rng(1, 6)
print(ri, type(ri))
rf = rng(99.5, 100.5)
print(rf, type(rf))
for i in ..10:
    print(rand(ri), rand(rf))

# Put them in a list/set and delete the list to ensure unref works
s={ri,rf}
print('Deleting individuals')
del ri, rf

print('Deleting set')
del s

print('Done')
