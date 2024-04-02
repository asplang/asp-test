def test(iterable):
    print('===')
    it1 = iter(iterable)
    print(next(it1))
    print(next(it1))
    it2 = iter(it1)
    it3 = reversed(it1)
    it4 = reversed(it3)
    print('%s %s %s' % (it1 == it2, it1 == it3, it1 == it4))
    print(next(it1))
    print('%s %s %s' % (it1 == it2, it1 == it3, it1 == it4))
    del it1
    for it in it2, it3, it4:
        print('---')
        for i in it:
            print(i)

for iterable in 3..10:2, 'abcdefg', [10, 11, 12, 13], ..0, 'xy', [42]:
    test(iterable)
print('Done')
