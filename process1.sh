#!/bin/sh

for file in ./test/combine/*.png
do
	basefile=`basename $file`
	basenoext=`basename $basefile .png`
	echo "Processing $basefile..."
	
	#convert $file -morphology Smooth Octagon:2 ./test/final/$basenoext.jpg
	convert $file -quality 60% ./test/final/$basenoext.jpg
done

