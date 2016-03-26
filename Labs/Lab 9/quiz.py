x = input("Enter something: ")
print('Upper: {}'.format(sum(1 for i in x if i.isupper())))
print('Non Whitespace {}'.format(sum(1 for i in x if i != ' ')))
