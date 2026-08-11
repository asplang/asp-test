def Decorator(callable):
    return callable

@Decorator # Cannot decorate expression statement
print('Hello')
