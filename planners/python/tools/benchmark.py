#! /usr/bin/env python

# This is a program to run benchmarks.

# Usage: benchmark.py <time> <memory> <command> [<logfile>]

# <time> is the maximal allowable execution time in seconds.
# <memory> is the maximal allowable space consumption in megabytes.
# <command> is the command to be run (use quotes if the command should include
#           arguments).
# <logfile> is the name for the log file (optional).

import os
import resource
import sys

class Log:
    SILENT = 0
    FILE = 0x1
    SCREEN = 0x2
    BOTH = FILE | SCREEN
    def __init__(self, filename=None):
        self.name = filename
        self.has_file = filename is not None
        if self.has_file:
            self.file = open(filename, "w")
    def write(self, string):
        sys.stdout.write(string)
        if self.has_file:
            self.file.write(string)
    def suspend(self):
        if self.has_file:
            self.file.close()
            del self.file
        sys.stdout.flush()
    def resume(self):
        if self.has_file:
            self.file = open(self.name, "a")
    def __call__(self, mode):
        if mode == Log.SILENT:
            return SilentWriter()
        elif mode == Log.SCREEN or not self.has_file:
            return sys.stdout
        elif mode == Log.FILE:
            return self.file
        else:
            return self

class SilentWriter:
    def write(self, string):
        pass
    
def run(cmd, timeout, memory, log=None, verbose=True):
    """Runs a command using os.system(), restricting time and space
    resources, preventing core dumps and redirecting the output
    (both stdout and stderr) into a log file (if log is not None).
    
    Parameters:
      cmd     - shell command to be executed
      timeout - timeout in CPU seconds
      memory  - maximum heap size allowed in Megabytes
      log     - the log file (of class benchmark.Log)
      verbose - If true, also print the heap and time restrictions,
                the return code of the program and elapsed time.
                If false, this info is logged if there is a log,
                but not printed.
    
    Return Value: (signal, time)
      signal  - 0 if the program terminated properly, non-zero otherwise.
      time    - time spent for executing the program in seconds.
                Note that this is *not* CPU time but usertime and might thus
                exceed the timeout threshold.
    """

    time_slack = 5

    log_mode = Log.SILENT
    if verbose:
        log_mode |= Log.SCREEN
    if log:
        cmd = "(%s) >> %s 2>&1" % (cmd, log.name)
        log_mode |= Log.FILE
    if not log:
        log = Log()

    print >> log(log_mode), "Timeout: %d seconds" % timeout
    print >> log(log_mode), "Heap restriction: %d MB" % memory
    print >> log(log_mode), "Command: %s" % cmd
    print >> log(log_mode)

    memory *= 1024 * 1024
    log.suspend()

    time_passed_before = os.times()[2] + os.times()[3]
    pid = os.fork()
    if not pid:
        resource.setrlimit(resource.RLIMIT_CPU, (timeout - time_slack, timeout))
        # resource.setrlimit(resource.RLIMIT_DATA, (memory, memory))
        # resource.setrlimit(resource.RLIMIT_RSS, (memory, memory))
        resource.setrlimit(resource.RLIMIT_AS, (memory, memory))
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
        signal = os.system(cmd)
        if signal % 256 == 0:
            os._exit(signal // 256)
        os._exit(signal % 256)

    signal = os.waitpid(pid, 0)[1]

    log.resume()
    time_passed = (os.times()[2] + os.times()[3]) - time_passed_before

    if signal == 0:
        print >> log(log_mode), "\nTime spent: %.3f seconds" % time_passed
    else:
        print >> log(log_mode), "\nFailed! [Signal %d, Time %.3f seconds]" \
              % (signal, time_passed)

    return signal, time_passed

if __name__ == "__main__":
    timeout = int(sys.argv[1])
    memory = int(sys.argv[2])
    command = sys.argv[3]

    log = None
    if len(sys.argv) > 4:
        log = Log(sys.argv[4])

    run(command, timeout, memory, log)
