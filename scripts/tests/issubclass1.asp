# Tests of built-in issubclass function.

from classes import *

print('issubclass(A, A)', issubclass(A, A)) # True
print('issubclass(A, B)', issubclass(A, B)) # False
print('issubclass(B, A)', issubclass(B, A)) # True
print('issubclass(A, D)', issubclass(A, D)) # False
print('issubclass(A, (B, C, D))', issubclass(A, (B, C, D))) # False
print('issubclass(D, A)', issubclass(D, A)) # True
print('issubclass(B, (C, D))', issubclass(B, (C, D))) # False
print('issubclass(B, (D, (C, A)))', issubclass(B, (D, (C, A)))) # True
print('---')
