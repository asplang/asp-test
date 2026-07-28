# Augmented assignment to previously undefined global variable should produce
# an appropriate error.
def foo():
  global i
  i += 1
foo()
