# A once-escaped closure can be destroyed in another scope if it does not
# escape again.

def main():
  def foo():
    def bar():
      pass
    return bar
  b = foo()
main()
del main
