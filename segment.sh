#!/bin/bash

i=$1 # first arg

mkdir input/$i-Treshold
for j in $(seq -f "%04g" 1 100) ; do 
	python thresh.py input/$i-Averaged/$j.png 70 8 input/$i-Treshold/$j.png| awk -v j=$j '{print 0+j,$1,$2}'
done > input/$i-positions.txt
	
