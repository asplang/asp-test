# Test classes and instances used by other test cases.

class A:
    count = 0
    def __init__(self):
        print('A.__init__')
        self.x = 42
    def foo(self):
        print('A.foo', self, self.x)
        return self.x

class B(A):
    pass

class C(B):
    def __init__(me, y):
        print('super:', super())
        print('super().__init__', super().__init__)
        super().__init__()
        print('C.__init__', y)
        me.y = y
    def foo(me):
        print('super:', super())
        print('super().foo:', super().foo)
        x = super().foo()
        print('C.foo', me, me.x)
        return x, me.y

class D(C):
    pass

print('class ids: A=0x%X B=0x%X C=0x%X D=0x%X' % (id(A), id(B), id(C), id(D)))

a1 = A()
print('---')

a2 = A()
print('---')

d1 = D(0)
print('---')
