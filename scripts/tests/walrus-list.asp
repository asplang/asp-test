# Assignment expressions in lists.
# The precendence of comma is less than the walrus operator, so, an assignment
# expression can be a list element.

def square(x):
    return x * x

lst = [s := square(3), s + 1, t := s + 2, t * 2]
print(s, t)
print(lst)
