def Decorator(callable):
    return callable

@Decorator # Cannot decorate assignment
i = 0
