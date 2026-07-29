# Calling a sibling closure.

def foo():
  def bar(x):
    def blah(y):
      print(x, y)
    def blech(y):
      print(x, y)
      blah(y + 1)
    blech(1)
  return bar
foo()(0)
del foo
