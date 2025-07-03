# Concatenation tests.

# Tuples.
x = (1,2,4) + (99, 100)
print(x)
del x

# Lists.
x = [1,2,4] + [99, 100]
print(x)
del x

# Small strings.
s1 = 'abcde'
s2 = 'pqrst'
print(s1 + s2)

# Big strings.
s1 = 'abcdefghijklmnopqrstruwxyz'
s2 = 'ABCDEFGHIJKLMNOPQRSTRUWXYZ'
print(s1 + s2)

del s1, s2

# Empty sequences. Note that we have to use a variable for the empty string,
# otherwise the compiler folds the string expressions.
empty_str = ''
print((11, 22, 33) + ())
print(() + (11, 22, 33))
print([44, 55, 66] + [])
print([] + [44, 55, 66])
print('abcde-pqr-xyzzy' + empty_str)
print(empty_str + 'abcde-pqr-xyzzy')
del empty_str

print('Done')
