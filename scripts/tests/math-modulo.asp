min = -2147483647 - 1
max = 2147483647
values = [min, -456, -17, -5, -1, 0, 1, 2, 3, 23, max]
for i in values:
    for j in values:
        if j == 0:
            continue
        rem = i % j
        overflow = rem < min or rem > max
        if not overflow:
            print("%d %% %d = %d" % (i, j, rem));
        else:
            print("%d %% %d = OVERFLOW" % (i, j))
