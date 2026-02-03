# This script tests deleting non-terminal key and value from a dictionary,
# exercising the use in AspUnref of the 2nd value in a stack element.

t = (1,2)
l = [3,4]
d = {t:l}
print('Deleting non-trivial dictionary')
del d
print('Success 1')

print('Deleting dictionary with non-trivial key and trivial value')
d = {t:None}
del d
print('Success 2')

print('Deleting dictionary with trivial key and non-trivial value')
d = {None:l}
del d
print('Success 3')
