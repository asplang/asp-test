# Python does not allow assignment expressions at the top level of an assert
# statement, but Asp does.

assert x := 13
print(x)
assert x := 42, 13
print(x)
assert 42, x := 13
print(x)
assert x := (42, 13)
print(x)
