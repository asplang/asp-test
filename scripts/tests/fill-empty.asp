def pse(se):
    st = 'SET:'
    for m in se:
        #if len(st) != 0:
        st += ' '
        st += m
    print(st)
    #printtree(se)
    print(se)

def pin(se):
    st = 'PRES:'
    for arg in args[1..]:
        #if len(st) != 0:
        st += ' '
        st += '1' if arg in se else '0'
    print(st)

se = {}
for arg in args[1..]:
    print('Inserting ')
    se <- arg
    pse(se)
    pin(se)
print('Done inserting')
print('Erasing')
for arg in args[1..]:
    print('Deleting ' + arg)
    del se[arg]
    pse(se)
    pin(se)
print('Done')
