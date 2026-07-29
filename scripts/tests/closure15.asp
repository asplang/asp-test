# Repeated deleting of nonlocal variables.

def foo():
  i = 0
  def bar():
    i = 1
    def blah():
      i = 2
      nonlocal i
      print(i)
      del i
      print(i)
      del i
      local i
      print(i)
    return blah
  return bar()
foo()()
del foo
