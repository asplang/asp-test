import empty as e

def rep(mod):
    for mem in mod:
        if mem[0] != `sys:
            print(mem[1])
    print('---')

e.i = 1
e.j = 2
e.k = 3
e.l = 4

def get_e():
    return e

rep(e)
del e.i
rep(e)
del e.j, e.k
rep(e)
del get_e().l
rep(e)
