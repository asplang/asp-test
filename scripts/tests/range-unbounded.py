#!/usr/bin/env python3

inf = 9999
def is_inf(x):
    return not(-999 < x < 999)

c = 0

def test_slice(r, s):
    global c
    print('Test #%d:' % (c,))
    c += 1
    print('r = %s => %s' % (range_str(r), range_list(r)))
    print('s = %s => %s' % (range_str(s), range_list(s)))

    zz = s.step if s.step is not None else 1
    xx = s.start if s.start is not None else -1 if zz < 0 else 0
    yy = s.stop if s.stop is not None else -inf if zz < 0 else inf

    # Disallow negative slice indices on unbounded ranges.
    if r.stop <= -inf or r.stop >= inf:
      sr = range(xx, yy, zz)
      msg = ''
      if xx < 0:
        msg = 'negative slice start'
      elif s.stop is None:
        if zz < 0:
           msg = 'negative step on unbounded slice'
      elif len(sr) > 1 and sr[-1] < 0:
         msg = 'last slice index negative'

      if len(msg) != 0:
        print('Skipping: ' + msg)
        return

    rangeBounded = not is_inf(r.stop)
    sliceBounded = s.stop is not None
    slc = r[s]
    if not (rangeBounded or sliceBounded):
        slc = range(slc.start, -inf if slc.step < 0 else inf, slc.step)
    elif is_inf(r.stop) and s.stop is not None:
        slc = range(slc.start, r.start + s.stop * r.step, slc.step)
    print('r[s] = %s => %s' % (range_str(slc), range_list(slc)))

def range_list(r):
    r = norm_range(r)
    bounded = not is_inf(r.stop)
    items = tuple(r[:3])
    fmt = '%d, ' * len(items)
    return '[%s...]' % (fmt % items) if not bounded else str(list(r))

def range_str(r):
    r = norm_range(r)
    return '%s..%s%s' % \
        (r.start if r.start != (-1 if r.step < 0 else 0) else '',
         r.stop if not is_inf(r.stop) else '',
         ':%d' % r.step if r.step != 1 else '')

def norm_range(r):
    step = r.step if r.step is not None else 1
    return range \
        (r.start if r.start is not None else -1 if step < 0 else 0,
         r.stop if r.stop is not None else -inf if step < 0 else inf,
         step)

def do_tests():
  for i in [-5, 1, 5]:
    for j in [-5, 1, 5, None]:
      for k in [-3, 1, 2]:
        r = range(i, j if j is not None else -inf if k < 0 else inf, k)
        for x in [-5, 1, 5, None]:
          for y in [-5, 1, 5, None]:
            for z in [-3, 1, 2]:
              s = slice(x, y, z)
              test_slice(r, s)
              print('---')

do_tests()
print('\nDone')
