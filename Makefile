all : banded-pos.txt

.DELETE_ON_ERROR :

%-pos.txt : %/reg/0001.png thresh.py 
	for i in $$(seq 1 100) ; do \
		n=$$(printf %04d $$i); \
		python thresh.py $*/reg/$$i.png 120 50 21 | awk -v i=$$i '{printf i"\t"; print}'; \
	done > $@
