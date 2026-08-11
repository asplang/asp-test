def Decorator(callable):
    return callable

@Decorator # Cannot decorate assert
assert True
