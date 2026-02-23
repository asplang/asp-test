a = 0
a -= 1
(a) += 2
print(a)

a = [1, 2, 'abc', -1]
a[0] /= 2
a[1] **= 3
(a[2]) *= 2
print(a)

def foo(): return a
foo()[3] <<= 3
(foo()[3]) += 1
print(a)

import empty as e
e.x = -8
e.x //= 3
(e.x) += 1
print(e.x)

def foo(): return e
foo().x += 2
(foo().x) += 3
print(e.x)
