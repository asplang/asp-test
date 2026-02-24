# Assignment expressions in if statements.

for s in ['', 'abcde']:

    # Unparenthesized.
    if l := len(s):
        print('Length of %s is %d' % (s, l))
    else:
        print('Zero length string')

    for value in [3, 7]:

        # Parenthesized subexpression.
        if (l := len(s)) > value:
            print('%d is greater than %d' % (l, value))
        else:
            print('%d is less than %d' % (l, value))
