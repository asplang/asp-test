# Assignment expressions in while statements.

s = 'abcde'
it = iter(s)
while c := next(it): # Unparenthesized
    print(c)
print('---')

it = iter(-3..3)
while (i := next(it)) is not None: # Parenthesized subexpression
    print(i)
print('---')
