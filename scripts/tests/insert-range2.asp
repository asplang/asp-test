dict = {:}
dict <- (.. 7) : 2 # range : int
dict <- .. 8 : 3 : 2 # range : int
dict <- 2 : .. 5 # int : range
dict <- 3 : .. 6 : 3 # int : range
dict <- (.. 10) : .. 13 # range : range
dict <- .. 11 : 2 : .. 14 : 2 # range : range
print(dict)
