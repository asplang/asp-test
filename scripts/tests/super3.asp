# Invalid super with invalid 2nd argument.

class X: pass
s = super(X, 0)
print(s)
