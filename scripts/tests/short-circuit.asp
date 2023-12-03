def f():
  print('f')
  return False

def t():
  print('t')
  return True

f() or t()
print('---')
f() and f()
print('---')
f() or t() or f()
print('---')
f() and t() and f()
print('---')
f() or t() and f() or f() and t() or t()
print('---')
print('Done')
