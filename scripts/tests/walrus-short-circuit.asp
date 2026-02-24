# Assignment expressions in short-circuit logic expressions.

a = 0
b = 1

print(a or (i := b))
print(i) # should success

print(a and (j := b))
print(j) # should fail
