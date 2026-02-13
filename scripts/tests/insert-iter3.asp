def ins_by_iter(it):
    it <- 1 <- 2
    next(it)
    it <- 3 <- 4
    next(it)
    it <- 5 <- 6

def ins_iter(lst, reverse):
    print('Forward' if not reverse else 'Reverse')
    print(' Before:', lst)
    it = iter(lst) if not reverse else reversed(lst)
    ins_by_iter(it)
    print(' After: ', lst)

ins_iter([], False)
ins_iter([], True)
ins_iter(['a'], False)
ins_iter(['a'], True)
ins_iter(['a', 'b'], False)
ins_iter(['a', 'b'], True)
ins_iter(['a', 'b', 'c'], False)
ins_iter(['a', 'b', 'c'], True)
