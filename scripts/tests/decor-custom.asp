# Static and class method decorators implemented in Asp.

class StaticMethod:
    def __init__(self, func):
        self.__func__ = func
    def __get__(self, inst, cls = None):
        return self.__func__

class BoundMethod:
    def __init__(self, func, cls):
        self.__func__ = func
        self.__self__ = cls
    def __call__(self, *args, **kwargs):
        return self.__func__(self.__self__, *args, **kwargs)

class ClassMethod:
    def __init__(self, func):
        self.__func__ = func
    def __get__(self, inst, cls = None):
        if cls is None:
            cls = type(inst)
        return BoundMethod(self.__func__, cls)

class A:
    @StaticMethod
    def sm(arg):
        print('A.sm: arg=%s' % (arg,))

    @ClassMethod
    def cm(cls, arg):
        print('A.cm: cls=%s, arg=%s' % (cls, arg))

    def m(self, arg):
        print('A.m: self=%s, arg=%s' % (self, arg))

a = A()

print('BoundMethod =', BoundMethod)
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
