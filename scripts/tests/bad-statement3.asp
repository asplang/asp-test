test1 = True
test2 = True

# Okay.
if test1:
    if test2: print(test1, test2)

# Syntax error.
if test1: if test2: print(test1, test2)
