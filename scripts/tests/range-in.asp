ranges = 4..45:5, -3..-33:-3
for r in ranges:
    l = list(r)
    print(r, l)
    for i in -26..26:
        print('%d is %s %s' % (i, "IN" if i in r else "NOT in", r))
