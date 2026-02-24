# Assignment expression in insert statements.

a = []
a <- p := 0
a <- q := (1, 'a')
a <- r1 := 0 .. 3
a <- r2 := 0 .. 5 : 2 # Inserts ..5:2 at the end
a <- (s := 2) .. 7 : -1 - s
a <- t := 16.6, u := t / 2
print(p, q, r1, r2, s, t, u)
print(a)
print('---')

d = {:}
for i in ..5:
    d <- -(k := i) : k * 2
    print(k, d)
del k, d
print('---')

d = {:}
d <- r1 := .. 5 : 2 : 'abc' # Key is ..5:2
d <- (r2 := .. 5) : 2 # Key is ..5, value is 2
print(r1, r2)
print(d)
print('---')
