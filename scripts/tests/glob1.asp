#a = 3

def foo():
    a = 1
    global a
    #print(a) # Will cause error if a is undefined at global scope
    a = 2
    print(a)
    local a
    print(a)

foo()
print(a)
