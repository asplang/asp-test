a = 3
b = 5
r1 = not a
r2 = a and b
r3 = a or b
print(a, b, r1, r2, r3)

b = 0
r4 = not not a and not not b
r5 = not not a or not not b
print(r4, r5)

def bar():
    print('bar')

True or foo()
False and foo()
foo() if False else bar()

a = 7.2; b = ''; c = []
print(a and b and c, a or b or c)
