i = None
print('None:', i < None)
i = ...
print('...:', i < ...)
i = False
print('False < True:', i < True)
i = 0
print('0:', i < 0)
i = 0.0
print('0.0:', i < 0.0)
i = 0
print('0 < 1.0', i < 1.0)
i = ''
print("'' < ''", i < '')
print("'' < 'abc'", i < 'abc')
print('tuple:', (3,4,5) < (3,4,5))
print('list:', [3,4,5] < [3,4,5])

print('---')

i = None
print('None:', i >= None)
i = ...
print('...:', i >= ...)
i = False
print('False >= True:', i >= True)
i = 0
print('0:', i >= 0)
i = 0.0
print('0.0:', i >= 0.0)
i = 0
print('0 >= 1.0', i >= 1.0)
i = ''
print("'' >= ''", i >= '')
print("'' >= 'abc'", i >= 'abc')
print('tuple:', (3,4,5) >= (3,4,5))
print('list:', [3,4,5] >= [3,4,5])

print('---')

i = None
print('None:', i <=> None)
i = ...
print('...:', i <=> ...)
i = False
print('False <=> True:', i <=> True)
print('True <=> False:', True <=> i)
i = 0
print('0:', i <=> 0)
i = 0.0
print('0.0:', i <=> 0.0)
i = 0
print('0 <=> 1.0', i <=> 1.0)
print('1.0 <=> 0', 1.0 <=> i)
i = ''
print("'' <=> ''", i <=> '')
print("'' <=> 'abc'", i <=> 'abc')
print("'abc' <=> ''", 'abc' <=> i)
print('tuple:', (3,4,5) <=> (3,4,5))
print('list:', [3,4,5] <=> [3,4,5])

print('---')

print('Done')
