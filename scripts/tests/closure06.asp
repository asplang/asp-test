# Accessing a global variable from a closure.

x = 42
def foo():
  def bar():
    print(x)
    x = 13
    print(x)
    del x
    print(x)
  return bar
foo()()
print('---')
print(x)
del foo, x
