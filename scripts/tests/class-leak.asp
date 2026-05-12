for i in ..1000:
    class A:
        def foo(self):
            print('A::foo', self)
    class B(A):
        pass
    a = A()
    b = B()
del i
del a, b
del A
del B
