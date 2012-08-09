
/*  A Bison parser, made from scan-ops_pddl.y with Bison version GNU Bison version 1.22
  */

#define YYBISON 1  /* Identify Bison output.  */

#define yyparse ops_pddlparse
#define yylex ops_pddllex
#define yyerror ops_pddlerror
#define yylval ops_pddllval
#define yychar ops_pddlchar
#define yydebug ops_pddldebug
#define yynerrs ops_pddlnerrs
#define	DEFINE_TOK	258
#define	DOMAIN_TOK	259
#define	REQUIREMENTS_TOK	260
#define	TYPES_TOK	261
#define	EITHER_TOK	262
#define	CONSTANTS_TOK	263
#define	PREDICATES_TOK	264
#define	FUNCTIONS_TOK	265
#define	ACTION_TOK	266
#define	VARS_TOK	267
#define	IMPLIES_TOK	268
#define	PRECONDITION_TOK	269
#define	PARAMETERS_TOK	270
#define	EFFECT_TOK	271
#define	AND_TOK	272
#define	NOT_TOK	273
#define	WHEN_TOK	274
#define	FORALL_TOK	275
#define	IMPLY_TOK	276
#define	OR_TOK	277
#define	EXISTS_TOK	278
#define	LE_TOK	279
#define	LEQ_TOK	280
#define	EQ_TOK	281
#define	GEQ_TOK	282
#define	GE_TOK	283
#define	MINUS_TOK	284
#define	AD_TOK	285
#define	MU_TOK	286
#define	DI_TOK	287
#define	ASSIGN_TOK	288
#define	SCALE_UP_TOK	289
#define	SCALE_DOWN_TOK	290
#define	INCREASE_TOK	291
#define	DECREASE_TOK	292
#define	NAME	293
#define	VARIABLE	294
#define	NUM	295
#define	OPEN_PAREN	296
#define	CLOSE_PAREN	297

#line 24 "scan-ops_pddl.y"

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
#define DOMDEF_EXPECTED            0
#define DOMAIN_EXPECTED            1
#define DOMNAME_EXPECTED           2
#define LBRACKET_EXPECTED          3
#define RBRACKET_EXPECTED          4
#define DOMDEFS_EXPECTED           5
#define REQUIREM_EXPECTED          6
#define TYPEDLIST_EXPECTED         7
#define LITERAL_EXPECTED           8
#define PRECONDDEF_UNCORRECT       9
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
#define ACTION                    20
#endif


#define NAME_STR "name\0"
#define VARIABLE_STR "variable\0"
#define STANDARD_TYPE "OBJECT\0"
 

static char *serrmsg[] = {
  "domain definition expected",
  "'domain' expected",
  "domain name expected",
  "'(' expected",
  "')' expected",
  "additional domain definitions expected",
  "requirements (e.g. ':STRIPS') expected",
  "typed list of <%s> expected",
  "literal expected",
  "uncorrect precondition definition",
  "type definition expected",
  "list of constants expected",
  "predicate definition expected",
  "<name> expected",
  "<variable> expected",
  "action functor expected",
  "atomic formula expected",
  "effect definition expected",
  "negated atomic formula expected",
  "requirement %s not supported by this FF version",  
  "action definition is not correct",
  NULL
};


/* void opserr( int errno, char *par ); */


static int sact_err;
static char *sact_err_par = NULL;
static PlOperator *scur_op = NULL;
static Bool sis_negated = FALSE;


int supported( char *str )

{

  int i;
  char * sup[] = { ":STRIPS", ":NEGATION", ":EQUALITY",":TYPING", 
		   ":CONDITIONAL-EFFECTS", ":NEGATIVE-PRECONDITIONS", ":DISJUNCTIVE-PRECONDITIONS", 
		   ":EXISTENTIAL-PRECONDITIONS", ":UNIVERSAL-PRECONDITIONS", 
		   ":QUANTIFIED-PRECONDITIONS", ":ADL", ":FLUENTS", ":ACTION-COSTS",
		   NULL };     

  for (i=0; NULL != sup[i]; i++) {
    if ( SAME == strcmp(sup[i], str) ) {
      return TRUE;
    }
  }
  
  return FALSE;

}


#line 131 "scan-ops_pddl.y"
typedef union {

  char string[MAX_LENGTH];
  char *pstring;
  ParseExpNode *pParseExpNode;
  PlNode *pPlNode;
  FactList *pFactList;
  TokenList *pTokenList;
  TypedList *pTypedList;

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



#define	YYFINAL		240
#define	YYFLAG		-32768
#define	YYNTBASE	43

#define YYTRANSLATE(x) ((unsigned)(x) <= 297 ? yytranslate[x] : 88)

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
    26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     1,     4,     5,    11,    16,    18,    21,    24,    27,
    30,    33,    36,    37,    43,    44,    45,    52,    53,    59,
    60,    61,    70,    71,    78,    79,    80,    88,    89,    90,
    94,    95,   101,   102,   108,   109,   110,   119,   120,   125,
   126,   132,   133,   138,   139,   144,   150,   156,   162,   168,
   174,   176,   181,   186,   191,   197,   205,   213,   214,   217,
   223,   229,   235,   241,   247,   249,   254,   262,   268,   269,
   272,   277,   279,   281,   286,   292,   298,   304,   310,   315,
   317,   322,   327,   328,   331,   333,   335,   337,   340,   342,
   343,   349,   354,   357,   358,   364,   369
};

static const short yyrhs[] = {    -1,
    44,    45,     0,     0,    41,     3,    47,    46,    48,     0,
    41,     4,    38,    42,     0,    42,     0,    58,    48,     0,
    65,    48,     0,    63,    48,     0,    49,    48,     0,    53,
    48,     0,    67,    48,     0,     0,    41,     9,    51,    50,
    42,     0,     0,     0,    41,    38,    87,    42,    52,    51,
     0,     0,    41,    10,    55,    54,    42,     0,     0,     0,
    41,    38,    87,    42,    29,    38,    56,    55,     0,     0,
    41,    38,    87,    42,    57,    55,     0,     0,     0,    41,
     5,    59,    38,    60,    61,    42,     0,     0,     0,    38,
    62,    61,     0,     0,    41,     6,    64,    86,    42,     0,
     0,    41,     8,    66,    86,    42,     0,     0,     0,    41,
    11,    68,    38,    69,    70,    71,    42,     0,     0,    15,
    41,    87,    42,     0,     0,    12,    41,    87,    42,    71,
     0,     0,    14,    74,    72,    71,     0,     0,    16,    76,
    73,    71,     0,    41,    24,    79,    79,    42,     0,    41,
    25,    79,    79,    42,     0,    41,    26,    79,    79,    42,
     0,    41,    27,    79,    79,    42,     0,    41,    28,    79,
    79,    42,     0,    80,     0,    41,    17,    75,    42,     0,
    41,    22,    75,    42,     0,    41,    18,    74,    42,     0,
    41,    21,    74,    74,    42,     0,    41,    23,    41,    87,
    42,    74,    42,     0,    41,    20,    41,    87,    42,    74,
    42,     0,     0,    74,    75,     0,    41,    33,    78,    79,
    42,     0,    41,    34,    78,    79,    42,     0,    41,    35,
    78,    79,    42,     0,    41,    36,    78,    79,    42,     0,
    41,    37,    78,    79,    42,     0,    80,     0,    41,    17,
    77,    42,     0,    41,    20,    41,    87,    42,    76,    42,
     0,    41,    19,    74,    76,    42,     0,     0,    76,    77,
     0,    41,    38,    82,    42,     0,    40,     0,    78,     0,
    41,    29,    79,    42,     0,    41,    30,    79,    79,    42,
     0,    41,    29,    79,    79,    42,     0,    41,    31,    79,
    79,    42,     0,    41,    32,    79,    79,    42,     0,    41,
    18,    81,    42,     0,    81,     0,    41,    85,    82,    42,
     0,    41,    26,    82,    42,     0,     0,    83,    82,     0,
    38,     0,    39,     0,    38,     0,    38,    84,     0,    38,
     0,     0,    38,     7,    84,    42,    86,     0,    38,    29,
    38,    86,     0,    38,    86,     0,     0,    39,     7,    84,
    42,    87,     0,    39,    29,    38,    87,     0,    39,    87,
     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   203,   208,   213,   218,   227,   237,   239,   241,   243,   245,
   247,   249,   255,   260,   264,   267,   292,   296,   301,   305,
   308,   338,   338,   366,   370,   376,   382,   387,   389,   398,
   402,   407,   415,   420,   430,   436,   439,   448,   453,   468,
   470,   488,   494,   494,   500,   509,   517,   525,   533,   541,
   549,   562,   568,   574,   580,   590,   605,   624,   629,   642,
   650,   658,   666,   674,   682,   695,   701,   716,   735,   739,
   751,   764,   772,   777,   783,   790,   797,   804,   815,   821,
   830,   837,   849,   852,   863,   869,   879,   886,   898,   908,
   911,   921,   932,   951,   954,   963,   974
};

static const char * const yytname[] = {   "$","error","$illegal.","DEFINE_TOK",
"DOMAIN_TOK","REQUIREMENTS_TOK","TYPES_TOK","EITHER_TOK","CONSTANTS_TOK","PREDICATES_TOK",
"FUNCTIONS_TOK","ACTION_TOK","VARS_TOK","IMPLIES_TOK","PRECONDITION_TOK","PARAMETERS_TOK",
"EFFECT_TOK","AND_TOK","NOT_TOK","WHEN_TOK","FORALL_TOK","IMPLY_TOK","OR_TOK",
"EXISTS_TOK","LE_TOK","LEQ_TOK","EQ_TOK","GEQ_TOK","GE_TOK","MINUS_TOK","AD_TOK",
"MU_TOK","DI_TOK","ASSIGN_TOK","SCALE_UP_TOK","SCALE_DOWN_TOK","INCREASE_TOK",
"DECREASE_TOK","NAME","VARIABLE","NUM","OPEN_PAREN","CLOSE_PAREN","file","@1",
"domain_definition","@2","domain_name","optional_domain_defs","predicates_def",
"@3","predicates_list","@4","functions_def","@5","functions_list","@6","@7",
"require_def","@8","@9","require_key_star","@10","types_def","@11","constants_def",
"@12","action_def","@13","@14","param_def","action_def_body","@15","@16","adl_goal_description",
"adl_goal_description_star","adl_effect","adl_effect_star","f_head","f_exp",
"literal_term","atomic_formula_term","term_star","term","name_plus","predicate",
"typed_list_name","typed_list_variable",""
};
#endif

static const short yyr1[] = {     0,
    44,    43,    46,    45,    47,    48,    48,    48,    48,    48,
    48,    48,    50,    49,    51,    52,    51,    54,    53,    55,
    56,    55,    57,    55,    59,    60,    58,    61,    62,    61,
    64,    63,    66,    65,    68,    69,    67,    70,    70,    71,
    71,    72,    71,    73,    71,    74,    74,    74,    74,    74,
    74,    74,    74,    74,    74,    74,    74,    75,    75,    76,
    76,    76,    76,    76,    76,    76,    76,    76,    77,    77,
    78,    79,    79,    79,    79,    79,    79,    79,    80,    80,
    81,    81,    82,    82,    83,    83,    84,    84,    85,    86,
    86,    86,    86,    87,    87,    87,    87
};

static const short yyr2[] = {     0,
     0,     2,     0,     5,     4,     1,     2,     2,     2,     2,
     2,     2,     0,     5,     0,     0,     6,     0,     5,     0,
     0,     8,     0,     6,     0,     0,     7,     0,     0,     3,
     0,     5,     0,     5,     0,     0,     8,     0,     4,     0,
     5,     0,     4,     0,     4,     5,     5,     5,     5,     5,
     1,     4,     4,     4,     5,     7,     7,     0,     2,     5,
     5,     5,     5,     5,     1,     4,     7,     5,     0,     2,
     4,     1,     1,     4,     5,     5,     5,     5,     4,     1,
     4,     4,     0,     2,     1,     1,     1,     2,     1,     0,
     5,     4,     2,     0,     5,     4,     2
};

static const short yydefact[] = {     1,
     0,     0,     2,     0,     0,     3,     0,     0,     0,     0,
     6,     4,     0,     0,     0,     0,     0,     0,     5,    25,
    31,    33,    15,    20,    35,    10,    11,     7,     9,     8,
    12,     0,    90,    90,     0,    13,     0,    18,     0,    26,
    90,     0,     0,    94,     0,    94,     0,    36,    28,     0,
     0,    93,    32,    34,    94,     0,    14,     0,    19,    38,
    29,     0,    87,     0,    90,     0,     0,    97,    16,    23,
     0,    40,    28,    27,    88,    90,    92,     0,    94,    15,
     0,    20,    94,     0,     0,     0,     0,    30,    91,    94,
    96,    17,    21,    24,     0,    94,     0,    42,    51,    80,
     0,    44,    65,    37,    95,    20,    39,     0,    58,     0,
     0,     0,    58,     0,     0,     0,    83,     0,     0,    89,
    83,    40,    69,     0,     0,     0,    83,     0,     0,     0,
     0,     0,    40,    22,    40,    58,     0,     0,     0,    94,
     0,     0,    94,    72,     0,    73,     0,     0,    85,    86,
     0,     0,    83,     0,     0,     0,    43,    69,     0,     0,
     0,     0,    94,     0,     0,     0,     0,     0,     0,    45,
    41,    59,    52,    54,    79,     0,     0,    53,     0,     0,
     0,     0,     0,    83,     0,     0,     0,    82,    84,     0,
     0,    81,    70,    66,     0,     0,     0,     0,     0,     0,
     0,     0,    55,     0,     0,     0,     0,     0,     0,    46,
    47,    48,    49,    50,    68,     0,    60,    61,    62,    63,
    64,     0,     0,    74,     0,     0,     0,     0,    71,     0,
    57,    56,    76,    75,    77,    78,    67,     0,     0,     0
};

static const short yydefgoto[] = {   238,
     1,     3,     8,     6,    12,    13,    45,    36,    80,    14,
    47,    38,   106,    82,    15,    32,    49,    62,    73,    16,
    33,    17,    34,    18,    39,    60,    72,    87,   122,   133,
   136,   137,   158,   159,   146,   147,    99,   100,   152,   153,
    64,   121,    42,    56
};

static const short yypact[] = {-32768,
   -27,     2,-32768,   -25,    26,-32768,    -4,    37,     3,    80,
-32768,-32768,    37,    37,    37,    37,    37,    37,-32768,-32768,
-32768,-32768,     0,    19,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,    35,    42,    42,    49,-32768,    67,-32768,    84,-32768,
    -3,    76,    81,    36,    82,    36,    83,-32768,    88,    89,
    90,-32768,-32768,-32768,    -1,    87,-32768,    92,-32768,   129,
-32768,   107,    89,   108,    42,    89,   113,-32768,-32768,   123,
   114,    45,    88,-32768,-32768,    42,-32768,   116,    36,     0,
   118,    19,    36,   119,   126,   127,   117,-32768,-32768,    36,
-32768,-32768,-32768,-32768,   130,    36,   115,-32768,-32768,-32768,
   128,-32768,-32768,-32768,-32768,    19,-32768,   131,   126,   126,
   133,   126,   126,   134,    58,    58,    63,    58,    58,-32768,
    78,    45,   127,   135,   126,   136,    78,   137,   137,   137,
   137,   137,    45,-32768,    45,   126,   138,   139,   140,    36,
   126,   141,    36,-32768,    33,-32768,    58,    58,-32768,-32768,
    58,   142,    78,    58,    58,   143,-32768,   127,   144,   -13,
   140,   127,    36,   132,    58,    58,    58,    58,    58,-32768,
-32768,-32768,-32768,-32768,-32768,   145,   146,-32768,   147,    58,
    58,    58,    58,    78,   148,   149,   150,-32768,-32768,   151,
   152,-32768,-32768,-32768,   153,   154,   155,   156,   157,   158,
   159,   126,-32768,   126,   -19,    58,    58,    58,   160,-32768,
-32768,-32768,-32768,-32768,-32768,   127,-32768,-32768,-32768,-32768,
-32768,   161,   162,-32768,   163,   164,   165,   166,-32768,   167,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,   169,   171,-32768
};

static const short yypgoto[] = {-32768,
-32768,-32768,-32768,-32768,    97,-32768,-32768,    77,-32768,-32768,
-32768,   -75,-32768,-32768,-32768,-32768,-32768,   106,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,   -89,-32768,-32768,
   -83,  -104,   -85,    52,   -36,   -99,   -86,  -100,  -110,-32768,
   -12,-32768,   -26,   -43
};


#define	YYLAST		210


static const short yytable[] = {   103,
   102,    98,    58,    50,     4,    66,    94,    43,   142,   139,
   156,    68,   127,     2,    52,     5,   148,   151,   154,   155,
   144,   145,   224,   161,   120,    51,   138,    67,   141,     7,
   134,   172,   157,     9,    41,    91,   103,    55,    77,    95,
    35,   162,   189,   170,    19,   171,   105,   185,   186,    89,
    75,   187,   108,    78,   190,   191,    84,   177,    85,    37,
    86,   180,   181,   182,   183,   197,   198,   199,   200,   201,
   184,   103,    40,   209,    55,   103,   195,    10,    11,    41,
   205,   206,   207,   208,    20,    21,    44,    22,    23,    24,
    25,   165,   166,   167,   168,   169,   176,   144,   145,   179,
   149,   150,   144,   145,    46,   225,   226,   227,   228,    26,
    27,    28,    29,    30,    31,   149,   150,    53,   222,   196,
   223,    48,    54,    57,    59,    61,    63,    65,    69,   103,
   230,   109,   110,    70,   111,   112,   113,   114,   115,   116,
   117,   118,   119,    71,   123,   124,   125,   126,    74,    76,
    79,    81,   120,   127,    83,    93,    92,    90,   104,    96,
   128,   129,   130,   131,   132,   120,    97,   101,   239,   184,
   240,   107,   135,   140,   143,   160,   163,   164,    88,   173,
   174,   175,   178,   188,   192,   194,   202,   203,   204,   210,
   211,   212,   213,   214,   215,   216,   217,   218,   219,   220,
   221,   229,   231,   232,   233,   234,   235,   236,   237,   193
};

static const short yycheck[] = {    86,
    86,    85,    46,     7,     3,     7,    82,    34,   113,   110,
   121,    55,    26,    41,    41,    41,   116,   117,   118,   119,
    40,    41,    42,   124,    38,    29,   110,    29,   112,     4,
   106,   136,   122,    38,    38,    79,   123,    39,    65,    83,
    41,   125,   153,   133,    42,   135,    90,   147,   148,    76,
    63,   151,    96,    66,   154,   155,    12,   141,    14,    41,
    16,    29,    30,    31,    32,   165,   166,   167,   168,   169,
    38,   158,    38,   184,    39,   162,   162,    41,    42,    38,
   180,   181,   182,   183,     5,     6,    38,     8,     9,    10,
    11,   128,   129,   130,   131,   132,   140,    40,    41,   143,
    38,    39,    40,    41,    38,   205,   206,   207,   208,    13,
    14,    15,    16,    17,    18,    38,    39,    42,   202,   163,
   204,    38,    42,    42,    42,    38,    38,    38,    42,   216,
   216,    17,    18,    42,    20,    21,    22,    23,    24,    25,
    26,    27,    28,    15,    17,    18,    19,    20,    42,    42,
    38,    29,    38,    26,    41,    38,    80,    42,    42,    41,
    33,    34,    35,    36,    37,    38,    41,    41,     0,    38,
     0,    42,    42,    41,    41,    41,    41,    41,    73,    42,
    42,    42,    42,    42,    42,    42,    42,    42,    42,    42,
    42,    42,    42,    42,    42,    42,    42,    42,    42,    42,
    42,    42,    42,    42,    42,    42,    42,    42,    42,   158
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

case 1:
#line 204 "scan-ops_pddl.y"
{ 
  opserr( DOMDEF_EXPECTED, NULL ); 
;
    break;}
case 3:
#line 215 "scan-ops_pddl.y"
{ 
;
    break;}
case 4:
#line 218 "scan-ops_pddl.y"
{
  if ( gcmd_line.display_info >= 1 ) {
    printf("\ndomain '%s' defined\n", gdomain_name);
  }
;
    break;}
case 5:
#line 229 "scan-ops_pddl.y"
{ 
  gdomain_name = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( gdomain_name, yyvsp[-1].string);
;
    break;}
case 13:
#line 257 "scan-ops_pddl.y"
{
;
    break;}
case 14:
#line 260 "scan-ops_pddl.y"
{ 
;
    break;}
case 15:
#line 266 "scan-ops_pddl.y"
{;
    break;}
case 16:
#line 269 "scan-ops_pddl.y"
{

  TypedListList *tll;

  if ( gparse_predicates ) {
    tll = gparse_predicates;
    while ( tll->next ) {
      tll = tll->next;
    }
    tll->next = new_TypedListList();
    tll = tll->next;
  } else {
    tll = new_TypedListList();
    gparse_predicates = tll;
  }

  tll->predicate = new_Token( strlen( yyvsp[-2].string ) + 1);
  strcpy( tll->predicate, yyvsp[-2].string );

  tll->args = yyvsp[-1].pTypedList;

;
    break;}
case 18:
#line 298 "scan-ops_pddl.y"
{
;
    break;}
case 19:
#line 301 "scan-ops_pddl.y"
{ 
;
    break;}
case 20:
#line 307 "scan-ops_pddl.y"
{;
    break;}
case 21:
#line 311 "scan-ops_pddl.y"
{

  TypedListList *tll;

  if(strcmp(yyvsp[0].string, "number")) {
    opserr(NOT_SUPPORTED, "non-number fluent");
  }

  if ( gparse_functions ) {
    tll = gparse_functions;
    while ( tll->next ) {
      tll = tll->next;
    }
    tll->next = new_TypedListList();
    tll = tll->next;
  } else {
    tll = new_TypedListList();
    gparse_functions = tll;
  }

  tll->predicate = new_Token( strlen( yyvsp[-4].string ) + 1);
  strcpy( tll->predicate, yyvsp[-4].string );

  tll->args = yyvsp[-3].pTypedList;

;
    break;}
case 23:
#line 341 "scan-ops_pddl.y"
{

  TypedListList *tll;

  /* assume untyped functions are "number" */
  
  if ( gparse_functions ) {
    tll = gparse_functions;
    while ( tll->next ) {
      tll = tll->next;
    }
    tll->next = new_TypedListList();
    tll = tll->next;
  } else {
    tll = new_TypedListList();
    gparse_functions = tll;
  }

  tll->predicate = new_Token( strlen( yyvsp[-2].string ) + 1);
  strcpy( tll->predicate, yyvsp[-2].string );

  tll->args = yyvsp[-1].pTypedList;

;
    break;}
case 25:
#line 372 "scan-ops_pddl.y"
{ 
  opserr( REQUIREM_EXPECTED, NULL ); 
;
    break;}
case 26:
#line 376 "scan-ops_pddl.y"
{ 
  if ( !supported( yyvsp[0].string ) ) {
    opserr( NOT_SUPPORTED, yyvsp[0].string );
    yyerror();
  }
;
    break;}
case 29:
#line 391 "scan-ops_pddl.y"
{ 
  if ( !supported( yyvsp[0].string ) ) {
    opserr( NOT_SUPPORTED, yyvsp[0].string );
    yyerror();
  }
;
    break;}
case 31:
#line 404 "scan-ops_pddl.y"
{ 
  opserr( TYPEDEF_EXPECTED, NULL ); 
;
    break;}
case 32:
#line 408 "scan-ops_pddl.y"
{
  gparse_types = yyvsp[-1].pTypedList;
;
    break;}
case 33:
#line 417 "scan-ops_pddl.y"
{ 
  opserr( CONSTLIST_EXPECTED, NULL ); 
;
    break;}
case 34:
#line 421 "scan-ops_pddl.y"
{
  gparse_constants = yyvsp[-1].pTypedList;
;
    break;}
case 35:
#line 432 "scan-ops_pddl.y"
{ 
  opserr( ACTION, NULL ); 
;
    break;}
case 36:
#line 436 "scan-ops_pddl.y"
{ 
  scur_op = new_PlOperator( yyvsp[0].string );
;
    break;}
case 37:
#line 440 "scan-ops_pddl.y"
{
  scur_op->next = gloaded_ops;
  gloaded_ops = scur_op; 
;
    break;}
case 38:
#line 450 "scan-ops_pddl.y"
{ 
  scur_op->params = NULL; 
;
    break;}
case 39:
#line 455 "scan-ops_pddl.y"
{
  TypedList *tl;
  scur_op->parse_params = yyvsp[-1].pTypedList;
  for (tl = scur_op->parse_params; tl; tl = tl->next) {
    /* to be able to distinguish params from :VARS 
     */
    scur_op->number_of_real_params++;
  }
;
    break;}
case 41:
#line 472 "scan-ops_pddl.y"
{
  TypedList *tl = NULL;

  /* add vars as parameters 
   */
  if ( scur_op->parse_params ) {
    for( tl = scur_op->parse_params; tl->next; tl = tl->next ) {
      /* empty, get to the end of list 
       */
    }
    tl->next = yyvsp[-2].pTypedList;
    tl = tl->next;
  } else {
    scur_op->parse_params = yyvsp[-2].pTypedList;
  }
;
    break;}
case 42:
#line 490 "scan-ops_pddl.y"
{ 
  scur_op->preconds = yyvsp[0].pPlNode; 
;
    break;}
case 44:
#line 496 "scan-ops_pddl.y"
{ 
  scur_op->effects = yyvsp[0].pPlNode; 
;
    break;}
case 46:
#line 511 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = LE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 47:
#line 519 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = LEQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 48:
#line 527 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = EQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 49:
#line 535 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = GEQ;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 50:
#line 543 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode(COMP);
  yyval.pPlNode->comp = GE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 51:
#line 551 "scan-ops_pddl.y"
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
case 52:
#line 564 "scan-ops_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(AND);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 53:
#line 570 "scan-ops_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(OR);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 54:
#line 576 "scan-ops_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(NOT);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 55:
#line 582 "scan-ops_pddl.y"
{ 
  PlNode *np = new_PlNode(NOT);
  np->sons = yyvsp[-2].pPlNode;
  np->next = yyvsp[-1].pPlNode;

  yyval.pPlNode = new_PlNode(OR);
  yyval.pPlNode->sons = np;
;
    break;}
case 56:
#line 594 "scan-ops_pddl.y"
{ 

  PlNode *pln;

  pln = new_PlNode(EX);
  pln->parse_vars = yyvsp[-3].pTypedList;

  yyval.pPlNode = pln;
  pln->sons = yyvsp[-1].pPlNode;

;
    break;}
case 57:
#line 609 "scan-ops_pddl.y"
{ 

  PlNode *pln;

  pln = new_PlNode(ALL);
  pln->parse_vars = yyvsp[-3].pTypedList;

  yyval.pPlNode = pln;
  pln->sons = yyvsp[-1].pPlNode;

;
    break;}
case 58:
#line 626 "scan-ops_pddl.y"
{
  yyval.pPlNode = NULL;
;
    break;}
case 59:
#line 631 "scan-ops_pddl.y"
{
  yyvsp[-1].pPlNode->next = yyvsp[0].pPlNode;
  yyval.pPlNode = yyvsp[-1].pPlNode;
;
    break;}
case 60:
#line 644 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode( NEF );
  yyval.pPlNode->neft = ASSIGN;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 61:
#line 652 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode( NEF );
  yyval.pPlNode->neft = SCALE_UP;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 62:
#line 660 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode( NEF );
  yyval.pPlNode->neft = SCALE_DOWN;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 63:
#line 668 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode( NEF );
  yyval.pPlNode->neft = INCREASE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 64:
#line 676 "scan-ops_pddl.y"
{
  yyval.pPlNode = new_PlNode( NEF );
  yyval.pPlNode->neft = DECREASE;
  yyval.pPlNode->lh = yyvsp[-2].pParseExpNode;
  yyval.pPlNode->rh = yyvsp[-1].pParseExpNode;
;
    break;}
case 65:
#line 684 "scan-ops_pddl.y"
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
case 66:
#line 697 "scan-ops_pddl.y"
{ 
  yyval.pPlNode = new_PlNode(AND);
  yyval.pPlNode->sons = yyvsp[-1].pPlNode;
;
    break;}
case 67:
#line 705 "scan-ops_pddl.y"
{ 

  PlNode *pln;

  pln = new_PlNode(ALL);
  pln->parse_vars = yyvsp[-3].pTypedList;

  yyval.pPlNode = pln;
  pln->sons = yyvsp[-1].pPlNode;

;
    break;}
case 68:
#line 718 "scan-ops_pddl.y"
{
  /* This will be conditional effects in FF representation, but here
   * a formula like (WHEN p q) will be saved as:
   *  [WHEN]
   *  [sons]
   *   /  \
   * [p]  [q]
   * That means, the first son is p, and the second one is q. 
   */
  yyval.pPlNode = new_PlNode(WHEN);
  yyvsp[-2].pPlNode->next = yyvsp[-1].pPlNode;
  yyval.pPlNode->sons = yyvsp[-2].pPlNode;
;
    break;}
case 69:
#line 736 "scan-ops_pddl.y"
{ 
  yyval.pPlNode = NULL; 
;
    break;}
case 70:
#line 741 "scan-ops_pddl.y"
{
  yyvsp[-1].pPlNode->next = yyvsp[0].pPlNode;
  yyval.pPlNode = yyvsp[-1].pPlNode;
;
    break;}
case 71:
#line 753 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( FHEAD );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[-2].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[-2].string );
  yyval.pParseExpNode->atom->next = yyvsp[-1].pTokenList;
;
    break;}
case 72:
#line 766 "scan-ops_pddl.y"
{ 
  yyval.pParseExpNode = new_ParseExpNode( NUMBER );
  yyval.pParseExpNode->atom = new_TokenList();
  yyval.pParseExpNode->atom->item = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pParseExpNode->atom->item, yyvsp[0].string );
;
    break;}
case 73:
#line 774 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = yyvsp[0].pParseExpNode;
;
    break;}
case 74:
#line 779 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MINUS );
  yyval.pParseExpNode->leftson = yyvsp[-1].pParseExpNode;
;
    break;}
case 75:
#line 785 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( AD );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 76:
#line 792 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( SU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 77:
#line 799 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( MU );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 78:
#line 806 "scan-ops_pddl.y"
{
  yyval.pParseExpNode = new_ParseExpNode( DI );
  yyval.pParseExpNode->leftson = yyvsp[-2].pParseExpNode;
  yyval.pParseExpNode->rightson = yyvsp[-1].pParseExpNode;
;
    break;}
case 79:
#line 817 "scan-ops_pddl.y"
{ 
  yyval.pTokenList = yyvsp[-1].pTokenList;
  sis_negated = TRUE;
;
    break;}
case 80:
#line 823 "scan-ops_pddl.y"
{
  yyval.pTokenList = yyvsp[0].pTokenList;
;
    break;}
case 81:
#line 832 "scan-ops_pddl.y"
{ 
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = yyvsp[-2].pstring;
  yyval.pTokenList->next = yyvsp[-1].pTokenList;
;
    break;}
case 82:
#line 839 "scan-ops_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token( 5 );
  yyval.pTokenList->item = "=";
  yyval.pTokenList->next = yyvsp[-1].pTokenList;
;
    break;}
case 83:
#line 851 "scan-ops_pddl.y"
{ yyval.pTokenList = NULL; ;
    break;}
case 84:
#line 854 "scan-ops_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = yyvsp[-1].pstring;
  yyval.pTokenList->next = yyvsp[0].pTokenList;
;
    break;}
case 85:
#line 865 "scan-ops_pddl.y"
{ 
  yyval.pstring = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pstring, yyvsp[0].string );
;
    break;}
case 86:
#line 871 "scan-ops_pddl.y"
{ 
  yyval.pstring = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pstring, yyvsp[0].string );
;
    break;}
case 87:
#line 881 "scan-ops_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pTokenList->item, yyvsp[0].string );
;
    break;}
case 88:
#line 888 "scan-ops_pddl.y"
{
  yyval.pTokenList = new_TokenList();
  yyval.pTokenList->item = new_Token( strlen(yyvsp[-1].string)+1 );
  strcpy( yyval.pTokenList->item, yyvsp[-1].string );
  yyval.pTokenList->next = yyvsp[0].pTokenList;
;
    break;}
case 89:
#line 900 "scan-ops_pddl.y"
{ 
  yyval.pstring = new_Token( strlen(yyvsp[0].string)+1 );
  strcpy( yyval.pstring, yyvsp[0].string );
;
    break;}
case 90:
#line 910 "scan-ops_pddl.y"
{ yyval.pTypedList = NULL; ;
    break;}
case 91:
#line 913 "scan-ops_pddl.y"
{ 

  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-4].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-4].string );
  yyval.pTypedList->type = yyvsp[-2].pTokenList;
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 92:
#line 923 "scan-ops_pddl.y"
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
case 93:
#line 934 "scan-ops_pddl.y"
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
case 94:
#line 953 "scan-ops_pddl.y"
{ yyval.pTypedList = NULL; ;
    break;}
case 95:
#line 956 "scan-ops_pddl.y"
{ 
  yyval.pTypedList = new_TypedList();
  yyval.pTypedList->name = new_Token( strlen(yyvsp[-4].string)+1 );
  strcpy( yyval.pTypedList->name, yyvsp[-4].string );
  yyval.pTypedList->type = yyvsp[-2].pTokenList;
  yyval.pTypedList->next = yyvsp[0].pTypedList;
;
    break;}
case 96:
#line 965 "scan-ops_pddl.y"
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
case 97:
#line 976 "scan-ops_pddl.y"
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
#line 993 "scan-ops_pddl.y"

#include "lex.ops_pddl.c"


/**********************************************************************
 * Functions
 **********************************************************************/

/* 
 * call	bison -pops -bscan-ops scan-ops.y
 */

void opserr( int errno, char *par )

{

/*   sact_err = errno; */

/*   if ( sact_err_par ) { */
/*     free(sact_err_par); */
/*   } */
/*   if ( par ) { */
/*     sact_err_par = new_Token(strlen(par)+1); */
/*     strcpy(sact_err_par, par); */
/*   } else { */
/*     sact_err_par = NULL; */
/*   } */

}
  
extern char *ops_pddltext;

int yyerror( char *msg )

{

  fflush(stdout);
  fprintf(stderr, "\n%s: syntax error in line %d, '%s':\n", 
	  gact_filename, lineno, ops_pddltext);

  if ( NULL != sact_err_par ) {
    fprintf(stderr, "%s %s\n", serrmsg[sact_err], sact_err_par);
  } else {
    fprintf(stderr, "%s\n", serrmsg[sact_err]);
  }

  exit( 1 );

}

extern FILE *ops_pddlin;

void load_ops_file( char *filename )

{

  FILE * fp;/* pointer to input files */
  char tmp[MAX_LENGTH] = "";

  /* open operator file 
   */
  if( ( fp = fopen( filename, "r" ) ) == NULL ) {
    sprintf(tmp, "\nff: can't find operator file: %s\n\n", filename );
    perror(tmp);
    exit( 1 );
  }

  gact_filename = filename;
  lineno = 1; 
  ops_pddlin = fp;

  yyparse();

  fclose( fp );/* and close file again */

}
