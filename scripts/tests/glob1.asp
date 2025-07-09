#a = 3

def foo():
    a = 1
    global a
    #print(a) # Will cause error; tested in bad-global.asp
    a = 2
    print(a)
    local a
    print(a)

foo()
print(a)
