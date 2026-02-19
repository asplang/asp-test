# Test evaluation order for assigning elements.

lst1 = [0] * 10
lst2 = [0] * 10
a = [13, lst1, 3, 42, lst2, -3]
it = iter(a)
for c in .. len(a) // 3:
    next(it)[next(it)] = next(it)
print(lst1, lst2, sep='\n')
