#!/bin/bash

i=1

while [ -d input/$i ] ; do
	mkdir input/$i-Converted
	for f in input/$i/*.tif ; do
		PNGFILE=$(basename $f .tif).png
		echo convert $f input/$i-Converted/${PNGFILE##*@}
	done
	i=$((i+1))
done
