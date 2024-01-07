# Check that recursive list works correctly
def use_recursive_list():
    d = ["one", "two", "three"]

    d <- d


    assert len(d) == 4
    
    assert 'one' in d
    assert 'two' in d
    assert 'three' in d
    assert d in d
    
    # This will cause OOM
    # print(d)

for i in 0..1000:
    use_recursive_list()