# Declaring closure global before the definition leaves no local ones.

def foo():
  global bar
  def bar():
    print('x')
foo()
print(bar)
bar()
del foo, bar
