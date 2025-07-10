def foo():
   global i
   i = 8
   local i
   i = 9
foo()
print(i)
