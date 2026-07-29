# Function arguments are part of a closure.

def foo(value):
  def closure():
    print(value)
  return closure
foo('x')()
foo('y')()
del foo
