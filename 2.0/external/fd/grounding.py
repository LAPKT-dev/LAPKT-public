from __future__ import print_function

from collections import defaultdict

import build_model
import pddl_to_prolog
import pddl
import fact_groups
import timers
import sys
from itertools import product


USE_PARTIAL_ENCODING = True


def get_fluent_facts(task, model):
    fluent_predicates = set()
    for action in task.actions:
        for effect in action.effects:
            fluent_predicates.add(effect.literal.predicate)
    for axiom in task.axioms:
        fluent_predicates.add(axiom.name)
    return set([fact for fact in model
            if fact.predicate in fluent_predicates])


def get_objects_by_type(typed_objects, types):
    result = defaultdict(list)
    supertypes = {}
    for type in types:
        supertypes[type.name] = type.supertype_names
    for obj in typed_objects:
        result[obj.type].append(obj.name)
        for type in supertypes[obj.type]:
            result[type].append(obj.name)
    return result

def instantiate(task, model):
    relaxed_reachable = False
    fluent_facts = get_fluent_facts(task, model)
    init_facts = set(task.init)
    type_to_objects = get_objects_by_type(task.objects, task.types)

    instantiated_actions = []
    instantiated_axioms = []
    reachable_action_parameters = defaultdict(list)
    for atom in model:
        if isinstance(atom.predicate, pddl.Action):
            action = atom.predicate
            parameters = action.parameters
            inst_parameters = atom.args[:len(parameters)]
            # Note: It's important that we use the action object
            # itself as the key in reachable_action_parameters (rather
            # than action.name) since we can have multiple different
            # actions with the same name after normalization, and we
            # want to distinguish their instantiations.
            reachable_action_parameters[action].append(inst_parameters)
            variable_mapping = dict([(par.name, arg)
                        for par, arg in zip(parameters, atom.args)])
            inst_action = action.instantiate(variable_mapping, init_facts,
                            fluent_facts, type_to_objects)
            if inst_action:
                instantiated_actions.append(inst_action)
        elif isinstance(atom.predicate, pddl.Axiom):
            axiom = atom.predicate
            variable_mapping = dict([(par.name, arg)
                        for par, arg in zip(axiom.parameters, atom.args)])
            inst_axiom = axiom.instantiate(variable_mapping, init_facts, fluent_facts)
            if inst_axiom:
                instantiated_axioms.append(inst_axiom)
        elif atom.predicate == "@goal-reachable":
            relaxed_reachable = True

    return (relaxed_reachable, fluent_facts, instantiated_actions,
        sorted(instantiated_axioms), reachable_action_parameters)


def explore(task):
    import normalize
    normalize.normalize(task)
    prog = pddl_to_prolog.translate(task)
    model = build_model.compute_model(prog)
    with timers.timing("Completing instantiation"):
        return instantiate(task, model)


class PropositionalDetAction :

    def __init__( self, name, cost ) :
        self.name = name
        self.cost = cost
        self.precondition = []
        self.effects = []

    def set_precondition( self, prec, atom_table ) :
        for p in prec :
            self.precondition.append( ( atom_table[p.text()], p.negated ) )

    def add_effect( self, adds, dels, atom_table ) :
        effs = []
        for _, lit in adds :
            effs.append( ( atom_table[lit.text()], False )  )
        for _, lit in dels :
            effs.append( (atom_table[lit.text()], True) )
        self.effects.append( effs )


class NumDetAction:
    def __init__(self, name, cost, precs, effects, num_effects, cmp):
        self.name = name
        self.cost = cost
        self.preconditions = precs
        self.effects = effects
        self.numeric_effects = num_effects
        self.comparison = cmp



def encode( lits, atom_table ) :
    encoded = []
    if isinstance( lits, pddl.Atom ) or isinstance( lits, pddl.NegatedAtom ) :
        # singleton
        index = atom_table[lits.text()]
        encoded.append( (index, lits.negated) )
        return encoded

    if isinstance( lits, pddl.Conjunction ) :
        lits = [ p for p in lits.parts ]

    for p in lits :
        try :
            index = atom_table[p.text()]
        except KeyError :
            continue
        encoded.append( (index, p.negated) )
    return encoded


def default( domain_file, problem_file, output_task ) :
    parsing_timer = timers.Timer()
    print("Domain: %s Problem: %s"%(domain_file, problem_file) )

    task = pddl.open( problem_file, domain_file)

    relaxed_reachable, atoms, actions, axioms, reachable_action_params = explore(task)
    print("goal relaxed reachable: %s" % relaxed_reachable)
    if not relaxed_reachable :
        print("No weak plan exists")
        sys.exit(2)

    print("%d atoms" % len(atoms))

    with timers.timing("Computing fact groups", block=True):
        groups, mutex_groups, translation_key = fact_groups.compute_groups(
            task, atoms, reachable_action_params,
            partial_encoding=USE_PARTIAL_ENCODING)
    index = 0
    atom_table = {}


    for atom in atoms :
        atom.index = index
        atom_table[ atom.text() ] = index
        output_task.add_atom( atom.text() )
        index += 1
    print("Invariants %d"%len(mutex_groups))
    for group in mutex_groups :
        if len(group) >= 2 :
            print("{%s}" % ", ".join(map(str, group)))
            if hasattr(output_task, 'add_invariant'):
                            output_task.add_invariant( encode( group, atom_table ) )
            #print( encode( group, atom_table ) )

    print("Deterministic %d actions" % len(actions))
    nd_actions = {}
    for action in actions:
        nd_action = PropositionalDetAction( action.name, action.cost )
        nd_action.set_precondition( action.precondition, atom_table )
        nd_action.add_effect( action.add_effects, action.del_effects, atom_table )
        nd_actions[ nd_action.name ] = nd_action
        negated_condistions = [x[0] for x in nd_action.precondition if x[1]]
        if len(negated_condistions) > 0 :
            output_task.notify_negated_conditions( negated_condistions )


    output_task.create_negated_fluents()
    index = 0
    # todo: remove nd_actions
    for action in nd_actions.values():
        output_task.add_action( action.name )
        #
        output_task.add_precondition( index, action.precondition )
        text_prec = []
        for p, v in action.precondition :
            text_prec.append( "%s=%s"%(output_task.get_atom_name( p ),  not v) )
        for eff in action.effects :
            output_task.add_effect( index, eff )
            text_eff = []
            for p, v in eff:
                text_eff.append( "%s=%s"%(output_task.get_atom_name( p ), not v) )
        index += 1
    output_task.set_domain_name(task.domain_name )
    output_task.set_problem_name(task.task_name )
    import pdb;pdb.set_trace()
    output_task.set_init(encode(task.init, atom_table))
    output_task.set_goal(encode(task.goal, atom_table))
    output_task.parsing_time = parsing_timer.report()


def convert_precondition(prec, atom_table):
    precondition = []
    comparision = dict()
    for p in prec:
        if isinstance(p, pddl.NumericWrapper):
            comparision[atom_table[p.text()].index] = p.expression
        precondition.append((atom_table[p.text()].index, p.negated))
    return precondition, comparision


def convert_effect(adds, dels, atom_table):
    effs = []
    for _, lit in adds:
        effs.append((atom_table[lit.text()].index, False))
    for _, lit in dels:
        effs.append((atom_table[lit.text()].index, True))
    return effs


def convert_expression(expression, function_table):
    import liblapkt
    if isinstance(expression, pddl.f_expression.PrimitiveNumericExpression):
        atom = pddl.Atom(expression.symbol, expression.args)
        return liblapkt.Var(atom.text(), function_table[atom.text()].index)
    elif isinstance(expression, pddl.f_expression.Substract):
        return liblapkt.Sub([convert_expression(x, function_table) for x in expression.parts])
    elif isinstance(expression, pddl.f_expression.FunctionAssignment):
        raise NotImplementedError
    raise NotImplementedError


def convert_num_effect(num_effects, function_table):
    import liblapkt
    result = []

    for num_eff in num_effects:
        if num_eff.symbol in ('=', 'assign'):
            atom = pddl.Atom(num_eff.fluent.symbol, num_eff.fluent.args)
            item = function_table.get(atom.text())
            index = item.index
            result.append(liblapkt.NumericEffect(convert_expression(num_eff.expression, function_table), index))
        else:
            raise NotImplementedError
    return result


def numeric(domain_file, problem_file, output_task ):
    import liblapkt
    parsing_timer = timers.Timer()
    print("Domain: %s Problem: %s" % (domain_file, problem_file))


    task = pddl.open(problem_file, domain_file)
    import normalize
    normalize.normalize(task)

    class TableItem:
        def __init__(self, a_index, a_atom, value=None):
            self.index = a_index
            self.atom = a_atom
            self.value = value

    index = 0
    atom_table = dict()

    objects_by_type = defaultdict(list)
    for obj in task.objects:
        lst = set(next(x.supertype_names for x in task.types if x.name == obj.type))
        lst.add(obj.type)
        for typename in lst:
            objects_by_type[typename].append(obj)
    init_atoms = [x for x in task.init if (not hasattr(x, 'predicate')) or x.predicate != '=']
    fluent_atoms = []

    # atoms
    for pred in task.predicates:
        for args in product(*(objects_by_type.get(x.type) for x in pred.arguments)):
            if None in args:
                continue
            # todo: some atoms are impossible to reach
            # todo: compute unreachable atoms
            atom = pddl.Atom(pred.name, [x.name for x in args])
            if atom.text() not in atom_table:
                atom_table[atom.text()] = TableItem(index, atom)
                output_task.add_atom( atom.text() )
                fluent_atoms.append(atom)
                index += 1

    index = 0

    function_table = dict()

    # functions
    for func in (x for x in task.init if isinstance(x, pddl.f_expression.Assign)):
        if isinstance(func.fluent, pddl.f_expression.PrimitiveNumericExpression) and func.fluent.symbol == 'total-cost':
            continue
        atom = pddl.Atom(func.fluent.symbol, func.fluent.args)
        function_table[atom.text()] = TableItem(index, atom, func.expression.value)
        index += 1

    negated_set = set()
    action_data = []

    # actions
    for (index, action) in enumerate(task.actions):
        lst = product(*(objects_by_type.get(x.type) for x in action.parameters))
        for var_values in lst:
            var_mapping = {param.name: var_values[i].name for (i, param) in enumerate(action.parameters)}


            instance = action.instantiate(var_mapping, init_atoms, fluent_atoms, objects_by_type)

            if instance is None:
                continue

            precs, cmp = convert_precondition(instance.precondition, atom_table)

            negated_condistions = [x[0] for x in precs if (x[1] and x[0] not in negated_set)]
            for n in negated_condistions: negated_set.add(n)
            output_task.add_negated_conditions(negated_condistions);
            effs = convert_effect(instance.add_effects, instance.del_effects, atom_table)

            num_effs = convert_num_effect(instance.numeric_effects, function_table)
            action_data.append(NumDetAction(instance.name,
                                            instance.cost,
                                            precs,
                                            effs,
                                            num_effs,
                                            cmp))

    cmp_map = {'>': liblapkt.CompareType.more, '>=': liblapkt.CompareType.more_equal}
    for (index, action) in enumerate(action_data):
        # todo: add comparision objects
        output_task.add_action(action.name)
        output_task.define_action(index, action.preconditions, action.effects, action.numeric_effects)
        output_task.set_cost(index, action.cost)
        # add comparision objects to output task
        for (idx, cmp) in action.comparison.items():
            expr = convert_expression(cmp.parts[0], function_table)
            output_task.add_comparison(idx, cmp_map[cmp.comparator], expr)

    # adding init and goal

    num_list = []
    for item in function_table.values():
        num_list.append((item.index, item.value))

    fluent_list = []
    import pdb;pdb.set_trace()
    for item in init_atoms:
        if isinstance(item, (pddl.Atom, pddl.NegatedAtom)):
            fluent_list.append((atom_table[item.text()].index, item.negated))

    output_task.set_init(fluent_list, num_list)
    # process metric
