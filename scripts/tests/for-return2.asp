# Test return statement inside nested for statements.

def parse_values(key1, key2):
    dictionary = \
        {'10': {1: 'one'}, \
         '20': {1: 'one', 2: 'two'}, \
         '30': {2: 'two', 3: 'three'}, \
         '40': {:}}
    for k1, v1 in dictionary:
        if k1 == key1:
            for k2, v2 in v1:
                if k2 == key2:
                    return v2
            else:
                return 'X'

print(parse_values('10', 5))
print(parse_values('30', 3))
print(parse_values('20', 3))
print(parse_values('40', 2))
print(parse_values('50', 1))
