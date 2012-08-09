#include "libff.h"

#include "memory.h"
#include "output.h"

#include "parse.h"

#include "expressions.h"

#include "inst_pre.h"
#include "inst_easy.h"
#include "inst_hard.h"
#include "inst_final.h"

/*
 *  ----------------------------- GLOBAL VARIABLES ----------------------------
 */
/*******************
 * GENERAL HELPERS *
 *******************/
/* used to time the different stages of the planner
 */
float gtempl_time = 0, greach_time = 0, grelev_time = 0, gconn_time = 0;
float gLNF_time = 0, gsearch_time = 0;


/* the command line inputs
 */
struct _command_line gcmd_line;

/* number of states that got heuristically evaluated
 */
int gevaluated_states = 0;

/* maximal depth of breadth first search
 */
int gmax_search_depth = 0;

/***********
 * PARSING *
 ***********/
/* used for pddl parsing, flex only allows global variables
 */
int gbracket_count;
char *gproblem_name;

/* The current input line number
 */
int lineno = 1;

/* The current input filename
 */
char *gact_filename;

/* The pddl domain name
 */
char *gdomain_name = NULL;

/* loaded, uninstantiated operators
 */
PlOperator *gloaded_ops = NULL;

/* stores initials as fact_list 
 */
PlNode *gorig_initial_facts = NULL;

/* not yet preprocessed goal facts
 */
PlNode *gorig_goal_facts = NULL;

/* axioms as in UCPOP before being changed to ops
 */
PlOperator *gloaded_axioms = NULL;

/* the types, as defined in the domain file
 */
TypedList *gparse_types = NULL;

/* the constants, as defined in domain file
 */
TypedList *gparse_constants = NULL;

/* the predicates and their arg types, as defined in the domain file
 */
TypedListList *gparse_predicates = NULL;

/* the functions and their arg types, as defined in the domain file
 */
TypedListList *gparse_functions = NULL;

/* the objects, declared in the problem file
 */
TypedList *gparse_objects = NULL;

/* the metric
 */
Token gparse_optimization;
ParseExpNode *gparse_metric = NULL;

/* connection to instantiation ( except ops, goal, initial )
 */

/* all typed objects 
 */
FactList *gorig_constant_list = NULL;

/* the predicates and their types
 */
FactList *gpredicates_and_types = NULL;

/* the functions and their types
 */
FactList *gfunctions_and_types = NULL;

/*****************
 * INSTANTIATING *
 *****************/
/* global arrays of constant names,
 *               type names (with their constants),
 *               predicate names,
 *               predicate aritys,
 *               defined types of predicate args
 */
Token gconstants[MAX_CONSTANTS];
int gnum_constants = 0;
Token gtype_names[MAX_TYPES];
int gtype_consts[MAX_TYPES][MAX_TYPE];
Bool gis_member[MAX_CONSTANTS][MAX_TYPES];
int gtype_size[MAX_TYPES];
int gnum_types = 0;
Token gpredicates[MAX_PREDICATES];
int garity[MAX_PREDICATES];
int gpredicates_args_type[MAX_PREDICATES][MAX_ARITY];
int gnum_predicates = 0;
Token gfunctions[MAX_FUNCTIONS];
int gf_arity[MAX_FUNCTIONS];
int gfunctions_args_type[MAX_FUNCTIONS][MAX_ARITY];
int gnum_functions = 0;

/* the domain in integer (Fact) representation
 */
PDDLOperator_pointer goperators[MAX_OPERATORS];
int gnum_operators = 0;
Fact *gfull_initial;
int gnum_full_initial = 0;
FluentValue *gfull_fluents_initial;
int gnum_full_fluents_initial = 0;
WffNode *ggoal = NULL;

ExpNode *gmetric = NULL;

/* stores inertia - information: is any occurence of the predicate
 * added / deleted in the uninstantiated ops ?
 */
Bool gis_added[MAX_PREDICATES];
Bool gis_deleted[MAX_PREDICATES];

/* for functions we *might* want to say, symmetrically, whether it is
 * increased resp. decreased at all.
 *
 * that is, however, somewhat involved because the right hand
 * sides can be arbirtray expressions, so we have no guarantee
 * that increasing really does adds to a functions value...
 *
 * thus (for the time being), we settle for "is the function changed at all?"
 */
Bool gis_changed[MAX_FUNCTIONS];

/* splitted initial state:
 * initial non static facts,
 * initial static facts, divided into predicates
 * (will be two dimensional array, allocated directly before need)
 */
Facts *ginitial = NULL;
int gnum_initial = 0;
Fact **ginitial_predicate;
int *gnum_initial_predicate;

/* same thing for functions
 */
FluentValues *gf_initial;
int gnum_f_initial = 0;
FluentValue **ginitial_function;
int *gnum_initial_function;

/* the type numbers corresponding to any unary inertia
 */
int gtype_to_predicate[MAX_PREDICATES];
int gpredicate_to_type[MAX_TYPES];

/* (ordered) numbers of types that new type is intersection of
 */
TypeArray gintersected_types[MAX_TYPES];
int gnum_intersected_types[MAX_TYPES];

/* splitted domain: hard n easy ops
 */
PDDLOperator_pointer *ghard_operators;
int gnum_hard_operators;
NormOperator_pointer *geasy_operators;
int gnum_easy_operators;

/* so called Templates for easy ops: possible inertia constrained
 * instantiation constants
 */
EasyTemplate *geasy_templates;
int gnum_easy_templates;

/* first step for hard ops: create mixed operators, with conjunctive
 * precondition and arbitrary effects
 */
MixedOperator *ghard_mixed_operators;
int gnum_hard_mixed_operators;

/* hard ''templates'' : pseudo actions
 */
PseudoAction_pointer *ghard_templates;
int gnum_hard_templates;

/* store the final "relevant facts"
 */
Fact grelevant_facts[MAX_RELEVANT_FACTS];
int gnum_relevant_facts = 0;
int gnum_pp_facts = 0;
/* store the "relevant fluents"
 */
Fluent grelevant_fluents[MAX_RELEVANT_FLUENTS];
int gnum_relevant_fluents = 0;
Token grelevant_fluents_name[MAX_RELEVANT_FLUENTS];
/* this is NULL for normal, and the LNF for
 * artificial fluents.
 */
LnfExpNode_pointer grelevant_fluents_lnf[MAX_RELEVANT_FLUENTS];

/* the final actions and problem representation
 */
Action *gactions = NULL;
int gnum_actions;
State ginitial_state;
int *glogic_goal = NULL;
int gnum_logic_goal = 0;
Comparator *gnumeric_goal_comp = NULL;
ExpNode_pointer *gnumeric_goal_lh = NULL, *gnumeric_goal_rh = NULL;
int gnum_numeric_goal = 0;

/* direct numeric goal access
 */
Comparator *gnumeric_goal_direct_comp;
float *gnumeric_goal_direct_c;

/* to avoid memory leaks; too complicated to identify
 * the exact state of the action to throw away (during construction),
 * memory gain not worth the implementation effort.
 */
Action *gtrash_actions = NULL;

/* additional lnf step between finalized inst and
 * conn graph
 */
Comparator *glnf_goal_comp = NULL;
LnfExpNode_pointer *glnf_goal_lh = NULL;
float *glnf_goal_rh = NULL;
int gnum_lnf_goal = 0;

LnfExpNode glnf_metric;
Bool goptimization_established = FALSE;

/**********************
 * CONNECTIVITY GRAPH *
 **********************/
/* one ops (actions) array ...
 */
OpConn *gop_conn;
int gnum_op_conn;

/* one effects array ...
 */
EfConn *gef_conn;
int gnum_ef_conn;

/* one facts array.
 */
FtConn *gft_conn;
int gnum_ft_conn;

/* and: one fluents array.
 */
FlConn *gfl_conn;
int gnum_fl_conn;
int gnum_real_fl_conn;/* number of non-artificial ones */

/* final goal is also transformed one more step.
 */
int *gflogic_goal = NULL;
int gnum_flogic_goal = 0;
Comparator *gfnumeric_goal_comp = NULL;
int *gfnumeric_goal_fl = NULL;
float *gfnumeric_goal_c = NULL;
int gnum_fnumeric_goal = 0;

/* direct access (by relevant fluents)
 */
Comparator *gfnumeric_goal_direct_comp = NULL;
float *gfnumeric_goal_direct_c = NULL;

/*******************
 * SEARCHING NEEDS *
 *******************/
/* applicable actions
 */
int *gA;
int gnum_A;

/* communication from extract 1.P. to search engine:
 * 1P action choice
 */
int *gH;
int gnum_H;
/* cost of relaxed plan
 */
float gcost;
Bool artificial_gtt = FALSE;

/* to store plan
 */
int gplan_ops[MAX_PLAN_LENGTH];
int gnum_plan_ops = 0;

/* stores the states that the current plan goes through
 * ( for knowing where new agenda entry starts from )
 */
State gplan_states[MAX_PLAN_LENGTH + 1];

/* dirty: multiplic. of total-time in final metric LNF
 */
float gtt;

/* the mneed structures
 */
Bool **gassign_influence;
Bool **gTassign_influence;

/* the real var input to the mneed computation.
 */
Bool *gmneed_start_D;
float *gmneed_start_V;

/* does this contain conditional effects?
 * (if it does then the state hashing has to be made more
 *  cautiously)
 */
Bool gconditional_effects;

/*
 *  ----------------------------- HEADERS FOR PARSING ----------------------------
 * ( fns defined in the scan-* files )
 */
void get_fct_file_name( char *filename );
void load_ops_file( char *filename );
void load_fct_file( char *filename );

/*
 *  ----------------------------- MAIN ROUTINE ----------------------------
 */
struct tms lstart, lend;
Bool lfound_plan;

/* Implementation */

int	FF_parse_problem( const char* domain_file, const char* instance_file )
{
	
	gcmd_line.optimize = TRUE;

	char ops_file[MAX_LENGTH];
	char fct_file[MAX_LENGTH];
	
	snprintf( ops_file, MAX_LENGTH, "%s", domain_file );
	snprintf( fct_file, MAX_LENGTH, "%s", instance_file );

	load_ops_file( ops_file );
	load_fct_file( fct_file );

	/* This is needed to get all types.
	*/
	build_orig_constant_list();

	/* last step of parsing: see if it's an ADL domain!
	*/
	if ( !make_adl_domain() ) 
	{
		printf("\nlibff: This is not an ADL problem!");
		printf("\n    can't be handled by this version.\n\n");
		return 1 ;
	}
	return 0;
}

int	FF_instantiate_problem()
{

	/**************************
	* first do PREPROCESSING * 
	**************************/
	
	/* start by collecting all strings and thereby encoding 
	* the domain in integers.
	*/
	encode_domain_in_integers();
	
	/* inertia preprocessing, first step:
	*   - collect inertia information
	*   - split initial state into
	*        - arrays for individual predicates
	*        - arrays for all static relations
	*        - array containing non - static relations
	*/
	do_inertia_preprocessing_step_1();
		
	/* normalize all PL1 formulae in domain description:
	* (goal, preconds and effect conditions)
	*   - simplify formula
	*   - expand quantifiers
	*   - NOTs down
	*/
	normalize_all_wffs();
	
	/* translate negative preconds: introduce symmetric new predicate
	* NOT-p(..) (e.g., not-in(?ob) in briefcaseworld)
	*/
	translate_negative_preconds();
	
	/* split domain in easy (disjunction of conjunctive preconds)
	* and hard (non DNF preconds) part, to apply 
	* different instantiation algorithms
	*/
	split_domain();
	
	/***********************************************
	* PREPROCESSING FINISHED                      *
	*                                             *
	* NOW MULTIPLY PARAMETERS IN EFFECTIVE MANNER *
	***********************************************/
	
	build_easy_action_templates();
	build_hard_action_templates();
	
	/* perform reachability analysis in terms of relaxed 
	* fixpoint
	*/
	perform_reachability_analysis();
	
	/* collect the relevant facts and build final domain
	* and problem representations.
	*/
	collect_relevant_facts_and_fluents();
	
	if ( !transform_to_LNF() ) 
	{
		printf("\n\nThis is not a linear task!\n\n");
		return 1;
	}

	/* now build globally accessable connectivity graph
	*/
	build_connectivity_graph();
	
	/* now check for acyclic := effects (in expressions.c)
	*/
	check_assigncycles();
	/* set the relevanc info (in expressions.c)
	*/
	determine_fl_relevance();

	return 0;
}
