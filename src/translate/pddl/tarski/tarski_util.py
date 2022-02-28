################################################################################
# Info:     Utility methods for LAPKT-Tarski integration                       #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              #
# Date:     08-Sep-2019                                                        #
#                                                                              #
# Dependencies:                                                                #
# 1. pip install timers                                                        #
# 2. pip install tarski                                                        #
# 3. python 3.x                                                                #
#                                                                              #
################################################################################
'''
References-
[1.]  "Combining the Expressivity of UCPOP with the Efficiency of Graphplan"
        by B.Cenk Gazen and Craig A. Knoblock
[2.]  "Concise finite-domain representations for PDDL planning tasks"
        by Malte Helmert (Artificial Intelligence 173 (2009) 503–53)
'''

# standard library imports
#-----------------------------------------------------------------------------#
import time
import itertools
import sys
import copy
import contextlib
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

# imports from boost::python planner lib
#-----------------------------------------------------------------------------#
from ...core.lib.pddl import Tarski_Instantiator
from ...core.lib.pddl import TI_Action
from ...core.lib.pddl import TI_Atom
from ...core.lib.pddl import TI_Formula
from ...core.lib.pddl import TI_Identifier
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

# Tarski library imports
#-----------------------------------------------------------------------------#
from tarski_lapkt.io import FstripsReader
from tarski_lapkt.reachability.asp import *
from tarski_lapkt.grounding import LPGroundingStrategy, NaiveGroundingStrategy
from tarski_lapkt.syntax.transform.quantifier_elimination import QuantifierElimination
from tarski_lapkt.syntax import (QuantifiedFormula, CompoundFormula, Tautology,
    Function, Quantifier, land, CompoundTerm, Contradiction, symref)
from tarski_lapkt.syntax.builtins import BuiltinPredicateSymbol
from tarski_lapkt.syntax.transform.substitutions import create_substitution
from tarski_lapkt.syntax.transform.errors import TransformationError
from tarski_lapkt.fstrips import (UniversalEffect, AddEffect, DelEffect,
    FunctionalEffect)
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


# DEFINED CONSTANTS
DEFAULTCOST =   1
DEFAULTCOST_METRIC =   1

#-----------------------------------------------------------------------------#
@contextlib.contextmanager
def time_taken( task_name: str) :
    """
    Track the time taken for a task.
    Usage - "with time_taken("<process name>") :"
    Arguments
    =========
    time_taken: string - name of the task
    """
    start = ( time.time(), time.process_time())
    print("***Started - {} ...***".format(task_name))
    sys.stdout.flush()
    yield
    #print( "{:.3f} , ".format(time.time()-start[0]), end="")
    print(("***Finished {} after {:.3f} seconds wall-clock time, {:.3f} seconds "+
            "CPU time***\n").format( task_name, time.time()-start[0],
                time.process_time()-start[1] ))
    sys.stdout.flush()
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


# conversion - iterative implementation
#-----------------------------------------------------------------------------#
def convert_to_TI_formula( formula) :
    """
    Convert Tarski CompoundFormula to C++ Formula class object
    C++ Formula class is minimalistic in comparison, utilized for instantiation
    Any action with OR in condition is distintegrated into multiple actions 
        without ORs.
    Arguments
    =========
    formula:
    """
    if isinstance( formula, CompoundFormula):
        form_x = []
        index = 0
        i = 0          # sequential index of formulas in "formula"
        sub_a = []     # sub atoms
        sub_f = []     # list of list sub formula
        symbol_f = []  # Formula string e.g. "AND"
        dnf_check = [] # True if NO ORs in formula, False if atleast 1 OR

        # The idea is to append all the formula and its subformulas in a list
        # and then transform them into an object of C++ Formula class 
        # Transformation is done by looping the list in reverse(from last index)

        # Anu- dnf_check turned out to be unncessary, TO BE REMOVED
        form_x.append( formula)
        while(i < len(form_x)):
            dnf_check.append(True)
            if (form_x[i].connective == Connective.Not ) :
                symbol_f.append( "not")
            elif (form_x[i].connective == Connective.And ) :
                symbol_f.append( "and")
            elif (form_x[i].connective == Connective.Or ) :
                symbol_f.append( "or")
                dnf_check[i] = False
            else :
                raise TransformationError("Unknown Connective",
                        form_x[i].connective,"Check the Connective")
            sub_a.append( list())
            sub_f.append( list())
            for subf in form_x[i].subformulas:
                if isinstance( subf, CompoundFormula):
                    index   +=  1
                    form_x.append( subf)
                    sub_f[i].append(index)
                elif isinstance( subf, Tautology):
                    sub_f[i].append( TI_Formula("T", [], [], True))
                elif isinstance( subf, Contradiction):
                    sub_f[i].append( TI_Formula("F", [], [], True))
                elif isinstance( subf, Atom):
                    sub_a[i].append( TI_Atom( str(subf.symbol.symbol),
                        [ TI_Identifier('v',term.symbol) if isinstance(term, Variable)  else\
                            TI_Identifier('c',term.symbol) for term in subf.subterms]))
            i += 1
        # Anu - Now process and add Compound formula in reverse:
        for i in range( len(form_x)-1, -1, -1):
            for j,f in enumerate(sub_f[i]):
                if dnf_check[f]:
                    dnf_check[i] = False
                sub_f[i][j] = TI_Formula(symbol_f[f],
                        sub_a[f], sub_f[f], dnf_check[f])
        t_formula  =   TI_Formula(symbol_f[0], sub_a[0], sub_f[0], dnf_check[0])
    elif isinstance( formula, Atom):
        t_formula  =   TI_Formula("and", [TI_Atom(formula.symbol.symbol,
            [TI_Identifier('v', term.symbol) if isinstance(term, Variable) else \
                TI_Identifier('c', term.symbol)for term in formula.subterms]),],[],True)
    elif isinstance( formula, Tautology):
        t_formula  =   TI_Formula("T", [], [], True)
    elif isinstance( formula, Contradiction):
        t_formula  =   TI_Formula("F", [], [], True)
    else :
        raise TransformationError("Invalid type for formula", formula,
                "Check the formula representation")
    return t_formula
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def ground_generate_task( domain_file, problem_file, out_task) :
    """
    Uses Tarski Grounder to generate the output task using pddl

    Arguments
    =========
    domain_file  : domain pddl file location
    problem_file : problem pddl file location
    output_task  : C++ container to store/process domain and problem

    Returns
    =======
    None
    """

    parsing_timer   =   time.process_time()
    #Setup a reader to read the domain and problem pddl files
    # Anu - This takes much more time than the FD parser
    with time_taken( "reading and parsing pddl file") :
        reader = FstripsReader( raise_on_error=True, theories=None)
        problem = reader.read_problem( domain_file, problem_file)
    """
    # Eliminate Universal Effects and Quantifiers by transformation
    with time_taken("finding static predicates") :
        problem.fluent_preds = find_fluent_predicates( problem)
    """
    with time_taken( "preprocessing tarski problem") :
        process_problem( problem)
        init = problem.init_bk
        out_task.set_domain_name( problem.domain_name)
        out_task.set_problem_name( problem.name)

    with time_taken( "grounding") :
        grounding               =   LPGroundingStrategy( problem)
        reachable_action_params =   copy.deepcopy( grounding.ground_actions())
        fluents                 =   copy.deepcopy( grounding.ground_state_variables())
        del grounding
        count_params = 0
        for x, y in reachable_action_params.items() :
            for z in y :
                count_params += 1
        print("Total number of reachable action params = ", count_params)

    # A C++ based instantiator for Tarski
    with time_taken("instantiating") :
        instantiator    =   Tarski_Instantiator( out_task)
    # Add grounded fluents to out_task
    #with time_taken("adding fluents") :
        fluent_sorted = [str(f) for f in fluents]
        fluent_sorted.sort()
        instantiator.add_fluents( fluent_sorted)
    # Get init with ONLY fluent atoms
    #with time_taken("setting init and goal") :
        instantiator.add_init( [ str(atom) for atom in problem.init_bk.keys()])
        instantiator.add_goal(convert_to_TI_formula( problem.goal))
        instantiator.add_functions(problem.fvals)
    #with time_taken('encoding and adding actions') :
        for name, action in problem.actions.items() :
            t_pre   =   convert_to_TI_formula( action.precondition)
            param_list = list( reachable_action_params[action.name])
            param_list.sort()
            effect_list = []
            c_effect_dict = {}
            cond_str_map = {}
            for effect in action.effects :
                #print(effect.condition)
                if isinstance( effect.condition,
                (CompoundFormula, Atom, Tautology)) :
                    c_effect_dict.setdefault( str(effect.condition),
                        list()).append( (TI_Atom( effect.atom.symbol.symbol,
                        [TI_Identifier('v', term.symbol) if isinstance(term, Variable) else \
                            TI_Identifier('c', term.symbol) for term in effect.atom.subterms]),
                        isinstance(effect, DelEffect)))
                    cond_str_map[str(effect.condition)] = effect.condition
                else :
                    raise  TransformationError( "Invalid Conditional Effect",
                        effect, "Check the condition type")
            for cond, atoms in c_effect_dict.items() :
                t_cond = convert_to_TI_formula( cond_str_map[cond])
                effect_list.append( (t_cond, atoms))
            if isinstance(action.cost, CompoundTerm) :
                cost_term = TI_Atom( action.cost.symbol.symbol,
                        [TI_Identifier('v', term.symbol) if isinstance(term, Variable) else \
                            TI_Identifier('c', term.symbol) for term in action.cost.subterms])
                cost_int = -1
            elif isinstance(action.cost, Constant) :
                cost_term = TI_Atom("",[])
                cost_int = action.cost.symbol
            else :
                cost_term = TI_Atom("",[])
                cost_int = action.cost # create CONSTANT for this
            cost = (cost_term, cost_int)
            t_action = TI_Action( name, [TI_Identifier('v', p.symbol) \
                if isinstance(p, Variable) else TI_Identifier('c', 
                    term.symbol) for p in action.parameters],
             t_pre, effect_list, cost)
            instantiator.instantiate_action( t_action, param_list)
        # finalize_actions Must be called after ALL actions are pushed to task
        # This adds neg_atoms to all Fluent_set(Bit_set) objects in actions
        instantiator.finalize_actions()
        # set init and goal AFTER finalize_actions
        instantiator.set_init();
        instantiator.set_goal();
        #
        #out_task.print_actions()
        #out_task.print_fluents()

    # Not going to handle axioms - not required right now
    # axioms = None # they need to be transformed into actions as per Gazen's paper
    #MUTEX Not needed right now, does not impact LAPKT algos
    #mutex_groups = None
    out_task.parsing_time = time.process_time() - parsing_timer
    return 0
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def process_problem(problem, task_id=[0,]) :
    """
    1. Eliminates univeral effects from problem by transforming to multiple
        conditional effects
    2. Extract action cost from total-cost action effect or 1(default) and
        remove total cost atoms from problem.init

    Arguments
    =========
    problem: object of Problem class
    task_id: list of integers
        0 - All tasks (default)
        1 - Eliminate Unviseral Effects and Quantifiers
        2 - Extract cost from 'total-cost' atoms in prob. description
    Returns
    =======
    None
    """
    # Eliminate function extensions from prob.init
    if ( 0 in task_id) or( 2 in task_id) :
        problem.init_bk = {}
        for atom in problem.init.as_atoms() :
            if isinstance(atom, Atom) :
                problem.init_bk[atom] = True
        problem.fvals = []
        for k, x in problem.init.function_extensions.items() :
            for var, val in x.data.items() :
                problem.fvals.append((k[0]+"("+",".join(
                    [str(x.expr) for x in var])+")", val.symbol))
        problem.init.function_extensions    =   dict()

    for _, action in problem.actions.items() :
        effects = list()
        if  problem.plan_metric:
            action.cost = DEFAULTCOST_METRIC
        else :
            action.cost = DEFAULTCOST
        for effect in action.effects :
            effects += process_effects( effect, action, 
                problem.language, problem.plan_metric)
        action.effects = effects
        if ( 0 in task_id) or ( 1 in task_id) :
            action.precondition = process_formula( action.precondition,
                    problem.language)
    return 0
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def process_effects( eff, action, lang, plan_metric, task_id=[0,]) :
    """
    Elimates univeral effects by transforming to multiple conditional effects

    Arguments
    =========
    lang: object of type FirstOrderLanguage
    eff:  any effect type object
    task_id - Usage same as 'process_problem' method
    Returns
    =======
    list: list of effects
    """
    effect_l            = [] # new list of effects
    if isinstance( eff, UniversalEffect) and ( 0 in task_id or 1 in task_id) :
        for effect in eff.effects :
            effect.condition = process_formula( effect.condition,
                    lang)

            # if Uni. Effect then transform to a list of Add/Del Effects
            if isinstance( effect, UniversalEffect) :
                effect_l += process_effects( effect, action, lang, plan_metric)
                continue

            # else if Add/Del effect, just instantiate condition and atom
            assert isinstance( effect, AddEffect) or isinstance(
                    effect, DelEffect)

            card, syms, substs = _enumerate_instantiations( eff.variables)
            if card == 0 :
                raise TransformationError( "universal effect elimination",
                       eff, "No constants were defined!")
            cond_effects    = []
            for values in sorted(itertools.product( *substs)) :
                subst       = create_substitution( syms, values)
                cond_sub    = process_formula( term_substitution(
                    lang, effect.condition, subst), lang)
                atom_sub    = term_substitution( lang, effect.atom, subst)
                if isinstance( effect, AddEffect) :
                    ce = AddEffect( atom_sub, cond_sub)
                elif isinstance( effect, DelEffect) :
                    ce = DelEffect( atom_sub, cond_sub)
                else :
                    raise TransformationError( "universal effect elimination",
                        eff, "Effect type can't be handled!")
                cond_effects.append( ce)
            effect_l += cond_effects
    elif isinstance( eff, FunctionalEffect) and (eff.lhs==
            plan_metric.opt_expression[1]) and (0 in task_id or 2 in task_id) :
        action.cost = eff.rhs
    elif (isinstance(eff, AddEffect) or isinstance(eff, DelEffect)) and \
            (0 in task_id or 1 in task_id) :
        eff.condition = process_formula( eff.condition, lang)
        effect_l.append( eff)
    else :
        effect_l.append( eff)

    return sorted(effect_l, key = lambda x:str(x))
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def process_formula( formula, lang) :
    """
    Recursively eliminate quantified formulas in formulas

    Arguments
    =========
    formula: CompoundFormula or QuantifiedFormula

    Returns
    =======
    Transformed formula
    """
    # Anu :  Added dnf check to flag formulas which may require DNF
    formula.dnf_check = False
    if isinstance( formula, CompoundFormula) :
        sub_f   =   []
        if formula.connective==Connective.Or :
            formula.dnf_check   =   True
                    
        for f in formula.subformulas :
            sub_f.append( process_formula( f, lang))
            if f.dnf_check==True :
                formula.dnf_check = True
        formula.subformulas =   sub_f
        # Process Not connective with Compound subformulas
        if (formula.connective == Connective.Not and 
                not isinstance(formula.subformulas[0], Atom)):
            assert len(formula.subformulas)==1
            assert isinstance(formula.subformulas[0], CompoundFormula)
            if formula.subformulas[0].connective==Connective.Not :
                assert len(formula.subformulas[0].subformulas)==1
                formula = process_formula(formula.subformulas[0].subformulas[0], lang)
            else :
                if formula.subformulas[0].connective==Connective.Or :
                    formula.connective = Connective.And
                elif formula.subformulas[0].connective==Connective.And :
                    formula.connective = Connective.Or
                else :
                    raise TransformationError("Process compound formula", 
                            formula.subformulas[0].connective,
                    "Cannot process connective type '{}'"
                    .format( st.sort.name))
                new_f = []
                for f in formula.subformulas[0].subformulas :
                    new_f.append(process_formula(
                        CompoundFormula(Connective.Not, [f,]), lang))
                formula.subformulas = new_f
        return formula
    elif isinstance( formula, QuantifiedFormula) :
        return process_formula( ( QuantifierElimination.rewrite( lang, formula,
            QuantifierEliminationMode.All)).result, lang)
    else :
        return formula
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def _enumerate_instantiations( variables) :
    """
    Enumerate Instantiations

    Argument
    ========
    variables: iterator of type class Variable

    Returns
    =======
    cardinality: int
    symbols: list
    instantiations: list
    """
    syms = []
    instantiations = []
    cardinality = 1
    for st in variables :
        if st.sort.builtin :
            raise TransformationError( "instantiate compound formula", phi,
                    "Variable found of built-in sort '{}', domain is too large!"
                    .format( st.sort.name))
        syms.append( st)
        instantiations.append( list(st.sort.domain()))
        cardinality *= len( instantiations[-1])
    return cardinality, syms, instantiations
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def visit(phi, subst):
    if isinstance(phi, CompoundFormula):
        subformulas = [visit(f, subst) for f in phi.subformulas]
        return CompoundFormula( phi.connective, subformulas)

    elif isinstance(phi, QuantifiedFormula):
        if any(symref(x) in subst for x in phi.variables):
            raise SubstitutionError(phi, subst, 'Attempted to substitute variable bound by quantifier')
        formula =   visit(phi.formula, subst)
        return QuantifiedFormula(phi.quantifier, phi.variables, formula)

    elif isinstance(phi, Atom):
        new_subterms = list(phi.subterms)
        phi = Atom(phi.symbol, phi.subterms)
        for k, t in enumerate(new_subterms):
            rep = subst.get(symref(t), None)
            if rep is None:
                new_subterms[k] = visit(t, subst)
            else:
                new_subterms[k] = rep
        phi.subterms = tuple(new_subterms)
        return phi
    elif isinstance(phi, CompoundTerm):
        new_subterms = list(phi.subterms)
        phi = CompoundTerm(phi.symbol, phi.subterms)
        for k, t in enumerate(new_subterms):
            rep = subst.get(symref(t), None)
            if rep is None:
                new_subterms[k] = visit(t, subst)
            else:
                new_subterms[k] = rep
        phi.subterms = tuple(new_subterms)
        return phi
    return phi
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def term_substitution(language, phi, substitution, inplace=False):
    """ Return the result of applying the given substitution to the given formula or term of the language.
    If `inplace` is true, the given formula is the one modified.
    """
    assert isinstance(phi, (Formula, Term))
    #phi = phi if inplace else copy.deepcopy(phi)
    phi = visit(phi, substitution)
    return phi
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
