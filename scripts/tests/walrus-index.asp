# Assignment expression in an index.

a = [0] * 5
j = -1
for a[i := j + 1] in ..len(a):
    print(a, j, i)
    j += 1
print('---')
print(a, j, i)
