# Closure is created but never escapes.

def foo():
  def bar():
    pass
  print(bar)
foo();
del foo
