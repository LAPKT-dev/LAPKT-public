#! /usr/bin/python3
from lapkt import planner
from lapkt.run import Run_planner

from os import cpu_count, fork, waitpid
from ruamel.yaml import YAML
from contextlib import contextmanager
from os.path import basename, dirname, realpath, isfile, join
from resource import (setrlimit, getrlimit, RLIMIT_AS, getrusage, RUSAGE_SELF,
        RLIMIT_STACK, RLIMIT_DATA)
from multiprocessing import Pool, Process, Pipe, Semaphore
from psutil import virtual_memory
from sys import platform, stdout, exit
from glob import glob
import signal

import re
import time

#-----------------------------------------------------------------------------#
@contextmanager
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
        basename(dirname(problem_info['domain']))))
    stdout.flush()
    yield
    #print( "{:.3f} , ".format(time.time()-start[0]), end="")
    problem_info[task_name+'_clock_time']  =   time.time()-start[0]
    #problem_info[task_name+'_cpu_time']    =   time.process_time()-start[1]
    print(("***Finished {} after {:.3f} seconds wall-clock time, {:.3f} seconds "+
            "CPU time***\n").format( task_name, time.time()-start[0],
                time.process_time()-start[1] ))
    stdout.flush()
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#-----------------------------------------------------------------------------#
class Run_instantiator(Run_planner) :

    def __init__(self, config: dict) :
        conn = config['conn']
        self.error              = True
        problem_info = {}
        problem_info['domain']  = basename(dirname(config['domain']['value']))
        problem_info['problem'] = basename(config['problem']['value'])
        problem_info['instance_generator'] = \
                config['lapkt_instance_generator']['value']
        setrlimit(RLIMIT_AS, (8000*1024*1024,8000*1024*1024))
        self.config             =   config
        with time_taken(problem_info, 'total') :
            try :
                self._spawn_container(config['planner']['value'])
                self._configure_planner()
                self._load_problem() 
                self.error  = False
            except Exception as e:
                problem_info['error_log'] = str(e)
        problem_info['max_memory']  =   getrusage(
                    RUSAGE_SELF).ru_maxrss/1000
        conn.send((problem_info, (self.error, problem_info['domain'],
            problem_info['problem'], problem_info.get('error_log',None))))
    #xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

def exec_instantiator(config) :
    sp = config['sp']
    try :
        Run_instantiator(config)
        #proc = Process(target=Run_instantiator, args=(config,))
        #proc.start()
        #proc.join()
    except :
        pass
    sp.release()

"""
def exec_instantiator(config) :
    sp = config['sp']
    try :
        #proc = Process(target=Run_instantiator, args=(config,))
        n = fork()
        if n == 0 :
            Run_instantiator(config)
            sys.exit(0)
        pid, status = os.waitpid(n, 0)
    except :
        pass
    sp.release()
"""

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
    out_pair = {}
    for instance_generator in ['Tarski', 'FF', 'FD'] :
        for p in pddl_pair.values() :
            config = {}
            config['planner']   =   {}
            config['domain']    =   {}
            config['problem']   =   {}
            config['lapkt_instance_generator']          =   {}
            config['lapkt_instance_generator']['value'] =   instance_generator
            config['planner']['value']  =  'STRIPS_Interface'
            config['domain']['value']   =  p['dfile']
            config['problem']['value']  =  p['pfile']
            parent_conn, child_conn = Pipe()
            sp.acquire()
            config['conn']      =   child_conn
            config['sp']        =   sp
            proc= Process(target=exec_instantiator, args=(config,))
            parent_connection.append((parent_conn, proc, config))
            proc.start()
            out_pair[instance_generator] = {}

    for conn, child, cnfg in parent_connection:

        if conn.poll() :
            x, error   = conn.recv()  
            domain  =   x['domain']
            del x['domain']
            out_pair[cnfg['lapkt_instance_generator']['value']][domain] = x
            if error[0] :
                error_code = '\n\n'.join([error_code, '\n'.join(error[1:])])
        else :
            x = {}
            error = True
            domain = basename(dirname(cnfg['domain']['value']))
            x['problem'] = basename(cnfg['problem']['value'])
            out_pair[cnfg['lapkt_instance_generator']['value']][domain] = x
            x['error_log'] = "Process exited without raising exception"
            error_code = x['error_log']

        child.join()

    with open(join(CWD,'log'),'w+') as logfile :
        YAML().dump(out_pair, logfile)

    if not error_code=='':
        raise Exception(error_code)


#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
if __name__=="__main__" :
    test_classical()
