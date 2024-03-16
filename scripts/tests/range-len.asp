ranges = 2..15:3, 3..-15:-3, 2..-5
for r in ranges:
    l = list(r)
    print(r, l)
    print(len(r), len(l))
    for i in -len(l) .. len(l):
        print(' @[%d] %d %d %s' % (i, r[i], l[i], \
            "OK" if r[i] == l[i] else "ERROR!!!"))
