a = 2
b = +a
c = -a
d = ~a
print(a, b, c, d)

ct = +True
cf = +False
cnt = -True
cnf = -False
print(ct, cf, cnt, cnf)

t = True
f = False
vt = +t
vf = +f
vnt = -t
vnf = -f
print(t, f, vt, vf, vnt, vnf)

print(-123++456)
print(---123+++456)
x=123
y=456
print(-x++y)
print(---x+++y)

# Invalid use of unary +; tested in bad-arith-op*.asp
# s = ''
# x = +s
