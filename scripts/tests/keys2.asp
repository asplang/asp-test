def check(k):
    key = sys.key(k)
    print('%r is a %s %s' % \
        (key, "key" if key is k else 'string of %r' % (k,), type(k)))

check(None)
check(...)
check(True)
check(0)
check(0.0)
check(`key)
check(..1)
check('')
check(())
check([])
check({})
check({:})
check(iter(..1))
check(check)
check(module())
check(type(None))