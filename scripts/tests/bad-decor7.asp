def Decorator(callable):
    return callable

@Decorator # Cannot decorate del statement
del Decorator
