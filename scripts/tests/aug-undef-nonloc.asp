# Augmented assignment to previously defined nonlocal variable that is
# subsequently deleted should produce an appropriate error.
def foo():
  i = 0
  def bar():
    nonlocal i
    i += 1
    print(i)
    del i
    i += 1
    print(i)
  return bar
foo()()
