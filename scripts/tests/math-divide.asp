min = -2147483648
max = 2147483647
values = [min, -456, -17, -5, -1, 0, 1, 2, 3, 23, max]
for i in values:
    for j in values:
        if j == 0:
            continue
        overflow = i == min and j == -1
        if not overflow:
            quot = i // j
            print("%d // %d = %d" % (i, j, quot));
        else:
            print("%d // %d = OVERFLOW" % (i, j))
