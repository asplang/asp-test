# Check that recursive list works correctly
def use_recursive_list():
    lst1 = ["one", "two", "three"]

    lst1 <- lst1


    assert len(lst1) == 4
    
    assert 'one' in lst1
    assert 'two' in lst1
    assert 'three' in lst1
    assert lst1 in lst1
    
    lst2 = ["1", "2", "3", lst1]
    lst2 <- lst2
    
    assert lst1 == lst1
    assert lst2 == lst2
    assert lst1 != lst2
    
    # This will cause OOM
    # print(d)

lst1 = []
lst1 <- lst1

assert lst1 == lst1
assert not (lst1 < lst1)

for i in 0..1000:
    use_recursive_list()
