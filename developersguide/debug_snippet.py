"""
Info- The below snippet is for use when debugging mixed Python and C++ code. 
This should be added at the beginning of the python frontend.

Effect - It will cause the python script to wait for user input, giving the 
developer enough time to attach a gdb session to the python programs PID.

We can attach gdb from command line or use an IDE like vscode.
1. from command line:
    sudo gdb --pid=<python program's pid>
2. Attach gdb from vscode with the following launch config.
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python launch",
            "type": "python",
            "request": "launch",
            //"stopOnEntry": true,
            "pythonPath": "/usr/bin/python3",
            "program": "${workspaceRoot}/release/lapkt",
            "args": ["BFWS", "-d", "${workspaceRoot}/tests/sample_instance/domain.pddl",
                "-p", "${workspaceRoot}/tests/sample_instance/problem.pddl"],
            //"cwd": "${workspaceFolder}",
        },
        {
            "name": "(gdb) Attach",
            "type": "cppdbg",
            "request": "attach",
            "program": "/usr/bin/python3",
            "processId": "${command:pickProcess}",
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}

NOTE - Trying to attach gdb at pdb breakpoints or by setting stopOnEntry true
will not work as gdb is unable to load symbol table properly when python is 
paused like that. - The root cause is unknown.
"""
#"""
import os
def wait_debug(str):
    print (str)
    wait = input()
    return

print ("PID =", os.getpid())
wait_debug('starting main..press a key')
#"""
