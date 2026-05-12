# Iterator tests with classes.

from iter1 import *

class C:
    def __init__(self):
        print("Creating C instance")
        self.a = 1
        self.b = 'two'
        self.c = ..3
    def foo(self): pass
    x = 1

# Class.
test(C)

# Class instance.
test(C())

print('Done')
