# Using implicit and explicit access to closure in nonlocal scope from within
# its own definition.

def foo():
  def bar():
    print(bar)
    nonlocal bar
    print(bar)
  return bar
b=foo();print(b)
print('---')
print(b())
print('---')
print(foo()())
del foo, b
