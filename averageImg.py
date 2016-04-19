from scipy import ndimage as n
from scipy import misc
from sys import argv

ipat = argv[1] #"NV181/1-Registered/%04d.png"
opat = argv[2] #"NV181/1-Averaged/%04d.png"

i = n.imread(ipat % 1, 0) # grey scale image 
i = i.astype("uint32")
#print i.shape # size of matrix height and large
for k in range(2, 101): # never goes to last element
	j = n.imread(ipat % k, 0)
	i = i+j
a = i/100
misc.imsave(opat[:len(opat)-8]+"background.png", a.astype("uint8"))
a = a.astype("int16")

for k in range(1, 101): # never goes to last element
	j = n.imread(ipat % k, 0)
	print ipat % k
	j = j-a		
	j[j<0]=0  
	misc.imsave(opat % k, j)
	


