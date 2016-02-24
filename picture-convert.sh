#!/bin/bash

mkdir "${PWD##*/}-Converted"
for i in *.tif
do sips -s format png "${i}" --out "${PWD##*/}-Converted/${i%tif}png"
done

for f in "${PWD##*/}-Converted"/*.png
do
mv "$f" "${PWD##*/}-Converted/${f##*@}"
done

mv "${PWD##*/}-Converted" ../

