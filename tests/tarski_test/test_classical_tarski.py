#! /usr/bin/python3
# 1. A script similar to lapkt_run.py without the planner - Done, just modified lapkt_run.py
# 2. A lab frontend with following functionalities:
#   - checks parse-ground step
#   - checks instantiaton step
#   - creates a property file
# 3. An input for the lab frontend with yml list of problems
# 4. Test this for all parsers - Tarski, FD and FF
################################################################################
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

# standard library imports
#-----------------------------------------------------------------------------#
import time
import itertools
import sys
import copy
import contextlib
import re
from resource import (setrlimit, getrlimit, RLIMIT_AS, getrusage, RUSAGE_SELF, 
        RLIMIT_STACK, RLIMIT_DATA)
from psutil import virtual_memory
from ruamel.yaml import YAML
from pathlib import Path
#YAML(typ='safe').load(from_f)
#YAML(typ='safe').dump(problem_list, pfile)
from glob import glob
from os.path import isfile, dirname, basename, join, realpath
from os import cpu_count
from multiprocessing import Pool, Process, Pipe, Semaphore
from sys import platform
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
DEFAULTCOST         =   1
DEFAULTCOST_METRIC  =   1

"""
CLASSICAL_PATH      =   ('../classical_tmp/*/*' if (
                            platform.startswith('linux') or 
                            platform.startswith('darwin')) 
                            else '..\classical_tmp\*\*')
"""

#-----------------------------------------------------------------------------#
@contextlib.contextmanager
def time_taken( problem_info: dict, task_name: str) :
    """
    Track the time taken for a task.
    Usage - "with time_taken("<process name>") :"
    Arguments
    =========
    time_taken: string - name of the task
    """
    start = ( time.time(), time.process_time())
    print("***Started - {} ...***".format(
        basename(dirname(problem_info['dfile']))))
    sys.stdout.flush()
    yield
    #print( "{:.3f} , ".format(time.time()-start[0]), end="")
    problem_info[task_name+'_clock_time']  =   time.time()-start[0]
    problem_info['time']    += problem_info[task_name+'_clock_time']
    #problem_info[task_name+'_cpu_time']    =   time.process_time()-start[1]
    print(("***Finished {} after {:.3f} seconds wall-clock time, {:.3f} seconds "+
            "CPU time***\n").format( task_name, time.time()-start[0],
                time.process_time()-start[1] ))
    sys.stdout.flush()
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


#-----------------------------------------------------------------------------#
def parse_ground_pddl( problem_info, conn, sp) :
    """
    """
    setrlimit(RLIMIT_AS, (8000*1024*1024,8000*1024*1024))
    domain_file     =   problem_info['dfile']
    problem_file    =   problem_info['pfile']
    error = False
    problem_info['time']    =   0  
    problem_info['max_mem'] =   0  

    try :
        with time_taken(problem_info, "parser") :
            reader = FstripsReader( raise_on_error=True, theories=None)
            problem = reader.read_problem( domain_file, problem_file)
            problem_info['parser_mem']  =   getrusage(
                    RUSAGE_SELF).ru_maxrss/1000
            problem_info['max_mem'] =   max(problem_info['parser_mem'], 
                    problem_info['max_mem'])
    except Exception as e:
        problem_info['log_parser'] = str(e)
        problem_info['parser_clock_time']   =   None
        problem_info['parser_mem']          =   None
        error = True

    try :
        with time_taken(problem_info, "preprocess") :
            process_problem( problem)
            init = problem.init_bk
            problem_info['preprocess_mem']    =   getrusage(
                    RUSAGE_SELF).ru_maxrss/1000
            problem_info['max_mem'] =   max(problem_info['preprocess_mem'], 
                    problem_info['max_mem'])
    except Exception as e:
        problem_info['log_preprocess'] = str(e)
        problem_info['preprocess_clock_time']  =   None
        problem_info['preprocess_mem']    =   None
        error = True

    try :
        with time_taken(problem_info, "grounder") :
            grounding               =   LPGroundingStrategy(problem)
            reachable_action_params =   copy.deepcopy(grounding.ground_actions())
            fluents                 =   copy.deepcopy(grounding.ground_state_variables())
            del grounding
            count_params = 0
            for x, y in reachable_action_params.items() :
                for z in y :
                    count_params += 1
            print("Total number of reachable action params = ", count_params)
            problem_info['grounder_mem']    =   getrusage(
                    RUSAGE_SELF).ru_maxrss/1000
            problem_info['max_mem'] =   max(problem_info['grounder_mem'], 
                    problem_info['max_mem'])
    except Exception as e:
        problem_info['log_grounder'] = str(e)
        problem_info['grounder_clock_time']  =   None
        problem_info['grounder_mem']    =   None
        error = True

    #problem_info['error'] = error
    retval = (error, basename(dirname(domain_file)),
                basename(problem_file),
                problem_info.get('log_parser',''),
                problem_info.get('log_preprocess',''), 
                problem_info.get('log_grounder',''))
    if conn :
        conn.send((problem_info, retval))
    sp.release()
    return problem_info, retval
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

def test_classical() :
    CWD             =   dirname(realpath(__file__))
    CLASSICAL_PATH  =   ('classical_pddl_samples/*/*' if (
                            platform.startswith('linux') or 
                            platform.startswith('darwin')) 
                            else 'classical_pddl_samples\*\*')
    file_depth_2 = [x for x in filter(lambda f: isfile(f), 
        glob(CLASSICAL_PATH))]
    pddl_pair = {}
    while len(file_depth_2) > 0:
        domain = basename(dirname(file_depth_2[0]))
        pddl_pair[domain] = {}
        if re.search('domain', file_depth_2[0]):
            dfile  = file_depth_2[0]
        else :
            problem= basename(file_depth_2[0])
            pfile  = file_depth_2[0]
        del file_depth_2[0]
        n_id = 0

        for i in range(len(file_depth_2)) :
            x = file_depth_2[i]
            if re.search(domain, x) :
                if re.search('domain', file_depth_2[0]):
                    dfile  = file_depth_2[0]
                else :
                    problem = basename(file_depth_2[0])
                    pfile  = file_depth_2[0]
                n_id = i
                break
        del file_depth_2[n_id]
        pddl_pair[domain]['problem']= problem
        pddl_pair[domain]['dfile']  = dfile
        pddl_pair[domain]['pfile']  = pfile

    error_code = ''
    cores = min(cpu_count(),int(virtual_memory().available/8000000000))
    if cores < 1 :
        raise Exception("The system doesn't have enough memory available, >= 8GB")
    else :
        print("Total cores used =", cores)

    sp = Semaphore(cores)
    parent_connection = []

    for p in pddl_pair.values() :
        parent_conn, child_conn = Pipe()
        sp.acquire()
        proc= Process(target=parse_ground_pddl, args=(p,child_conn, sp,))
        parent_connection.append((parent_conn, proc))
        proc.start()

    for conn, child in parent_connection:
        x, error   = conn.recv()  
        domain  =   basename(dirname(x['dfile']))
        del x['dfile']
        del x['pfile']
        pddl_pair[domain] = x
        if error[0] :
            error_code = '\n\n'.join([error_code, '\n'.join(error[1:])])
        child.join()

    with open(join(CWD,'log'),'w+') as logfile :
        YAML().dump(pddl_pair, logfile)

    if not error_code=='':
        raise Exception(error_code)


#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
if __name__=="__main__" :
    test_classical()
