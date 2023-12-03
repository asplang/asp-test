#c = [0,1,2,3,4,5,6,7,8,9]
#c[3..7] = [-1] * 4

# Simplified; generates internal error
c = [0,1,2]
#c[1..3] = [-1] * 2
c[1..3] = [-1, -1]

print(c)
