
# ########################
#
# Prerequisites:
#   - valgrind
#   - timeout
#   - dot (graphviz)
#   - krtoolkit
#
# For the best results with profiling, compile with the following:
#   scons -Q debug=1
#


from os import system as cmd
from sys import argv
import glob, os, sys
from math import log10
from domains import *

USAGE = """
 Usage:
    python run.py profile <executable> <ipc directory> [<domain pddl> <problem pddl>]
    python run.py benchmark <executable> <ipc directory> <results directory> [<domain>]
    python run.py compare <directories with , separated> <ipc directory>
    python run.py clean
    """

# Set the time limit (in seconds)
timelimit = 300
memorylimit = 2000
cores = 3 # Only used for the benchmarking

OLD = 1
NEW = 2

# Set the style of planner you are using
TYPE = NEW

benchmark = None
domains = None
ipc = None
results_directory = "results"

def profile_domain(planner, dom, domain, problem):

    print
    print "Profiling %s..." % dom

    if TYPE == OLD:
        cmd("timeout %d valgrind --tool=callgrind %s --domain %s/%s --problem %s/%s > %s.out 2>&1" % (timelimit, planner, ipc, domain, ipc, problem, dom))
    elif TYPE == NEW:
        cmd("timeout %d valgrind --tool=callgrind %s %s/%s %s/%s /dev/null > %s.out 2>&1" % (timelimit, planner, ipc, domain, ipc, problem, dom))
    else:
        assert False, "What the deuce?"

    callfile=glob.glob('callgrind.out.*')[0]
    cmd("python gprof2dot.py -f callgrind %s 2> /dev/null | dot -Tpng -o %s.png > /dev/null 2>&1" % (callfile, dom))
    cmd("rm %s" % callfile)
    

def benchmark_domain(planner, dom):
    
    from krrt.utils import get_value, match_value, run_experiment, write_file

    print
    print "Benchmarking %s..." % dom

    
    if TYPE == OLD:
        domprob_args = ["--domain %s/%s/%s --problem %s/%s/%s" % (ipc,dom,domain,ipc,dom,problem) for (domain, problem) in benchmark[dom]]
    elif TYPE == NEW:
        domprob_args = ["%s/%s/%s %s/%s/%s o/dev/null" % (ipc,dom,domain,ipc,dom,problem) for (domain, problem) in benchmark[dom]]
    else:
        assert False, "What the deuce?"

    if os.path.exists(results_directory) is False:
        os.mkdir(results_directory)

    results = run_experiment(base_directory=".",
                             base_command=planner,
                             single_arguments={'domprob': domprob_args},
                             time_limit=timelimit,
                             memory_limit=memorylimit,
                             results_dir=results_directory,
                             progress_file=None,
                             processors=cores,
                             sandbox=None)
    
    data = []
    for resid in results.get_ids():

        res = results[resid]

        if TYPE == OLD:
            prob = res.single_args['domprob'].split(' ')[-1].split('/')[-1]
        elif TYPE == NEW:
            prob = res.single_args['domprob'].split(' ')[-2].split('/')[-1]
        else:
            assert False, "What the deuce?"

        if 'old-' in planner:
            cmd("tail -26 %s > TMP_OUTPUT" % res.output_file)
            outfile = "TMP_OUTPUT"
        else:
            outfile = res.output_file

        os.system("cp %s %s"%(outfile, outfile+dom))

        if res.timed_out:
            data.append("%s,time,-1,-1,-1,-1" % prob)
        elif match_value("%s.err" % res.output_file, '.*std::bad_alloc.*'):
            data.append("%s,mem,-1,-1,-1,-1" % prob)
        elif match_value("%s.err" % res.output_file, '.*MemoryError.*'):
            data.append("%s,mem,-1,-1,-1,-1" % prob)
        elif match_value("%s.err" % res.output_file, '.*cannot allocate memory.*'):
            data.append("%s,mem,-1,-1,-1,-1" % prob)
        elif match_value("%s.err" % res.output_file, '.*Segmentation fault.*'):
            data.append("%s,seg,-1,-1,-1,-1" % prob)
        else:
            if match_value(outfile, '.*Effective Width during search*'):                
                lines = open(outfile)
                quality = 0
                generated = 0
                expanded = 0
                width = 0
                for line in lines:
                    if 'Plan found with cost:' in line:
                        quality = int(line.split(':')[-1])
                    if 'Nodes generated during search:' in line:
                        generated = int(line.split(':')[-1])
                    if 'Nodes expanded during search:' in line:
                        expanded = int(line.split(':')[-1])
                    if 'Effective Width during search:' in line:
                        width = int(line.split(':')[-1])
                        data.append("%s,ok,%f,%d,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded, width))
                
            elif match_value(outfile, '([0-9]+).* .*actions in the plan.'):
                quality = get_value(outfile, '([0-9]+).* .*actions in the plan.', int)
                generated = 0
                expanded = 0
                backtracks = 0
                if match_value(outfile, '.*Backtracks during search: ([0-9]+).*'):
                    backtracks = get_value(outfile, '.*Backtracks during search: ([0-9]+).*', int)
                data.append("%s,ok,%f,%d,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded, backtracks))
            elif match_value(outfile, '.*Plan found with cost: ([0-9]+).*'):
                quality = get_value(outfile, '.*Plan found with cost: ([0-9]+).*', int)
                generated = get_value(outfile, '.*Nodes generated during search: ([0-9]+).*', int)
                expanded = get_value(outfile, '.*Nodes expanded during search: ([0-9]+).*', int)
                backtracks = 0
                if match_value(outfile, '.*Backtracks during search: ([0-9]+).*'):
                    backtracks = get_value(outfile, '.*Backtracks during search: ([0-9]+).*', int)
                data.append("%s,ok,%f,%d,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded, backtracks))
            elif match_value(outfile, '.*Length : ([0-9]+).*'):
                quality = get_value(outfile, '.*Length : ([0-9]+).*', int)
                generated = get_value(outfile, '.*Expanded nodes : ([0-9]+).*', int)
                expanded = get_value(outfile, '.*Evaluated nodes : ([0-9]+).*', int)
                backtracks = 0
                if match_value(outfile, '.*Backtracks during search: ([0-9]+).*'):
                    backtracks = get_value(outfile, '.*Backtracks during search: ([0-9]+).*', int)
                data.append("%s,ok,%f,%d,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded, backtracks))
            elif match_value(outfile, '.*Plan cost: ([0-9]+\.[0-9]+), steps.*'):
                quality = get_value(outfile, '.*Plan cost: ([0-9]+\.[0-9]+), steps.*', float)
                generated = get_value(outfile, '.*Generated: ([0-9]+).*', int)
                expanded = get_value(outfile, '.*Expanded: ([0-9]+).*', int)
                backtracks = 0
                if match_value(outfile, '.*Backtracks during search: ([0-9]+).*'):
                    backtracks = get_value(outfile, '.*Backtracks during search: ([0-9]+).*', int)
                data.append("%s,ok,%f,%d,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded, backtracks))
            elif match_value(outfile, '.*NOT I-REACHABLE.*'):
                backtracks = 0
                if match_value(outfile, '.*Backtracks during search: ([0-9]+).*'):
                    backtracks = get_value(outfile, '.*Backtracks during search: ([0-9]+).*', int)
                data.append("%s,not-i,%f,-1,-1,-1,%d" % (prob, res.runtime, backtracks))
            else:
                print "Error with %s" % prob
                data.append("%s,err,%f,-1,-1,-1" % (prob, res.runtime))

        if 'old-' in planner:
            cmd("rm TMP_OUTPUT")

    data.sort()
    
    data = ['problem,status,runtime,quality,generated,expanded'] + data
    
    
    write_file("%s/%s.csv" %( results_directory, dom), data)
    
    #cmd("rm -rf %s"%results_directoy)
    
def compare_results(dirs):
    
    from krrt.utils import load_CSV
    print
    print "Comparing results for %s..." % (dirs)
    
    coverage = [0] * len(dirs)
    time_better = [0] * len(dirs)
    time_score = [0] * len(dirs)
    quality_better = [0] * len(dirs)
    quality_score = [0] * len(dirs)
    nodes_expanded = [0] * len(dirs)
    nodes_generated = [0] * len(dirs)
    time_total = [0] * len(dirs)
    
    for dom in domains:
        

        data = []
        cov = []
        t_score = []
        q_score = []
        
        for i in range(len(dirs)):
            direc = dirs[i]
            data.append(load_CSV("%s/%s.csv" % (direc, dom))[1:])
            cov.append(len(filter(lambda x: 'ok' == x[1], data[-1])))
            coverage[i] += cov[-1]
        
        shared_data = []
        
        for prob in zip(*data):
            if 0 != len(filter(lambda x: 'ok' == x[1], prob)):                
                for x in prob:
                    if x[1] != 'ok':
                        x[2] = sys.maxint
                    if x[1] != 'ok':
                        x[3] = sys.maxint
                
                shared_data.append(list(prob))
        

        for i in range(len(dirs)):
            tsum = 0
            for x in shared_data:
                if x[i][1] != 'ok': continue
                tstar = max(1.0, min([float(x[j][2]) for j in range(len(x))]))
                t = float(x[i][2])
                if float(x[i][2]) < 1.0:
                    tsum+=1.0
                else:
                    tsum += 1/(1+log10(t/tstar))
                    #tsum += float(tstar/t)
                    #tsum += log10(1+tstar)/log10(1+t)
            t_score.append(tsum)
            
            time_score[i] += t_score[i]

        for i in range(len(dirs)):
            q_score.append( sum([ min([float(x[j][3]) for j in range(len(x)) ]) / float(x[i][3]) for x in shared_data ]))
            quality_score[i] += q_score[i]

        #n_gen_1 = sum([int(x[0][4]) for x in shared_data])
        #n_gen_2 = sum([int(x[1][4]) for x in shared_data])
        #nodes_generated[0] += n_gen_1
        #nodes_generated[1] += n_gen_2

        #n_exp_1 = sum([int(x[0][5]) for x in shared_data])
        #n_exp_2 = sum([int(x[1][5]) for x in shared_data])
        #nodes_expanded[0] += n_exp_1
        #nodes_expanded[1] += n_exp_2

        #time_1 = sum([float(x[0][2]) for x in shared_data])
        #time_2 = sum([float(x[1][2]) for x in shared_data])
        #time_total[0] += time_1
        #time_total[1] += time_2

        print "\nDomain: %s" % dom
        print "Coverage: %s" % ' -vs- '.join(["%d" % c for c in cov])
        #print "Time better: %d -vs- %d" % (time_better_1, time_better_2)
        print "Time score: %s" % ' -vs- '.join(["%.2f" % t for t in t_score])
        #print "Quality better: %d -vs- %d" % (quality_better_1, quality_better_2)
        print "Quality score: %s" % ' -vs- '.join(["%.2f" % t for t in q_score])
        #print "Time per node generated: %.6f -vs- %.6f" % ((float(time_1) / float(max(1,n_gen_1))), (float(time_2) / float(max(1,n_gen_2))))
        #print "Time per node expanded: %.6f -vs- %.6f" % ((float(time_1) / float(max(1,n_exp_1))), (float(time_2) / float(max(1,n_exp_2))))

    print "\nDomain: all"
    print "Coverage: %s" % ' -vs- '.join(["%d" % c for c in coverage])
    #print "Time better: %d -vs- %d" % (time_better[0], time_better[1])
    print "Time score: %s" % ' -vs- '.join(["%.2f" % t for t in time_score])
    #print "Quality better: %d -vs- %d" % (quality_better[0], quality_better[1])
    print "Quality score: %s" % ' -vs- '.join(["%.2f" % t for t in quality_score])
    #print "Time per node generated: %.6f -vs- %.6f" % ((float(time_total[0]) / float(max(1,nodes_generated[0]))), (float(time_total[1]) / float(max(1,nodes_generated[1]))))
    #print "Time per node expanded: %.6f -vs- %.6f" % ((float(time_total[0]) / float(max(1,nodes_expanded[0]))), (float(time_total[1]) / float(max(1,nodes_expanded[1]))))


if 1 == len(argv):
    print USAGE
    os._exit(1)

if 'profile' == argv[1]:
    if len(argv) < 4:
        print USAGE
        os._exit(1)
    
    if 'ipc-2006' == argv[3]:
        benchmark = benchmark_06
        domains = domains_06
        profile_problems = profile_problems_06
    elif 'ipc-2011' == argv[3]:
        benchmark = benchmark_11
        domains = domains_11
        profile_problems = profile_problems_11
    else:
        print "Invalid benchmark set: %s" % argv[3]
        os._exit(1)

    ipc = argv[3]

    if len(argv) < 5:
        for (dom, domain, problem) in profile_problems:
            profile_domain(argv[2], dom, domain, problem)
        
    else:
        profile_domain(argv[2], 'custom', argv[4], argv[5])


elif 'benchmark' == argv[1]:
    
    if len(argv) < 5:
        print USAGE
        os._exit(1)

    if 'ipc-2006' == argv[3]:
        benchmark = benchmark_06
        domains = domains_06
        profile_problems = profile_problems_06
    elif 'ipc-2011' == argv[3]:
        benchmark = benchmark_11
        domains = domains_11
        profile_problems = profile_problems_11
    elif 'ipc-2014/seq-sat' == argv[3]:
        benchmark = benchmark_14_sat
        domains = domains_14_sat
        profile_problems = profile_problems_14
    elif 'ipc-2014/seq-agl' == argv[3]:
        benchmark = benchmark_14_agl
        domains = domains_14_agl
        profile_problems = profile_problems_14
    else:
        print "Invalid benchmark set: %s" % argv[3]
        os._exit(1)
    
    results_directory = argv[4]
    ipc = argv[3]
        
    if len(argv) < 6:
        #domains = {'transport','parking', 'sokoban'}
        for dom in domains:
            #if dom in {'floortile'}:
            #    continue            
            benchmark_domain(argv[2], dom)
    else:
        benchmark_domain(argv[2], argv[5])


elif 'compare' == argv[1]:

    if 'ipc-2006' == argv[3]:
        benchmark = benchmark_06
        domains = domains_06
        profile_problems = profile_problems_06
    elif 'ipc-2011' == argv[3]:
        benchmark = benchmark_11
        domains = domains_11
        profile_problems = profile_problems_11
    elif 'ipc-2014/seq-sat' == argv[3]:
        benchmark = benchmark_14_sat
        domains = domains_14_sat
        profile_problems = profile_problems_14
    elif 'ipc-2014/seq-agl' == argv[3]:
        benchmark = benchmark_14_agl
        domains = domains_14_agl
        profile_problems = profile_problems_14
    else:
        print "Invalid benchmark set: %s" % argv[3]
        os._exit(1)

    ipc = argv[3]

    compare_results(argv[2].split(','))


elif 'clean' == argv[1]:
    cmd('rm -f *.png')
    cmd('rm -f *.out')
    cmd('rm -f *.csv')


else:
    print USAGE
    os._exit(1)

print
