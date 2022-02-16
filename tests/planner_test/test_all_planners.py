#! /usr/bin/python3
from lapkt.run import Run_planner
from lapkt.config import load_planner_config
from pathlib import Path

def test_all_planners() :
    config = load_planner_config()
    for k, options in config.items() :
        if isinstance(options, dict) :
            for k1, v in options.items():
                if v.get('cmd_arg', None) :
                    v['value'] = v['cmd_arg']['default']
        options['lapkt_instance_generator'] =   {}
        options['lapkt_instance_generator']['value'] = 'Tarski'
        options['domain']           =   {}
        options['domain']['value']  =   Path('domain.pddl')
        options['problem']          =   {}
        options['problem']['value'] =   Path('problem.pddl')
        options['planner']          =   {}
        options['planner']['value'] =   k
        Run_planner(options)

if __name__ == '__main__' :
    test_all_planners() 
