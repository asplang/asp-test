# Test of isinstance with invalid 2nd argument (sequence contain something that
# is not a type, class, or another sequence).

print(isinstance(0, (type(0), None))) # ok
print(isinstance(0, (None, type(0)))) # error
