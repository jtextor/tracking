#!/bin/bash

sort -k 4g -k 1g $1 | \
awk -v OFS="\t" -v ds=1.407374978 -v dt=30 '$4 {if($4!=t){n=1;t=$4};print $4,n,dt*$1,ds*$3,ds*(768-$2),0;n++}'