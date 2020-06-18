#! /usr/bin/python3
import builtins
from pathlib import Path
from yaml import safe_load
from argparse import ArgumentParser, Action
from importlib import import_module
from re import match
from subprocess import run
# LAPKT Imports
from lib import planner
from contextlib import contextmanager
from time import time, process_time, sleep
from sys import stdout
from os.path import join, isfile, isdir, dirname, realpath

# Parameters which must be set correctly
parent_folder       =   Path(__file__).parent.absolute()
rel_config_file     =   Path('config/lapkt_planner_config.yml')
PLANNER_CONFIG_PATH =   join(parent_folder, rel_config_file)
rel_validate_file   =   Path('bin/validate')
VALIDATE_PATH       =   join(parent_folder, rel_validate_file)
CWD                 =   dirname(realpath(__file__))

# Verifying input against BUILTIN_TYPES prevents security issue with eval(<input>)
BUILTIN_TYPES = [d for d in dir(builtins) if isinstance(getattr(builtins, d), type)]
#-----------------------------------------------------------------------------#
@contextmanager
def time_taken( task_name: str) :
    """
    Track the time taken for a task.
    Usage - "with time_taken("<process name>") :"
    Arguments
    =========
    time_taken: string - name of the task
    """
    start = (time(), process_time())
    print("|----------------------------------------------------------|")
    print("***Started - {} ...***".format(task_name))
    print("|----------------------------------------------------------|")
    stdout.flush()
    yield
    #print( "{:.3f} , ".format(time.time()-start[0]), end="")
    print("----------------------------------------------------------")
    print(("***Finished {} after {:.3f} seconds wall-clock time, {:.3f} seconds "+
            "CPU time***").format( task_name, time()-start[0],
                process_time()-start[1] ))
    print("----------------------------------------------------------")
    stdout.flush()
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

class Run_planner:
    """
    Container to run the planner
    """
    # store
    config = None
    planner_instance = None
    solved = False 

    # process
    def __init__(self, config: dict):
        self.config             =   config
        with time_taken('LAPKT_ALL_TASKS') :
            self._spawn_container(config['planner']['value'])
            self._configure_planner()
            with time_taken('LAPKT_PARSE_GROUND_TASK') :
                self._load_problem()
            with time_taken('LAPKT_SOLVE_TASK') :
                self._exec()
            self._validate_plan()

    def _load_problem(self) :
        """
        load problem from pddl files
        """
        if config['lapkt_instance_generator']['value'] == 'Tarski' :
            from lib.tarski import ground_generate_task as process_task
        elif config['lapkt_instance_generator']['value'] == 'FF' :
            if isdir(join(CWD, Path('lib/ff'))) :
                from lib.ff import gen_problem_description as process_task 
            else :
                print('FF Translate is not installed!')
                exit()
        elif config['lapkt_instance_generator']['value'] == 'FD' :
            if isdir(join(CWD, Path('lib/fd'))) :
                from lib.fd import default as process_task
            else :
                print('FD Translate is not installed!')
                exit()
        else :
            # We can add options for procedurally generated problems here
            raise ValueError("The value doesn't match supported parsers - Tarski/FF/FD")

        if config['lapkt_instance_generator']['value'] == 'FF' :
            process_task(config['domain']['value'], config['problem']['value'],
                self.planner_instance, 
                self.planner_instance.ignore_action_costs, False)
        elif config['lapkt_instance_generator']['value'] in ['Tarski', 'FD'] :
            process_task(config['domain']['value'], config['problem']['value'],
                self.planner_instance)
        else :
            # We can add handle  procedurally generated problems here
            pass
        print('#Actions:', self.planner_instance.num_actions())
        print('#Fluents:', self.planner_instance.num_atoms())
        return 0

    def _configure_planner(self) :
        """
        load configs into planner
        """
        print("Loading Planner Config...")
        for k, v in config.items() :
            if isinstance(v, dict) and v.get('var_name', None) :
                try :
                    getattr(self.planner_instance, v['var_name'])
                except :
                    raise ValueError('Check the variable name ',v['var_name'])
                setattr(self.planner_instance, v['var_name'],v['value'])
                print('"'+v['var_name']+'"', "value set to: ", getattr(self.planner_instance, v['var_name']))
            elif isinstance(v, dict) and v.get('func_name', None) :
                try :
                    getattr(self.planner_instance, v['func_name'])(v['value'])
                except :
                    raise ValueError('Check the setter name ',v['func_name'])
        return 0

    def _exec(self) :
        """
        run planner
        """
        self.planner_instance.setup()
        self.planner_instance.solve()
        return 0

    def _spawn_container(self, name) :
        """
        Used to spawn a planner type object
        """
        try :
            self.planner_instance   =   getattr(planner, name)()
        except :
            raise ValueError("Either planner name, " +name+
                    ", is wrong or lapkt didn't load it")
        return 0

    def _validate_plan(self) :
        """
        Used to validate the plan
        """
        if isfile(VALIDATE_PATH) :
            with time_taken('LAPKT_VALIDATE_SOL') :
                self.solved =  not run([VALIDATE_PATH, self.config['domain']['value'], 
                    self.config['problem']['value'],
                    self.config['plan_file']['value']]).returncode
            print("Is instance Solved =", self.solved)
        return 0


#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

def store_value(args, config) :
    """
    A utility to generate config from cmd args
    """
    config['planner'] = dict()
    for k in dir(args) :
        if match(r'^[^_]\w*',k) : 
            config.setdefault(k,dict())['value'] = getattr(args, k)
    return 0

if __name__ ==  "__main__" :
    parser_main =   ArgumentParser(description= "Process planner input")
    parser_sub  =   parser_main.add_subparsers(help='sub-command help')
    #args, planner_args  =   parser_main.parse_known_args()

    # Load the parsing args from the config file on PLANNER_CONFIG_PATH
    with open(PLANNER_CONFIG_PATH) as from_f :
        list_planner_config = safe_load(from_f)
        for k,options in list_planner_config.items() :
            parser = parser_sub.add_parser(k, 
                    help='Use '+k+' -h'+' to view planner options')
            for opt, parser_args in options.items():
                if isinstance(parser_args, dict) and \
                        parser_args.get('cmd_arg', None):
                    has_type = parser_args['cmd_arg'].get('type', None)
                    if has_type and has_type in BUILTIN_TYPES :
                        parser_args['cmd_arg']['type'] = eval(has_type)
                    parser.add_argument('--'+opt, **parser_args['cmd_arg'])
                    del parser_args['cmd_arg'] #Will be in the Arg-parser
            # Add common cmd args
            parser.add_argument( '-d', '--domain', action='store', nargs='?',
                    required=True, help='path to the domain pddl file')
            parser.add_argument( '-p', '--problem', action='store', nargs='?',
                    required=True, help='path to the problem pddl file')
            parser.add_argument( '--lapkt_instance_generator', action='store', nargs='?',
                    default='Tarski', 
                    help='Choice of parser - Tarski<Default>,FD or FF')
            parser.set_defaults(planner=k)

        #print(list_planner_config)
        args        =   parser_main.parse_args()

        try :
            config      =   list_planner_config[args.planner]
        except:
            print("Use option '-h' for help")
            exit(0)
        store_value(args, config) 
        run_status  =   Run_planner(config).solved
