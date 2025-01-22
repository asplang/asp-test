# Test of local scope iterator being used outside the scope in which it was
# created.

def advance_iter(it):
    next(it)

it = iter(...)
it2 = iter(it)
print(next(it2))
advance_iter(it2)
for x in it2:
    print(x)
