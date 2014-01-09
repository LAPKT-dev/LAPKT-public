TARGET: prof.so

prof.c : prof.pyx
	cython -o $@ $<

prof.so: prof.c
	gcc -o prof.so -shared prof.c -fPIC -lpython2.7 -lprofiler -I/usr/include/python2.7
