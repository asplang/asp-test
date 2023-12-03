a=1
a,b=1,2
a,b=(1,2)
a+=2
print(a)

# Try list elements in tuple assignment. This works in Python.
lst = [0,1,2,3]
(lst[1], a, lst[2], b) = (1,2,3,4)
print(a, b, lst)
