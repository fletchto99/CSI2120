import re

fin = open('car_imperial.txt', 'r')
fout = open('car_metric.txt', 'w')

for line in fin:
    unpacked = line.split(", ")
    litresPer100Km = round(378.5411784 / (1.609344 * float(re.findall(r'\d+', unpacked[3])[0])), 1)
    trunkSpace = round(float(re.findall(r'\d+', unpacked[4])[0]) / 35.315, 3)

    fout.write("{}, {}, {}, {} litre/100 km, {} m^3\n".format(unpacked[0], unpacked[1], unpacked[2], litresPer100Km,
                                                              trunkSpace))

fout.close()
fin.close()
