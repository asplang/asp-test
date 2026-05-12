# Invalid super: object unrelated to class.

class C: pass
c = C()
class D: pass
s = super(D, c)
print(D, c, s, sep='\n')
