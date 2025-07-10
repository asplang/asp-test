i = 7
def foo():
   global i
   print(i)
   del i
foo()
print(`i in ...)
