c = 0

def test_slice(r, s):
    global c
    print('Test #%d:' % (c,))
    c += 1
    print('r = %s => %s' % (r, range_list(r)))
    print('s = %s => %s' % (s, range_list(s)))

    i, j, k = range_values(r)
    x, y, z = range_values(s)

    zz = z if z is not None else 1
    xx = x if (x is not None) else (-1 if zz < 0 else 0)

    # Disallow negative slice indices on unbounded ranges.
    if j is None:
        msg = ''
        if xx < 0:
            msg = 'negative slice start'
        elif y is None:
            if zz < 0:
                msg = 'negative step on unbounded slice'
        elif len(s) > 1 and s[-1] < 0:
            msg = 'last slice index negative'

        if len(msg) != 0:
            print('Skipping: ' + msg)
            return

    slc = r[s]
    print('r[s] = %s => %s' % (slc, range_list(slc)))

def range_list(r):
    _, end, _ = range_values(r)
    items = tuple(r[..3])
    fmt = '%d, ' * len(items)
    return '[%s...]' % (fmt % items,) if end is None else str(list(r))

def do_tests():
  for i in [-5, 1, 5]:
    for j in [-5, 1, 5, None]:
      for k in [-3, 1, 2]:
        r = i..j:k
        for x in [-5, 1, 5, None]:
          for y in [-5, 1, 5, None]:
            for z in [-3, 1, 2]:
              s = x..y:z
              test_slice(r, s)
              print('---')

do_tests()
print('\nDone')
