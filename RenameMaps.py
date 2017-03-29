import os
import sys
import shutil
import re

INPUT_PATH = "d:\\dbmaps\\test\\final\\"
OUTPUT_PATH = "d:\\dbmaps\\test\\zoom17\\"


for filename in os.listdir(INPUT_PATH):
    InputFile = INPUT_PATH + filename

    matchResult = re.search('([a-zA-Z]+)-([0-9]+)-([0-9]+)-([0-9]+)\.', filename)
    if (not matchResult): continue

    cellX = int(matchResult.group(2)) - 90
    cellY = int(matchResult.group(3)) - 40
    zoom = matchResult.group(4)

    newFilename = "db-" + str(cellX) + "-" + str(cellY) + "-" + str(zoom) + ".jpg"
    OutputFile = OUTPUT_PATH + newFilename

    print("Copying " + filename + " to " + newFilename + "...")

    shutil.copyfile(InputFile, OutputFile)


