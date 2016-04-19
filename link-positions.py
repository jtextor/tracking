from sys import argv, exit, stderr
from scipy import spatial
from functools import partial

filename = argv[1]
print filename
radius_threshold = float( argv[2] )

positions = {}
trackids = {}
n_pos = 0
with open(filename) as f:
	for line in f:
		l = map( float, line.strip().split() )
		n = int(l[0])
		if n_pos != n :
			n_pos = n_pos + 1
			positions[n_pos] = []
			trackids[n_pos] = []
		positions[n].append( (l[1],l[2]) )
		trackids[n].append( None )

current_track_id = 0

for px in range( 1, n_pos ) :
	py = px+1
	Tx, Ty = map( spatial.KDTree, ( positions[px], positions[py] ) )
	for i, Nx in enumerate( Tx.query_ball_tree( Ty, radius_threshold ) ) :
		if len( Nx ) > 1 :
			stderr.write( "Error: ambiguous tracking at the NN threshold %g!\n" % radius_threshold )
			exit(1)
		if len( Nx ) > 0 :
			tid = trackids[px][i]
			if tid == None :
				current_track_id = current_track_id+1
				tid = current_track_id
				trackids[px][i] = tid
			for Nxj in Nx :
				trackids[py][Nxj] = tid

def format_pos( i, p ) :
	if p[1] != None :
		return "%i\t%f\t%f\t%i" % (i,p[0][0],p[0][1],p[1])
	else :
		return "%i\t%f\t%f" % (i,p[0][0],p[0][1])

for p in range( 1, n_pos+1 ) :
	print "\n".join( map( partial( format_pos, p ), zip( positions[p], trackids[p] ) ) )