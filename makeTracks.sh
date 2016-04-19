#!/bin/bash

i=1
while [ -d input/$i ] ; do
	echo Step 1
	bash segment.sh $i	# must change name of files in segment.sh

	echo Step 2
	echo input/$i-positions.txt 
	python link-positions.py input/$i-positions.txt 1.9 > input/$i-tracks.txt

	echo Step 3
	bash resort-tracks.sh input/$i-tracks.txt > input/$i-tracks-final.txt 
	
	i=$((i+1))  
	exit
done