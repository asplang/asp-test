for i in -5..6:
  for j in -5..6:
    for k in -3..4:
      if k == 0: continue
      r = i..j:k
      print('%s => %s' % (r, list(r)))
      for x in -6..7:
        for y in -6..7:
          for z in -3..4:
            if z == 0: continue
            slc = x..y:z
            s = r[slc]
            print('%s[%s] = %s => %s' % (r, slc, s, list(s)))
