def f():
  print('f')
  return False

def t():
  print('t')
  return True

f() if t() else t()
