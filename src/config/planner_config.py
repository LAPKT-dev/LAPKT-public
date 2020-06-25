from ruamel.yaml import YAML
from pathlib import Path
from os.path import join

def load_planner_config():
    parent_folder       =   Path(__file__).parent.absolute()
    rel_config_file     =   Path('lapkt_planner_config.yml')
    PLANNER_CONFIG_PATH =   join(parent_folder, rel_config_file)
    with open(PLANNER_CONFIG_PATH) as from_f :
        return YAML(typ='safe').load(from_f)
