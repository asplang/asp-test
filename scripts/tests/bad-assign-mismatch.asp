# Sequence assignment test.
d = {1:(2,3), 4:(5,6)}
# Should generate sequence mismatch, not unexpected type
x,(y,z) = d[4]
