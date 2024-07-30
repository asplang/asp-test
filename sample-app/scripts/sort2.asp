def compare(a, b):
    return a <=> b

items = \
    [iter(args), sys, len, {:}, {}, [], (), \
     'abc', ..5, `sys, 3.14, 4, True, False, ..., None]
print('Before:', items)
sort(items, compare)
print('After: ', items)
