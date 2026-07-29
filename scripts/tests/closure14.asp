# Scope overrides with normal and augmented assignment.

def foo():
  i = 0
  def bar():
    i = 100
    nonlocal i
    i += 1
    print(i)
    local i
    print(i)
    global i
    i = 42
  return bar
b = foo()
b()
b()
print(i)
del foo, b, i
