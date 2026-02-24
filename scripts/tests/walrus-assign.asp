# Order of evaluation in (chained) assignments is the same as Python: value
# first, and then targets left to right.
a = [0] * 5
a[j := i + 1] = a[j + 1] = 5 + (i := 1)
print(a, i, j)
