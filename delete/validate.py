#!/usr/bin/env python3

import sys
import subprocess
import os

def program(name, args):
    return ([os.path.join(BIN_DIR, name)] + args)

if __name__ == '__main__':
    EXEC_PATH=os.path.join(os.path.dirname(__file__), "../bin/Validate")
    sys.exit(subprocess.call([EXEC_PATH]+sys.argv[1:]))
