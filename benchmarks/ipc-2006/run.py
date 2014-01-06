
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
import glob, os


USAGE = """
 Usage:
    python run.py profile <executable> [<domain pddl> <problem pddl>]
    python run.py benchmark <executable> [<domain>]
    python run.py compare <csv 1> <csv 2>
    python run.py clean
    """

# Set the time limit (in seconds)
timelimit = 300
memorylimit = 1000
cores = 4 # Only used for the benchmarking

domains = ['openstacks', 'pathways', 'pipesworld', 'rovers', 'storage', 'TPP', 'trucks']



# Domain and problem files
benchmark = {}

benchmark['openstacks'] = []
for i in range(1,10):
    benchmark['openstacks'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark['openstacks'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark['pathways'] = []
for i in range(1,10):
    benchmark['pathways'].append(("domain_p0%d.pddl" % i, "p0%d.pddl" % i))
for i in range(10,31):
    benchmark['pathways'].append(("domain_p%d.pddl" % i, "p%d.pddl" % i))

benchmark['pipesworld'] = []
for i in range(1,10):
    benchmark['pipesworld'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 51):
    benchmark['pipesworld'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark['rovers'] = []
for i in range(1,10):
    benchmark['rovers'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 41):
    benchmark['rovers'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark['storage'] = []
for i in range(1,10):
    benchmark['storage'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark['storage'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark['TPP'] = []
for i in range(1,10):
    benchmark['TPP'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark['TPP'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark['trucks'] = []
for i in range(1,10):
    benchmark['trucks'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark['trucks'].append(('domain.pddl', "problems/p%d.pddl" % i))



def profile_domain(planner, dom, domain, problem):

    print
    print "Profiling %s..." % dom
        
    cmd("timeout %d valgrind --tool=callgrind %s --domain %s --problem %s > %s.out 2>&1" % (timelimit, planner, domain, problem, dom))
    callfile=glob.glob('callgrind.out.*')[0]
    cmd("python gprof2dot.py -f callgrind %s 2> /dev/null | dot -Tpng -o %s.png > /dev/null 2>&1" % (callfile, dom))
    cmd("rm %s" % callfile)
    

def benchmark_domain(planner, dom):
    
    from krrt.utils import get_value, match_value, run_experiment, write_file

    print
    print "Benchmarking %s..." % dom
    
    results = run_experiment(base_directory=".",
                             base_command=planner,
                             single_arguments={'domprob': ["--domain %s/%s --problem %s/%s" % (dom,domain,dom,problem) for (domain, problem) in benchmark[dom]]},
                             time_limit=timelimit,
                             memory_limit=memorylimit,
                             results_dir="results",
                             progress_file=None,
                             processors=cores,
                             sandbox=None)
    
    data = []
    for resid in results.get_ids():
        res = results[resid]
        prob = res.single_args['domprob'].split(' ')[-1].split('/')[-1]
        if res.timed_out:
            data.append("%s,time,-1,-1,-1,-1" % prob)
        elif match_value("%s.err" % res.output_file, '.*std::bad_alloc.*'):
            data.append("%s,mem,-1,-1,-1,-1" % prob)
        else:
            quality = get_value(res.output_file, '.*Plan found with cost: ([0-9]+).*', int)
            generated = get_value(res.output_file, '.*Nodes generated during search: ([0-9]+).*', int)
            expanded = get_value(res.output_file, '.*Nodes expanded during search: ([0-9]+).*', int)
            data.append("%s,ok,%f,%d,%d,%d" % (prob, res.runtime, quality, generated, expanded))
    
    data.sort()
    
    data = ['problem,status,runtime,quality,generated,expanded'] + data
    
    write_file("%s.csv" % dom, data)
    
    cmd("rm -rf results")
    

def compare_results(file1, file2):

    print
    print "Comparing results for %s and %s..." % (file1, file2)

if 1 == len(argv):
    print USAGE
    os._exit(1)

if 'profile' == argv[1]:
    if len(argv) < 3:
        print USAGE
        os._exit(1)
    
    elif len(argv) < 4:
        # Do everything
        profile_domain(argv[2], 'openstacks', 'openstacks/domain.pddl', 'openstacks/problems/p15.pddl') #p30.pddl
        profile_domain(argv[2], 'pathways', 'pathways/domain_p15.pddl', 'pathways/p15.pddl') #p30.pddl
        profile_domain(argv[2], 'pipesworld', 'pipesworld/domain.pddl', 'pipesworld/problems/p13.pddl') #p50.pddl
        profile_domain(argv[2], 'rovers', 'rovers/domain.pddl', 'rovers/problems/p20.pddl') #p40.pddl
        profile_domain(argv[2], 'storage', 'storage/domain.pddl', 'storage/problems/p20.pddl') #p30.pddl
        profile_domain(argv[2], 'TPP', 'TPP/domain.pddl', 'TPP/problems/p15.pddl #p30.pddl')
        profile_domain(argv[2], 'trucks', 'trucks/domain.pddl', 'trucks/problems/p07.pddl') #p30.pddl
        
    else:
        profile_domain(argv[2], argv[3], argv[4], argv[5])


elif 'benchmark' == argv[1]:
    if len(argv) < 4:
        for dom in domains:
            benchmark_domain(argv[2], dom)
    else:
        benchmark_domain(argv[2], argv[3])


elif 'compare' == argv[1]:
    compare_results(argv[2], argv[3])


elif 'clean' == argv[1]:
    cmd('rm -f *.png')
    cmd('rm -f *.out')
    cmd('rm -f *.csv')


else:
    print USAGE
    os._exit(1)

print
