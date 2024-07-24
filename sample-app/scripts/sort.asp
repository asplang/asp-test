def compare(a, b):
    return 0 if a == b else -1 if a < b else +1

items = [10, 9, 8, 7, 6.02, 5, 4, 3.14, 2, 1]
print('Before:', items)
sort(items, compare)
print('After: ', items)
