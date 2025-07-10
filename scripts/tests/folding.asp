# Compiler constant folding.
print(~42)
print(2 + 3)
print(2.1 + 3.2)
print(True and False)
print('x' if True else 'y')
print('abc' + 'def' + 'ghi')
print('ABC' 'DEF' 'GHI')
print('' 'z')
print('a' '')
#print(2 'abc') # bad syntax; tested in bad-juxta.asp
print(2 < 3)
print(2.1 < 3.2)
print('abc' < 'abcd')

print('---')

x = 42
y = 3.14

print(+5)
print(not 'abc')
print(2 or 5)
print(0 or 5)
print(2 and 5)
print(0 and 5)
print(False or x) # Should fold to x
print(True or x) # Should fold to True
print(False and x) # Should fold to False
print(True and x) # Should fold to x
print(2 == 5)
print('abc' == 'abc')
print(2 != 5)
print('abc' != 'abc')
print(2 > 5)
print(7 | 18)
print(7 ^ 18)
print(7 & 18)
print(6 << 2)
print(6 >> 1)

print(5 + 6)
print(5 - 6)
print(5 * 6)
print(5 / 6)
print(25 // 6)
print(25 % 6)
print(5 ** 3)

print(5 + 6.1)
print(5 - 6.1)
print(5 * 6.1)
print(5 / 6.1)
print(25 // 6.1)
print(25 % 6.1)
print(5 ** 3.1)

print(16 // 4)
print(-16 // 4)
print(15 // 4)
print(-15 // 4)

print(16.3 // 4.1)
print(-16.3 // 4.1)
print(15.3 // 4.1)
print(-15.3 // 4.1)

print(25 % 6)
print(-25 % 6)
print(25 % -6)
print(-25 % -6)

print(25.2 % 6.1)
print(-25.2 % 6.1)
print(25.2 % -6.1)
print(-25.2 % -6.1)

print(5 ** 3.2)
print(-5 ** 3.2)
print(5 ** -3.2)
print(-5 ** -3.2)

print(5 * 'abc') # Shouldn't fold

print(5 if 7 else 9)
print(5 if 0 else 9)
print(x if True else y) # Should fold to x
print(x if False else y) # Should fold to y

print(x * 7 * 6) # No folding; a * 7, followed by result * 6
print(7 * 6 * x) # First expression should fold

print('---')

print({3, 3.0, 4, 4.0, 'abc'})
print("3 <=> 3:", 3 <=> 3)
print("3 <=> 4:", 3 <=> 4)
print("4 <=> 3:", 4 <=> 3)
print("3 <=> 3.0:", 3 <=> 3.0)
print("3.0 <=> 3.0:", 3.0 <=> 3.0)
print("3.0 <=> 3:", 3.0 <=> 3)
print("'abc' <=> 'abc':", 'abc' <=> 'abc')
print("'abc' <=> 'abcd':", 'abc' <=> 'abcd')
print("'abcd' <=> 'abc':", 'abcd' <=> 'abc')
print("4 <=> 'abc':", 4 <=> 'abc')
print("'abc' <=> 4:", 'abc' <=> 4)
print("3.0 <=> 'abc':", 3.0 <=> 'abc')
print("'abc' <=> 3.0:", 'abc' <=> 3.0)
