assert ('%d' % (100,)) == "100"
assert ('%i' % (200,)) == "200"
assert ('%#o' % (100,)) == "0144"
assert ('%#x' % (200,)) == "0xc8"
assert ('%#X' % (200,)) == "0XC8"
assert ('%#7.0f' % (3,)) == "     3."
assert ('"%+7.3f" and "%g"' % (3.94, acos(-1))) == '" +3.940" and "3.14159"'
assert ('"%+e" and "%-e"' % (3.94e-7, 2.71e8)) == '"+3.940000e-07" and "2.710000e+08"'
assert ('"%+G" and "%-G"' % (3.94e-7, 2.71e8)) == '"+3.94E-07" and "2.71E+08"'
assert ('"%c", "%c"' % ('A', 0x61)) == '"A", "a"'
assert ('"%07s" %% "%14s"' % ([123,'a'], (0,3.94))) == '"[123, \'a\']" % "     (0, 3.94)"'


s = 'abcde'
assert ('%3s'  % (s,)) == "abcde"
assert ('%7s' % (s, )) == "  abcde"
assert ('%.2s' % (s, )) == "ab"
assert ('%3.2s' % (s, )) == " ab"
assert ('%3.3s' % (s, )) == "abc"
assert ('%3.5s' % (s, )) == "abcde"
assert ('%3.7s' % (s, )) == "abcde"
assert ('%7.3s' % (s, )) == "    abc"
assert ('%7.5s' % (s, )) == "  abcde"
assert ('%#-7.7s' % (s, )) == "abcde  "
assert ('%7.9s' % (s, )) == "  abcde"
assert ('%0.9s' % (s, )) == "abcde"
assert ('%9.0s' % (s, )) == "         "
assert ('%0.0s' % (s, )) == ""
assert ('%-7.3s' % (s, )) == "abc    "
assert ('%07.3s' % (s, )) == "    abc"

assert ('%7.3s' % (33, )) == "     33"
assert ('%s' % (33.333333, )) == "33.3333"
assert ('%7.3s' % (33.333333, )) == "    33."
assert ('%7.3s' % (0x33, )) == "     51"

assert ('%7.7s' % ('%X' % (33,),)) == "     21"
assert ('%7.7s' % ('%7.3f' % (33.333333,),)) == " 33.333"


# Length specifiers are accepted but ignored
assert ('%ls' % ("hello", )) == "hello"
assert ('%ll1.1f' % (0.0, )) == "0.0"
assert ('%L1.1f' % (0.0, )) == "0.0"
