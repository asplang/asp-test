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
# NOTE: Doing 'del' (instead of 'del s') here reports syntax error on line 1,
# instead of the line it's on!
# - investigate.
del s

print('Done')
