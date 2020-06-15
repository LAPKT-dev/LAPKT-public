#!/usr/bin/python3

################################################################################
#                                                                              #
# Lab :-    Python package for running code on a large set of benchmarks       #
#                                                                              #
# Info:     Parser for getting info from the log files                         #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              # 
# Date:     17-Aug-2019                                                        #
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

# https://lab.readthedocs.io/en/latest/lab.parser.html
from lab.parser import Parser

############ DEFINE UTILITY METHODS ############

def mark_last_element(iterable):
    """
    Creates a generator with 'mark' as True for the last item.
    Arguments:
    ==========
    iterable: an iterable object
    Returns:
    ========
    tuple: (mark, item), where last is only
    true if you are on the final iteration.
    """
    iterator = iter(iterable)
    chk = False
    try :
        lookback = next(iterator)
        chk = True
        while True :
            cur = next(iterator)
            yield False, lookback
            lookback = cur
    except StopIteration :
        if chk :
            yield True, lookback
        #raise StopIteration()

def modify_props_for_atomic_goals(content, props):
    """
    In case of multiple atomic goals, duplicates the non-list type properties
    for each goal. Resulting 'props' is a 'dict' of 'list' for each atomic-g 
    Arguments
    =========
    props : dict of properties
    Returns:
    ========
    None
    """

    if (props==None) or (props['atomic']==False) :
        return
    
    goals = re.findall(r'\((.*?)\)',props['goals'])

    num_goals = len(goals)
    size_list_attr = 0 #size of list for keys with list type values

    for g in goals:
        pass

    for key in props.keys():
        if isinstance(props[key], list):
            size_list_attr = len(props[key]) if size_list_attr==0 else size_list_attr
            if (num_goals-size_list_attr!=0) :
                props[key].extend([None]*(num_goals-size_list_attr))
            continue
        else :
            if key!='goals':
                val = props[key]
                props[key] = [val]*num_goals


## Define methods to parse the log in run.log/ other log file
# SYNTAX-function(open(file).read(), properties) # properties is a dictionary

def fetch_props(file_content, props):
    """
    get the parameter values from the run log file
    Arguments
    =========
    file_content - open(file).read() - file is passed from parser.add_function
    props - experiment's property dict
    Returns:
    ========
    dict - properties attribute values in a 'dict'
    """

    flag_new_value = False
    
    props['atomic'] = False
    if re.search(r'ATOMIC GOALS', file_content) :
        props['atomic'] = True
        flag_new_value = True
    g = re.search(r'Goals: (.*) \n', file_content)
    if g :
        props['goals'] = g.group(1);
        flag_new_value = True
    a = re.search(r'#Actions: (\d*)', file_content)
    if a :
        props['num_actions'] = a.group(1);
        flag_new_value = True
    f = re.search(r'#Fluents: (\d*)', file_content)
    if f :
        props['num_fluents'] = f.group(1);
        flag_new_value = True

    # initialize property variables
    cost = None
    generated = None
    expanded = None
    runtime = None
    memory = None
    plan = None
    goal = None
    width = None
    false_pos_novelty = None
    tuple_false_pos = None
    h1 = None
    h2 = None

    for last, content in mark_last_element(file_content.split('\n')):
        # Cost of plan
        cost_t = re.match(r'Plan found with cost: (\d+)',content)
        if cost_t:
            cost = cost_t.group(1)
            flag_new_value = True
        # Number of generated nodes
        generated_t = re.match(r'Nodes generated during search: (\d+)', content)
        if generated_t :
            generated = generated_t.group(1)
            flag_new_value = True
        # Number of expanded nodes
        expanded_t = re.match(r'Nodes expanded during search: (\d+)', content)
        if expanded_t:
            expanded = expanded_t.group(1)
            flag_new_value = True
        # Total Time
        runtime_t = re.match(r'Total time: ([\d.e-]+)', content)
        if runtime_t:
            runtime = runtime_t.group(1)
            flag_new_value = True
        # Memory
        memory_t = re.match(r'Max. Resident Set Size:(\d+)', content)
        if memory_t:
            memory = memory_t.group(1)
            flag_new_value = True
        # Plan
        plan_t = re.match(r'plan: ([^\n]+)', content)
        if plan_t:
            plan = plan_t.group(1)
            flag_new_value = True
        # Goal
        goal_t = re.match(r'Goal: ([^\n]+)', content)
        if goal_t:
            goal = goal_t.group(1)
            flag_new_value = True


        ## Width based algorithm specific
        width_t = re.match(r'Effective width: (\d+)', content)
        if width_t:
            width = width_t.group(1)
            flag_new_value = True
        
        fpn_t = re.match(r'Novelty false positives during search: (\d+)',
            content)
        if fpn_t:
            false_pos_novelty = fpn_t.group(1)
            flag_new_value = True

        tfp_t = re.match(r'Tuple false positives during search: (\d+)',
            content)
        if tfp_t:
            tuple_false_pos = tfp_t.group(1)
            flag_new_value = True

        h1_t = re.match(r'h1: (\d+)', content)
        if h1_t:
            h1 = h1_t.group(1)
            flag_new_value = True

        h2_t = re.match(r'h2: (\d+)', content)
        if h2_t:
            h2 = h2_t.group(1)
            flag_new_value = True

        if '****' in content or (last and flag_new_value):
            if (props['atomic']) :
                props.setdefault('cost',[]).append(cost)
                props.setdefault('generated',[]).append(generated)
                props.setdefault('expanded',[]).append(expanded)
                props.setdefault('runtime',[]).append(runtime)
                props.setdefault('memory',[]).append(memory)
                props.setdefault('plan',[]).append(plan)
                props.setdefault('goal',[]).append(goal)
                props.setdefault('width',[]).append(width)
                props.setdefault('false_pos_novelty',[]).append(false_pos_novelty)
                props.setdefault('tuple_false_pos',[]).append(tuple_false_pos)
                props.setdefault('h1',[]).append(h1)
                props.setdefault('h2',[]).append(h2)
            else:
                props['cost']       = cost
                props['generated']  =   generated
                props['expanded']   =   expanded
                props['runtime']    =   runtime
                props['memory']     =   memory
                props['plan']       =   plan
                props['goal']       =   goal
                props['width']      =   width
                props['false_pos_novelty']  =   false_pos_novelty
                props['tuple_false_pos']    =   tuple_false_pos
                props['h1']        =   h1
                props['h2']         =   h2
            flag_new_value = False


            cost = None
            generated = None
            expanded = None
            runtime = None
            memory = None
            plan = None
            goal = None
            width = None
            false_pos_novelty = None
            tuple_false_pos = None
            h1 = None
            h2 = None


#
        
parser = Parser()
parser.add_pattern('planner_exit_code', r'solve exit code: (.+)\n', 
        type=int, file='driver.log')
parser.add_function(fetch_props,'run.log')
parser.add_function(modify_props_for_atomic_goals, 'run.log')
parser.parse()

