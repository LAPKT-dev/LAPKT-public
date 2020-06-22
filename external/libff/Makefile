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

main.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
main.o: /usr/include/strings.h /usr/include/features.h
main.o: /usr/include/stdc-predef.h /usr/include/ctype.h memory.h
main.o: /usr/include/string.h output.h parse.h expressions.h inst_pre.h
main.o: inst_easy.h inst_hard.h inst_final.h relax.h search.h
memory.o: /usr/include/string.h /usr/include/strings.h
memory.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
memory.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
memory.o: memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
output.o: /usr/include/strings.h /usr/include/features.h
output.o: /usr/include/stdc-predef.h /usr/include/ctype.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
parse.o: /usr/include/strings.h /usr/include/features.h
parse.o: /usr/include/stdc-predef.h /usr/include/ctype.h memory.h
parse.o: /usr/include/string.h output.h parse.h
expressions.o: /usr/include/string.h /usr/include/strings.h
expressions.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
expressions.o: /usr/include/stdlib.h /usr/include/stdio.h
expressions.o: /usr/include/ctype.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/strings.h
inst_pre.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
inst_pre.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
inst_pre.o: output.h memory.h expressions.h inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_easy.o: /usr/include/strings.h /usr/include/features.h
inst_easy.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_easy.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_easy.o: inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_hard.o: /usr/include/strings.h /usr/include/features.h
inst_hard.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_hard.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_hard.o: inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_final.o: /usr/include/strings.h /usr/include/features.h
inst_final.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_final.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_final.o: inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
relax.o: /usr/include/strings.h /usr/include/features.h
relax.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h memory.h
relax.o: /usr/include/string.h expressions.h relax.h search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
search.o: /usr/include/strings.h /usr/include/features.h
search.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h memory.h
search.o: /usr/include/string.h expressions.h relax.h search.h
utility.o: /usr/include/string.h /usr/include/strings.h
utility.o: /usr/include/features.h /usr/include/stdc-predef.h utility.h ff.h
utility.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
utility.o: output.h
libff.o: libff.h ff.h /usr/include/stdlib.h /usr/include/stdio.h
libff.o: /usr/include/strings.h /usr/include/features.h
libff.o: /usr/include/stdc-predef.h /usr/include/ctype.h memory.h
libff.o: /usr/include/string.h output.h parse.h expressions.h inst_pre.h
libff.o: inst_easy.h inst_hard.h inst_final.h
memory.o: /usr/include/string.h /usr/include/strings.h
memory.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
memory.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
memory.o: memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
output.o: /usr/include/strings.h /usr/include/features.h
output.o: /usr/include/stdc-predef.h /usr/include/ctype.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
parse.o: /usr/include/strings.h /usr/include/features.h
parse.o: /usr/include/stdc-predef.h /usr/include/ctype.h memory.h
parse.o: /usr/include/string.h output.h parse.h
expressions.o: /usr/include/string.h /usr/include/strings.h
expressions.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
expressions.o: /usr/include/stdlib.h /usr/include/stdio.h
expressions.o: /usr/include/ctype.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/strings.h
inst_pre.o: /usr/include/features.h /usr/include/stdc-predef.h ff.h
inst_pre.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
inst_pre.o: output.h memory.h expressions.h inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_easy.o: /usr/include/strings.h /usr/include/features.h
inst_easy.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_easy.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_easy.o: inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_hard.o: /usr/include/strings.h /usr/include/features.h
inst_hard.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_hard.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_hard.o: inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
inst_final.o: /usr/include/strings.h /usr/include/features.h
inst_final.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
inst_final.o: memory.h /usr/include/string.h expressions.h inst_pre.h
inst_final.o: inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
relax.o: /usr/include/strings.h /usr/include/features.h
relax.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h memory.h
relax.o: /usr/include/string.h expressions.h relax.h search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/stdio.h
search.o: /usr/include/strings.h /usr/include/features.h
search.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h memory.h
search.o: /usr/include/string.h expressions.h relax.h search.h
utility.o: /usr/include/string.h /usr/include/strings.h
utility.o: /usr/include/features.h /usr/include/stdc-predef.h utility.h ff.h
utility.o: /usr/include/stdlib.h /usr/include/stdio.h /usr/include/ctype.h
utility.o: output.h
test_main.o: libff.h ff.h /usr/include/stdlib.h /usr/include/stdio.h
test_main.o: /usr/include/strings.h /usr/include/features.h
test_main.o: /usr/include/stdc-predef.h /usr/include/ctype.h output.h
