#a = 3

def foo():
    a = 1
    global a
    print(a) # Will cause error because a is undefined at global scope

foo()
