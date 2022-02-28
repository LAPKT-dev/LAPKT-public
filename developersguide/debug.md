## Debugging Python/C++ multi language source code {#debug}


#### A brief overview of how to set up a debug environment and perform debugging operations on the VS Code.

Note- In LAPKT, `.vscode/launch.json` has been configured to run python program with `--wait_debug` option. The option is present in `lapkt` python script and causes the program to wait for user input.

- Steps to debug using VS Code -

  * Update Python launch option in `.vscode/launch.json` with required arguments.
  * Start Debugging(`F5`). Because of `--wait_debug` option, the program will stop for user input and also print a message "PID = <#######>  ;  Press a key to begin run..."
  * Go to Run tab in the VS Code. Then, select `(gdb) Attach` and run it. VS Code will ask for a process to attach `gdb` to. `gdb` has to be attached to the python program, which can searched using the PID printed by the previous step. After that, it will request for sudoer access(in a new terminal), which must be provided. 
  * Add breakpoints in `cxx` files using VS Code.
  * Switch back to previous terminal (where the python program is waiting for a key input) and then press `return` key. The program will next pause at the instruction where it encounters one of the breakpoints.

#### A brief overview on how to use gdb from terminal to debug on any Linux OS.
- Steps to debug using linux terminal
  * Open a new terminal and run the following command to compile lapkt libraries with debug symbols.

            ./install.py --cmake_build_options Debug

  * Run `lapkt` with the option `--wait_debug`  and other arguments as necessary. Because of `--wait_debug` option, the program will stop for user input and also print a message "PID = <#######>  ;  Press a key to begin run..."
  * Open a new terminal window and issue the following command. 
        `sudo gdb --pid=<PID>`
  *  In the terminal (where the python program is waiting for key input), press `return` - the program will not move forward as it is waiting for `continue` or `cont` command from the attached gdb.
  *  Add the breakpoints as necessary in the gdb console and issue the `cont` command. It will next stop at the one of the breakpoints.  An example on how to set breakpoints - `br tarski_instantiator.cxx:401`. This will cause program to pause at the instruction corresponding to line `401` in `tarski_instantiator.cxx`.
  *  Deleting the breakpoint using `del <breakpoint number>` or just `del`, and then issuing `cont` will allow the program to execute freely until termination.