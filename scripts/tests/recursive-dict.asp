# Check that recursive dict works correctly
def use_recursive_dict():
    d = {'one': 1, 'two': 2, 'three': 3}

    d['four'] = d
    d <- 'five' : d


    assert len(d) == 5
    del d['four']

    assert len(d) == 4
    
    assert 'one' in d
    assert 'two' in d
    assert 'three' in d
    assert 'four' not in d
    assert 'five' in d

    d2 = {"1": 1, "2": 2, "3" : 3, "4": d}
    d2 <- "5" : d2

    assert d == d
    assert d2 == d2
    assert d != d2

    # This will cause OOM
    # print(d)
   

# Check that recursive dict doesn't cause memory leak
for i in 0..1000:
    use_recursive_dict()
