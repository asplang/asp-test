def ins_iter(lst, reverse):
    print('Forward' if not reverse else 'Reverse')
    print(' Before:', lst)
    it = iter(lst) if not reverse else reversed(lst)
    lst <- it : 1 <- it : 2
    next(it)
    lst <- it : 3 <- it : 4
    next(it)
    lst <- it : 5 <- it : 6
    print(' After: ', lst)

ins_iter([], False)
ins_iter([], True)
ins_iter(['a'], False)
ins_iter(['a'], True)
ins_iter(['a', 'b'], False)
ins_iter(['a', 'b'], True)
ins_iter(['a', 'b', 'c'], False)
ins_iter(['a', 'b', 'c'], True)
