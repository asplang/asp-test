# Assignment expressions in sets.
# The precendence of comma is less than the walrus operator, so, an assignment
# expression can be a set member.


d = {x := 3, y := x * -2, z := y * -3}
print(x, y, z)
print(d)
