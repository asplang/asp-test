# Mutable argument defaults are problematic in Python too, so no worries.
def foo(x = []):
    x <- 1
    for i in x:
        print(i)
    print('---')
foo()
foo()

a=[]
def bar(x = a):
    x <- 1
    for i in x:
        print(i)
    print('---')
bar()
bar()
for i in a:
    print(i)
