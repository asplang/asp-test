# Invalid function call.
# *3.14 should be caught by the compiler as an attempt to pass an invalid type
# of object as a group argument.
foo(*t, *3.14, 99)
