# Functions nested three deep returning closures, called with temporaries.

def foo():
  x = 0
  def bar():
    def blah():
      print(x)
    return blah
  return bar
foo()()()
del foo
