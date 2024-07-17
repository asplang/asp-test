def gcd(m, n):
    return m if n == 0 else gcd(n, m % n)

if len(args) < 3:
    print('Must specify two integers')
    exit(1)

a = int(args[1])
b = int(args[2])
print('GCD of %d and %d is %d' % (a, b, gcd(a, b)))
