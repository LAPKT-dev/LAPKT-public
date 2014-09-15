from os import walk

domains_06 = ['openstacks', 'pathways', 'pipesworld', 'rovers', 'storage', 'TPP', 'trucks']
domains_11 = ['blocksworld','barman', 'elevators', 'floortile', 'nomystery','openstacks', 'parcprinter', 'parking', 'pegsol', 'scanalyzer', 'sokoban', 'tidybot', 'transport', 'visitall', 'woodworking']

domains_14_sat = []
domains_14_agl = []

# Domain and problem files
benchmark_06 = {}
benchmark_11 = {}
benchmark_14_sat = {}
benchmark_14_agl = {}

benchmark_06['openstacks'] = []
for i in range(1,10):
    benchmark_06['openstacks'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark_06['openstacks'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark_06['pathways'] = []
for i in range(1,10):
    benchmark_06['pathways'].append(("domain_p0%d.pddl" % i, "p0%d.pddl" % i))
for i in range(10,31):
    benchmark_06['pathways'].append(("domain_p%d.pddl" % i, "p%d.pddl" % i))

benchmark_06['pipesworld'] = []
for i in range(1,10):
    benchmark_06['pipesworld'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 51):
    benchmark_06['pipesworld'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark_06['rovers'] = []
for i in range(1,10):
    benchmark_06['rovers'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 41):
    benchmark_06['rovers'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark_06['storage'] = []
for i in range(1,10):
    benchmark_06['storage'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark_06['storage'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark_06['TPP'] = []
for i in range(1,10):
    benchmark_06['TPP'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark_06['TPP'].append(('domain.pddl', "problems/p%d.pddl" % i))

benchmark_06['trucks'] = []
for i in range(1,10):
    benchmark_06['trucks'].append(('domain.pddl', "problems/p0%d.pddl" % i))
for i in range(10, 31):
    benchmark_06['trucks'].append(('domain.pddl', "problems/p%d.pddl" % i))


benchmark_11['blocksworld']=[]
for i in range(1, 10):
    benchmark_11['blocksworld'].append(('domain.pddl', "instances/blocksaips0%d.pddl" % i))

for i in range(10, 51):
    benchmark_11['blocksworld'].append(('domain.pddl', "instances/blocksaips%d.pddl" % i))

benchmark_11['blocksworld'].append(('domain.pddl', "instances/widthH^m.pddl"))
benchmark_11['blocksworld'].append(('domain.pddl', "instances/HectorWidthHint.pddl"))
benchmark_11['blocksworld'].append(('domain.pddl', "instances/susman.pddl"))



prob_list = ['pfile10-040.pddl', 'pfile07-028.pddl', 'pfile06-024.pddl', 'pfile06-021.pddl', 'pfile09-034.pddl', 'pfile09-035.pddl', 'pfile07-026.pddl', 'pfile08-029.pddl', 'pfile08-030.pddl', 'pfile09-036.pddl', 'pfile08-031.pddl', 'pfile10-038.pddl', 'pfile10-037.pddl', 'pfile08-032.pddl', 'pfile06-022.pddl', 'pfile06-023.pddl', 'pfile07-027.pddl', 'pfile09-033.pddl', 'pfile10-039.pddl', 'pfile07-025.pddl']
benchmark_11['barman'] = [('domain.pddl', prob) for prob in prob_list]


prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['elevators'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['seq-p06-011.pddl', 'seq-p05-009.pddl', 'seq-p08-016.pddl', 'seq-p09-017.pddl', 'seq-p01-001.pddl', 'seq-p06-012.pddl', 'seq-p07-014.pddl', 'seq-p05-010.pddl', 'seq-p02-004.pddl', 'seq-p02-003.pddl', 'seq-p03-005.pddl', 'seq-p01-002.pddl', 'seq-p03-006.pddl', 'seq-p10-020.pddl', 'seq-p04-007.pddl', 'seq-p07-013.pddl', 'seq-p10-019.pddl', 'seq-p09-018.pddl', 'seq-p08-015.pddl', 'seq-p04-008.pddl']
benchmark_11['floortile'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['nomystery'] = [('domain.pddl', prob) for prob in prob_list]

benchmark_11['openstacks'] = []
for i in range(1,10):
    benchmark_11['openstacks'].append(("p0%d-domain.pddl" % i, "p0%d.pddl" % i))
for i in range(10, 21):
    benchmark_11['openstacks'].append(("p%d-domain.pddl" % i, "p%d.pddl" % i))

benchmark_11['parcprinter'] = []
for i in range(1,10):
    benchmark_11['parcprinter'].append(("p0%d-domain.pddl" % i, "p0%d.pddl" % i))
for i in range(10, 21):
    benchmark_11['parcprinter'].append(("p%d-domain.pddl" % i, "p%d.pddl" % i))

prob_list = ['pfile10-040.pddl', 'pfile12-047.pddl', 'pfile13-050.pddl', 'pfile09-034.pddl', 'pfile11-041.pddl', 'pfile12-045.pddl', 'pfile11-042.pddl', 'pfile09-035.pddl', 'pfile12-046.pddl', 'pfile09-036.pddl', 'pfile08-031.pddl', 'pfile10-038.pddl', 'pfile10-037.pddl', 'pfile11-043.pddl', 'pfile08-032.pddl', 'pfile13-049.pddl', 'pfile12-048.pddl', 'pfile09-033.pddl', 'pfile11-044.pddl', 'pfile10-039.pddl']
benchmark_11['parking'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['pegsol'] = [('domain.pddl', prob) for prob in prob_list]


prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['scanalyzer'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['sokoban'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['tidybot'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['transport'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['problem34.pddl', 'problem38.pddl', 'problem12.pddl', 'problem26.pddl', 'problem16.pddl', 'problem40.pddl', 'problem42.pddl', 'problem46.pddl', 'problem32.pddl', 'problem36.pddl', 'problem28.pddl', 'problem30.pddl', 'problem14.pddl', 'problem24.pddl', 'problem44.pddl', 'problem22.pddl', 'problem18.pddl', 'problem48.pddl', 'problem20.pddl', 'problem50.pddl']
benchmark_11['visitall'] = [('domain.pddl', prob) for prob in prob_list]

prob_list = ['p06.pddl', 'p13.pddl', 'p15.pddl', 'p09.pddl', 'p17.pddl', 'p11.pddl', 'p12.pddl', 'p02.pddl', 'p14.pddl', 'p05.pddl', 'p08.pddl', 'p10.pddl', 'p19.pddl', 'p04.pddl', 'p03.pddl', 'p07.pddl', 'p16.pddl', 'p18.pddl', 'p20.pddl', 'p01.pddl']
benchmark_11['woodworking'] = [('domain.pddl', prob) for prob in prob_list]





profile_problems_06 = [
    ('openstacks', 'openstacks/domain.pddl', 'openstacks/problems/p15.pddl'), #p30.pddl
    ('pathways', 'pathways/domain_p15.pddl', 'pathways/p15.pddl'), #p30.pddl
    ('pipesworld', 'pipesworld/domain.pddl', 'pipesworld/problems/p13.pddl'), #p50.pddl
    ('rovers', 'rovers/domain.pddl', 'rovers/problems/p20.pddl'), #p40.pddl
    ('storage', 'storage/domain.pddl', 'storage/problems/p20.pddl'), #p30.pddl
    ('TPP', 'TPP/domain.pddl', 'TPP/problems/p15.pddl'), #p30.pddl
    ('trucks', 'trucks/domain.pddl', 'trucks/problems/p07.pddl') #p30.pddl
        ]

profile_problems_11 = []
profile_problems_14 = []


domains_14_sat = walk('ipc-2014/seq-sat').next()[1]
for d in domains_14_sat:
    for (dirpath, dirnames, filenames) in walk('ipc-2014/seq-sat/'+d):
        domains = [f for f in filenames if "domain" in f]
        problems = [f for f in filenames if "domain" not in f]
        if len(domains) == 1:
            benchmark_14_sat[d]=[ (domains[0], prob) for prob in problems]
        else:
            if len(domains) != len(problems):
                raise Exception( "missmatching domain and problem files" )
                
            benchmark_14_sat[d] = zip( domains, problems )
    

domains_14_agl = walk('ipc-2014/seq-agl').next()[1]
for d in domains_14_agl:
    for (dirpath, dirnames, filenames) in walk('ipc-2014/seq-agl/'+d):
        domains = [f for f in filenames if "domain" in f]
        problems = [f for f in filenames if "domain" not in f]
        if len(domains) == 1:
            benchmark_14_agl[d]=[ (domains[0], prob) for prob in problems]            
        else:
            if len(domains) != len(problems):
                raise Exception( "missmatching domain and problem files" )            
            benchmark_14_agl[d] = zip( sorted(domains), sorted(problems) )
    
    
