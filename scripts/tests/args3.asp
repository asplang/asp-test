#import sys # Should still be able to access sys without the import
args=None
print(len(sys.args), 'args')
for arg in sys.args:
    print('Arg:', arg)
