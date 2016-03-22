import random
import math

things = 5*['car'] + 3*['bike'] + 4*['airplane']

ids = [math.trunc(100*random.random()) for x in range(len(things))]

# fix below to sort according to pass 1 for radix sort
tups = sorted([(ids[i],things[i]) for i in range(len(things))])


print(tups)

tups = sorted(tups, key=lambda item: item[1])

print(tups)