#!/bin/sh

TESTFILE="skyrim-124-86-17.png"
TESTFILE="skyrim-142-92-17.png"
#TESTFILE="skyrim-97-47-17.png"
#TESTFILE="skyrim-90-89-17.png"
#TESTFILE="skyrim-116-93-17.png"
#TESTFILE="skyrim-119-95-17.png"
#TESTFILE="skyrim-142-96-17.png"
WATERFILE="./test/maps/$TESTFILE"
NOWATERFILE="./test/nowater/$TESTFILE"
OUTPUTFILE="testwater2.png"

cp $WATERFILE   db__water1.png
cp $NOWATERFILE dbnowater1.png

# convert $NOWATERFILE canvas3.png \( $WATERFILE -clone 0 -compose difference -composite -colorspace HSL -channel B -threshold 15% -colorspace RGB -channel ALL,sync -blur 1x1  \) -compose over -composite $OUTPUTFILE
# convert $NOWATERFILE canvas3.png \( $WATERFILE -clone 0 -compose difference -composite -threshold 7500 -blur 1x1  \) -compose over -composite $OUTPUTFILE

convert $NOWATERFILE $WATERFILE -compose difference -composite diff.png
#convert diff.png -threshold 6000 -blur 1x1 mask.png
convert diff.png -colorspace HSL -channel B -threshold 9000 -colorspace RGB -channel ALL,sync -blur 1x1 mask.png

# convert nowater.jpg canvas3.png \( original.jpg -clone 0 -compose difference -composite -colorspace HSL -channel B -threshold 2000 -colorspace RGB -channel ALL,sync -blur 1x1  \) -compose over -composite testwater1.jpg
# convert nowater.jpg original.jpg -compose difference -composite diff1.jpg
# convert diff1.jpg -threshold 2000 -blur 1x1 mask1.png


convert $NOWATERFILE -alpha on -channel a -evaluate set 50% -channel ALL $WATERFILE -compose overlay -composite $OUTPUTFILE

convert nowater.jpg -alpha on -channel a -evaluate set 50% -channel ALL original.jpg -compose overlay -composite testwater3.jpg
