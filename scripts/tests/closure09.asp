# Ensuring that common scopes are shared by multiple closures.

def main():
  x = 0
  def foo(y):
    def bar():
      print('out', x, y)
    return bar
  b1 = foo(5)
  x = 1
  b2 = foo(7)
  b1()
  b2()
main()
del main
