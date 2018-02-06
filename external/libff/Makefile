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

main.o: ff.h /usr/include/stdlib.h 
main.o:  /usr/include/sys/cdefs.h
main.o: 
main.o:  
main.o:  /usr/include/sys/wait.h
main.o: /usr/include/sys/signal.h 
main.o:  
main.o:  
main.o:  /usr/include/sys/resource.h
main.o: /usr/include/endian.h /usr/include/endian.h
main.o:  
main.o:  /usr/include/alloca.h
main.o:  
main.o: /usr/include/stdio.h 
main.o:  /usr/include/strings.h
main.o: /usr/include/string.h 
main.o: /usr/include/ctype.h  /usr/include/sys/types.h
main.o: /usr/include/sys/timeb.h /usr/include/sys/times.h memory.h output.h
main.o: parse.h expressions.h inst_pre.h inst_easy.h inst_hard.h inst_final.h
main.o: relax.h search.h
memory.o: /usr/include/string.h 
memory.o:  /usr/include/sys/cdefs.h
memory.o: 
memory.o: 
memory.o:  
memory.o:  
memory.o: /usr/include/strings.h 
memory.o:  ff.h /usr/include/stdlib.h
memory.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
memory.o:  
memory.o:  
memory.o:  
memory.o: /usr/include/sys/resource.h /usr/include/endian.h
memory.o: /usr/include/endian.h 
memory.o: 
memory.o:  /usr/include/alloca.h
memory.o:  
memory.o: /usr/include/stdio.h 
memory.o: /usr/include/ctype.h 
memory.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
memory.o: /usr/include/sys/times.h memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h 
output.o:  
output.o:  /usr/include/sys/cdefs.h
output.o: 
output.o: 
output.o:  
output.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
output.o:  
output.o:  
output.o:  
output.o: /usr/include/sys/resource.h /usr/include/endian.h
output.o: /usr/include/endian.h 
output.o: 
output.o:  /usr/include/alloca.h
output.o:  
output.o: /usr/include/stdio.h 
output.o:  /usr/include/strings.h
output.o: /usr/include/string.h 
output.o: /usr/include/ctype.h 
output.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h 
parse.o:  
parse.o:  /usr/include/sys/cdefs.h
parse.o: 
parse.o:  
parse.o:  /usr/include/sys/wait.h
parse.o: /usr/include/sys/signal.h 
parse.o:  
parse.o:  
parse.o:  /usr/include/sys/resource.h
parse.o: /usr/include/endian.h /usr/include/endian.h
parse.o:  
parse.o:  /usr/include/alloca.h
parse.o:  
parse.o: /usr/include/stdio.h 
parse.o:  /usr/include/strings.h
parse.o: /usr/include/string.h 
parse.o: /usr/include/ctype.h 
parse.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h output.h parse.h
expressions.o: /usr/include/string.h 
expressions.o:  /usr/include/sys/cdefs.h
expressions.o: 
expressions.o: 
expressions.o:  
expressions.o: 
expressions.o:  /usr/include/strings.h
expressions.o:  
expressions.o: ff.h /usr/include/stdlib.h /usr/include/sys/wait.h
expressions.o: /usr/include/sys/signal.h 
expressions.o:  
expressions.o:  
expressions.o:  /usr/include/sys/resource.h
expressions.o: /usr/include/endian.h /usr/include/endian.h
expressions.o:  
expressions.o:  /usr/include/alloca.h
expressions.o:  
expressions.o: /usr/include/stdio.h 
expressions.o: /usr/include/ctype.h 
expressions.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h 
inst_pre.o:  /usr/include/sys/cdefs.h
inst_pre.o: 
inst_pre.o: 
inst_pre.o:  
inst_pre.o:  
inst_pre.o: /usr/include/strings.h 
inst_pre.o:  ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_pre.o:  
inst_pre.o:  
inst_pre.o:  
inst_pre.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_pre.o: /usr/include/endian.h 
inst_pre.o: 
inst_pre.o:  /usr/include/alloca.h
inst_pre.o:  
inst_pre.o: /usr/include/stdio.h 
inst_pre.o: /usr/include/ctype.h 
inst_pre.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h 
inst_easy.o:  
inst_easy.o:  /usr/include/sys/cdefs.h
inst_easy.o: 
inst_easy.o: 
inst_easy.o:  
inst_easy.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_easy.o:  
inst_easy.o:  
inst_easy.o:  
inst_easy.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_easy.o: /usr/include/endian.h 
inst_easy.o: 
inst_easy.o:  /usr/include/alloca.h
inst_easy.o:  
inst_easy.o: /usr/include/stdio.h 
inst_easy.o:  /usr/include/strings.h
inst_easy.o: /usr/include/string.h 
inst_easy.o: /usr/include/ctype.h 
inst_easy.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_easy.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_easy.o: inst_pre.h inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h 
inst_hard.o:  
inst_hard.o:  /usr/include/sys/cdefs.h
inst_hard.o: 
inst_hard.o: 
inst_hard.o:  
inst_hard.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_hard.o:  
inst_hard.o:  
inst_hard.o:  
inst_hard.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_hard.o: /usr/include/endian.h 
inst_hard.o: 
inst_hard.o:  /usr/include/alloca.h
inst_hard.o:  
inst_hard.o: /usr/include/stdio.h 
inst_hard.o:  /usr/include/strings.h
inst_hard.o: /usr/include/string.h 
inst_hard.o: /usr/include/ctype.h 
inst_hard.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_hard.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_hard.o: inst_pre.h inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h 
inst_final.o:  
inst_final.o:  /usr/include/sys/cdefs.h
inst_final.o: 
inst_final.o: 
inst_final.o:  
inst_final.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_final.o:  
inst_final.o:  
inst_final.o:  
inst_final.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_final.o: /usr/include/endian.h 
inst_final.o: 
inst_final.o:  /usr/include/alloca.h
inst_final.o:  
inst_final.o: /usr/include/stdio.h 
inst_final.o:  /usr/include/strings.h
inst_final.o: /usr/include/string.h 
inst_final.o: /usr/include/ctype.h 
inst_final.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_final.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_final.o: inst_pre.h inst_final.h
relax.o: ff.h /usr/include/stdlib.h 
relax.o:  
relax.o:  /usr/include/sys/cdefs.h
relax.o: 
relax.o:  
relax.o:  /usr/include/sys/wait.h
relax.o: /usr/include/sys/signal.h 
relax.o:  
relax.o:  
relax.o:  /usr/include/sys/resource.h
relax.o: /usr/include/endian.h /usr/include/endian.h
relax.o:  
relax.o:  /usr/include/alloca.h
relax.o:  
relax.o: /usr/include/stdio.h 
relax.o:  /usr/include/strings.h
relax.o: /usr/include/string.h 
relax.o: /usr/include/ctype.h 
relax.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
relax.o: search.h
search.o: ff.h /usr/include/stdlib.h 
search.o:  
search.o:  /usr/include/sys/cdefs.h
search.o: 
search.o: 
search.o:  
search.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
search.o:  
search.o:  
search.o:  
search.o: /usr/include/sys/resource.h /usr/include/endian.h
search.o: /usr/include/endian.h 
search.o: 
search.o:  /usr/include/alloca.h
search.o:  
search.o: /usr/include/stdio.h 
search.o:  /usr/include/strings.h
search.o: /usr/include/string.h 
search.o: /usr/include/ctype.h 
search.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
search.o: search.h
utility.o: /usr/include/string.h 
utility.o:  /usr/include/sys/cdefs.h
utility.o: 
utility.o: 
utility.o:  
utility.o:  
utility.o: /usr/include/strings.h 
utility.o:  utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
utility.o:  
utility.o:  
utility.o:  
utility.o: /usr/include/sys/resource.h /usr/include/endian.h
utility.o: /usr/include/endian.h 
utility.o: 
utility.o:  /usr/include/alloca.h
utility.o:  
utility.o: /usr/include/stdio.h 
utility.o: /usr/include/ctype.h 
utility.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
utility.o: /usr/include/sys/times.h output.h
libff.o: libff.h ff.h /usr/include/stdlib.h 
libff.o:  
libff.o:  /usr/include/sys/cdefs.h
libff.o: 
libff.o:  
libff.o:  /usr/include/sys/wait.h
libff.o: /usr/include/sys/signal.h 
libff.o:  
libff.o:  
libff.o:  /usr/include/sys/resource.h
libff.o: /usr/include/endian.h /usr/include/endian.h
libff.o:  
libff.o:  /usr/include/alloca.h
libff.o:  
libff.o: /usr/include/stdio.h 
libff.o:  /usr/include/strings.h
libff.o: /usr/include/string.h 
libff.o: /usr/include/ctype.h 
libff.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
libff.o: /usr/include/sys/times.h memory.h output.h parse.h expressions.h
libff.o: inst_pre.h inst_easy.h inst_hard.h inst_final.h
memory.o: /usr/include/string.h 
memory.o:  /usr/include/sys/cdefs.h
memory.o: 
memory.o: 
memory.o:  
memory.o:  
memory.o: /usr/include/strings.h 
memory.o:  ff.h /usr/include/stdlib.h
memory.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
memory.o:  
memory.o:  
memory.o:  
memory.o: /usr/include/sys/resource.h /usr/include/endian.h
memory.o: /usr/include/endian.h 
memory.o: 
memory.o:  /usr/include/alloca.h
memory.o:  
memory.o: /usr/include/stdio.h 
memory.o: /usr/include/ctype.h 
memory.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
memory.o: /usr/include/sys/times.h memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h 
output.o:  
output.o:  /usr/include/sys/cdefs.h
output.o: 
output.o: 
output.o:  
output.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
output.o:  
output.o:  
output.o:  
output.o: /usr/include/sys/resource.h /usr/include/endian.h
output.o: /usr/include/endian.h 
output.o: 
output.o:  /usr/include/alloca.h
output.o:  
output.o: /usr/include/stdio.h 
output.o:  /usr/include/strings.h
output.o: /usr/include/string.h 
output.o: /usr/include/ctype.h 
output.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h 
parse.o:  
parse.o:  /usr/include/sys/cdefs.h
parse.o: 
parse.o:  
parse.o:  /usr/include/sys/wait.h
parse.o: /usr/include/sys/signal.h 
parse.o:  
parse.o:  
parse.o:  /usr/include/sys/resource.h
parse.o: /usr/include/endian.h /usr/include/endian.h
parse.o:  
parse.o:  /usr/include/alloca.h
parse.o:  
parse.o: /usr/include/stdio.h 
parse.o:  /usr/include/strings.h
parse.o: /usr/include/string.h 
parse.o: /usr/include/ctype.h 
parse.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h output.h parse.h
expressions.o: /usr/include/string.h 
expressions.o:  /usr/include/sys/cdefs.h
expressions.o: 
expressions.o: 
expressions.o:  
expressions.o: 
expressions.o:  /usr/include/strings.h
expressions.o:  
expressions.o: ff.h /usr/include/stdlib.h /usr/include/sys/wait.h
expressions.o: /usr/include/sys/signal.h 
expressions.o:  
expressions.o:  
expressions.o:  /usr/include/sys/resource.h
expressions.o: /usr/include/endian.h /usr/include/endian.h
expressions.o:  
expressions.o:  /usr/include/alloca.h
expressions.o:  
expressions.o: /usr/include/stdio.h 
expressions.o: /usr/include/ctype.h 
expressions.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h 
inst_pre.o:  /usr/include/sys/cdefs.h
inst_pre.o: 
inst_pre.o: 
inst_pre.o:  
inst_pre.o:  
inst_pre.o: /usr/include/strings.h 
inst_pre.o:  ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_pre.o:  
inst_pre.o:  
inst_pre.o:  
inst_pre.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_pre.o: /usr/include/endian.h 
inst_pre.o: 
inst_pre.o:  /usr/include/alloca.h
inst_pre.o:  
inst_pre.o: /usr/include/stdio.h 
inst_pre.o: /usr/include/ctype.h 
inst_pre.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h 
inst_easy.o:  
inst_easy.o:  /usr/include/sys/cdefs.h
inst_easy.o: 
inst_easy.o: 
inst_easy.o:  
inst_easy.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_easy.o:  
inst_easy.o:  
inst_easy.o:  
inst_easy.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_easy.o: /usr/include/endian.h 
inst_easy.o: 
inst_easy.o:  /usr/include/alloca.h
inst_easy.o:  
inst_easy.o: /usr/include/stdio.h 
inst_easy.o:  /usr/include/strings.h
inst_easy.o: /usr/include/string.h 
inst_easy.o: /usr/include/ctype.h 
inst_easy.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_easy.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_easy.o: inst_pre.h inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h 
inst_hard.o:  
inst_hard.o:  /usr/include/sys/cdefs.h
inst_hard.o: 
inst_hard.o: 
inst_hard.o:  
inst_hard.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_hard.o:  
inst_hard.o:  
inst_hard.o:  
inst_hard.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_hard.o: /usr/include/endian.h 
inst_hard.o: 
inst_hard.o:  /usr/include/alloca.h
inst_hard.o:  
inst_hard.o: /usr/include/stdio.h 
inst_hard.o:  /usr/include/strings.h
inst_hard.o: /usr/include/string.h 
inst_hard.o: /usr/include/ctype.h 
inst_hard.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_hard.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_hard.o: inst_pre.h inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h 
inst_final.o:  
inst_final.o:  /usr/include/sys/cdefs.h
inst_final.o: 
inst_final.o: 
inst_final.o:  
inst_final.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_final.o:  
inst_final.o:  
inst_final.o:  
inst_final.o: /usr/include/sys/resource.h /usr/include/endian.h
inst_final.o: /usr/include/endian.h 
inst_final.o: 
inst_final.o:  /usr/include/alloca.h
inst_final.o:  
inst_final.o: /usr/include/stdio.h 
inst_final.o:  /usr/include/strings.h
inst_final.o: /usr/include/string.h 
inst_final.o: /usr/include/ctype.h 
inst_final.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_final.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_final.o: inst_pre.h inst_final.h
relax.o: ff.h /usr/include/stdlib.h 
relax.o:  
relax.o:  /usr/include/sys/cdefs.h
relax.o: 
relax.o:  
relax.o:  /usr/include/sys/wait.h
relax.o: /usr/include/sys/signal.h 
relax.o:  
relax.o:  
relax.o:  /usr/include/sys/resource.h
relax.o: /usr/include/endian.h /usr/include/endian.h
relax.o:  
relax.o:  /usr/include/alloca.h
relax.o:  
relax.o: /usr/include/stdio.h 
relax.o:  /usr/include/strings.h
relax.o: /usr/include/string.h 
relax.o: /usr/include/ctype.h 
relax.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
relax.o: search.h
search.o: ff.h /usr/include/stdlib.h 
search.o:  
search.o:  /usr/include/sys/cdefs.h
search.o: 
search.o: 
search.o:  
search.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
search.o:  
search.o:  
search.o:  
search.o: /usr/include/sys/resource.h /usr/include/endian.h
search.o: /usr/include/endian.h 
search.o: 
search.o:  /usr/include/alloca.h
search.o:  
search.o: /usr/include/stdio.h 
search.o:  /usr/include/strings.h
search.o: /usr/include/string.h 
search.o: /usr/include/ctype.h 
search.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
search.o: search.h
utility.o: /usr/include/string.h 
utility.o:  /usr/include/sys/cdefs.h
utility.o: 
utility.o: 
utility.o:  
utility.o:  
utility.o: /usr/include/strings.h 
utility.o:  utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
utility.o:  
utility.o:  
utility.o:  
utility.o: /usr/include/sys/resource.h /usr/include/endian.h
utility.o: /usr/include/endian.h 
utility.o: 
utility.o:  /usr/include/alloca.h
utility.o:  
utility.o: /usr/include/stdio.h 
utility.o: /usr/include/ctype.h 
utility.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
utility.o: /usr/include/sys/times.h output.h
test_main.o: libff.h ff.h /usr/include/stdlib.h 
test_main.o:  /usr/include/sys/cdefs.h
test_main.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
test_main.o: /usr/include/sys/resource.h /usr/include/endian.h
test_main.o: /usr/include/endian.h
test_main.o: 
test_main.o:  /usr/include/alloca.h
test_main.o:  
test_main.o: /usr/include/stdio.h 
test_main.o: /usr/include/string.h 
test_main.o: /usr/include/ctype.h 
test_main.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
test_main.o: /usr/include/sys/times.h output.h
