def Decorator(callable):
    return callable

i = []

@Decorator # Cannot decorate insertion statement
i <- 0
