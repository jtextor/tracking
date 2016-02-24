#!/bin/bash

i=1

while [ -d input/$i ] ; do

mkdir input/$i-Registered

echo matlab -nodisplay -nojvm -nosplash -nodesktop -r \
	'"'fpat="'"input/$i-Converted/%04d.png"';"opat="'"input/$i-Registered/%04d.png"';"dcorrect';'exit'"'
i=$((i+1))
  
done
