#!/bin/bash

echo Step 1
bash segment.sh > positions.txt	# must change name of files in segment.sh

echo Step 2
python link-positions.py positions.txt 4 > tracks.txt

echo Step 3
bash resort-tracks.sh tracks.txt > tracks-final.txt 