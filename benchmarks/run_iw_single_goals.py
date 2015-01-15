
# ########################
# SCRIPT TO RUN IW over SINGLE/atomic goals
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
import csv

from domains import *

USAGE = """
 Usage:
    python run_iw_single_goals.py profile <executable> <ipc directory> [<domain pddl> <problem pddl>]
    python run_iw_single_goals.py benchmark <executable> <ipc directory> <results directory> <max_bound> [<domain>]

    python run_iw_single_goals.py analyze <results directory>  <ipc directory> 
    python run_iw_single_goals.py clean
    """

# Set the time limit (in seconds)
timelimit = 1800
memorylimit = 2000
cores = 3 # Only used for the benchmarking

OLD = 1
NEW = 2

# Set the style of planner you are using
TYPE = OLD

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
    

def benchmark_domain(planner, bound, dom):
    
    from krrt.utils import get_value, match_value, run_experiment, write_file

    print
    print "Benchmarking %s..." % dom

    
    if TYPE == OLD:
        domprob_args = [" --bound %s --domain %s/%s/%s --problem %s/%s/%s" % (bound,ipc,dom,domain,ipc,dom,problem) for (domain, problem) in benchmark[dom]]
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
        
        
        path, filename = os.path.split(outfile)
        os.system("cp %s %s"%(outfile, path+"/"+dom+"_"+prob+".log"))

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
        
        lines = open(outfile)
        quality = 0
        generated = 0
        expanded = 0
        pruned = 0
        width = 0
        h2=0
        h1=0
        time=0.0
        plan=""
        goal=""
        for line in lines:
            if 'Plan found with cost:' in line:
                quality = int(line.split(':')[-1])
            if 'Nodes generated during search:' in line:
                generated = int(line.split(':')[-1])
            if 'Nodes expanded during search:' in line:
                expanded = int(line.split(':')[-1])
            if 'Nodes pruned by bound:' in line:
                pruned = int(line.split(':')[-1])
            if 'Effective width:' in line:
                width = int(line.split(':')[-1])
            if 'Total time:' in line:
                time = float(line.split(':')[-1])    
            if 'h1:' in line:
                if "inf" in line:
                    h1 = 99999
                else:
                    h1 = int(line.split(':')[-1])
            if 'h2:' in line:
                if "inf" in line:
                    h2 = 99999
                else:
                    h2 = int(line.split(':')[-1])    
            if 'plan:' in line:
                plan = (line.split(':')[-1]).strip()
            if 'Goal:' in line:
                goal = (line.split(':')[-1]).strip()
            if '****' in line:    
                data.append("%s,%s,ok,%f,%d,%d,%d,%d,%d,%d,%d,%s" % (prob, goal, time, generated, pruned, expanded, width, quality,h1,h2,plan))
                quality = 0
                generated = 0
                expanded = 0
                pruned = 0
                width = 0
                h2=0
                h1=0
                time=0.0
                plan=""
                goal=""

            
        os.system("rm "+res.output_file)
        os.system("rm %s.err"%res.output_file)
    data.sort()
    
    data = ['problem,status,goal,runtime,generated,pruned,expanded,width,quality,h1,h2,plan'] + data
    
    
    write_file("%s/%s.csv" %( results_directory, dom), data)
    
    
    #cmd("rm -rf %s"%results_directoy)
    
def analyze_results(direc):
    
    print "Analyzing IW results for %s..." % (direc)
        
    global_iw_eq_h = 0
    global_iw_neq_h = 0
    global_iw_great_h = 0
    global_width_unk_norm = 0
    global_width_count_1_norm = 0.0
    global_width_count_2_norm = 0.0
    global_width_unk = 0
    global_width_count_1 = 0.0
    global_width_count_2 = 0.0


    global_iw_eq_hplus1 = 0
    global_iw_great_hplus1 = 0
    global_iw_less_hplus1 = 0
    global_runtime_1 = 0
    global_runtime_2 = 0
    global_iw1_eq_h1 = 0
    global_iw1_great_h1 = 0
    global_iw1_less_h1 = 0    
    global_iw1_eq_h12 = 0    
    global_iw2_eq_h2 = 0
    global_iw2_great_h2 = 0
    global_iw2_less_h2 = 0

    for dom in domains:
        input_file = csv.DictReader( open( "%s/%s.csv" % (direc, dom), 'rU'  ) )
        iw_eq_h = 0
        iw_neq_h = 0
        iw_great_h = 0

        width_unk = 0
        width_count_1 = 0.0
        width_count_2 = 0.0

        iw_eq_hplus1 = 0
        iw_great_hplus1 = 0
        iw_less_hplus1 = 0

        runtime_1 = 0
        runtime_2 = 0

        iw1_eq_h1 = 0
        iw1_great_h1 = 0
        iw1_less_h1 = 0

        iw1_eq_h12 = 0

        iw2_eq_h2 = 0
        iw2_great_h2 = 0
        iw2_less_h2 = 0

        for row in input_file:    
            if 'ok' == row['status']:
                width = int(row['width'])
                if width < 3:
                    
                    h_val = int(row['h%d'%width])
                    qual = int(row['quality'])
                    if qual == h_val:
                        iw_eq_h+=1
                    else:
                        iw_neq_h+=1
                        if qual > h_val:
                            iw_great_h+=1

                    if width == 1:
                        width_count_1 += 1 
                        runtime_1+= float(row['runtime'])
                        if qual == int(row['h%d'%(width)]):
                            iw1_eq_h1+=1
                        elif qual > int(row['h%d'%(width)]):
                            iw1_great_h1+=1                        
                        else:
                            iw1_less_h1+=1 

                        if qual == int(row['h%d'%(width)]) and  qual == int(row['h%d'%(width+1)]):                            
                            iw1_eq_h12+=1

                        if qual == int(row['h%d'%(width+1)]):
                            iw_eq_hplus1+=1
                        elif qual > int(row['h%d'%(width+1)]):
                            iw_great_hplus1+=1                        
                        else:
                            iw_less_hpuls1+=1
                    else:
                        width_count_2 += 1 
                        if qual == int(row['h%d'%(width)]):
                            iw2_eq_h2+=1
                        elif qual > int(row['h%d'%(width)]):
                            iw2_great_h2+=1                        
                        else:
                            iw2_less_h2+=1 
                        runtime_2+= float(row['runtime'])


                else:
                    width_unk+=1
                
                            


        total_solved = float(width_count_1 + width_count_2)#float(iw_eq_h + iw_neq_h)
        total = float(iw_eq_h + iw_neq_h + width_unk)

        if total_solved == 0:
            print "\nDomain: %s" % (dom) 
            print "SOMETHING IS WRONG, NOTHING HAS BEEN SOLVED"
            continue

        global_iw_eq_h += iw_eq_h / total_solved
        global_iw_neq_h += iw_neq_h / total_solved
        global_iw_great_h += iw_great_h / total_solved
        global_width_unk_norm += width_unk / total
        global_width_count_1_norm += width_count_1 / total
        global_width_count_2_norm += width_count_2 / total
        global_width_unk += width_unk
        global_width_count_1 += width_count_1
        global_width_count_2 += width_count_2
        if width_count_1 !=0:
            global_iw_eq_hplus1 += iw_eq_hplus1
            global_iw_great_hplus1 += iw_great_hplus1
            global_iw_less_hplus1 += iw_less_hplus1 
            global_runtime_1 += runtime_1
            global_iw1_eq_h1 += iw1_eq_h1
            global_iw1_great_h1 += iw1_great_h1
            global_iw1_less_h1 += iw1_less_h1  
            global_iw1_eq_h12 += iw1_eq_h12   

        if width_count_2 !=0:
            global_runtime_2 += runtime_2 
            global_iw2_eq_h2 += iw2_eq_h2 
            global_iw2_great_h2 += iw2_great_h2 
            global_iw2_less_h2 += iw2_less_h2


        print "\nDomain: %s" % (dom)
        print "num goals solved: %d"%total
        if width_count_1 != 0:
            print "\tw(1): %.2f%%, avg runtime %.3f sec. "%(float( width_count_1 / total  )*100.0, float( runtime_1 /  width_count_1 )) 
            if iw1_eq_h1 != 0: print "\t\tplan length iw(1) == h^1: \t\t%.2f%% "%(float( iw1_eq_h1 /  width_count_1 )*100.0) 
            if iw1_eq_h12 != 0: print "\t\tplan length iw(1) == h^1 == h^2: \t%.2f%% "%(float( iw1_eq_h12 /  width_count_1 )*100.0) 
            if iw_eq_hplus1 != 0: print "\t\tplan length iw(1) == h^2: \t\t%.2f%% "%(float( iw_eq_hplus1 /  width_count_1 )*100.0) 

            if iw1_great_h1 != 0: print "\t\tplan length iw(1) > h^1: \t\t%.2f%% "%(float( iw1_great_h1 / width_count_1 )*100.0)             
            if iw_great_hplus1 != 0: print "\t\tplan length iw(1) > h^2: \t\t%.2f%% "%(float( iw_great_hplus1 / width_count_1 )*100.0) 
            if iw1_less_h1 != 0: print "\t\tplan length iw(1) < h^1: \t\t%.2f%% "%(float( iw1_less_h1 / width_count_1 )*100.0)
            if iw_less_hplus1 != 0: print "\t\tplan length iw(1) < h^2: \t\t%.2f%% "%(float( iw_less_hplus1 / width_count_1 )*100.0) 
        if width_count_2 != 0:
            print "\tw(2): %.2f%%, avg runtime %.3f sec. "%(float( width_count_2 / total )*100.0, float( runtime_2 /  width_count_2 )) 
            if iw2_eq_h2 != 0: print "\t\tplan length iw(2) == h^2: \t\t%.2f%% "%(float( iw2_eq_h2 /  width_count_2 )*100.0) 
            if iw2_great_h2 != 0: print "\t\tplan length iw(2) > h^2: \t\t%.2f%% "%(float( iw2_great_h2 / width_count_2 )*100.0) 
            if iw2_less_h2 != 0: print "\t\tplan length iw(2) < h^2: \t\t%.2f%% "%(float( iw2_less_h2 / width_count_2 )*100.0)
        if width_unk != 0:
            print "\tw(>2): %.2f%% "%(float( width_unk / total )*100.0) 
        print "\tplan length iw(i) == h^i: %.2f%% "%(float( iw_eq_h /  total_solved )*100.0) 
        if iw_great_h != 0: print "\tplan length iw(i) > h^i: %.2f%% "%(float( iw_great_h / total_solved )*100.0) 
        
        

    total = len(domains)

    print "\nDomain: all (normalized per domain)"    
    if global_width_count_1 != 0:
        print "\tw(1): %.2f%%, avg runtime %.3f sec. "%(float( global_width_count_1_norm / total  )*100.0, float( global_runtime_1 /   global_width_count_1 )) 
        if global_iw1_eq_h1 != 0: print "\t\tplan length iw(1) == h^1: \t\t%.2f%% "%(float( global_iw1_eq_h1 /   global_width_count_1 )*100.0) 
        if global_iw1_eq_h12 != 0: print "\t\tplan length iw(1) == h^1 == h^2: \t%.2f%% "%(float( global_iw1_eq_h12 /   global_width_count_1 )*100.0) 
        if global_iw_eq_hplus1 != 0: print "\t\tplan length iw(1) == h^2: \t\t%.2f%% "%(float( global_iw_eq_hplus1 /  global_width_count_1 )*100.0) 
        
        if global_iw1_great_h1 != 0: print "\t\tplan length iw(1) > h^1: \t\t%.2f%% "%(float( global_iw1_great_h1 /  global_width_count_1 )*100.0)             
        if global_iw_great_hplus1 != 0: print "\t\tplan length iw(1) > h^2: \t\t%.2f%% "%(float( global_iw_great_hplus1 /  global_width_count_1 )*100.0) 
        if global_iw1_less_h1 != 0: print "\t\tplan length iw(1) < h^1: \t\t%.2f%% "%(float( global_iw1_less_h1 /  global_width_count_1 )*100.0)
        if global_iw_less_hplus1 != 0: print "\t\tplan length iw(1) < h^2: \t\t%.2f%% "%(float( global_iw_less_hplus1 /  global_width_count_1 )*100.0) 
    if global_width_count_2 != 0:
        print "\tw(2): %.2f%%, avg runtime %.3f sec. "%(float( global_width_count_2_norm / total )*100.0, float( global_runtime_2 /   global_width_count_2 )) 
        if global_iw2_eq_h2 != 0: print "\t\tplan length iw(2) == h^2: \t\t%.2f%% "%(float( global_iw2_eq_h2 /   global_width_count_2 )*100.0) 
        if global_iw2_great_h2 != 0: print "\t\tplan length iw(2) > h^2: \t\t%.2f%% "%(float( global_iw2_great_h2 /  global_width_count_2 )*100.0) 
        if global_iw2_less_h2 != 0: print "\t\tplan length iw(2) < h^2: \t\t%.2f%% "%(float( global_iw2_less_h2 /  global_width_count_2 )*100.0)
    if global_width_unk != 0:
        print "\tw(>2): %.2f%% "%(float( global_width_unk_norm / total )*100.0) 
    print "\tplan length iw(i) == h^i: %.2f%% "%(float( global_iw_eq_h /  total )*100.0) 
    if global_iw_great_h != 0: print "\tplan length iw(i) > h^i: %.2f%% "%(float( global_iw_great_h / total )*100.0)     


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
    elif 'ipc-2014/seq-sat' == argv[3]:
        benchmark = benchmark_14
        domains = domains_14
        profile_problems = profile_problems_14
    
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
        benchmark = benchmark_14
        domains = domains_14
        profile_problems = profile_problems_14
    
    else:
        print "Invalid benchmark set: %s" % argv[3]
        os._exit(1)
    
    results_directory = argv[4]
    ipc = argv[3]
    bound = argv[5]
    

    if len(argv) < 7:
        for dom in domains:
            benchmark_domain(argv[2], bound , dom)
    else:
        benchmark_domain(argv[2], argv[6])


elif 'analyze' == argv[1]:

    if 'ipc-2006' == argv[3]:
        benchmark = benchmark_06
        domains = domains_06
        profile_problems = profile_problems_06
    elif 'ipc-2011' == argv[3]:
        benchmark = benchmark_11
        domains = domains_11
        profile_problems = profile_problems_11
    elif 'ipc-2014/seq-sat' == argv[3]:
        benchmark = benchmark_14
        domains = domains_14
        profile_problems = profile_problems_14
    else:
        print "Invalid benchmark set: %s" % argv[3]
        os._exit(1)

    ipc = argv[3]

    analyze_results(argv[2].split(',')[0])


elif 'clean' == argv[1]:
    cmd('rm -f *.png')
    cmd('rm -f *.out')
    cmd('rm -f *.csv')


else:
    print USAGE
    os._exit(1)

print
