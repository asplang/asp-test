# Tests of built-in isinstance function.

print('isinstance(0, type(0))', isinstance(0, type(0))) # True
print('isinstance(0.0, type(0))', isinstance(0.0, type(0))) # False
print('---')

from classes import *

print('isinstance(a1, A)', isinstance(a1, A)) # True
print('isinstance(a1, D)', isinstance(a1, D)) # False
print('isinstance(d1, A)', isinstance(d1, A)) # True
print('isinstance(d1, B)', isinstance(d1, B)) # True
print('isinstance(d1, C)', isinstance(d1, C)) # True
print('isinstance(a1, (D, A))', isinstance(a1, (D, A))) # True
print('isinstance(a1, (D, (C, A), C))', isinstance(a1, (D, (C, A), C))) # True
print('isinstance(A, type(A))', isinstance(A, type(A))) # True
print('isinstance(A, type(B))', isinstance(A, type(B))) # True
print('isinstance(a1, (D, [C, A], C))', isinstance(a1, (D, [C, A], C))) # True
print('isinstance(a1, (B, C, D)', isinstance(a1, (B, C, D))) # False
print('isinstance(a1, ())', isinstance(a1, ())) # False
print('isinstance(a1, [])', isinstance(a1, [])) # False
print('isinstance(A, ())', isinstance(A, ())) # False
print('isinstance(A, [])', isinstance(A, [])) # False
print('---')
