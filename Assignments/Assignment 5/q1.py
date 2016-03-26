import math

def cubeLess(x, b):
    return b - x**3

def smallerCube(max):
    return [(i, cubeLess(i, max)) for i in range(1, math.ceil(max**(1/3)))]

def restSum(tuples):
    return sum([x[1] for x in tuples])

def showAllRestSum(lower, upper):
    return [(i, restSum(smallerCube(i))) for i in range(lower, upper) if restSum(smallerCube(i)) % 3 == 0]

print(showAllRestSum(1, 20))
