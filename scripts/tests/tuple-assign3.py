#!/usr/bin/env python3

x = ((1),)
print('((1),)', x)
for ((x),) in [((1),)]: print(x)

x = ((()),)
print('((()),)', x)
for ((()),) in [((()),)]: print('hello')

x = ((((()))))
print('((((()))))', x)
for ((((())))) in [((((()))))]: print('hello')

x = 1,
print('1,', x)
for x, in [(1,)]: print(x)

x = (1,)
print('(1,)', x)
for (x,) in [(1,)]: print(x)

x = (),
print('(),', x)
for (), in [((),)]: print('hello')

x = ((),)
print('((),)', x)
for ((),) in [((),)]: print('hello')

x = (),((),),()
print('(),((),),()', x)
for (),((),),() in [((),((),),())]: print('hello')

x = ((),((),),())
print('((),((),),())', x)
for ((),((),),()) in [((),((),),())]: print('hello')
