#a = b = 42
#a,b = 42,43
#a,z,d = 40,(41,42),43
#(a,(b,),) = (41,(42,),)
#a,(b,c),d = 40,(41,42),43
#a,(b,c),(d,e),f = 40,(41,42),(43,44),45
#a,(b,(c,d),e),f = 40,(41,(42,43),44),45
#x,y,z = a,(b,(c,d),e),f = 40,(41,(42,43),44),45
a,(b,(c,d),e),f = x,y,z = 40,(41,(42,43),44),45
l=[1,2]
#l[0],l[1] = 50,52
d={1:'one',2:'two'}
#d[1] = 50
#d[1],d[2] = 50,52
d[1],l[1] = 50,52
print(a, b, c, d, e, f, x, y, z)
print(l, d)