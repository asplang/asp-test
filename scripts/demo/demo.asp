#
# Demo script.
#

pi = acos(-1)
delay = float(args[1]) if len(args) >= 2 else 0.01

funcs = [sin, cos]

def deg2rad(deg):
    return deg * pi / 180

while True:

    for deg in 0..360:5:

        # Calculate the point values.
        rad = deg2rad(deg)
        points = {}
        for func in funcs:
            points <- func(rad)

        # Build a line to display.
        line = ''
        for point in points:
            pos = 39 + int(round(39 * point))
            spaceCount = pos - len(line)
            if spaceCount >= 0:
                line += spaceCount * ' ' + '*'

        print(line)
        sleep(delay)
