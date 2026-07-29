# Passing a closure to a sibling closure.

def foo():
  def bar(x):
    def blah(y):
      print(x, y)
    def blech(clos):
      print(x, clos)
      clos(x + 1)
    blech(blah)
  return bar
foo()(0)
del foo
