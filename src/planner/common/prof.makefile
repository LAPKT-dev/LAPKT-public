TARGET: prof.so

prof.c : prof.pyx
	cython -o $@ $<

prof.so: prof.c
	gcc -o prof.so -shared prof.c -fPIC -lpython3.8 -lprofiler -I/usr/include/python3.8
