# Use an element expression as the target of a for statement.

a = [0, 0, 0, 0, 0]
i = 0
for a[i] in ..len(a):
    print(a, i)
    i += 1
print(i)
