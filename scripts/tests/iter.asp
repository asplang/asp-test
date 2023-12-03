# Iterator tests.

def printall(object):
    it = iter(object)
    while it:
        print(next(it))
    print(it, bool(it), next(it))
    print('---')

# Range.
printall(..5)

# Range in negative direction.
printall(..-5:-1)

# Dictionary.
printall({1:11,3:33,2:22})

# Set.
printall({6,5,4,7,9,8})

# List.
printall([14,12,7,8])

# Tuple.
printall((14,12,7,8))

# String.
printall('abcde')

print('Done')
