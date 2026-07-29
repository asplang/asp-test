# A class defined inside a function is created by a closure, and its methods
# are closures as well.

def foo():
  x = 1
  class A:
    print(x)
    def bar():
      print(-x)
  A.bar()
foo()
del foo
