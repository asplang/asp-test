# Testing decorator syntax.

def Decorator(callable):
    return callable

@Decorator
def foo(): pass

@Decorator
@Decorator
def foo(): pass

@Decorator

@Decorator
def foo(): pass


@Decorator
@Decorator

def foo(): pass


@Decorator # comment
# blank line
@Decorator

class cls: pass

@Decorator # comment
@Decorator # comment
# blank line
class cls: pass
