# Practical class example: single variable polynomial.

class Polynomial:
    def __init__(self, *coeffs):
        self.coeffs = coeffs if len(coeffs) else (0,)
    def value(self, x):
        exp = self.degree()
        sum = 0.0
        for coeff in self.coeffs:
            sum += coeff * x ** exp
            exp -= 1
        return sum
    def degree(self):
        return len(self.coeffs) - 1

test_cases = []
test_cases <- (), -2, +2
test_cases <- (3, -5, 4), -10, +10, 0.5

for test_case in test_cases:
    poly = Polynomial(*test_case[0])
    print('Coeffs are %s' % (poly.coeffs,))
    print('Degree is %d' % (poly.degree(),))
    incr = test_case[3] if len(test_case) > 3 else 1
    x = test_case[1]
    while x <= test_case[2] + incr / 2:
        print('%s -> %s' % (x, poly.value(x)))
        x += incr
    print('---')
