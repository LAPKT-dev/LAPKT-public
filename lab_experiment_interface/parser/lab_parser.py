#!/usr/bin/python3

################################################################################
#                                                                              #
# Lab :-    Python package for running code on a large set of benchmarks       #
#                                                                              #
# Info:     Parser for getting info from the log files                         #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              # 
# Date:     24-Oct-2019                                                        #
#                                                                              #
################################################################################

# What are the contents to be parsed here ?
# Info for all problems
# 1. Generated nodes
# 2. Expanded nodes
# 3. Execution Time
# 
# Info for IW algo - above + following
# 1. Width
# 2. Count pruned states because of IW
# ++ for Bloomfilter
# 3. % of bloom-filter which is filled - overtime.
#
# Info for BFWS problems - above + following
# 1. For each width-value, number of states where the minimum width for which 
#       each state was expanded equals width-value

import re
import math
from os.path import basename, abspath, dirname

# https://lab.readthedocs.io/en/latest/lab.parser.html
from lab.parser import Parser

############ DEFINE UTILITY METHODS ############


## Define methods to parse the log in run.log/ other log file
# SYNTAX-function(open(file).read(), properties) # properties is a dictionary
#-----------------------------------------------------------------------------#
def fetch_props(content, props):
    """
    get the parameter values from the run log file
    Arguments
    =========
    content - open(file).read() - file is passed from parser.add_function
    props - experiment's property dict
    Returns:
    ========
    dict - properties attribute values in a 'dict'
    """

    # Number of Actions
    x   =   re.search(r'#Actions: (\d*)', content)
    props['num_actions']    =   int(x.group(1)) if x else None 

    # Number of Fluents
    x   =   re.search(r'#Fluents: (\d*)', content)
    props['num_fluents']    =   int(x.group(1)) if x else None

    # Cost of plan
    # Anu: Known issue - anytime planners return many matches!
    x               =   re.search(r'Final value: ([\d.e-]+)', content)
    props['plan_cost']   =   float(x.group(1)) if x else None
    if props['plan_cost']==None :
        x               =   re.search(r'Plan cost: ([\d.e-]+)', content)
        props['plan_cost']   =   float(x.group(1)) if x else None
    if props['plan_cost']==None :
        x   =   re.search(r'Plan found with cost: ([\d.e-]+)', content)
        props['plan_cost']           =   float(x.group(1)) if x else None
    props['is_plan_found']  =   True if x else False

    # Number of generated nodes
    x   =   re.search(r'Nodes generated during search: (\d+)', content)
    props['generated']  =   int(x.group(1)) if x else None
    if  props['generated']  == None:
        x   =   re.search(r'Generated (\d+) state', content)
        props['generated']    =   int(x.group(1)) if x else None

    # Number of expanded nodes
    x   =   re.search(r'Nodes expanded during search: (\d+)', content)
    props['expanded']   =   int(x.group(1)) if x else None
    if  props['expanded']  == None:
        x   =   re.search(r'Expanded (\d+) state', content)
        props['expanded']    =   int(x.group(1)) if x else None

    # Total Time
    x   =   re.search(r'Finished LAPKT_ALL_TASKS after ([\d.e-]+)', content)
    props['runtime_total']    =   float(x.group(1)) if x else None
    
    # Parsing+grounding Time
    x   =   re.search(r'Finished LAPKT_PARSE_GROUND_TASK after ([\d.e-]+)', content)
    props['runtime_parser']    =   float(x.group(1)) if x else None

    # Solve Time
    x   =   re.search(r'Finished LAPKT_SOLVE_TASK after ([\d.e-]+)', content)
    props['runtime_solver']    =   float(x.group(1)) if x else None
    # Anu: Known issue - anytime/portfolio planners return many matches!
    if props['runtime_solver'] == None :
        x   =   re.search(r'Total time: ([\d.e-]+)', content)
        props['runtime_solver']    =   float(x.group(1)) if x else None
    if props['runtime_solver'] == None :
        x   =   re.search(r'Actual search time: ([\d.e-]+)', content)
        props['runtime_solver']    =   float(x.group(1)) if x else None

    # Memory
    x   =   re.search(r'Max. Resident Set Size:(\d+)', content)
    props['memory']     =   float(x.group(1)) if x else None
    if props['memory'] == None :
        x = re.search(r'Peak memory: (\d+)', content)
        props['memory'] = float(x.group(1))/1000 if x else None

    # Goal
    x   =   re.search(r'Goal: ([^\n]+)', content)
    props['goal']       =   x.group(1) if x else None
    # Goal found - boolean

    #----  Width based algorithm specific
    x   =   re.search(r'Effective width: (\d+)', content)
    props['width']      =   int(x.group(1)) if x else None
    x   =   re.search(r'h1: (\d+)', content)
    props['h1']         =   int(x.group(1)) if x else None
    x   =   re.search(r'h2: (\d+)', content)
    props['h2']         =   int(x.group(1)) if x else None
    x   =   re.search(r'Nodes pruned by bound: (\d+)', content)
    props['pruned']     =   int(x.group(1)) if x else None
    x   =   re.search(r'Num nodes random pruned: (\d+)', content)
    props['OLC_pruned']     =   int(x.group(1)) if x else None
    x   =   re.search(r'Novelty false positives during search: (\d+)', content)
    props['false_pos_novelty']  =   int(x.group(1)) if x else None
    x   =   re.search(r'Tuple false positives during search: (\d+)', content)
    props['tuple_false_pos']    =   int(x.group(1)) if x else None

    x   =   re.search(r'Max novelty node generated: (\d+)', content)
    props['max_novelty_generated']    =   int(x.group(1)) if x else None
    x   =   re.search(r'Max novelty node expanded: (\d+)', content)
    props['max_novelty_expanded']    =   int(x.group(1)) if x else None

    for i in range(1,11) :
        x   =   re.search(r'Solution nodes of novelty '+str(i)+r': (\d+)', content)
        props['novelty_'+str(i)+'_sol_nodes']    =   int(x.group(1)) if x and \
                                    not math.isnan(int(x.group(1))) else 0

    for i in range(1,11) :
        x   =   re.search(r'Count novelty '+str(i)+' generated nodes: (\d+)', content)
        props['novelty_'+str(i)+'_gen_count']    =   int(x.group(1)) if x and \
                                    not math.isnan(int(x.group(1))) else 0
    for i in range(1,11) :
        x   =   re.search(r'Count novelty '+str(i)+' expanded nodes: (\d+)', content)
        props['novelty_'+str(i)+'_exp_count']    =   int(x.group(1)) if x and \
                                    not math.isnan(int(x.group(1))) else 0

    x   =   re.search(r'Plan found in iteration: (\d+)', content)
    props['iteration_index']    =   int(x.group(1)
            ) if x and not math.isnan(int(x.group(1))) else None
    x   =   re.search(r'Num Partitions: (\d+)', content)
    props['num_partitions']    =   int(x.group(1)
            ) if x and not math.isnan(int(x.group(1))) else None
    
    if (re.search(r'Holding Queue was Popped', content)) :
        props['HQ_Popped'] = True
    else:
        props['HQ_Popped'] = False

    # Parse validate output
    if (re.search(r'Plan valid', content)) :
        props['is_plan_valid'] = True
    else:
        props['is_plan_valid'] = False

    #----  Bloom-sampling algorithm specific
    x   =   re.search(r'Bloom Fillratio: ([\d.e-]+)', content)
    props['bloom_fillratio']      =   float(x.group(1)) if x else None
    x   =   re.search(r'Novelty-Num_nodes Map: ([^\n]+)', content)
    props['novelty:num_nodes']      =   x.group(1) if x else None
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def coverage(content, props) :
    props['coverage']       =   int(props['is_plan_valid']==True)
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
def parse_plan(content, props) :
    x   =   re.match(r'.*', content, re.DOTALL)
    props['plan']       =   x.group(0) if x else none
    props['plan_file']  =   abspath('plan.ipc')
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

parser = Parser()
parser.add_pattern('solver_exit_code', r'solve exit code: (.+)\n', 
        type=int, file='driver.log')
parser.add_pattern('validate_exit_code', r'validate exit code: (.+)\n', 
        type=int, file='driver.log')
parser.add_pattern('lab_exit_code', r'lab_parser exit code: (.+)\n', 
        type=int, file='driver.log')
parser.add_function(fetch_props,'run.log')
parser.add_function(parse_plan,'plan.ipc')
parser.add_function(coverage)
parser.parse()
