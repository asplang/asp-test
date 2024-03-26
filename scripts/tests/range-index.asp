for r in 2..15:3, 2..-15:-3, 2..-5:
    print('%s => %s' % (r, list(r)))
    for i in -len(r)..len(r):
        print('  (%s)[%d] = %s' % (r, i, r[i],))
