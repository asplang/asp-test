# Simple example to test reference counting.

def foo():
  x = 0
  def bar():
    print('out', x, bar)
  x = 1
  tup = (bar,)
  lst = [bar]
  dict = {42:bar}
  mix = {0: None, 1: [0, (1, bar), 2]}
  return bar
foo()()
del foo
