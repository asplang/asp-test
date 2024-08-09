# This is a regression test to ensure that the key/value version of the list
# insersion operator doesn't leak data memory as it once did.

for i in ..300:
    lst=[1,3]
    lst <- 5
    lst <- 1 : 'xyzzy'
    lst <- 'zzz' <- 0 : 'aaa'
    for x in lst:
        print(x)
    del x
    del lst
    i += 1
