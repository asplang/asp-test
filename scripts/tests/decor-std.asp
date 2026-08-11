# Built-in static and class method decorators.

class A:
    @staticmethod
    def sm(arg):
        print('A.sm: arg=%s' % (arg,))

    @classmethod
    def cm(cls, arg):
        print('A.cm: cls=%s, arg=%s' % (cls, arg))

    def m(self, arg):
        print('A.m: self=%s, arg=%s' % (self, arg))

a = A()

print('A =', A)
print('a =', a)
print('---')

print('Calling A.sm', A.sm)
A.sm('x')
print('---')
print('Calling a.sm', a.sm)
a.sm('y')
print('---')
print('Calling A.cm', A.cm)
A.cm('x')
print('---')
print('Calling a.cm', a.cm)
a.cm('y')
print('---')
print('Calling A.m', A.m)
A.m(None, 'x')
print('---')
print('Calling a.m', a.m)
a.m('y')
print('---')

del A, a
