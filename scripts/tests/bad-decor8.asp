def Decorator(callable):
    return callable

@Decorator # Cannot decorate conditional statement
if True:
    pass
