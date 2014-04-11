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

main.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
main.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
main.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
main.o: /usr/include/sys/_symbol_aliasing.h
main.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
main.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
main.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
main.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
main.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
main.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
main.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
main.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
main.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
main.o: /usr/include/machine/types.h /usr/include/i386/types.h
main.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
main.o: /usr/include/secure/_common.h /usr/include/strings.h
main.o: /usr/include/string.h /usr/include/secure/_string.h
main.o: /usr/include/ctype.h /usr/include/runetype.h /usr/include/sys/types.h
main.o: /usr/include/sys/timeb.h /usr/include/sys/times.h memory.h output.h
main.o: parse.h expressions.h inst_pre.h inst_easy.h inst_hard.h inst_final.h
main.o: relax.h search.h
memory.o: /usr/include/string.h /usr/include/_types.h
memory.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
memory.o: /usr/include/sys/_symbol_aliasing.h
memory.o: /usr/include/sys/_posix_availability.h
memory.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
memory.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
memory.o: /usr/include/strings.h /usr/include/secure/_string.h
memory.o: /usr/include/secure/_common.h ff.h /usr/include/stdlib.h
memory.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
memory.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
memory.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
memory.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
memory.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
memory.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
memory.o: /usr/include/libkern/_OSByteOrder.h
memory.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
memory.o: /usr/include/machine/types.h /usr/include/i386/types.h
memory.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
memory.o: /usr/include/ctype.h /usr/include/runetype.h
memory.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
memory.o: /usr/include/sys/times.h memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
output.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
output.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
output.o: /usr/include/sys/_symbol_aliasing.h
output.o: /usr/include/sys/_posix_availability.h
output.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
output.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
output.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
output.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
output.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
output.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
output.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
output.o: /usr/include/libkern/_OSByteOrder.h
output.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
output.o: /usr/include/machine/types.h /usr/include/i386/types.h
output.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
output.o: /usr/include/secure/_common.h /usr/include/strings.h
output.o: /usr/include/string.h /usr/include/secure/_string.h
output.o: /usr/include/ctype.h /usr/include/runetype.h
output.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
parse.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
parse.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
parse.o: /usr/include/sys/_symbol_aliasing.h
parse.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
parse.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
parse.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
parse.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
parse.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
parse.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
parse.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
parse.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
parse.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
parse.o: /usr/include/machine/types.h /usr/include/i386/types.h
parse.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
parse.o: /usr/include/secure/_common.h /usr/include/strings.h
parse.o: /usr/include/string.h /usr/include/secure/_string.h
parse.o: /usr/include/ctype.h /usr/include/runetype.h
parse.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h output.h parse.h
expressions.o: /usr/include/string.h /usr/include/_types.h
expressions.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
expressions.o: /usr/include/sys/_symbol_aliasing.h
expressions.o: /usr/include/sys/_posix_availability.h
expressions.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
expressions.o: /usr/include/Availability.h
expressions.o: /usr/include/AvailabilityInternal.h /usr/include/strings.h
expressions.o: /usr/include/secure/_string.h /usr/include/secure/_common.h
expressions.o: ff.h /usr/include/stdlib.h /usr/include/sys/wait.h
expressions.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
expressions.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
expressions.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
expressions.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
expressions.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
expressions.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
expressions.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
expressions.o: /usr/include/machine/types.h /usr/include/i386/types.h
expressions.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
expressions.o: /usr/include/ctype.h /usr/include/runetype.h
expressions.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/_types.h
inst_pre.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_pre.o: /usr/include/sys/_symbol_aliasing.h
inst_pre.o: /usr/include/sys/_posix_availability.h
inst_pre.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_pre.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
inst_pre.o: /usr/include/strings.h /usr/include/secure/_string.h
inst_pre.o: /usr/include/secure/_common.h ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_pre.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_pre.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_pre.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_pre.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_pre.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_pre.o: /usr/include/libkern/_OSByteOrder.h
inst_pre.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_pre.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_pre.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_pre.o: /usr/include/ctype.h /usr/include/runetype.h
inst_pre.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_easy.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_easy.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_easy.o: /usr/include/sys/_symbol_aliasing.h
inst_easy.o: /usr/include/sys/_posix_availability.h
inst_easy.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_easy.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_easy.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_easy.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_easy.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_easy.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_easy.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_easy.o: /usr/include/libkern/_OSByteOrder.h
inst_easy.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_easy.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_easy.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_easy.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_easy.o: /usr/include/string.h /usr/include/secure/_string.h
inst_easy.o: /usr/include/ctype.h /usr/include/runetype.h
inst_easy.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_easy.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_easy.o: inst_pre.h inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_hard.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_hard.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_hard.o: /usr/include/sys/_symbol_aliasing.h
inst_hard.o: /usr/include/sys/_posix_availability.h
inst_hard.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_hard.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_hard.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_hard.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_hard.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_hard.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_hard.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_hard.o: /usr/include/libkern/_OSByteOrder.h
inst_hard.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_hard.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_hard.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_hard.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_hard.o: /usr/include/string.h /usr/include/secure/_string.h
inst_hard.o: /usr/include/ctype.h /usr/include/runetype.h
inst_hard.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_hard.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_hard.o: inst_pre.h inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_final.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_final.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_final.o: /usr/include/sys/_symbol_aliasing.h
inst_final.o: /usr/include/sys/_posix_availability.h
inst_final.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_final.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_final.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_final.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_final.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_final.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_final.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_final.o: /usr/include/libkern/_OSByteOrder.h
inst_final.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_final.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_final.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_final.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_final.o: /usr/include/string.h /usr/include/secure/_string.h
inst_final.o: /usr/include/ctype.h /usr/include/runetype.h
inst_final.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_final.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_final.o: inst_pre.h inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
relax.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
relax.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
relax.o: /usr/include/sys/_symbol_aliasing.h
relax.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
relax.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
relax.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
relax.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
relax.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
relax.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
relax.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
relax.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
relax.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
relax.o: /usr/include/machine/types.h /usr/include/i386/types.h
relax.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
relax.o: /usr/include/secure/_common.h /usr/include/strings.h
relax.o: /usr/include/string.h /usr/include/secure/_string.h
relax.o: /usr/include/ctype.h /usr/include/runetype.h
relax.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
relax.o: search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
search.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
search.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
search.o: /usr/include/sys/_symbol_aliasing.h
search.o: /usr/include/sys/_posix_availability.h
search.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
search.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
search.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
search.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
search.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
search.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
search.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
search.o: /usr/include/libkern/_OSByteOrder.h
search.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
search.o: /usr/include/machine/types.h /usr/include/i386/types.h
search.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
search.o: /usr/include/secure/_common.h /usr/include/strings.h
search.o: /usr/include/string.h /usr/include/secure/_string.h
search.o: /usr/include/ctype.h /usr/include/runetype.h
search.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
search.o: search.h
utility.o: /usr/include/string.h /usr/include/_types.h
utility.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
utility.o: /usr/include/sys/_symbol_aliasing.h
utility.o: /usr/include/sys/_posix_availability.h
utility.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
utility.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
utility.o: /usr/include/strings.h /usr/include/secure/_string.h
utility.o: /usr/include/secure/_common.h utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
utility.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
utility.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
utility.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
utility.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
utility.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
utility.o: /usr/include/libkern/_OSByteOrder.h
utility.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
utility.o: /usr/include/machine/types.h /usr/include/i386/types.h
utility.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
utility.o: /usr/include/ctype.h /usr/include/runetype.h
utility.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
utility.o: /usr/include/sys/times.h output.h
libff.o: libff.h ff.h /usr/include/stdlib.h /usr/include/Availability.h
libff.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
libff.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
libff.o: /usr/include/sys/_symbol_aliasing.h
libff.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
libff.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
libff.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
libff.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
libff.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
libff.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
libff.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
libff.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
libff.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
libff.o: /usr/include/machine/types.h /usr/include/i386/types.h
libff.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
libff.o: /usr/include/secure/_common.h /usr/include/strings.h
libff.o: /usr/include/string.h /usr/include/secure/_string.h
libff.o: /usr/include/ctype.h /usr/include/runetype.h
libff.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
libff.o: /usr/include/sys/times.h memory.h output.h parse.h expressions.h
libff.o: inst_pre.h inst_easy.h inst_hard.h inst_final.h
memory.o: /usr/include/string.h /usr/include/_types.h
memory.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
memory.o: /usr/include/sys/_symbol_aliasing.h
memory.o: /usr/include/sys/_posix_availability.h
memory.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
memory.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
memory.o: /usr/include/strings.h /usr/include/secure/_string.h
memory.o: /usr/include/secure/_common.h ff.h /usr/include/stdlib.h
memory.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
memory.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
memory.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
memory.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
memory.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
memory.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
memory.o: /usr/include/libkern/_OSByteOrder.h
memory.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
memory.o: /usr/include/machine/types.h /usr/include/i386/types.h
memory.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
memory.o: /usr/include/ctype.h /usr/include/runetype.h
memory.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
memory.o: /usr/include/sys/times.h memory.h inst_pre.h
output.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
output.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
output.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
output.o: /usr/include/sys/_symbol_aliasing.h
output.o: /usr/include/sys/_posix_availability.h
output.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
output.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
output.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
output.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
output.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
output.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
output.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
output.o: /usr/include/libkern/_OSByteOrder.h
output.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
output.o: /usr/include/machine/types.h /usr/include/i386/types.h
output.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
output.o: /usr/include/secure/_common.h /usr/include/strings.h
output.o: /usr/include/string.h /usr/include/secure/_string.h
output.o: /usr/include/ctype.h /usr/include/runetype.h
output.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
output.o: /usr/include/sys/times.h utility.h output.h
parse.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
parse.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
parse.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
parse.o: /usr/include/sys/_symbol_aliasing.h
parse.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
parse.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
parse.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
parse.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
parse.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
parse.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
parse.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
parse.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
parse.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
parse.o: /usr/include/machine/types.h /usr/include/i386/types.h
parse.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
parse.o: /usr/include/secure/_common.h /usr/include/strings.h
parse.o: /usr/include/string.h /usr/include/secure/_string.h
parse.o: /usr/include/ctype.h /usr/include/runetype.h
parse.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
parse.o: /usr/include/sys/times.h memory.h output.h parse.h
expressions.o: /usr/include/string.h /usr/include/_types.h
expressions.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
expressions.o: /usr/include/sys/_symbol_aliasing.h
expressions.o: /usr/include/sys/_posix_availability.h
expressions.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
expressions.o: /usr/include/Availability.h
expressions.o: /usr/include/AvailabilityInternal.h /usr/include/strings.h
expressions.o: /usr/include/secure/_string.h /usr/include/secure/_common.h
expressions.o: ff.h /usr/include/stdlib.h /usr/include/sys/wait.h
expressions.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
expressions.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
expressions.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
expressions.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
expressions.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
expressions.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
expressions.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
expressions.o: /usr/include/machine/types.h /usr/include/i386/types.h
expressions.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
expressions.o: /usr/include/ctype.h /usr/include/runetype.h
expressions.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
expressions.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: /usr/include/string.h /usr/include/_types.h
inst_pre.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_pre.o: /usr/include/sys/_symbol_aliasing.h
inst_pre.o: /usr/include/sys/_posix_availability.h
inst_pre.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_pre.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
inst_pre.o: /usr/include/strings.h /usr/include/secure/_string.h
inst_pre.o: /usr/include/secure/_common.h ff.h /usr/include/stdlib.h
inst_pre.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_pre.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_pre.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_pre.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_pre.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_pre.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_pre.o: /usr/include/libkern/_OSByteOrder.h
inst_pre.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_pre.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_pre.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_pre.o: /usr/include/ctype.h /usr/include/runetype.h
inst_pre.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_pre.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_pre.o: inst_pre.h
inst_easy.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_easy.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_easy.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_easy.o: /usr/include/sys/_symbol_aliasing.h
inst_easy.o: /usr/include/sys/_posix_availability.h
inst_easy.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_easy.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_easy.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_easy.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_easy.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_easy.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_easy.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_easy.o: /usr/include/libkern/_OSByteOrder.h
inst_easy.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_easy.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_easy.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_easy.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_easy.o: /usr/include/string.h /usr/include/secure/_string.h
inst_easy.o: /usr/include/ctype.h /usr/include/runetype.h
inst_easy.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_easy.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_easy.o: inst_pre.h inst_easy.h
inst_hard.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_hard.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_hard.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_hard.o: /usr/include/sys/_symbol_aliasing.h
inst_hard.o: /usr/include/sys/_posix_availability.h
inst_hard.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_hard.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_hard.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_hard.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_hard.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_hard.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_hard.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_hard.o: /usr/include/libkern/_OSByteOrder.h
inst_hard.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_hard.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_hard.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_hard.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_hard.o: /usr/include/string.h /usr/include/secure/_string.h
inst_hard.o: /usr/include/ctype.h /usr/include/runetype.h
inst_hard.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_hard.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_hard.o: inst_pre.h inst_hard.h
inst_final.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
inst_final.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
inst_final.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
inst_final.o: /usr/include/sys/_symbol_aliasing.h
inst_final.o: /usr/include/sys/_posix_availability.h
inst_final.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
inst_final.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
inst_final.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
inst_final.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
inst_final.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
inst_final.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
inst_final.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
inst_final.o: /usr/include/libkern/_OSByteOrder.h
inst_final.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
inst_final.o: /usr/include/machine/types.h /usr/include/i386/types.h
inst_final.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
inst_final.o: /usr/include/secure/_common.h /usr/include/strings.h
inst_final.o: /usr/include/string.h /usr/include/secure/_string.h
inst_final.o: /usr/include/ctype.h /usr/include/runetype.h
inst_final.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
inst_final.o: /usr/include/sys/times.h output.h memory.h expressions.h
inst_final.o: inst_pre.h inst_final.h
relax.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
relax.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
relax.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
relax.o: /usr/include/sys/_symbol_aliasing.h
relax.o: /usr/include/sys/_posix_availability.h /usr/include/machine/_types.h
relax.o: /usr/include/i386/_types.h /usr/include/sys/wait.h
relax.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
relax.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
relax.o: /usr/include/i386/_structs.h /usr/include/sys/_structs.h
relax.o: /usr/include/machine/_structs.h /usr/include/sys/resource.h
relax.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
relax.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
relax.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
relax.o: /usr/include/machine/types.h /usr/include/i386/types.h
relax.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
relax.o: /usr/include/secure/_common.h /usr/include/strings.h
relax.o: /usr/include/string.h /usr/include/secure/_string.h
relax.o: /usr/include/ctype.h /usr/include/runetype.h
relax.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
relax.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
relax.o: search.h
search.o: ff.h /usr/include/stdlib.h /usr/include/Availability.h
search.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
search.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
search.o: /usr/include/sys/_symbol_aliasing.h
search.o: /usr/include/sys/_posix_availability.h
search.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
search.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
search.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
search.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
search.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
search.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
search.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
search.o: /usr/include/libkern/_OSByteOrder.h
search.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
search.o: /usr/include/machine/types.h /usr/include/i386/types.h
search.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
search.o: /usr/include/secure/_common.h /usr/include/strings.h
search.o: /usr/include/string.h /usr/include/secure/_string.h
search.o: /usr/include/ctype.h /usr/include/runetype.h
search.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
search.o: /usr/include/sys/times.h output.h memory.h expressions.h relax.h
search.o: search.h
utility.o: /usr/include/string.h /usr/include/_types.h
utility.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
utility.o: /usr/include/sys/_symbol_aliasing.h
utility.o: /usr/include/sys/_posix_availability.h
utility.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
utility.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
utility.o: /usr/include/strings.h /usr/include/secure/_string.h
utility.o: /usr/include/secure/_common.h utility.h ff.h /usr/include/stdlib.h
utility.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
utility.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
utility.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
utility.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
utility.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
utility.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
utility.o: /usr/include/libkern/_OSByteOrder.h
utility.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
utility.o: /usr/include/machine/types.h /usr/include/i386/types.h
utility.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
utility.o: /usr/include/ctype.h /usr/include/runetype.h
utility.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
utility.o: /usr/include/sys/times.h output.h
test_main.o: libff.h ff.h /usr/include/stdlib.h /usr/include/Availability.h
test_main.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
test_main.o: /usr/include/sys/_types.h /usr/include/sys/cdefs.h
test_main.o: /usr/include/sys/_symbol_aliasing.h
test_main.o: /usr/include/sys/_posix_availability.h
test_main.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
test_main.o: /usr/include/sys/wait.h /usr/include/sys/signal.h
test_main.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
test_main.o: /usr/include/i386/signal.h /usr/include/i386/_structs.h
test_main.o: /usr/include/sys/_structs.h /usr/include/machine/_structs.h
test_main.o: /usr/include/sys/resource.h /usr/include/machine/endian.h
test_main.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
test_main.o: /usr/include/libkern/_OSByteOrder.h
test_main.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
test_main.o: /usr/include/machine/types.h /usr/include/i386/types.h
test_main.o: /usr/include/stdio.h /usr/include/secure/_stdio.h
test_main.o: /usr/include/secure/_common.h /usr/include/strings.h
test_main.o: /usr/include/string.h /usr/include/secure/_string.h
test_main.o: /usr/include/ctype.h /usr/include/runetype.h
test_main.o: /usr/include/sys/types.h /usr/include/sys/timeb.h
test_main.o: /usr/include/sys/times.h output.h
