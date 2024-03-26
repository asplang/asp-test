print(0..5:1)
for i in 0..5:1:
  print(i)

# Boolean range component should be converted to integers.
print(..True)
print(True..False:-1)
print(..:True)
