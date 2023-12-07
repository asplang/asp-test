print('Value is... "%d"' % (100,))
print('Value is... "%i"' % (200,))
print('Value is... "%#o"' % (100,))
print('Value is... "%#x"' % (200,))
print('Value is... "%#X"' % (200,))
print('Values are... "%#7.0f"' % (3,))
print('Values are... "%+7.3f" and "%g"' % (3.94, acos(-1)))
print('Values are... "%+e" and "%-e"' % (3.94e-7, 2.71e8))
print('Values are... "%+G" and "%-G"' % (3.94e-7, 2.71e8))
print('Value is... "%c", "%c".' % ('A', 0x61))
print('Value is... "%07s" %% "%14s".' % ([123,'a'], (0,3.94)))

def printf_str(fmt, s):
    print(fmt, '->', ('"' + fmt + '"') % (s,))

s = 'abcde'
printf_str('%3s', s)
printf_str('%7s', s)
printf_str('%.2s', s)
printf_str('%3.2s', s)
printf_str('%3.3s', s)
printf_str('%3.5s', s)
printf_str('%3.7s', s)
printf_str('%7.3s', s)
printf_str('%7.5s', s)
printf_str('%#-7.7s', s)
printf_str('%7.9s', s)
printf_str('%0.9s', s)
printf_str('%9.0s', s)
printf_str('%0.0s', s)
printf_str('%-7.3s', s)
printf_str('%07.3s', s)

printf_str('%7.3s', 33)
printf_str('%s', 33.333333)
printf_str('%7.3s', 33.333333)
printf_str('%7.3s', 0x33)

print('"%7.7s"' % ('%X' % (33,),))
print('"%7.7s"' % ('%7.3f' % (33.333333,),))

# Unterminated format string. These cases cause run errors.
#print('value is %' % (42,))
#print('value is %\0d' % (42,))
