# Python does not allow assignment expressions at the top level of a return
# statement, but Asp does.

def foo():
    global x
    return x := 13
print(foo(), x)
del x

def foo():
    global x
    return x := 42, 13
print(foo(), x)
del x

def foo():
    global x
    return 42, x := 13
print(foo(), x)
del x

def foo():
    global x
    return x := (42, 13)
print(foo(), x)
del x
