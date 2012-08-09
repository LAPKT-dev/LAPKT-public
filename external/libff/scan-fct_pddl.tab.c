
/*  A Bison parser, made from scan-fct_pddl.y with Bison version GNU Bison version 1.22
  */

#define YYBISON 1  /* Identify Bison output.  */

#define yyparse fct_pddlparse
#define yylex fct_pddllex
#define yyerror fct_pddlerror
#define yylval fct_pddllval
#define yychar fct_pddlchar
#define yydebug fct_pddldebug
#define yynerrs fct_pddlnerrs
#define	DEFINE_TOK	258
#define	PROBLEM_TOK	259
#define	SITUATION_TOK	260
#define	BSITUATION_TOK	261
#define	OBJECTS_TOK	262
#define	BDOMAIN_TOK	263
#define	INIT_TOK	264
#define	GOAL_TOK	265
#define	METRIC_TOK	266
#define	AND_TOK	267
#define	NOT_TOK	268
#define	NAME	269
#define	VARIABLE	270
#define	NUM	271
#define	LE_TOK	272
#define	LEQ_TOK	273
#define	EQ_TOK	274
#define	GEQ_TOK	275
#define	GE_TOK	276
#define	MINUS_TOK	277
#define	AD_TOK	278
#define	MU_TOK	279
#define	DI_TOK	280
#define	FORALL_TOK	281
#define	IMPLY_TOK	282
#define	OR_TOK	283
#define	EXISTS_TOK	284
#define	EITHER_TOK	285
#define	OPEN_PAREN	286
#define	CLOSE_PAREN	287

#line 24 "scan-fct_pddl.y"

#ifdef YYDEBUG
  extern int yydebug=1;
#endif

#define YYMAXDEPTH 1000000

#include <stdio.h>
#include <string.h> 
#include "ff.h"
#include "memory.h"
#include "parse.h"


#ifndef SCAN_ERR
#define SCAN_ERR
#define DEFINE_EXPECTED            0
#define PROBLEM_EXPECTED           1
#define PROBNAME_EXPECTED          2
#define LBRACKET_EXPECTED          3
#define RBRACKET_EXPECTED          4
#define DOMDEFS_EXPECTED           5
#define REQUIREM_EXPECTED          6
#define TYPEDLIST_EXPECTED         7
#define DOMEXT_EXPECTED            8
#define DOMEXTNAME_EXPECTED        9
#define TYPEDEF_EXPECTED          10
#define CONSTLIST_EXPECTED        11
#define PREDDEF_EXPECTED          12 
#define NAME_EXPECTED             13
#define VARIABLE_EXPECTED         14
#define ACTIONFUNCTOR_EXPECTED    15
#define ATOM_FORMULA_EXPECTED     16
#define EFFECT_DEF_EXPECTED       17
#define NEG_FORMULA_EXPECTED      18
#define NOT_SUPPORTED             19
#define SITUATION_EXPECTED        20
#define SITNAME_EXPECTED          21
#define BDOMAIN_EXPECTED          22
#define BADDOMAIN                 23
#define INIFACTS                  24
#define GOALDEF                   25
#define ADLGOAL                   26
#endif


static char * serrmsg[] = {
  "'define' expected",
  "'problem' expected",
  "problem name expected",
  "'(' expected",
  "')' expected",
  "additional domain definitions expected",
  "requirements (e.g. ':strips') expected",
  "typed list of <%s> expected",
  "domain extension expected",
  "domain to be extented expected",
  "type definition expected",
  "list of constants expected",
  "predicate definition expected",
  "<name> expected",
  "<variable> expected",
  "action functor expected",
  "atomic formula expected",
  "effect definition expected",
  "negated atomic formula expected",
  "requirement %s not supported by this IPP version",  
  "'situation' expected",
  "situation name expected",
  "':domain' expected",
  "this problem needs another domain file",
  "initial facts definition expected",
  "goal definition expected",
  "first order logic expression expected",
  NULL
};


/* void fcterr( int errno, char *par ); */


static int sact_err;
static char *sact_err_par = NULL;
static Bool sis_negated = FALSE;


#line 115 "scan-fct_pddl.y"
typedef union {

  char string[MAX_LENGTH];
  char* pstring;
  ParseExpNode *pParseExpNode;
  PlNode* pPlNode;
  FactList* pFactList;
  TokenList* pTokenList;
  TypedList* pTypedList;

} YYSTYPE;

#ifndef YYLTYPE
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;

#define YYLTYPE yyltype
#endif

#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		197
#define	YYFLAG		-32768
#define	YYNTBASE	33

#define YYTRANSLATE(x) ((unsigned)(x) <= 287 ? yytranslate[x] : 62)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
    26,    27,    28,    29,    30,    31,    32
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     1,     4,     5,    12,    17,    22,    23,    26,    29,
    32,    35,    38,    43,    44,    50,    51,    57,    63,    69,
    75,    81,    87,    93,    95,   100,   105,   110,   116,   124,
   132,   133,   136,   138,   141,   143,   152,   158,   160,   165,
   170,   176,   182,   188,   194,   196,   201,   206,   212,   218,
   224,   230,   235,   237,   242,   247,   248,   251,   253,   255,
   257,   260,   261,   267,   272,   276,   279,   280,   286,   291,
   294,   296,   298,   301,   306,   308,   313,   314
};

static const short yyrhs[] = {    -1,
    34,    33,     0,     0,    31,     3,    35,    36,    38,    32,
     0,    31,     4,    14,    32,     0,    31,     8,    14,    32,
     0,     0,    39,    38,     0,    40,    38,     0,    42,    38,
     0,    37,    38,     0,    44,    38,     0,    31,     7,    56,
    32,     0,     0,    31,     9,    41,    47,    32,     0,     0,
    31,    10,    43,    45,    32,     0,    31,    11,    14,    50,
    32,     0,    31,    17,    49,    49,    32,     0,    31,    18,
    49,    49,    32,     0,    31,    19,    49,    49,    32,     0,
    31,    20,    49,    49,    32,     0,    31,    21,    49,    49,
    32,     0,    51,     0,    31,    12,    46,    32,     0,    31,
    28,    46,    32,     0,    31,    13,    45,    32,     0,    31,
    27,    45,    45,    32,     0,    31,    29,    31,    57,    32,
    45,    32,     0,    31,    26,    31,    57,    32,    45,    32,
     0,     0,    45,    46,     0,    48,     0,    48,    47,     0,
    59,     0,    31,    19,    31,    14,    61,    32,    16,    32,
     0,    31,    19,    14,    16,    32,     0,    16,     0,    31,
    14,    53,    32,     0,    31,    22,    49,    32,     0,    31,
    23,    49,    49,    32,     0,    31,    22,    49,    49,    32,
     0,    31,    24,    49,    49,    32,     0,    31,    25,    49,
    49,    32,     0,    16,     0,    31,    14,    61,    32,     0,
    31,    22,    50,    32,     0,    31,    23,    50,    50,    32,
     0,    31,    22,    50,    50,    32,     0,    31,    24,    50,
    50,    32,     0,    31,    25,    50,    50,    32,     0,    31,
    13,    52,    32,     0,    52,     0,    31,    58,    53,    32,
     0,    31,    19,    53,    32,     0,     0,    54,    53,     0,
    14,     0,    15,     0,    14,     0,    14,    55,     0,     0,
    14,    30,    55,    32,    56,     0,    14,    22,    14,    56,
     0,    22,    14,    56,     0,    14,    56,     0,     0,    15,
    30,    55,    32,    57,     0,    15,    22,    14,    57,     0,
    15,    57,     0,    14,     0,    59,     0,    59,     0,     0,
    31,    13,    60,    32,     0,    60,     0,    31,    58,    61,
    32,     0,     0,    14,    61,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   183,   185,   191,   196,   207,   217,   229,   231,   233,   235,
   237,   239,   245,   254,   259,   268,   273,   282,   310,   318,
   326,   334,   342,   350,   363,   369,   375,   381,   391,   406,
   428,   433,   452,   457,   467,   472,   489,   517,   525,   534,
   540,   547,   554,   561,   572,   580,   589,   595,   602,   609,
   616,   627,   633,   642,   649,   661,   666,   677,   683,   693,
   700,   712,   715,   724,   735,   740,   759,   762,   771,   782,
   803,   813,   818,   828,   838,   848,   859,   862
};

static const char * const yytname[] = {   "$","error","$illegal.","DEFINE_TOK",
"PROBLEM_TOK","SITUATION_TOK","BSITUATION_TOK","OBJECTS_TOK","BDOMAIN_TOK","INIT_TOK",
"GOAL_TOK","METRIC_TOK","AND_TOK","NOT_TOK","NAME","VARIABLE","NUM","LE_TOK",
"LEQ_TOK","EQ_TOK","GEQ_TOK","GE_TOK","MINUS_TOK","AD_TOK","MU_TOK","DI_TOK",
"FORALL_TOK","IMPLY_TOK","OR_TOK","EXISTS_TOK","EITHER_TOK","OPEN_PAREN","CLOSE_PAREN",
"file","problem_definition","@1","problem_name","base_domain_name","problem_defs",
"objects_def","init_def","@2","goal_def","@3","metric_def","adl_goal_description",
"adl_goal_description_star","init_el_plus","init_el","f_exp","ground_f_exp",
"literal_term","atomic_formula_term","term_star","term","name_plus","typed_list_name",
"typed_list_variable","predicate","literal_name","atomic_formula_name","name_star",
"name_star"
};
#endif

static const short yyr1[] = {     0,
    33,    33,    35,    34,    36,    37,    38,    38,    38,    38,
    38,    38,    39,    41,    40,    43,    42,    44,    45,    45,
    45,    45,    45,    45,    45,    45,    45,    45,    45,    45,
    46,    46,    47,    47,    48,    48,    48,    49,    49,    49,
    49,    49,    49,    49,    50,    50,    50,    50,    50,    50,
    50,    51,    51,    52,    52,    53,    53,    54,    54,    55,
    55,    56,    56,    56,    56,    56,    57,    57,    57,    57,
    58,    -1,    -1,    59,    59,    60,    61,    61
};

static const short yyr2[] = {     0,
     0,     2,     0,     6,     4,     4,     0,     2,     2,     2,
     2,     2,     4,     0,     5,     0,     5,     5,     5,     5,
     5,     5,     5,     1,     4,     4,     4,     5,     7,     7,
     0,     2,     1,     2,     1,     8,     5,     1,     4,     4,
     5,     5,     5,     5,     1,     4,     4,     5,     5,     5,
     5,     4,     1,     4,     4,     0,     2,     1,     1,     1,
     2,     0,     5,     4,     3,     2,     0,     5,     4,     2,
     1,     1,     2,     4,     1,     4,     0,     2
};

static const short yydefact[] = {     1,
     0,     1,     3,     2,     0,     0,     7,     0,     0,     7,
     0,     7,     7,     7,     7,     0,    62,     0,    14,    16,
     0,    11,     4,     8,     9,    10,    12,     5,    62,     0,
     0,     0,     0,     0,     0,     0,     0,    66,    62,    13,
     6,     0,     0,    33,    35,    75,     0,     0,    24,    53,
    45,     0,     0,    62,    60,     0,    65,     0,    71,     0,
    77,    15,    34,    31,     0,     0,     0,    56,     0,     0,
     0,     0,    31,     0,    56,    17,    77,     0,     0,     0,
     0,    18,    64,    61,    62,     0,     0,     0,     0,    77,
     0,    31,     0,     0,     0,    38,     0,     0,     0,    58,
    59,     0,     0,    56,     0,     0,    67,     0,     0,    67,
     0,     0,     0,     0,     0,     0,    63,    74,     0,    77,
    78,    76,    32,    25,    27,    52,    56,     0,     0,     0,
     0,     0,     0,     0,    55,    57,     0,     0,    67,     0,
     0,    26,     0,    54,    46,    47,     0,     0,     0,     0,
    37,     0,     0,     0,     0,     0,     0,    19,    20,    21,
    22,    23,     0,     0,    70,     0,    28,     0,    49,    48,
    50,    51,     0,    39,    40,     0,     0,     0,     0,    67,
     0,     0,     0,     0,    42,    41,    43,    44,    69,    67,
    30,    29,    36,    68,     0,     0,     0
};

static const short yydefgoto[] = {     4,
     2,     5,     7,    10,    11,    12,    13,    33,    14,    34,
    15,    92,    93,    43,    44,    98,    53,    49,    50,   103,
   104,    56,    31,   140,    61,    45,    46,    91
};

static const short yypact[] = {   -23,
    16,   -23,-32768,-32768,    13,    45,    22,    42,   114,    22,
    39,    22,    22,    22,    22,    43,     4,    63,-32768,-32768,
    64,-32768,-32768,-32768,-32768,-32768,-32768,-32768,    25,    66,
    56,    68,    70,    76,    -1,    94,    95,-32768,     4,-32768,
-32768,    29,    84,    70,-32768,-32768,    85,    96,-32768,-32768,
-32768,    59,    97,     4,    95,    98,-32768,   100,-32768,    -4,
   112,-32768,-32768,    76,    76,     1,     1,    -2,     1,     1,
   102,    76,    76,   104,    37,-32768,   112,    -1,    -1,    -1,
    -1,-32768,-32768,-32768,     4,   113,   106,   120,   123,   112,
   107,    76,   108,   109,   110,-32768,    71,     1,     1,-32768,
-32768,     1,   111,    37,     1,     1,   129,    76,   115,   129,
   116,   117,    30,    -1,    -1,    -1,-32768,-32768,   118,   112,
-32768,-32768,-32768,-32768,-32768,-32768,    37,     1,     1,     1,
     1,   119,   121,   122,-32768,-32768,   124,   125,    57,   126,
   127,-32768,   128,-32768,-32768,-32768,   130,   131,   132,   133,
-32768,   134,   135,    38,     1,     1,     1,-32768,-32768,-32768,
-32768,-32768,   138,    95,-32768,    76,-32768,    76,-32768,-32768,
-32768,-32768,   139,-32768,-32768,   136,   137,   140,   141,   129,
   142,   143,   144,   145,-32768,-32768,-32768,-32768,-32768,   129,
-32768,-32768,-32768,-32768,   146,   161,-32768
};

static const short yypgoto[] = {   170,
-32768,-32768,-32768,-32768,   105,-32768,-32768,-32768,-32768,-32768,
-32768,   -34,   -64,   101,-32768,   -65,   -56,-32768,   147,   -59,
-32768,   -54,   -18,  -104,   148,-32768,   149,   -70
};


#define	YYLAST		212


static const short yytable[] = {    48,
    84,    99,   102,   105,   106,   143,   112,     1,   109,    88,
    38,   100,   101,    96,    51,   111,    96,    29,     3,   121,
    57,   113,   114,   115,   116,    30,    89,   123,    97,    52,
    94,    97,   132,   133,   165,    83,   134,   108,    29,   137,
   138,    58,    59,     6,   136,    51,    36,    60,     8,   152,
   100,   101,     9,    96,    37,    16,   147,   148,   149,   150,
    52,   146,   154,   155,   156,   157,   117,   153,    97,   175,
    23,   139,    77,   141,    28,   189,    32,    35,   163,    39,
    78,    79,    80,    81,   127,   194,   164,    40,   176,   177,
   178,   179,   128,   129,   130,   131,    64,    65,    59,    41,
    42,    66,    67,    68,    69,    70,    47,    54,    55,   181,
    71,    72,    73,    74,    22,    62,    24,    25,    26,    27,
    17,    18,    19,    20,    21,    90,    59,    76,    82,    85,
    86,   182,   107,   183,   110,   119,   120,   118,   122,   124,
   125,   126,   135,   139,    63,   196,   142,   144,   145,   151,
   158,   180,   159,   160,   184,   161,   162,   166,   167,   168,
   197,   169,   170,   171,   172,   173,   174,   185,   186,   195,
     0,   187,   188,   190,   191,   192,   193,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,    87,     0,     0,     0,
     0,    95
};

static const short yycheck[] = {    34,
    55,    67,    68,    69,    70,   110,    77,    31,    73,    14,
    29,    14,    15,    16,    16,    75,    16,    14,     3,    90,
    39,    78,    79,    80,    81,    22,    31,    92,    31,    31,
    65,    31,    98,    99,   139,    54,   102,    72,    14,   105,
   106,    13,    14,    31,   104,    16,    22,    19,     4,   120,
    14,    15,    31,    16,    30,    14,   113,   114,   115,   116,
    31,    32,   128,   129,   130,   131,    85,   127,    31,    32,
    32,    15,    14,   108,    32,   180,    14,    14,    22,    14,
    22,    23,    24,    25,    14,   190,    30,    32,   154,   155,
   156,   157,    22,    23,    24,    25,    12,    13,    14,    32,
    31,    17,    18,    19,    20,    21,    31,    14,    14,   164,
    26,    27,    28,    29,    10,    32,    12,    13,    14,    15,
     7,     8,     9,    10,    11,    14,    14,    32,    32,    32,
    31,   166,    31,   168,    31,    16,    14,    32,    32,    32,
    32,    32,    32,    15,    44,     0,    32,    32,    32,    32,
    32,    14,    32,    32,    16,    32,    32,    32,    32,    32,
     0,    32,    32,    32,    32,    32,    32,    32,    32,     0,
    -1,    32,    32,    32,    32,    32,    32,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    47,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    58,    -1,    -1,    -1,
    -1,    65
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/local/lib/bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Bob Corbett and Richard Stallman

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */


#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#define YYLEX		yylex(&yylval, &yylloc)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_bcopy(FROM,TO,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_bcopy (from, to, count)
     char *from;
     char *to;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_bcopy (char *from, char *to, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif

#line 184 "/usr/local/lib/bison.simple"
int
yyparse()
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_bcopy ((char *)yyss1, (char *)yyss, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_bcopy ((char *)yyvs1, (char *)yyvs, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_bcopy ((char *)yyls1, (char *)yyls, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

case 3:
#line 193 "scan-fct_pddl.y"
{ 
  fcterr( PROBNAME_EXPECTED, NULL ); 
;
    break;}
case 4:
#line 197 "scan-fct_pddl.y"
{  
  gproblem_name = yyvsp[-2].pstring;
  if ( gcmd_line.display_info >= 1 ) {
    printf("\nproblem '%s' defined\n", gproblem_name);
  }
;
    break;}
case 5:
#line 209 "scan-fct_pddl.y"
{ 
  yyval.pstring = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy(yyval.pstring, yyvsp[-1].string);
;
    break;}
case 6:
#line 219 "scan-fct_pddl.y"
{ 
  if ( SAME != strcmp(yyvsp[-1].string, gdomain_name) ) {
    fcterr( BADDOMAIN, NULL );
    yyerror();
  }
;
    break;}
case 13:
#line 247 "scan-fct_pddl.y"
{ 
  gparse_objects = yyvsp[-1].pTypedList;
;
    break;}
case 14:
#line 256 "scan-fct_pddl.y"
{
  fcterr( INIFACTS, NULL ); 
;
    break;}
case 15:
#line 260 "scan-fct_pddl.y"
{
  gorig_initial_facts = new_PlNode(AND);
  gorig_initial_facts->sons = yyvsp[-1].pPlNode;
;
    break;}
case 16:
#line 270 "scan-fct_pddl.y"
{ 
  fcterr( GOALDEF, NULL ); 
;
    break;}
case 17:
#line 274 "scan-fct_pddl.y"
{
  yyvsp[-1].pPlNode->next = gorig_goal_facts;
  gorig_goal_facts = yyvsp[-1].pPlNode;
;
    break;}
case 18:
#line 284 "scan-fct_pddl.y"
{

  if ( gparse_metric != NULL ) {
    printf("\n\ndouble metric specification!\n\n");
    exit( 1 );
  }

  /* duh */
  gparse_optimization = malloc(10);

  strcpy(gparse_optimization, yyvsp[-2].string);
  gparse_metric = yyvsp[-1].pParseExpNode;

;
    break;}
case 19:
#line 312 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = LE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 20:
#line 320 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = LEQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 21:
#line 328 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = EQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 22:
#line 336 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = GEQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 23:
#line 344 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = GE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 24:
#line 352 "scan-fct_pddl.y"
{ 
  if ( sis_negated ) {
    yyval.pPlNode = new_PlNode(NOT);
    yyval.pPlNode->sons = new_PlNode(ATOM);
    yyval.pPlNode->sons->atom = yyvsp[0].pTokenList;
    sis_negated = FALSE;
  } else {
    yyval.pPlNode = new_PlNode(ATOM);
    yyval.pPlNode->atom = yyvsp[0].pTokenList;
  }
;
    break;}
case 25:
#line 365 "scan-fct_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(AND);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 26:
#line 371 "scan-fct_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(OR);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 27:
#line 377 "scan-fct_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(NOT);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 28:
#line 383 "scan-fct_pddl.y"
{ 
  PlNode *np = new_PlNode(NOT);
  np->sons = yyvsp[-2].pPlNode;
  np->next = yyvsp[-1].pPlNode;

  yyval.pPlNode = new_PlNode(OR);
  yyval.pPlNode->sons = np;
;
    break;}
case 29:
#line 395 "scan-fct_pddl.y"
{ 

  PlNode *pln;

  pln = new_PlNode(EX);
  pln->parse_vars = yyvsp[-3].pTypedList;

  yyval.pPlNode = pln;
  pln->sons = yyvsp[-1].pPlNode;

;
    break;}
case 30:
#line 410 "scan-fct_pddl.y"
{ 

  PlNode *pln;

  pln = new_PlNode(ALL);
  pln->parse_vars = yyvsp[-3].pTypedList;

  yyval.pPlNode = pln;
  pln->sons = yyvsp[-1].pPlNode;

;
    break;}
case 31:
#line 430 "scan-fct_pddl.y"
{
  yyval.pPlNode = NULL;
;
    break;}
case 32:
#line 435 "scan-fct_pddl.y"
{
  yyvsp[-1].pPlNode->next = yyvsp[0].pPlNode;
  yyval.pPlNode = yyvsp[-1].pPlNode;
;
    break;}
case 33:
#line 454 "scan-fct_pddl.y"
{
  yyval.pPlNode = yyvsp[0].pPlNode;
;
    break;}
case 34:
#line 459 "scan-fct_pddl.y"
{
   yyval.pPlNode = yyvsp[-1].pPlNode;
   yyval.pPlNode->next = yyvsp[0].pPlNode;
;
    break;}
case 35:
#line 469 "scan-fct_pddl.y"
{
  yyval.pPlNode = yyvsp[0].pPlNode;
;
    break;}
case 36:
#line 474 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode( COMP );
  yyval.pPlNode->comp = EQ;

  yyval.pPlNode->lh = new_ParseExpNode( FHEAD );
  yyval.pPlNode->lh->atom = new_TokenList();
  yyval.pPlNode->lh->atom->item = new_Token( strlen(yyvsp[-4].string)+1 );
  strcpy( yyval.pPlNode->lh->atom->item, yyvsp[-4].string );
  yyval.pPlNode->lh->atom->next = yyvsp[-3].pTokenList;

  yyval.pPlNode->rh = new_ParseExpNode( NUMBER );
  yyval.pPlNode->rh->atom = new_TokenList();
  yyval.pPlNode->rh->atom->item = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pPlNode->rh->atom->item, yyvsp[-1].string );
;
    break;}
case 37:
#line 491 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode( COMP );
  yyval.pPlNode->comp = EQ;

  yyval.pPlNode->lh = new_ParseExpNode( FHEAD );
  yyval.pPlNode->lh->atom = new_TokenList();
  yyval.pPlNode->lh->atom->item = new_Token( strlen(yyvsp[-2].string)+1 );
  strcpy( yyval.pPlNode->lh->atom->item, yyvsp[-2].string );

  yyval.pPlNode->rh = new_ParseExpNode( NUMBER );
  yyval.pPlNode->rh->atom = new_TokenList();
  yyval.pPlNode->rh->atom->item = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pPlNode->rh->atom->item, yyvsp[-1].string );
;
    break;}
case 38:
#line 519 "scan-fct_pddl.y"
{ 
  yyval.pParseExpNode = new_ParseExpNode( NUMBER );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[0].string );
;
    break;}
case 39:
#line 527 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( FHEAD );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[-2].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[-2].string );
  yyval.pParseExpNode->atom->next = yyvsp[-1].pTokenList;
;
    break;}
case 40:
#line 536 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MINUS );
  yyval.pParseExpNode->leftson = yyvsp[-1].pParseExpNode;
;
    break;}
case 41:
#line 542 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( AD );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 42:
#line 549 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( SU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 43:
#line 556 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 44:
#line 563 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( DI );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 45:
#line 574 "scan-fct_pddl.y"
{ 
  yyval.pParseExpNode = new_ParseExpNode( NUMBER );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[0].string );
;
    break;}
case 46:
#line 582 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( FHEAD );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[-2].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[-2].string );
  yyval.pParseExpNode->atom->next = yyvsp[-1].pTokenList;
;
    break;}
case 47:
#line 591 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MINUS );
  yyval.pParseExpNode->leftson = yyvsp[-1].pParseExpNode;
;
    break;}
case 48:
#line 597 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( AD );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 49:
#line 604 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( SU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 50:
#line 611 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 51:
#line 618 "scan-fct_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( DI );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 52:
#line 629 "scan-fct_pddl.y"
{ 
  yyval.pTokenList = yyvsp[-1].pTokenList;
  sis_negated = TRUE;
;
    break;}
case 53:
#line 635 "scan-fct_pddl.y"
{
  yyval.pTokenList = yyvsp[0].pTokenList;
;
    break;}
case 54:
#line 644 "scan-fct_pddl.y"
{ 
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = yyvsp[-2].pstring;
  yyval.pTokenList->next = yyvsp[-1].pTokenList;
;
    break;}
case 55:
#line 651 "scan-fct_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token( 5 );
  yyval.pTokenList->item = "=";
  yyval.pTokenList->next = yyvsp[-1].pTokenList;
;
    break;}
case 56:
#line 663 "scan-fct_pddl.y"
{
  yyval.pTokenList = NULL;
;
    break;}
case 57:
#line 668 "scan-fct_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = yyvsp[-1].pstring;
  yyval.pTokenList->next = yyvsp[0].pTokenList;
;
    break;}
case 58:
#line 679 "scan-fct_pddl.y"
{ 
  yyval.pstring = new_Token(strlen(yyvsp[0].string) + 1);
  strcpy(yyval.pstring, yyvsp[0].string);
;
    break;}
case 59:
#line 685 "scan-fct_pddl.y"
{ 
  yyval.pstring = new_Token(strlen(yyvsp[0].string) + 1);
  strcpy(yyval.pstring, yyvsp[0].string);
;
    break;}
case 60:
#line 695 "scan-fct_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token(strlen(yyvsp[0].string) + 1);
  strcpy(yyval.pTokenList->item, yyvsp[0].string);
;
    break;}
case 61:
#line 702 "scan-fct_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token(strlen(yyvsp[-1].string) + 1);
  strcpy(yyval.pTokenList->item, yyvsp[-1].string);
  yyval.pTokenList->next = yyvsp[0].pTokenList;
;
    break;}
case 62:
#line 714 "scan-fct_pddl.y"
{ yyval.pTypedList = NULL; ;
    break;}
case 63:
#line 717 "scan-fct_pddl.y"
{ 
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-4].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-4].string );
  yyval.pTypedList->type = yyvsp[-2].pTokenList;
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 64:
#line 726 "scan-fct_pddl.y"
{
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-3].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-3].string );
  yyval.pTypedList->type = new_TokenList();
  yyval.pTypedList->type->item = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pTypedList->type->item, yyvsp[-1].string );
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 65:
#line 737 "scan-fct_pddl.y"
{
  yyval.pTypedList = yyvsp[0].pTypedList;
;
    break;}
case 66:
#line 742 "scan-fct_pddl.y"
{
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-1].string );
  if ( yyvsp[0].pTypedList ) {/* another element (already typed) is following */
    yyval.pTypedList->type = copy_TokenList( yyvsp[0].pTypedList->type );
  } else {/* no further element - it must be an untyped list */
    yyval.pTypedList->type = new_TokenList();
    yyval.pTypedList->type->item = new_Token( strlen(STANDARD_TYPE)+1 );
    strcpy( yyval.pTypedList->type->item, STANDARD_TYPE );
  }
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 67:
#line 761 "scan-fct_pddl.y"
{ yyval.pTypedList = NULL; ;
    break;}
case 68:
#line 764 "scan-fct_pddl.y"
{ 
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-4].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-4].string );
  yyval.pTypedList->type = yyvsp[-2].pTokenList;
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 69:
#line 773 "scan-fct_pddl.y"
{
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-3].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-3].string );
  yyval.pTypedList->type = new_TokenList();
  yyval.pTypedList->type->item = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pTypedList->type->item, yyvsp[-1].string );
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 70:
#line 784 "scan-fct_pddl.y"
{
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-1].string );
  if ( yyvsp[0].pTypedList ) {/* another element (already typed) is following */
    yyval.pTypedList->type = copy_TokenList( yyvsp[0].pTypedList->type );
  } else {/* no further element - it must be an untyped list */
    yyval.pTypedList->type = new_TokenList();
    yyval.pTypedList->type->item = new_Token( strlen(STANDARD_TYPE)+1 );
    strcpy( yyval.pTypedList->type->item, STANDARD_TYPE );
  }
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 71:
#line 805 "scan-fct_pddl.y"
{ 
  yyval.pstring = new_Token(strlen(yyvsp[0].string) + 1);
  strcpy(yyval.pstring, yyvsp[0].string);
;
    break;}
case 72:
#line 815 "scan-fct_pddl.y"
{
  yyval.pPlNode = yyvsp[0].pPlNode;
;
    break;}
case 73:
#line 820 "scan-fct_pddl.y"
{
   yyval.pPlNode = yyvsp[-1].pPlNode;
   yyval.pPlNode->next = yyvsp[0].pPlNode;
;
    break;}
case 74:
#line 830 "scan-fct_pddl.y"
{ 
  PlNode *tmp;

  tmp = new_PlNode(ATOM);
  tmp->atom = yyvsp[-1].pTokenList;
  yyval.pPlNode = new_PlNode(NOT);
  yyval.pPlNode->sons = tmp;
;
    break;}
case 75:
#line 840 "scan-fct_pddl.y"
{
  yyval.pPlNode = new_PlNode(ATOM);
  yyval.pPlNode->atom = yyvsp[0].pTokenList;
;
    break;}
case 76:
#line 850 "scan-fct_pddl.y"
{ 
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = yyvsp[-2].pstring;
  yyval.pTokenList->next = yyvsp[-1].pTokenList;
;
    break;}
case 77:
#line 861 "scan-fct_pddl.y"
{ yyval.pTokenList = NULL; ;
    break;}
case 78:
#line 864 "scan-fct_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token(strlen(yyvsp[-1].string) + 1);
  strcpy(yyval.pTokenList->item, yyvsp[-1].string);
  yyval.pTokenList->next = yyvsp[0].pTokenList;
;
    break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 465 "/usr/local/lib/bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 873 "scan-fct_pddl.y"



#include "lex.fct_pddl.c"


/**********************************************************************
 * Functions
 **********************************************************************/


/* 
 * call	bison -pfct -bscan-fct scan-fct.y
 */
void fcterr( int errno, char *par ) {

/*   sact_err = errno; */

/*   if ( sact_err_par ) { */
/*     free( sact_err_par ); */
/*   } */
/*   if ( par ) { */
/*     sact_err_par = new_Token( strlen(par)+1 ); */
/*     strcpy( sact_err_par, par); */
/*   } else { */
/*     sact_err_par = NULL; */
/*   } */

}

extern char *fct_pddltext;

int yyerror( char *msg )

{
  fflush( stdout );
  fprintf(stderr,"\n%s: syntax error in line %d, '%s':\n", 
	  gact_filename, lineno, fct_pddltext );

  if ( sact_err_par ) {
    fprintf(stderr, "%s%s\n", serrmsg[sact_err], sact_err_par );
  } else {
    fprintf(stderr,"%s\n", serrmsg[sact_err] );
  }

  exit( 1 );

}

extern FILE *fct_pddlin;

void load_fct_file( char *filename ) 

{

  FILE *fp;/* pointer to input files */
  char tmp[MAX_LENGTH] = "";

  /* open fact file 
   */
  if( ( fp = fopen( filename, "r" ) ) == NULL ) {
    sprintf(tmp, "\nff: can't find fact file: %s\n\n", filename );
    perror(tmp);
    exit ( 1 );
  }

  gact_filename = filename;
  lineno = 1; 
  fct_pddlin = fp;

  yyparse();

  fclose( fp );/* and close file again */

}

