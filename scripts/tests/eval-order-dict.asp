# Test evaluation order for dictionary key/value pairs.

it = iter(..)
d = {next(it) : next(it), next(it) : next(it)}
d <- next(it) : next(it) <- next(it) : next(it)
print(d)
