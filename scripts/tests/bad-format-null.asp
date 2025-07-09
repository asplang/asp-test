# Unterminated format string containing null.
# This should generate an "invalid format" error.
print('value is %\0d' % (42,))
