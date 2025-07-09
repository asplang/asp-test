s='abcde'
for i in ..5:
    print(s[i])
for i in -1..-6:-1:
    print(s[i])
# These should fail; tested in bad-index*.asp
#print(s[5])
#print(s[-6])
