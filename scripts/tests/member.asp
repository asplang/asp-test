t = (1, 3, 5)
print(3 in t, 4 in t, 6 not in t)

se = {1, 3, 5}
print(5 in se, 4 in se, 5 not in se)

d = {1: 'one', 3: '333', 5: 'five'}
print(5 in d, 4 in d, 'one' in d, 'x' not in d)

s = 'abcde'
print('bc' in s)
print('xy' in s)
print('abcdef' in s)
print('' in s)
print('def' in 'abcdecdef')
print('' in '')
print('x' in '')
print('' in 'x')
print('x' in 'x')
print('x' not in 'x')

print(`args in sys, `args in module(), `args in ...)
def foo(x = 3.14):
    locals = ...
    print(`x in locals, `foo in module(), `oops in locals)
    print(exists(`locals), exists(`foo), exists(`args), exists(`oops))
foo()
print(exists(foo), exists(`foo), exists(`oops))
