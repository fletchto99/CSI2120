class House:
    rooms = []
    roomSizes = []
    __name__ = 'House'

    def __init__(self, extra=[]):
        self.rooms = ['kitchen', 'living', 'dining', 'main'] + extra

    def inputSqft(self):
        def isfloat(value):
            try:
                float(value)
                return True
            except ValueError:
                return False

        for room in self.rooms:
            inp = ''
            while True:
                inp = input("{} : width x length: ".format(room))
                split = inp.split(" x ") if " " in inp else inp.split("x")
                if len(split) == 2 and isfloat(split[0]) and isfloat(split[1]):
                    break
                else:
                    print("Invalid input! Must be form width x length")
            self.roomSizes.append(inp)

    def printMetric(self):
        for i in range(len(self.rooms)):
            roomsizes = self.roomSizes[i].split("x")
            print("{} : {} x {} m".format(self.rooms[i], round(float(roomsizes[0]) / 3.2808, 2),
                                          round(float(roomsizes[1]) / 3.2808, 2)))


class Semi(House):
    def __init__(self):
        super(Semi, self).__init__()
