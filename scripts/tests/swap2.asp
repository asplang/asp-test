x, y = 10, 20
print(x, y)
x, (a, b), y = y, (y, x), x
print(x, a, b, y)
x, (a, b), (p, (q, r)), y = y, (y, x), (1, (2, 3)), x
print(x, a, b, p, q, r, y)
