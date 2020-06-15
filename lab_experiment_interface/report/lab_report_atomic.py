#!/usr/bin/python3

################################################################################
#                                                                              #
# Lab :-    Python package for running code on a large set of benchmarks       #
#                                                                              #
# Info:     Generated Reports                                                  #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              # 
# Date:     3-Sep-2019                                                         #
#                                                                              #
################################################################################

# NOTES:
# 1. When IW timesout no logs are captured for remaining atomic goals
# -- Then the number of output rows may differ for algorithms
# -- Match the rows by Problem-Goal pair and discard all missing val rows

# 2. Need to capture the coverage of the algo automatically
# -- Add this to the lab_report
# -- IW: Add a parameter in <>.cxx code to get total number of atomic goals

# 3.

import re
import json

from downward.reports import PlanningReport
from downward.reports.scatter import ScatterPlotReport
from downward.reports.absolute import AbsoluteReport
from downward.reports.compare import ComparativeReport
from downward.reports.taskwise import TaskwiseReport


############ DEFINE UTILITY METHODS ############

def overrides(parent_class):
    """
    Decorator function - to assert that the method exists and can be overridden
    parent_class: name of the class
    """
    def overrider(method):
        assert(method.__name__ in dir(parent_class))
        return method
    return overrider

def modify_props_for_atomic_goals(props):
    """
    Modify the props according to the 
    This will only work alongside the lab_parser.py - preprocesses the props
    Arguments
    =========
    props : dict of properties
    Returns:
    ========
    None
    """
    # Do nothing, if 'props' values are not list or 'props' is 'None'
    # (planner output does not split properties for each atomic goals)
    # - Defaults to standard implementation as per downward lib
    new_props = dict()
    run_ids = list(props.keys())
    for run in run_ids :
        if props[run]==None or not isinstance(props[run]['goal'], list) :
            continue
        goals = re.findall(r'\((.*?)\)',props[run]['goals'])
        del props[run]['goals']
        num_goals = len(goals)

        new_id = [] # create new id attribute value for atomic goals
        for key in props[run].keys() :
            if isinstance(props[run][key], list) :
                if (key=='id') :
                    x = props[run][key]
                    for goal in props[run]['goal']:
                        new_id.append(x+[goal])
                    props[run][key] = new_id
                else :
                    continue
            elif (key=='problem'):
                val             = props[run][key]
                props[run][key] = []
                for goal in props[run]['goal'] :
                    props[run][key].append(val+goal)
            else :
                val             = props[run][key]
                props[run][key] = [val]*num_goals
                if key == 'domain':
                    assert isinstance(props[run]['domain'],list)

        
        assert 'domain' in props[run].keys()
        for attr in props[run].keys():
            assert len(props[run]['id'])==len(props[run][attr])
            assert len(props[run]['id'])>0
            new_id = None
            for id_l, val in  zip(props[run]['id'], props[run][attr]):
                new_id = "-".join(id_l)
                new_props.setdefault(new_id,{})[attr] = val
    return new_props



############ DEFINE REPORT SUB-CLASSES ############

class AtmScatterPlotReport(ScatterPlotReport):
    """
    Class for the ScatterPlotReport object, customized for planners 
    running on atomic goals. Hence, returning a dict of prop. list for eachm,
    problem where values in list correspond to each atomic goal.
    """
    @overrides(ScatterPlotReport)
    def _load_data(self):
        super()._load_data()
        if self.props :
            modify_props_for_atomic_goals(self.props)

class AtmAbsoluteReport(AbsoluteReport):
    """
    Class for the AbsoluteReport object, customized for planners 
    running on atomic goals. Hence, returning a dict of prop. list for eachm,
    problem where values in list correspond to each atomic goal.
    """
    @overrides(AbsoluteReport)
    def _load_data(self):
        super()._load_data()
        if self.props :
            modify_props_for_atomic_goals(self.props)

class AtmCompare(ComparativeReport):
    """
    Class for the ComparativeReport object, customized for planners 
    running on atomic goals. Hence, returning a dict of prop. list for eachm,
    problem where values in list correspond to each atomic goal.
    """   
    @overrides(ComparativeReport)
    def _load_data(self):
        super()._load_data()
        if self.props :
            modify_props_for_atomic_goals(self.props)

class AtmPlanningReport(PlanningReport):
    """
    Class for the PlanningReport object, customized for planners 
    running on atomic goals. Hence, returning a dict of prop. list for eachm,
    problem where values in list correspond to each atomic goal.
    """
    @overrides(PlanningReport)
    def _load_data(self):
        super()._load_data()
        if self.props :
            modify_props_for_atomic_goals(self.props)

class AtmTaskwiseReport(TaskwiseReport):
    """
    Class for the PlanningReport object, customized for planners 
    running on atomic goals. Hence, returning a dict of prop. list for eachm,
    problem where values in list correspond to each atomic goal.
   """
    @overrides(TaskwiseReport)
    def _load_data(self):
        #assert self.props != None
        super()._load_data()
        self.props = modify_props_for_atomic_goals(self.props)
        #with open('updated_props.txt', 'w') as f:
        #    f.write(json.dumps(self.props, indent=2, separators=(',', ': '), sort_keys=True))
        #for key in self.props.keys():
        #    assert isinstance(self.props[key]["algorithm"], list)
        


