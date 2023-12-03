a = 0
def foo(a):
    global a
    print('glob', a)
    a = 2
    local a
    print('loc', a) # Refers to argument

foo(1)
print(a)
