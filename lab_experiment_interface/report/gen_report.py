from lab.reports import Attribute, Report
from report.lab_report import CactusPlotReport
from report.lab_report import ScatterPlotReport
from downward.reports.taskwise import TaskwiseReport
from downward.reports.compare import ComparativeReport
from downward.reports.absolute import AbsoluteReport
from os.path import basename, abspath, dirname


"""
ATTRIBUTES      =   ['benchmark_name', 'algorithm', 'time_limit','run_dir',
                    'memory_limit', 'num_actions', 'num_fluents',
                    'is_done_searching', 'is_plan_found_valid', 'runtime',
                    'memory','generated', 'expanded', 'cost', 'max_novelty_generated',
                    'max_novelty_expanded','novelty_1_gen_count','novelty_2_gen_count',
                    'novelty_3_gen_count','novelty_4_gen_count','novelty_1_exp_count',
                    'novelty_2_exp_count','novelty_3_exp_count','novelty_4_exp_count',
                    'num_partitions', 'iteration_index', 'novelty_1_sol_nodes',
                    'novelty_2_sol_nodes','novelty_3_sol_nodes','novelty_4_sol_nodes',
                    'OLC_pruned','HQ_Popped']
ATTRIBUTES_IW   =   ['benchmark_name', 'domain', 'problem', 'algorithm',
                    'time_limit', 'memory_limit', 'num_actions',
                    'num_fluents','is_plan_found', 'is_plan_valid', 'runtime',
                    'memory','generated', 'expanded', 'pruned', 'cost',
                    'novelty:num_nodes','bloom_fillratio','width']
ATTR_IW_STE     =   ['benchmark_name', 'domain', 'problem','goal', 'algorithm',
                    'time_limit', 'memory_limit', 'num_actions',
                    'num_fluents','is_plan_found', 'is_plan_valid', 'runtime',
                    'memory','generated', 'expanded', 'pruned', 'false_pos_tuple',
                    'false_pos_novelty', 'width', 'cost', 'h1', 'h2', 'plan']
"""

def remove_cov(run) :
    if run['coverage'] == 0 :
        run['expanded'] = None
        run['generated'] = None
        run['memory'] = None
        run['runtime'] = None
        run['pruned'] = None
        run['cost'] = None
    return True

def domain_as_category(run1, run2) :
    return run1['domain']

def get_attributes(header_config, algo) :
    attr =  []
    for k, l in header_config.items():
        if k in algo.strip().split() :
            attr =  header_config['common'] + l
            break
    return attr

def add_taskwise_report(exp, args, header_config) :
    for i, algo in enumerate(args.SOLVERS) :
        ATTRIBUTES =  get_attributes(header_config, algo)
        exp.add_report( TaskwiseReport( attributes = ATTRIBUTES,
            filter_algorithm=[basename(algo),]), name='TestReport'+str(i),
            outfile='report_'+str(i)+'.html')

# Add all pairwise comparison reports here
def generate_pairwise_comparison_rp(exp, args, header_config) :
    if (len(args.SOLVERS)>0) :
        algo_pairs = []
        for i, algo1 in enumerate(args.SOLVERS):
            for j, algo2 in enumerate(args.SOLVERS):
                if (i<j) :
                    algo_pairs.append((basename(algo1), basename(algo2)))
                else :
                    continue
        exp.add_report(ComparativeReport(algo_pairs, attributes=['coverage']),
                outfile='coverage_report.html') 
        # Compare performance of algorithms using Scatter Plot
        matplotlib_options = {
            'font.family': 'serif',
            'font.weight': 'normal',
            # Used if more specific sizes not set.
            #'font.size': 20,
            #'axes.labelsize': 20,
            #'axes.titlesize': 30,
            #'legend.fontsize': 22,
            #'xtick.labelsize': 10,
            #'ytick.labelsize': 10,
            #'lines.markersize': 10,
            #'lines.markeredgewidth': 0.25,
            #'lines.linewidth': 1,
            # Width and height in inches.
            'figure.figsize': [8, 8],
            'savefig.dpi': 100,
            'scatter.edgecolors': 'black',
            'axes.grid': True,
            'image.aspect': 'equal',
            'axes.formatter.useoffset': False,
        }
        matplotlib_cactus_options = {
            'figure.figsize': [16, 9],
            'savefig.dpi': 100,
            'axes.grid': True,
            'axes.formatter.useoffset': False,
            'legend.fontsize' : 'small',
            'lines.markersize'  : 2,
            'legend.markerscale' : 4,
            'markers.fillstyle' : 'none',
        }   
        index = 0
        """
        for algo1, algo2 in algo_pairs :
            if(re.search(r'_ste',  algo1) and re.search(r'_ste', algo2)):
                continue
            if(re.search(r'_ste', algo2)):
                temp = algo1
                algo1 = algo2
                algo2 = temp
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - number of node expanded").title(),
                attributes=["expanded"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                xscale='log', yscale='log',
                show_missing=False,
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-expanded_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - number of nodes generated").title(),
                attributes=["generated"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                xscale='log', yscale='log',
                show_missing=False,
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-generated_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - number of nodes pruned").title(),
                attributes=["pruned"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                xscale='linear', yscale='linear',
                show_missing=False,
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-pruned_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - runtime").title(),
                attributes=["runtime"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                show_missing=False,
                xscale='log', yscale='log',
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-runtime_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - max resident memory").title(),
                attributes=["memory"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                show_missing=False,
                xscale='log', yscale='log',
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-memory_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - max width reached").title(),
                attributes=["width"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                xscale='linear', yscale='linear',
                show_missing=False,
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-width_"+str(index))
            exp.add_report(ScatterPlotReport(
                title = str(args.EXP_NAME+
                    " - cost of plan").title(),
                attributes=["cost"],
                filter_algorithm=[algo1, algo2],
                filter=remove_cov, get_category=domain_as_category,
                xscale='log', yscale='log',
                show_missing=False,
                matplotlib_options=matplotlib_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="scatterplot-quality_"+str(index))
            index += 1
            # End loop
        """

        # plot instance solved over various exec properties
        plot_runtime = True 
        plot_generated = True 
        plot_expanded = True 
        plot_memory = True 
        for i, algo in enumerate(args.SOLVERS) :
            ATTRIBUTES =  get_attributes(header_config, algo)
            if not 'runtime_solver' in ATTRIBUTES:
                plot_runtime = False
            if not 'generated' in ATTRIBUTES:
                plot_generated = False
            if not 'expanded' in ATTRIBUTES:
                plot_expanded = False
            if not 'memory' in ATTRIBUTES:
                plot_memory = False

        if plot_runtime :
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over time").title(),
                time_limit = args.TIME_LIMIT,
                attributes=["runtime_solver"],
                xscale='linear', yscale='linear',
                ylabel='Number of Instances Solved',
                matplotlib_options=matplotlib_cactus_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="Instances solved over time"+str(index))
        if plot_generated :
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over nodes generated").title(),
                time_limit = args.TIME_LIMIT,
                attributes=["generated"],
                xscale='log', yscale='linear',
                ylabel='Number of Instances Solved', xlabel='Number of generated nodes in thousands',
                matplotlib_options=matplotlib_cactus_options,
                format="png"  # Use "tex" for pgfplots output.
                ), name="Instances solved over nodes generated"+str(index))
        if plot_expanded :
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over nodes expanded").title(),
                time_limit = args.TIME_LIMIT,
                attributes=["expanded"],
                xscale='log', yscale='linear',
                ylabel='Number of Instances Solved', xlabel='Number of expanded nodes in thousands',
                matplotlib_options=matplotlib_cactus_options,
                format="png"  # Use "tex" for pgfplots output.
                ), name="Instances solved over nodes expanded"+str(index))
        if plot_memory:
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over memory consumed").title(),
                time_limit = args.TIME_LIMIT,
                attributes=["memory"],
                xscale='linear', yscale='linear',
                ylabel='Number of Instances Solved', xlabel="Memory consumed(MB)",
                matplotlib_options=matplotlib_cactus_options,
                format="png"  # Use "tex" for pgfplots output.
                ), name="Instances solved over memory consumed"+str(index))


        search_params = [] #[ ['k-BFWS'], ['BFWS-f5']]
        for search_param in search_params:
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over time").title(),
                search_param = search_param,
                time_limit = args.TIME_LIMIT,
                attributes=["runtime"],
                xscale='log', yscale='linear',
                ylabel='Number of Instances Solved',
                matplotlib_options=matplotlib_cactus_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="_".join(search_param)+"_Instances solved over time"+str(index))
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over nodes generated").title(),
                search_param = search_param,
                time_limit = args.TIME_LIMIT,
                attributes=["generated"],
                xscale='log', yscale='linear',
                ylabel='Number of Instances Solved', xlabel='Number of generated nodes in thousands',
                matplotlib_options=matplotlib_cactus_options, 
                format="png"  # Use "tex" for pgfplots output.
                ), name="_".join(search_param)+"_Instances solved over nodes generated"+str(index))
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over nodes expanded").title(),
                search_param = search_param,
                time_limit = args.TIME_LIMIT,
                attributes=["expanded"],
                xscale='log', yscale='linear',
                ylabel='Number of Instances Solved', xlabel='Number of expanded nodes in thousands',
                matplotlib_options=matplotlib_cactus_options,
                format="png"  # Use "tex" for pgfplots output.
                ), name="_".join(search_param)+"_Instances solved over nodes expanded"+str(index))
            exp.add_report(CactusPlotReport(
                title = str(args.EXP_NAME+
                    " - Instances solved over memory consumed").title(),
                search_param = search_param,
                time_limit = args.TIME_LIMIT,
                attributes=["memory"],
                xscale='linear', yscale='linear',
                ylabel='Number of Instances Solved', xlabel="Memory consumed(MB)",
                matplotlib_options=matplotlib_cactus_options,
                format="png"  # Use "tex" for pgfplots output.
                ), name="_".join(search_param)+"_Instances solved over memory consumed"+str(index))
            # End loop

