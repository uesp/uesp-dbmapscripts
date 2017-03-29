#!/bin/sh

for file in ./test/maps/*.png
do
	basefile=`basename $file`
	basenoext=`basename $basefile .jpg`
	echo "Processing $basefile..."
	
	#convert ./test/nowater/$basefile canvas3.png \( $file -clone 0 -compose difference -composite -colorspace HSL -channel B -threshold 9000 -colorspace RGB -channel ALL,sync -blur 1x1  \) -compose over -composite ./test/combine/$basefile
	
	convert ./test/nowater/$basefile -alpha on -channel a -evaluate set 50% -channel ALL $file -compose overlay -composite ./test/combine/$basefile
done


