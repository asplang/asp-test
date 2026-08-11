class Decorator1:
    def __init__(self, cls):
        print('Applying decorator1')
        self.cls = cls
    def __call__(self, *args, **kwargs):
        print('Entering decorator1')
        result = self.cls(*args, **kwargs)
        print('Exiting decorator1')
        return result

class Decorator2:
    def __init__(self, cls):
        print('Applying decorator2')
        self.cls = cls
    def __call__(self, *args, **kwargs):
        print('Entering decorator2')
        result = self.cls(*args, **kwargs)
        print('Exiting decorator2')
        return result

print('Defining class A')
@Decorator1
@Decorator2
class A:
    print('Defining class A content')
    def foo(self):
        print('foo: self=%s' % (self,))
    print('End of class A content')
print('End of class A')

print('---')
print('Creating A instance')
a = A()

print('---')
print('Calling A method')
a.foo()
