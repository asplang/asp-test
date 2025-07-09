# Literals. All invalid cases are tested in bad-literal-*.asp

2
#5a # invalid
#5_0_ # invalid
5_0

#0b_12 # invalid
#0b_1a # invalid
#0b_1_ # invalid
#0b_1. # invalid
#0b_1 # invalid
0b1
#0b1_02 # invalid
#0b1_0a # invalid
#0b1_0_ # invalid
#0b1_0. # invalid
0b1_0
0b01_0101

#0x_fg # invalid
#0x_f_ # invalid
#0x_f. # invalid
#0x_f # invalid
0xf
#0xf_fg # invalid
#0xf_f_ # invalid
#0xf_f. # invalid
0xf_f
0x1234_cdef

.1
2.
1_2.
#2_.4_7 # invalid
#2_3._7 # invalid
#2_3.4_ # invalid
#2_3.4a # invalid
#3_e4 # invalid
#3e_4 # invalid
2_3.4_7

#2_3.4_7_e5 # invalid
#2_3.4_7e_5 # invalid
2_3.4_7e1_5

''
'abc'
'x_y_z'
