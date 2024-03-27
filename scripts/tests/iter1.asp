# Iterator tests.

def test(object):
    printall(object, False)
    printall(object, True)

def printall(object, reversed):
    print('Object: %s' % (object,))
    print('Iterating %s:' % ('backward' if reversed else 'forward',))
    it = (sys.reversed if reversed else iter)(object)
    while it:
        print(next(it))
    print(it, bool(it), next(it))
    print('---')

# Range in forward direction.
test(..5)

# Range in negative direction.
test(..-6:-1)

# Dictionary.
test({1:11,3:33,2:22})

# Set.
test({6,5,4,7,9,8})

# List.
test([14,12,7,8])

# Tuple.
test((14,12,7,8))

# Small string.
test('abcde')

# Large string.
test('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')

# Iterator and reversed iterator.
lst = [13, 42, 144, 256]
it = iter(lst)
next(it)
printall(it, False)
printall(it, False)
it = reversed(lst)
next(it)
printall(it, False)
printall(it, False)
del it, lst

print('Done')
