[a,b] = 10,20
print(a, b)

[a,[b,c],d] = 11,(22,33),44
print(a, b, c, d)

[a,(b,c),d,(e,f)] = w,[x,y],z,(p,q) = 11,(22,33),44,(55,66)
print(a, b, c, d, e, f)
print(w, x, y, z, p, q)

[((a,),),b] = (((21,),),32)
print(a, b)
