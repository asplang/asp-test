d = {1:(2,3), 4:(5,6)}

#x,(y,z) = d[4] # Should generate error; tested in bad-assign-mismatch.asp

y,z = d[4] # works

for x,(y,z) in d: # works
  print(x,y,z)
