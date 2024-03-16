# Iterator as collection in for statement.

lst = [1,2,3,4,5]
it = iter(lst)
print(next(it))
for i in it:
    print(i)
