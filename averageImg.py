from scipy import ndimage as n
from scipy import misc

#i = n.imread("banded/reg/0001.png", 0) # grey scale image 
i = n.imread("NV181/1-Converted-reg/0001.png", 0) # grey scale image 
#i = n.imread("test/unreg/0001.png", 0) # grey scale image 
i = i.astype("uint32")
#print i.shape # size of matrix height and large
for k in range(2, 101): # never goes to last element
	j = n.imread("NV181/1-Converted-reg/%04d.png" %k, 0)
	i = i+j
a = i/100
misc.imsave("imtest.png", a.astype("uint8"))
a = a.astype("int16")
#print a.dtype			#always says int16



for k in range(1, 101): # never goes to last element
	j = n.imread("NV181/1-Converted-reg/%04d.png" %k, 0)
	print j.dtype		# says int32 vs uint8
	#j = a.astype("uint8")	# makes it worst
	#print j.dtype
	j = j-a
	print 'type'
	print j.dtype		# int16 first then int32 vs int16
	j[j<0]=0 # to remove negative values 
	misc.imsave("NV181/1-Converted-avg/%04d.png" %k, j)
	


