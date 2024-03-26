for i in [-5, 1, 5]:
  for j in [-5, 1, 5]:
    for k in [-3, 1, 2]:
      r = i..j:k
      print('%s => %s:' % (r, list(r)))
      for x in [-6, -5, -4, 1, 4, 5, 6]:
        for y in [-6, -5, -4, 1, 4, 5, 6]:
          for z in [-3, 1, 2]:
            slc = x..y:z
            s = r[slc]
            print('(%s)[%s] = %s => %s' % (r, slc, s, list(s)))
