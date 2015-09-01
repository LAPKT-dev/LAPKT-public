#!/bin/sh
#
# Makefile for FF v 1.0
#


####### FLAGS

TYPE	= 
ADDONS	= 

CC      = gcc


CFLAGS  =  -O6 -Wall -ansi $(TYPE) $(ADDONS)
#CFLAGS	=  -g -pg -Wall -ansi $(TYPE) $(ADDONS) 
# -g -pg

LIBS    = -lm


####### Files

PDDL_PARSER_SRC	= scan-fct_pddl.tab.c \
	scan-ops_pddl.tab.c \
	scan-probname.tab.c \
	lex.fct_pddl.c \
	lex.ops_pddl.c 

PDDL_PARSER_OBJ = scan-fct_pddl.tab.o \
	scan-ops_pddl.tab.o 


SOURCES 	= main.c \
	memory.c \
	output.c \
	parse.c \
	expressions.c \
	inst_pre.c \
	inst_easy.c \
	inst_hard.c \
	inst_final.c \
	relax.c \
	search.c \
	utility.c

LIB_SOURCES = libff.c \
	memory.c \
	output.c \
	parse.c \
	expressions.c \
	inst_pre.c \
	inst_easy.c \
	inst_hard.c \
	inst_final.c \
	relax.c \
	search.c \
	utility.c


OBJECTS 	= $(SOURCES:.c=.o)
LIB_OBJECTS	= $(LIB_SOURCES:.c=.o)

####### Implicit rules

.SUFFIXES:

.SUFFIXES: .c .o

.c.o:; $(CC) -c $(CFLAGS) $<

####### Build rules

libff: $(LIB_OBJECTS) $(PDDL_PARSER_OBJ)
	ar cru libff.a $(LIB_OBJECTS) $(PDDL_PARSER_OBJ)

ff: $(OBJECTS) $(PDDL_PARSER_OBJ)
	$(CC) -static -o ff $(OBJECTS) $(PDDL_PARSER_OBJ) $(CFLAGS) $(LIBS)

# pddl syntax
scan-fct_pddl.tab.c: scan-fct_pddl.y lex.fct_pddl.c
	bison -pfct_pddl -bscan-fct_pddl scan-fct_pddl.y

scan-ops_pddl.tab.c: scan-ops_pddl.y lex.ops_pddl.c
	bison -pops_pddl -bscan-ops_pddl scan-ops_pddl.y

lex.fct_pddl.c: lex-fct_pddl.l
	flex -Pfct_pddl lex-fct_pddl.l

lex.ops_pddl.c: lex-ops_pddl.l
	flex -Pops_pddl lex-ops_pddl.l

test_lib: test_main.cxx
	g++ -static -o test_lib test_main.cxx -lff -L./

# misc
clean:
	rm -f *.o *.bak *~ *% core *_pure_p9_c0_400.o.warnings test_lib \
        \#*\# $(RES_PARSER_SRC) $(PDDL_PARSER_SRC)

veryclean: clean
	rm -f ff H* J* K* L* O* graph.* *.symbex gmon.out \
	$(PDDL_PARSER_SRC) \
	lex.fct_pddl.c lex.ops_pddl.c lex.probname.c \
	*.output

depend:
	makedepend -- $(SOURCES)  $(LIB_SOURCES) $(PDDL_PARSER_SRC) test_main.cxx

lint:
	lclint -booltype Bool $(SOURCES) 2> output.lint

# DO NOT DELETE

main.o: ff.h /usr/include/stdlib.h /usr/include/features.h
main.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
main.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
main.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
main.o: /usr/include/endian.h /usr/include/bits/endian.h
main.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
main.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
main.o: /usr/include/sys/types.h /usr/include/time.h
main.o: /usr/include/sys/select.h /usr/include/bits/select.h
main.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
main.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
main.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
main.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
main.o: /usr/include/wchar.h /usr/include/bits/wchar.h /usr/include/xlocale.h
main.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
main.o: /usr/include/strings.h /usr/include/ctype.h /usr/include/sys/timeb.h
main.o: /usr/include/sys/times.h memory.h /usr/include/string.h output.h
main.o: parse.h expressions.h inst_pre.h inst_easy.h inst_hard.h inst_final.h
main.o: relax.h search.h
memory.o: /usr/include/string.h /usr/include/features.h
memory.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
memory.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
memory.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
memory.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
memory.o: /usr/include/endian.h /usr/include/bits/endian.h
memory.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
memory.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
memory.o: /usr/include/sys/types.h /usr/include/time.h
memory.o: /usr/include/sys/select.h /usr/include/bits/select.h
memory.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
memory.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
memory.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
memory.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
memory.o: /usr/include/wchar.h /usr/include/bits/wchar.h
memory.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
memory.o: /usr/include/strings.h /usr/include/ctype.h
memory.o: /usr/include/sys/timeb.h /usr/include/sys/times.h memory.h
memory.o: inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/features.h
output.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
output.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
output.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
output.o: /usr/include/endian.h /usr/include/bits/endian.h
output.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
output.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
output.o: /usr/include/sys/types.h /usr/include/time.h
output.o: /usr/include/sys/select.h /usr/include/bits/select.h
output.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
output.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
output.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
output.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
output.o: /usr/include/wchar.h /usr/include/bits/wchar.h
output.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
output.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
output.o: /usr/include/ctype.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/features.h
parse.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
parse.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
parse.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
parse.o: /usr/include/endian.h /usr/include/bits/endian.h
parse.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
parse.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
parse.o: /usr/include/sys/types.h /usr/include/time.h
parse.o: /usr/include/sys/select.h /usr/include/bits/select.h
parse.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
parse.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
parse.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
parse.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
parse.o: /usr/include/wchar.h /usr/include/bits/wchar.h
parse.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
parse.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
parse.o: /usr/include/ctype.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h /usr/include/string.h output.h
parse.o: parse.h
expressions.o: /usr/include/string.h /usr/include/features.h
expressions.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
expressions.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
expressions.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
expressions.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
expressions.o: /usr/include/endian.h /usr/include/bits/endian.h
expressions.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
expressions.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
expressions.o: /usr/include/sys/types.h /usr/include/time.h
expressions.o: /usr/include/sys/select.h /usr/include/bits/select.h
expressions.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
expressions.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
expressions.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
expressions.o: /usr/include/stdio.h /usr/include/libio.h
expressions.o: /usr/include/_G_config.h /usr/include/wchar.h
expressions.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
expressions.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
expressions.o: /usr/include/ctype.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/features.h
inst_pre.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_pre.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_pre.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_pre.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_pre.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_pre.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_pre.o: /usr/include/sys/types.h /usr/include/time.h
inst_pre.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_pre.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_pre.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_pre.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_pre.o: /usr/include/stdio.h /usr/include/libio.h
inst_pre.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_pre.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
inst_pre.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
inst_pre.o: /usr/include/ctype.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_easy.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_easy.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_easy.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_easy.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_easy.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_easy.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_easy.o: /usr/include/sys/types.h /usr/include/time.h
inst_easy.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_easy.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_easy.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_easy.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_easy.o: /usr/include/stdio.h /usr/include/libio.h
inst_easy.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_easy.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_easy.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_easy.o: /usr/include/strings.h /usr/include/ctype.h
inst_easy.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_easy.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_easy.o: inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_hard.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_hard.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_hard.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_hard.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_hard.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_hard.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_hard.o: /usr/include/sys/types.h /usr/include/time.h
inst_hard.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_hard.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_hard.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_hard.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_hard.o: /usr/include/stdio.h /usr/include/libio.h
inst_hard.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_hard.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_hard.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_hard.o: /usr/include/strings.h /usr/include/ctype.h
inst_hard.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_hard.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_hard.o: inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_final.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_final.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_final.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_final.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_final.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_final.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_final.o: /usr/include/sys/types.h /usr/include/time.h
inst_final.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_final.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_final.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_final.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_final.o: /usr/include/stdio.h /usr/include/libio.h
inst_final.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_final.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_final.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_final.o: /usr/include/strings.h /usr/include/ctype.h
inst_final.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_final.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_final.o: inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/features.h
relax.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
relax.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
relax.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
relax.o: /usr/include/endian.h /usr/include/bits/endian.h
relax.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
relax.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
relax.o: /usr/include/sys/types.h /usr/include/time.h
relax.o: /usr/include/sys/select.h /usr/include/bits/select.h
relax.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
relax.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
relax.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
relax.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
relax.o: /usr/include/wchar.h /usr/include/bits/wchar.h
relax.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
relax.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
relax.o: /usr/include/ctype.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h /usr/include/string.h
relax.o: expressions.h relax.h search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/features.h
search.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
search.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
search.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
search.o: /usr/include/endian.h /usr/include/bits/endian.h
search.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
search.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
search.o: /usr/include/sys/types.h /usr/include/time.h
search.o: /usr/include/sys/select.h /usr/include/bits/select.h
search.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
search.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
search.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
search.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
search.o: /usr/include/wchar.h /usr/include/bits/wchar.h
search.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
search.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
search.o: /usr/include/ctype.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h /usr/include/string.h
search.o: expressions.h relax.h search.h
utility.o: /usr/include/string.h /usr/include/features.h
utility.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
utility.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
utility.o: /usr/include/xlocale.h utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
utility.o: /usr/include/endian.h /usr/include/bits/endian.h
utility.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
utility.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
utility.o: /usr/include/sys/types.h /usr/include/time.h
utility.o: /usr/include/sys/select.h /usr/include/bits/select.h
utility.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
utility.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
utility.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
utility.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
utility.o: /usr/include/wchar.h /usr/include/bits/wchar.h
utility.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
utility.o: /usr/include/strings.h /usr/include/ctype.h
utility.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
libff.o: libff.h ff.h /usr/include/stdlib.h /usr/include/features.h
libff.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
libff.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
libff.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
libff.o: /usr/include/endian.h /usr/include/bits/endian.h
libff.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
libff.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
libff.o: /usr/include/sys/types.h /usr/include/time.h
libff.o: /usr/include/sys/select.h /usr/include/bits/select.h
libff.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
libff.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
libff.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
libff.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
libff.o: /usr/include/wchar.h /usr/include/bits/wchar.h
libff.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
libff.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
libff.o: /usr/include/ctype.h /usr/include/sys/timeb.h
libff.o: /usr/include/sys/times.h memory.h /usr/include/string.h output.h
libff.o: parse.h expressions.h inst_pre.h inst_easy.h inst_hard.h
libff.o: inst_final.h
memory.o: /usr/include/string.h /usr/include/features.h
memory.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
memory.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
memory.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
memory.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
memory.o: /usr/include/endian.h /usr/include/bits/endian.h
memory.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
memory.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
memory.o: /usr/include/sys/types.h /usr/include/time.h
memory.o: /usr/include/sys/select.h /usr/include/bits/select.h
memory.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
memory.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
memory.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
memory.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
memory.o: /usr/include/wchar.h /usr/include/bits/wchar.h
memory.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
memory.o: /usr/include/strings.h /usr/include/ctype.h
memory.o: /usr/include/sys/timeb.h /usr/include/sys/times.h memory.h
memory.o: inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/features.h
output.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
output.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
output.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
output.o: /usr/include/endian.h /usr/include/bits/endian.h
output.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
output.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
output.o: /usr/include/sys/types.h /usr/include/time.h
output.o: /usr/include/sys/select.h /usr/include/bits/select.h
output.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
output.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
output.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
output.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
output.o: /usr/include/wchar.h /usr/include/bits/wchar.h
output.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
output.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
output.o: /usr/include/ctype.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/features.h
parse.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
parse.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
parse.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
parse.o: /usr/include/endian.h /usr/include/bits/endian.h
parse.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
parse.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
parse.o: /usr/include/sys/types.h /usr/include/time.h
parse.o: /usr/include/sys/select.h /usr/include/bits/select.h
parse.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
parse.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
parse.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
parse.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
parse.o: /usr/include/wchar.h /usr/include/bits/wchar.h
parse.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
parse.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
parse.o: /usr/include/ctype.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h /usr/include/string.h output.h
parse.o: parse.h
expressions.o: /usr/include/string.h /usr/include/features.h
expressions.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
expressions.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
expressions.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
expressions.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
expressions.o: /usr/include/endian.h /usr/include/bits/endian.h
expressions.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
expressions.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
expressions.o: /usr/include/sys/types.h /usr/include/time.h
expressions.o: /usr/include/sys/select.h /usr/include/bits/select.h
expressions.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
expressions.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
expressions.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
expressions.o: /usr/include/stdio.h /usr/include/libio.h
expressions.o: /usr/include/_G_config.h /usr/include/wchar.h
expressions.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
expressions.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
expressions.o: /usr/include/ctype.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/features.h
inst_pre.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_pre.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_pre.o: /usr/include/xlocale.h ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_pre.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_pre.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_pre.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_pre.o: /usr/include/sys/types.h /usr/include/time.h
inst_pre.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_pre.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_pre.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_pre.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_pre.o: /usr/include/stdio.h /usr/include/libio.h
inst_pre.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_pre.o: /usr/include/bits/wchar.h /usr/include/bits/stdio_lim.h
inst_pre.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
inst_pre.o: /usr/include/ctype.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_easy.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_easy.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_easy.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_easy.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_easy.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_easy.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_easy.o: /usr/include/sys/types.h /usr/include/time.h
inst_easy.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_easy.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_easy.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_easy.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_easy.o: /usr/include/stdio.h /usr/include/libio.h
inst_easy.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_easy.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_easy.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_easy.o: /usr/include/strings.h /usr/include/ctype.h
inst_easy.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_easy.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_easy.o: inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_hard.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_hard.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_hard.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_hard.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_hard.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_hard.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_hard.o: /usr/include/sys/types.h /usr/include/time.h
inst_hard.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_hard.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_hard.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_hard.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_hard.o: /usr/include/stdio.h /usr/include/libio.h
inst_hard.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_hard.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_hard.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_hard.o: /usr/include/strings.h /usr/include/ctype.h
inst_hard.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_hard.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_hard.o: inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/features.h
inst_final.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
inst_final.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
inst_final.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
inst_final.o: /usr/include/endian.h /usr/include/bits/endian.h
inst_final.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
inst_final.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
inst_final.o: /usr/include/sys/types.h /usr/include/time.h
inst_final.o: /usr/include/sys/select.h /usr/include/bits/select.h
inst_final.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
inst_final.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
inst_final.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
inst_final.o: /usr/include/stdio.h /usr/include/libio.h
inst_final.o: /usr/include/_G_config.h /usr/include/wchar.h
inst_final.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
inst_final.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
inst_final.o: /usr/include/strings.h /usr/include/ctype.h
inst_final.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
inst_final.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_final.o: inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/features.h
relax.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
relax.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
relax.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
relax.o: /usr/include/endian.h /usr/include/bits/endian.h
relax.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
relax.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
relax.o: /usr/include/sys/types.h /usr/include/time.h
relax.o: /usr/include/sys/select.h /usr/include/bits/select.h
relax.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
relax.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
relax.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
relax.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
relax.o: /usr/include/wchar.h /usr/include/bits/wchar.h
relax.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
relax.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
relax.o: /usr/include/ctype.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h /usr/include/string.h
relax.o: expressions.h relax.h search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/features.h
search.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
search.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
search.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
search.o: /usr/include/endian.h /usr/include/bits/endian.h
search.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
search.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
search.o: /usr/include/sys/types.h /usr/include/time.h
search.o: /usr/include/sys/select.h /usr/include/bits/select.h
search.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
search.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
search.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
search.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
search.o: /usr/include/wchar.h /usr/include/bits/wchar.h
search.o: /usr/include/xlocale.h /usr/include/bits/stdio_lim.h
search.o: /usr/include/bits/sys_errlist.h /usr/include/strings.h
search.o: /usr/include/ctype.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h /usr/include/string.h
search.o: expressions.h relax.h search.h
utility.o: /usr/include/string.h /usr/include/features.h
utility.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
utility.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
utility.o: /usr/include/xlocale.h utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
utility.o: /usr/include/endian.h /usr/include/bits/endian.h
utility.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
utility.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
utility.o: /usr/include/sys/types.h /usr/include/time.h
utility.o: /usr/include/sys/select.h /usr/include/bits/select.h
utility.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
utility.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
utility.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
utility.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
utility.o: /usr/include/wchar.h /usr/include/bits/wchar.h
utility.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
utility.o: /usr/include/strings.h /usr/include/ctype.h
utility.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
test_main.o: libff.h ff.h /usr/include/stdlib.h /usr/include/features.h
test_main.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
test_main.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
test_main.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
test_main.o: /usr/include/endian.h /usr/include/bits/endian.h
test_main.o: /usr/include/bits/byteswap.h /usr/include/bits/types.h
test_main.o: /usr/include/bits/typesizes.h /usr/include/bits/byteswap-16.h
test_main.o: /usr/include/sys/types.h /usr/include/time.h
test_main.o: /usr/include/sys/select.h /usr/include/bits/select.h
test_main.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
test_main.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
test_main.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
test_main.o: /usr/include/stdio.h /usr/include/libio.h
test_main.o: /usr/include/_G_config.h /usr/include/wchar.h
test_main.o: /usr/include/bits/wchar.h /usr/include/xlocale.h
test_main.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
test_main.o: /usr/include/strings.h /usr/include/ctype.h
test_main.o: /usr/include/sys/timeb.h /usr/include/sys/times.h output.h
