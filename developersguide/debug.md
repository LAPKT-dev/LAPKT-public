# Debugging Python/C++ source

## VSCode 

Make sure to [configure and install](./configurevscode.md) VSCode extensions.

The vscode [launch.json](../.vscode/launch.json) settings has the necessary launch options for debugging. The arguments in the `launch.json` may need to be updated, e.g. the path to the PDDL input files.

If VSCode is configured properly, a tab `Run and Debug` should show up on the left pane. There would be four launch options in that pane which are described below

| Launcher | Usage |
|----|----|
| Python launch | Run and debug python frontend |
| (gdb) Launch | Debug C++ libraries |
| (lldb) Launch | Debug C++ libraries on mac |
| (gdb) Attach | Attach gdb to lapkt program that is current running, (user) needs to provide the PID of the program |


To use `(gdb) Attach`, run `lapkt.py` with `--wait_debug` option. `wait_debug` option outputs the program PID and also waits for user input, which gives sufficient time and information for the user to attach a `gdb` session.

### Typical steps to debug C++ source from VSCode

  * Build lapkt the option `-DCMAKE_BUILD_TYPE=Debug`
  * Update Python launch option in `.vscode/launch.json` with required arguments
  * Access the `Run and Debug` tab and choose the `(gdb) Launch` option
  * Mark breakpoints in the source as necessary,
  * Hit Start Debugging(`F5`)

## Linux terminal

Another way to debug is to run gdb from the Linux terminal. Good thing about this method is that it is independent of IDEs. But, we loose the accessibility that comes along with IDEs.

  * Build lapkt the option `-DCMAKE_BUILD_TYPE=Debug`
  * Run `lapkt.py` with `--wait_debug` option. `wait_debug` option outputs the program PID and also waits for user input, which gives sufficient time and information for the user to attach a `gdb` session.
  * Open a new terminal window and issue the following command. 
        `sudo gdb --pid=<PID>`
  * Give some user input to lapkt program, e.g. simple press `return`. Since, we have attached gdb to the program it will wait for `continue` or `cont` command from the gdb console.
  *  Add the breakpoints as necessary in the gdb console and issue the `cont` command. It will next stop at the one of the breakpoints.  An example on how to set breakpoints - `br tarski_instantiator.cxx:401`. This will cause program to pause at the line `401` in `tarski_instantiator.cxx`.
  * To delete a breakpoint use `del <breakpoint number>` or just `del`
  * Issue `cont` command without breakpoints to execute in debug mode until successful termination/runtime error.


  (todo user) Add debug instructions for other platforms