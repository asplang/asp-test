s = {}
print('Inserting str')
s <- 'abc'
print('Inserting empty tuple')
s <- ()
#print('Inserting non-empty tuples')
#s <- (1,)
#s <- (1,2)

print('Content')
for x in s:
    print(x)
print('End of content')

print('Inserting tuples with mutable contents')
# Should cause error.
s <- (1, (False, True), ('a', (7, 8)), (1, []), (2, 3))
