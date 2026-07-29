# A closure can escape from multiple scopes. The means of escape can be through
# a return value or explicit storage (e.g., to the global scope).

def main():
  def foo():
    def bar():
      pass
    return bar
  b = foo()
  global cl
  cl = b
main()
del main
cl()
del cl
