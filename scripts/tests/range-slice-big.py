#!/usr/bin/env python3

def range_str(r):
    return '%s..%s%s' % \
        (r.start if r.start != 0 else '',
         r.stop,
         ':%d' % r.step if r.step != 1 else '')

for i in range(-5, 6):
  for j in range(-5, 6):
    for k in range(-3, 4):
      if k == 0: continue
      r = range(i, j, k)
      print('%s => %s' % (range_str(r), list(r)))
      for x in range(-6, 7):
        for y in range(-6, 7):
          for z in range(-3, 4):
            if z == 0: continue
            slc = slice(x, y, z)
            s = r[slc]
            print('%s[%s] = %s => %s' % \
              (range_str(r), range_str(slc), range_str(s), list(s)))
