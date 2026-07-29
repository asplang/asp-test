# Closure inside global nested classes. Class namespaces are ignored for lookup.

x = 0
class A:
  x = 1
  class B:
    x = 2
    class C:
      x = 3
      def foo():
        def bar():
          print(x)
        return bar
A.B.C.foo()()
del A, x
