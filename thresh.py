#import cv2
from scipy import misc,ndimage # image processing 
from sys import argv
import numpy # all arrays and matrices

#im = cv2.imread( argv[1], 0 )
im = ndimage.imread( argv[1], 0 ) # image read as file array, grey scale image
t = int( argv[2] ) # treshold for brightness 
min_size_t = int( argv[3] ) # threshold for size 
opat = argv[4]
# circ_t = float( argv[4] )

thr = ndimage.binary_fill_holes( im>t )
lbls, n_lbls = ndimage.label( thr )
l_sizes = ndimage.sum(thr, lbls, range(n_lbls + 1))

# play with these lines
mask_size = numpy.logical_or( l_sizes < min_size_t, l_sizes > 10*min_size_t ) #increase 10
thr[mask_size[lbls]] = 0

objs, n_objs = ndimage.label( thr )

innew = numpy.zeros( (im.shape[0], im.shape[1], 3) )

innew[:,:,0] = im
innew[:,:,1] = (objs>0)*255

misc.imsave( opat, innew )

i=1
for o in ndimage.find_objects( objs ):
	oi = objs[o]==i
	com = ndimage.center_of_mass( oi )
	area = float( numpy.sum( oi ) )
	circumference = float( numpy.sum( oi - ndimage.binary_erosion( oi ) ) )
	#if 10.0*area/circumference >= circ_t :
	print "%f\t%f" % (o[0].start+com[0], o[1].start+com[1])
	i=i+1
