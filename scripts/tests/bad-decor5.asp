def Decorator(callable):
    return callable

@Decorator # Cannot decorate while loop
while (True):
    break
