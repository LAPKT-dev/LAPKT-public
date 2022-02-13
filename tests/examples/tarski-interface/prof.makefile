TARGET: prof.so

prof.c : prof.pyx
	cython -o $@ $<

prof.so: prof.c
	gcc -o prof.so -shared prof.c -fPIC $(python3-config --cflags) $(python3-config --ldflags) -lprofiler -I/usr/include/python3.8
