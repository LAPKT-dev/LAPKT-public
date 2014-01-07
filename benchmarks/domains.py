
domains_06 = ['openstacks', 'pathways', 'pipesworld', 'rovers', 'storage', 'TPP', 'trucks']
domains_11 = ['barman', 'elevators', 'floortile', 'openstacks', 'parcprinter', 'parking', 'pegsol', 'scanalyzer', 'sokoban', 'tidybot', 'transport', 'visitall', 'woodworking']

# Domain and problem files
benchmark_06 = {}
benchmark_11 = {}

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


benchmark_11['barman'] = []



profile_problems_06 = [
    ('openstacks', 'openstacks/domain.pddl', 'openstacks/problems/p15.pddl'), #p30.pddl
    ('pathways', 'pathways/domain_p15.pddl', 'pathways/p15.pddl'), #p30.pddl
    ('pipesworld', 'pipesworld/domain.pddl', 'pipesworld/problems/p13.pddl'), #p50.pddl
    ('rovers', 'rovers/domain.pddl', 'rovers/problems/p20.pddl'), #p40.pddl
    ('storage', 'storage/domain.pddl', 'storage/problems/p20.pddl'), #p30.pddl
    ('TPP', 'TPP/domain.pddl', 'TPP/problems/p15.pddl #p30.pddl'),
    ('trucks', 'trucks/domain.pddl', 'trucks/problems/p07.pddl') #p30.pddl
        ]

profile_problems_11 = []
