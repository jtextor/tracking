#!/bin/bash

for i in $(seq -f "%04g" 1 100) ; do 
	python thresh.py banded/reg/$i.png 120 10 | awk -vi=$i '{print 0+i,$1,$2}'
done
