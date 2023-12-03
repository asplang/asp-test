a = 0
def foo():
    global a
    print('glob', a)
    a = 2
    local a
    print('loc', a) # Refers to global because a never existed locally

foo()
print(a)
