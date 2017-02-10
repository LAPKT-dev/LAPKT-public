from fd.pddl import actions
from fd.pddl import conditions
from fd.pddl import predicates
from fd.pddl import effects
from fd.pddl import pddl_types
from fd.pddl import tasks


domain_name = 'blocks-world-domain'
Table = 'Table'
constants = [pddl_types.TypedObject(Table, None)]
x = pddl_types.TypedObject("?x", None)
y = pddl_types.TypedObject("?y", None)
z = pddl_types.TypedObject("?z", None)
ON = 'on'
CLEAR = 'clear'

problem_name = 'sussman-anomaly'
a, b, c = 'abc'
block = 'block'


def gen_predicates():
    result = set()
    result.add(predicates.Predicate('on', [x, y]))
    result.add(predicates.Predicate('clear', [x]))
    result.add(predicates.Predicate('block', [x]))
    return result


def gen_objects():
    objects = set()
    objects.add(pddl_types.TypedObject(a, None))
    objects.add(pddl_types.TypedObject(b, None))
    objects.add(pddl_types.TypedObject(c, None))
    return objects

def gen_init():
    init = set()
    init.add(conditions.Atom(block, [a]))
    init.add(conditions.Atom(block, [b]))
    init.add(conditions.Atom(block, [c]))
    init.add(conditions.Atom(block, [Table]))
    init.add(conditions.Atom(ON, [c, a]))
    init.add(conditions.Atom(ON, [a, Table]))
    init.add(conditions.Atom(ON, [b, Table]))
    init.add(conditions.Atom(CLEAR, [c]))
    init.add(conditions.Atom(CLEAR, [b]))
    init.add(conditions.Atom(CLEAR, [Table]))
    return init


def gen_goal():
    goal = set()
    goal.add(conditions.Atom(ON, [b, c]))
    goal.add(conditions.Atom(ON, [a, b]))
    return conditions.Conjunction(goal)


def gen_actions():
    parameters=[x, y, z]
    preconditions = list()
    preconditions.append(conditions.Atom(ON, [x, z]))
    preconditions.append(conditions.Atom(CLEAR, [x]))
    preconditions.append(conditions.Atom(CLEAR, [y]))
    preconditions.append(conditions.NegatedAtom('=', [y, z]))
    preconditions.append(conditions.NegatedAtom('=', [x, z]))
    preconditions.append(conditions.NegatedAtom('=', [x, y]))
    preconditions.append(conditions.NegatedAtom('=', [x, Table]))
    action_effects = list()
    action_effects.append(effects.Effect(parameters=[], condition=conditions.Truth(),
                                         literal=conditions.Atom(ON,[x,y])))
    action_effects.append(effects.Effect(parameters=[], condition=conditions.Truth(),
                                         literal=conditions.NegatedAtom(ON, [x,z])))
    action_effects.append(effects.Effect(parameters=[],
                                         condition=conditions.NegatedAtom('=', [z, Table]),
                                         literal=conditions.Atom(CLEAR, [z])))
    action_effects.append(effects.Effect(parameters=[],
                                         condition=conditions.NegatedAtom('=', [y, Table]),
                                         literal=conditions.NegatedAtom(CLEAR, [y])))

    puton = actions.Action('puton', parameters,
                           len(parameters), conditions.Conjunction(preconditions).simplified(),
                           action_effects, None)
    return [puton]


if __name__ == '__main__':
    requirements = tasks.Requirements([':strips', ':equality', ':conditional-effects'])
    task = tasks.Task(domain_name, problem_name, requirements,
                      [], gen_objects(), gen_predicates(), [],
                      gen_init(), gen_goal(), gen_actions(), [], False, constants)

    print (task.domain() + '\n')
    print (task.problem())
