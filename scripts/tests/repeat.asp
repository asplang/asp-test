# Tests for repetition operator.

print(3 * 'abc')
print('xyz' * 5)
print((1, 2, 3) * 3)
print(3 * (7, 8, 9) * 2)
print(2 * ['a', 'b'] * 3)
print([1.0, 2.17, 3.14] * 4)
print(repr('' * 1000))
print(() * 1000)
print([] * 1000)
print(repr(0 * 'lmnop'))
print(0 * (42,))
print(0 * [57])

#print(-1 * (42,)) # Invalid; cannot repeat negative number of times

x = []
y = x * 1
x <- 42
print(x, y) # x and y should be different

t = ([],)
u = t * 1
v = t * 2
t[0] <- 57
print(t, u, v) # The insertion is refected in all sequences (same as Python)
