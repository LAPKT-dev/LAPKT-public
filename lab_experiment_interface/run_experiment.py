#!/usr/bin/python3

################################################################################
#                                                                              #
# Lab :-    Python package for running code on a large set of benchmarks       #
#                                                                              #
# Problem:  Experimental setup for Space and Time efficient IW                 #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              #
# Date:     24-Oct-2019                                                        #
#                                                                              #
################################################################################

############ IMPORT LIBRARIES ############

#import glob
import platform
import argparse
import re
from ruamel.yaml import YAML
#import shutil
import itertools
from pathlib import Path

from lab.experiment import ARGPARSER
from lab.environments import LocalEnvironment, BaselSlurmEnvironment
from lab.experiment import Experiment
from lab.parser import Parser
from os import cpu_count, rename, makedirs
from os.path import basename, abspath, dirname, join, realpath, isfile, isdir
from report.gen_report import *
#from lab_report import *

#---- DEFINE COMMON CONFIG PARAMETERS -----------------------------------------#
CONFIG_FILE         =   'experiment_config.yml'
REPORT_HEADER_FILE  =   'report_header_config.yml'
LOG_PARSER          =   'parser/lab_parser.py'
CWD                 =   dirname(realpath(__file__))
CLR_TMP_PATH        =   join(CWD, Path('clear_tmp.sh'))

# Define path and local system parameters
NODE            =   platform.node()
REMOTE          =   None #NODE.endswith( ".unimelb.edu.au")
SCRIPT_DIR      =   dirname(abspath(__file__))
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#---- PARSE COMMAND-LINE ARGS -------------------------------------------------#
with open(join(CWD, Path(CONFIG_FILE)), 'r') as fc_p:
    config = YAML(typ='safe').load(fc_p)

ARGPARSER.add_argument('--SOLVERS', nargs='+', action='store', 
        default=[join(CWD, Path(x)) for x in config['SOLVERS']], 
        required=False, help='USAGE: --SOLVERS\
       "<PATH-to-solver> <args>" "solver2 <args>"...')
ARGPARSER.add_argument('--NUM_PROC',  nargs='?', type=int, action='store', 
        default=int(config['NUM_PROC']) if config['NUM_PROC'] else cpu_count(), 
        help='number of processors')
ARGPARSER.add_argument('--PLIST_YML', action='store', default=join(CWD, 
    Path(config['PLIST_YML'])), nargs='?', help='yaml file with list of problems,\
            check "example.json"')
ARGPARSER.add_argument('--BNAME', nargs='*',  action='store', 
        default=config['BNAME'], help='benchmark dir-name')
ARGPARSER.add_argument('--DNAME', nargs='*', action='store', 
        default=config['DNAME'], help='domain name')
ARGPARSER.add_argument('--PNAME', nargs='*', action='store', 
        default=config['PNAME'], help='problem name')
ARGPARSER.add_argument('--PLAN_FILE', nargs='*', action='store', 
        default=config['PLAN_FILE'], help='domain name')
ARGPARSER.add_argument('--TAGS', nargs='*', action='store', 
        default=config['TAGS'], help='domain name')
ARGPARSER.add_argument('--VALIDATE', nargs='?', action='store', 
        default=join(CWD, Path(config['VALIDATE'])), 
        help='Path to validate executable')
ARGPARSER.add_argument('--EXP_DIR', nargs='?', action='store', 
        default=join(CWD, Path(config['EXP_DIR'])), 
        help='path to directory to store results')
ARGPARSER.add_argument('--EXP_NAME', nargs='?', action='store', 
        default=config['EXP_NAME'], help='path to directory to store results')
# Parse the arguments
args = ARGPARSER.parse_args()
args.TIME_LIMIT      =   config['TIME_LIMIT']   # seconds
args.MEMORY_LIMIT      =   config['MEMORY_LIMIT']   # seconds

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#---- SETUP EXPERIMENT -------------------------------------------------------#

# Setup local/remote environment
if REMOTE:
    ENV = None #To be use later for HPC infrastructure
else:
    # NOTE: if "processes = NUM_PROCESSES" is omitted, then default is #CPUs
    ENV = LocalEnvironment(processes=args.NUM_PROC)

exp =   Experiment(path=join(args.EXP_DIR, "results"), environment=ENV)
exp.add_parser(join(CWD, Path(LOG_PARSER)))

if (len(args.steps)>0 and ('1' in args.steps or 'build' in args.steps)) or \
        args.run_all_steps : 
    # Don't over-write instead create backups
    index = 0
    while( isdir(args.EXP_DIR) and index!=1000):
        index += 1
        try :
            rename(args.EXP_DIR, args.EXP_DIR+'_'+str(index))
        except :
            pass
    makedirs(args.EXP_DIR)

# Add step to write experiment files to disk
exp.add_step('build', exp.build)

# Add step to execute all runs
exp.add_step('start', exp.start_runs)

# Add step to parse again if needed, default step name = 'parse-again'
#exp.add_parse_again_step()

#
exp.add_fetcher(name='fetch')

# Setup experiment runs for each domain problem:
# returns: -
def setup_exp_run(args, exp, algo, dfile, pfile, bname, domain, problem):
    """
    """
    run         =   exp.add_run()
    solver      =   algo.strip().split()
    solver[0]   =   abspath(solver[0])
    if re.match( r'fast-downward\d*\.py' , basename(solver[0])) :
        solver.extend(['--plan_file', args.PLAN_FILE,abspath(dfile), abspath(pfile)])
    else :
        solver.extend(['--domain', abspath(dfile),
                    '--problem', abspath(pfile),
                    '--plan_file',args.PLAN_FILE])
    #print(solver)
    #print('command: ',solver)
    run.add_command('solve',solver,
            time_limit=args.TIME_LIMIT, memory_limit=args.MEMORY_LIMIT)
    run.set_property('benchmark_name', bname)
    run.set_property('domain', domain)
    run.set_property('problem', problem)
    run.set_property('algorithm', basename(algo))
    run.set_property('time_limit', args.TIME_LIMIT)
    run.set_property('memory_limit', args.MEMORY_LIMIT)
    run.set_property('coverage', 0)
    run.set_property('id', [basename(algo),".".join(bname),domain,
                            ".".join(basename(pfile).split('.')[:-1])] )
    if args.VALIDATE :
        validate    =   [abspath(args.VALIDATE),]
        validate.extend([abspath(dfile), abspath(pfile),args.PLAN_FILE])
        run.add_command('validate',validate,
            time_limit=args.TIME_LIMIT, memory_limit=args.MEMORY_LIMIT)

    ### A HACK for Tarski unbound tmp file issue - to be removed
    if isfile(CLR_TMP_PATH) :
        run.add_command('clear_tmp',[abspath(CLR_TMP_PATH),],
            time_limit=args.TIME_LIMIT, memory_limit=args.MEMORY_LIMIT)
    ### A HACK - to be removed

with open(Path(args.PLIST_YML),'r') as pfile :
    problem_list = YAML(typ='safe').load(pfile)

for algo in args.SOLVERS :
    for domain, b_dict in problem_list.items() :
        if args.DNAME and not any([re.search(d, domain) for d in args.DNAME]) : continue
        for bname, plist in b_dict.items() :
            if args.BNAME and not any([b in bname for b in args.BNAME]) : continue
            for pname, p in plist.items() :
                if args.PNAME and not any([re.match(p, pname) for p in args.PNAME]) : continue
                if args.TAGS and p['tag'] \
                    and not any([re.match(t, p['tag']) for t in args.TAGS]) : continue
                dfile = join(abspath(dirname(args.PLIST_YML)), Path(p['domain_file']))
                pfile = join(abspath(dirname(args.PLIST_YML)), Path(p['problem_file']))
                setup_exp_run(args, exp, algo, dfile, pfile, bname, domain, pname)

if (len(args.steps)>0 and (1 in args.steps or 'build' in args.steps)) or \
        args.run_all_steps : 
    with open(join(args.EXP_DIR,'plist.yml'),'w+') as pfile :
        YAML(typ='safe').dump(problem_list, pfile)

# Add step to make a report
with open(join(CWD, Path(REPORT_HEADER_FILE)), 'r') as fh_p:
    header_config = YAML(typ='safe').load(fh_p)
add_taskwise_report(exp, args, header_config)
generate_pairwise_comparison_rp(exp, args, header_config)

    # Parse and run steps
exp.run_steps()

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
