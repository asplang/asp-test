s = {}
s <- None
s <- ...
s <- False
s <- True
for i in 0, 1, -1:
    s <- i
for i in 0.0, 1.0, -1.0, 10000000.0:
    s <- i
s <- ..5 <- 1..5 <- ..5:2
s <- '' <- 'a' <- 'aa'
s <- ()
s <- (None,) <- (None, None)
s <- (...,) <- (..., ...)
s <- (None, ...) <- (..., None)
s <- (0,) <- (1,) <- (0,0)
s <- (0,(1,2),3) <- (0,1,(2,3)) <- ((0,1),2,3)
#s <- []
#s <- {}
#s <- {:}
def foo(): pass
s <- foo
s <- sys
s <- type(None) <- type([]) <- type(foo) <- type(sys) <- type(type(0))
for x in s:
    print(x)
for x in [None, '', (), [], {}, {:}, ((),()), ([],)]:
    print("%r %s" % \
        (x, \
         "can be a KEY" if x is None or key(x) is not None else \
         "CANNOT be a key"))

del i
del x
del s
del foo
