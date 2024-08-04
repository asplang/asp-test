def highlight(lst, item, reverse = False):
    it1 = iter(lst) if not reverse else reversed(lst)
    while True:
        it2 = iter(it1)
        ele = next(it1)
        if ele is None: break
        if ele == item:
            if reverse:
                it1, it2 = it2, it1
            lst <- it2 : '('
            lst <- it1 : ')'
            break

lst = ['a', 'b', 'c', 'b', 'd', 'e', 'a']
print(lst)
highlight(lst, 'c')
print(lst)
highlight(lst, 'a', True)
print(lst)
highlight(lst, 'z')
print(lst)
