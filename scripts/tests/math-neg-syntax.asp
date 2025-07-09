# The lack of spacing in the following code is intentional in order to test
# lexical analysis and parsing. Failure cases are tested elsewhere.
a=0
print(a)

# Minus sign invokes constant folding.
print(a-1)
print(a-0x13)
print(a-3.14)
print(a-1e-3)

# Bad token: Decimal constant out of range.
#print(2147483649)

# Integer constant out of range (during emit).
#print(2147483648)

# Constant folding fails due to arithmetic overflow in unary plus.
#print(+2147483648)

# Constant folding works due to negation.
print(-2147483648)
print(-2147483648+0)

# Constant folding fails due to arithmetic overflow in outer unary negation.
#print(--2147483648)

# Integer constant out of range (during emitting of binary operation).
#print(a-2147483648)

# Constant folding works due to unary negation.
print(0+-2147483648)

# Emit works due to unary negation.
print(a+-2147483648)

# Constant folding fails due to arithmetic overflow in binary expression.
#print(0--2147483648)
#print(0+2147483648)
#print(2147483648+0)
#print(0*2147483648)
#print(2147483648*0)
#print(0/2147483648)
#print(2147483648/0)

# Compiles, but fails at run time with arithmetic overflow.
#print(a--2147483648)

# Integer constant out of range (during folding of unary not).
#print(not 2147483648)

# Integer constant out of range (during folding of binary equality test).
#print(0.0==2147483648)
#print(0==2147483648)
#print(2147483648==0.0)
#print(2147483648==0)

# Integer constant out of range (during folding of binary comparison).
#print(0.0<2147483648)
#print(2147483648>0)

# Constant folding works due to unary negation.
print(-2147483648<0)
print(-2147483648>0)

# Integer constant out of range (during folding of unary invert).
#print(~2147483648)

# Integer constant out of range (during folding of binary operation).
#print(0&2147483648)
#print(2147483648&0)

# Integer constant out of range (during folding of condition).
#print('a' if 2147483648 else 'b')

# Integer constant out of range (during folding of conditional expression).
#print(2147483648 if False else 0)
#print(0 if True else 2147483648)

# Constant folding fails due to arithmetic overflow in unary minus.
#print(-0x80000000)

# This all works because hex values are representations of 32-bit signed values.
print(0x7FFFFFFF)
print(-0x7FFFFFFF)
print(0x80000000)
