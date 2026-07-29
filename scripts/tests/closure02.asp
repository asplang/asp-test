# The most basic example of an escaping closure.

def foo():
  x = 0
  def closure():
    print(x)
  return closure
cl = foo()
cl()
del foo, cl
