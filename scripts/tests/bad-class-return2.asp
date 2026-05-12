# Return not allowed in class body, notwithstand the class is defined inside a
# function.

def foo():
    class A:
        return
