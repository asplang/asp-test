# Compute fibonacci number.

def fib(n):
    if type(n) != type(0) or n < 0:
        return None
    else:
        return 0 if n == 0 else 1 if n <= 2 else fib(n - 1) + fib(n - 2)

if len(args) < 2:
    print('Must specify an integer index')
    exit(1)

a = int(args[1])
print('Fibonacci number %d is %d' % (a, fib(a)))
