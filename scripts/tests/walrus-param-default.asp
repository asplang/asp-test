# Ensure scope of assignment expression in keyword argument value is at the
# same level as the function definition, not within the function.

def foo(arg = (fa := 42)): return arg, fa
print(fa, foo()); del fa # Should succeed
print(foo()) # Should fail
