x = input("Enter something: ")

upper = 0
non_whitespace = 0
for c in x:
    if c != ' ':
        non_whitespace += 1
    if c.isupper():
        upper += 1

print('Upper: {}'.format(upper))
print('Non Whitespace {}'.format(non_whitespace))