def Decorator(callable):
    return callable

a = [1, 2, 3]

@Decorator # Cannot decorate for loop
for i in a:
    print(i)
