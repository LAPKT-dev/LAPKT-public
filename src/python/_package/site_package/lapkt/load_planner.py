"""
MIT License

Copyright (c) 2022 Anubhav Singh(anubhav.singh.er@pm.me)
"""

from os import access, X_OK, environ, pathsep, system
from contextlib import contextmanager
from sre_constants import SUCCESS
from time import time, process_time
from sys import stdout
from os.path import isfile, join, dirname, realpath
from pathlib import Path

# lapkt imports
from . import planner

# External Libs
from ruamel.yaml import YAML

parent_folder = Path(__file__).parent.absolute()
rel_config_file = Path('planner/lapkt_planner_config.yml')
PLANNER_CONFIG_PATH = join(parent_folder, rel_config_file)
CWD = dirname(realpath(__file__))
# -----------------------------------------------------------------------------#


@contextmanager
def time_taken(task_name: str):
    """Track the time taken for a task.
    Usage - "with time_taken("<process name>"):
    :param task_name:name of the task
    :type task_name: str
    """
    start = (time(), process_time())
    print("|----------------------------------------------------------|")
    print("***Started - {} ...***".format(task_name))
    print("|----------------------------------------------------------|")
    stdout.flush()
    yield
    print("----------------------------------------------------------")
    print((
        "***Finished {} after {:.3f} seconds wall-clock time, {:.3f} " +
        "seconds CPU time***").format(task_name, time()-start[0],
                                      process_time()-start[1]))
    print("----------------------------------------------------------")
    stdout.flush()
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


def exists_exec(runfile, name):
    if runfile and isfile(runfile) and access(runfile, X_OK):
        return runfile
    elif any([isfile(join(path, name)) and
              access(join(path, name), X_OK)
              for path in environ["PATH"].split(pathsep)]):
        return name
    else:
        print("Please install external dependency/package - " + name)
        return None
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


class Planner:
    """Container to run the planner

    :raises ValueError: [description]
    :raises ValueError: [description]
    :raises ValueError: [description]
    :raises ValueError: [description]
    :return: [description]
    :rtype: [type]
    """
    # store
    config = None
    planner_instance = None
    solved = False

    # process
    def __init__(self, config: dict):
        self.config = config
        self._spawn_container(config['planner']['value'])
        self._configure_planner()
        with time_taken('LAPKT_PARSE_GROUND_TASK'):
            self._load_problem()
    
    def solve(self):
        with time_taken('LAPKT_SOLVE_TASK'):
            return self._exec()
        
    
    def validate(self):
        retval = validate_plan(
            self.config['domain']['value'],
            self.config['problem']['value'],
            self.config['plan_file']['value'])
        if retval == -1:
            print("Plan was not validated, since 'validate'" +
                  " binary was not found")
        else:
            self.solved = not retval
            out_status = "passed" if self.solved else "failed"
            print("'validate' check : Plan " + out_status)

    def _load_problem(self):
        """
        load problem from pddl files
        """
        if self.config['grounder']['value'] == 'Tarski':
            try:
                from .pddl.tarski import ground_generate_task as process_task
            except Exception:
                print('Tarski PDDL translator is not installed!')
                exit()
        elif self.config['grounder']['value'] == 'FF':
            try:
                from .pddl.ff import pddl_translate_ff as process_task
            except Exception:
                print('FF PDDL translator is not installed!')
                exit()
        elif self.config['grounder']['value'] == 'FD':
            try:
                from .pddl.fd import default as process_task
            except Exception:
                print('FD translator is not installed!')
                exit()
        else:
            # We can add options for procedurally generated problems here
            raise ValueError(
                "The value doesn't match supported parsers -" +
                " Tarski/FF/FD")

        if self.config['grounder']['value'] == 'FF':
            process_task(
                self.config['domain']['value'],
                self.config['problem']['value'], self.planner_instance,
                self.planner_instance.ignore_action_costs, False)
        elif (self.config['grounder']['value']
              in ['Tarski', 'FD']):
            process_task(
                self.config['domain']['value'],
                self.config['problem']['value'], self.planner_instance)
        else:
            # We can add handle  procedurally generated problems here
            pass
        print('#Actions:', self.planner_instance.num_actions())
        print('#Fluents:', self.planner_instance.num_atoms())
        return 0

    def _configure_planner(self):
        """
        load configs into planner
        """
        print("Loading Planner Config...")
        for k, v in self.config.items():
            if isinstance(v, dict) and v.get('var_name', None):
                try:
                    getattr(self.planner_instance, v['var_name'])
                except Exception:
                    raise ValueError('Check the variable name ', v['var_name'])
                setattr(self.planner_instance, v['var_name'], v['value'])
                print('"' + v['var_name'] + '"', "value set to: ",
                      getattr(self.planner_instance, v['var_name']))
            elif isinstance(v, dict) and v.get('func_name', None):
                try:
                    getattr(self.planner_instance, v['func_name'])(v['value'])
                except Exception:
                    raise ValueError('Check the setter name ', v['func_name'])
        return 0

    def _exec(self):
        """
        run planner
        """
        self.planner_instance.setup(
            bool(not (self.config.get('no_match_tree',
                      None) and self.config['no_match_tree']['value'])))
        self.planner_instance.solve()
        
        if self.config["anytime_fd"]['value'] != None:
            with time_taken("Running FD"):
                fd_cmd =  "python3 {} --plan-file {} --portfolio-bound {} {} {}".format(
                    self.config["anytime_fd"]['value'],
                    self.config["plan_file"]['value'], 
                    int(self.planner_instance.plan_cost), 
                    self.config['domain']['value'], 
                    self.config['problem']['value']
                )
                system(fd_cmd)
            
        return SUCCESS

    def _spawn_container(self, name):
        """
        Used to spawn a planner type object
        """
        try:
            print(dir(planner), name)
            self.planner_instance = getattr(planner, name)()
        except Exception:
            raise ValueError(
                "lapkt encountered error while loading the planner. " +
                "Verify the planner name, " + name)
        return 0
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


def validate_plan(domain_f, problem_f, plan_f):
    """
    Used to validate the plan (requires val-wrapper pypi package)
    """
    try:
        from val_wrapper import val_main
    except Exception:
        return -1
    with time_taken('LAPKT_VALIDATE_SOL'):
        return val_main("Validate", [domain_f, problem_f, plan_f])
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#


def load_planner_config(config_path=PLANNER_CONFIG_PATH):
    """load the yaml configuration file

    :return: a dictionary with a list of preconfigured planners
    :rtype: dict
    """
    with open(config_path) as from_f:
        return YAML(typ='safe').load(from_f)
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
