# Testing order of invocation for decorators.

class Decorator1:
    def __init__(self, func):
        print('Applying decorator1')
        self.func = func
    def __call__(self, *args, **kwargs):
        print('Entering decorator1')
        result = self.func(*args, **kwargs)
        print('Exiting decorator1')
        return result

class Decorator2:
    def __init__(self, func):
        print('Applying decorator2')
        self.func = func
    def __call__(self, *args, **kwargs):
        print('Entering decorator2')
        result = self.func(*args, **kwargs)
        print('Exiting decorator2')
        return result

class Decorator3:
    def __init__(self, func):
        print('Applying decorator3')
        self.func = func
    def __call__(self, *args, **kwargs):
        print('Entering decorator3')
        result = self.func(*args, **kwargs)
        print('Exiting decorator3')
        return result

print('Defining class')
class Class:
    print('Defining method')
    @Decorator1
    @Decorator2
    @Decorator3
    def method(message):
        print(message)
    print('End of method definition')
print('End of class definition')

print('---')

print('Creating instance')
inst = Class()

print('---')

print('Calling method')
inst.method('Hello')
