#!/bin/bash

i=1

while [ -d input/$i ] ; do

mkdir -p input/$i-Averaged
python averageImg.py "input/$i-Registered/%04d.png" "input/$i-Averaged/%04d.png"
i=$((i+1))
exit
  
done