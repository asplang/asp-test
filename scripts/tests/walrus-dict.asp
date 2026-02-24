# Assignment expressions in dictionaries.
# Unlike Python, the precendence of colon (as a pair separator) is less than
# the walrus operator, so, an assignment expression can be a dictionary key or
# value.

d = {x := 3 : y := x * 2, z := y + 1 : y * 2}
print(x, y, z, d)
