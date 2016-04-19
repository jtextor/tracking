#Adjust jittering and intensity of all pictures in files n-Converted and save them in 
#file n-Registered

#!/bin/bash

i=1
while [ -d input/$i ] ; do
	mkdir input/$i-Registered
	matlab -nodisplay -nojvm -nosplash -nodesktop -r \
	"fpat='input/$i-Converted/%04d.png';opat='input/$i-Registered/o%04d.png';dcorrect;exit"
	i=$((i+1))
exit
done
