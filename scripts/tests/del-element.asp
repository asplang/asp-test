a = list(..5)
s = {}
d = {:}
for item in a:
    s <- item
    d <- item : item

def rep():
    print(a, s, d)

def get_a():
    return a
def get_s():
    return s
def get_d():
    return d

rep()
del a[1]
del s[1], d[1]
rep()
del get_a()[2]
del get_s()[2], get_d()[2]
rep()
