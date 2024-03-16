#!/usr/bin/env python3

def range_str(r):
    return '%s..%s%s' % \
        (r.start if r.start != 0 else '',
         r.stop,
         ':%d' % r.step if r.step != 1 else '')

for i in [-5, 1, 5]:
  for j in [-5, 1, 5]:
    for k in [-3, 1, 2]:
      r = range(i, j, k)
      print('%s => %s:' % (range_str(r), list(r)))
      for x in [-6, -5, -4, 1, 4, 5, 6]:
        for y in [-6, -5, -4, 1, 4, 5, 6]:
          for z in [-3, 1, 2]:
            slc = slice(x, y, z)
            s = r[slc]
            print('%s[%s] = %s => %s' % \
              (range_str(r), range_str(slc), range_str(s), list(s)))
