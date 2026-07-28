# Augmented assignment to previously undefined global variable should produce
# an appropriate error. Global override should ignore local variable.
def foo():
  i = 0
  global i
  i += 1
foo()
