from __future__ import print_function

from collections import defaultdict

import build_model
import pddl_to_prolog
import pddl
import fact_groups
import timers
import sys

import normalize

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
		self.cond_effs = {}
		self.negated_conditions = []
	
	def set_precondition( self, prec, atom_table ) :
		for p in prec :
			sym =  atom_table[p.text()]
			if p.negated and sym not in self.negated_conditions :
				self.negated_conditions.append( sym )
			self.precondition.append( ( sym, p.negated ) )
	
	def add_effect( self, adds, dels, atom_table ) :
		effs = []
		for cond, lit in adds :
			if len(cond) == 0 :
				effs.append( ( atom_table[lit.text()], False )  )
			else :
				condition = [ ( atom_table[cond_lit.text()], cond_lit.negated ) for cond_lit in cond ]
				for c in condition :
					if c[1] and c[0] not in self.negated_conditions :
						self.negated_conditions.append( c[0] )
				condition = tuple( condition )
				try :
					self.cond_effs[condition].append( ( atom_table[lit.text()], False ) )
				except KeyError :
					self.cond_effs[condition] = [( atom_table[lit.text()], False )]
		for cond, lit in dels :
			if len(cond) == 0 :
				effs.append( (atom_table[lit.text()], True) )
			else :
				condition = [ ( atom_table[cond_lit.text()], cond_lit.negated ) for cond_lit in cond ]
				for c in condition :
					if c[1] and c[0] not in self.negated_conditions :
						self.negated_conditions.append( c[0] )

				condition = tuple( condition )

				try :
					self.cond_effs[condition].append( ( atom_table[lit.text()], True ) )
				except KeyError :
					self.cond_effs[condition] = [( atom_table[lit.text()], True )]

		if len(effs) > 0 :
			self.effects.append( effs )
		#if len(self.cond_effs) > 0 :
		#	print( "Conditional effects: \n" )
		#	for cond, eff in self.cond_effs.iteritems() :
		#		print( "Condition: %s %s\n"%(cond,eff) )

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
		if isinstance( p, pddl.Assign ) :
			continue # MRJ: we don't handle assigns
		try :
			index = atom_table[p.text()]
		except KeyError :
			continue
		encoded.append( (index, p.negated) )
	return encoded

def fodet( domain_file, problem_file, output_task ) :
	parsing_timer = timers.Timer()
	print("Domain: %s Problem: %s"%(domain_file, problem_file) )

	task = pddl.open( problem_file, domain_file)
	normalize.normalize(task)

	relaxed_reachable, atoms, actions, axioms, reachable_action_params = explore(task)
	print("goal relaxed reachable: %s" % relaxed_reachable)
	if not relaxed_reachable :
		print("No plan exists")
		sys.exit(2)
	
	print("%d atoms" % len(atoms))

	with timers.timing("Computing fact groups", block=True):
		groups, mutex_groups, translation_key = fact_groups.compute_groups(
			task, atoms, reachable_action_params,
			partial_encoding=USE_PARTIAL_ENCODING)
	
	index = 0
	atom_table = {}

	atom_names = [ atom.text() for atom in atoms ]
	atom_names.sort()
	
	for atom in atom_names :
		atom_table[ atom ] = index
		output_task.add_atom( atom )
		index += 1

	print("Axioms %d"%len(axioms))
	for axiom in axioms:
		axiom.dump()
		output_task.add_axiom( encode( axiom.condition, atom_table), encode( [ axiom.effect ], atom_table ))

	print("Deterministic %d actions" % len(actions))
	nd_actions = {}
	for action in actions :
		#print( "action: %s cost: %d"%(action.name,action.cost) )
		nd_action = PropositionalDetAction( action.name, action.cost )
		nd_action.set_precondition( action.precondition, atom_table )
		nd_action.add_effect( action.add_effects, action.del_effects, atom_table )
		nd_actions[ nd_action.name ] = nd_action


	for name, _ in nd_actions.iteritems() :
		output_task.add_action( name )

	index = 0
	for action in nd_actions.values() :
		output_task.add_precondition( index, action.precondition )
		for eff in action.effects :
			output_task.add_effect( index, eff )
		#if len(action.cond_effs) != 0 :
		#	print action.name, len(action.cond_effs), "has conditional effects"
		for cond, eff in action.cond_effs.iteritems() :
			output_task.add_cond_effect( index, list(cond), eff )
		output_task.set_cost( index, action.cost ) 
		index += 1
	output_task.set_domain_name( task.domain_name )
	output_task.set_problem_name( task.task_name )
	output_task.set_init( encode( task.init, atom_table ) )
	output_task.set_goal( encode( task.goal, atom_table ) )
	output_task.parsing_time = parsing_timer.report()

def default( domain_file, problem_file, output_task ) :
	parsing_timer = timers.Timer()
	print("Domain: %s Problem: %s"%(domain_file, problem_file) )

	task = pddl.open( problem_file, domain_file)
	normalize.normalize(task)

	relaxed_reachable, atoms, actions, axioms, reachable_action_params = explore(task)
	print("goal relaxed reachable: %s" % relaxed_reachable)
	if not relaxed_reachable :
		print("No plan exists")
		sys.exit(2)
	
	print("%d atoms" % len(atoms))

	with timers.timing("Computing fact groups", block=True):
		groups, mutex_groups, translation_key = fact_groups.compute_groups(
			task, atoms, reachable_action_params,
			partial_encoding=USE_PARTIAL_ENCODING)
	
	index = 0
	atom_table = {}

	atom_names = [ atom.text() for atom in atoms ]
	atom_names.sort()
	
	for atom in atom_names :
		atom_table[ atom ] = index
		output_task.add_atom( atom )
		index += 1


	print("Deterministic %d actions" % len(actions))
	nd_actions = {}
	for action in actions :
		#print( "action: %s cost: %d"%(action.name,action.cost) )
		nd_action = PropositionalDetAction( action.name, action.cost )
		nd_action.set_precondition( action.precondition, atom_table )
		nd_action.add_effect( action.add_effects, action.del_effects, atom_table )
		if len(nd_action.negated_conditions) > 0 :
			output_task.notify_negated_conditions( nd_action.negated_conditions )
		nd_actions[ nd_action.name ] = nd_action

	output_task.create_negated_fluents()

	for name, _ in nd_actions.iteritems() :
		output_task.add_action( name )

	index = 0
	for action in nd_actions.values() :
		output_task.add_precondition( index, action.precondition )
		for eff in action.effects :
			output_task.add_effect( index, eff )
		#if len(action.cond_effs) != 0 :
		#	print action.name, len(action.cond_effs), "has conditional effects"
		for cond, eff in action.cond_effs.iteritems() :
			output_task.add_cond_effect( index, list(cond), eff )
		output_task.set_cost( index, action.cost ) 
		index += 1

	# MRJ: Mutex groups processing needs to go after negations are compiled away
	print("Invariants %d"%len(mutex_groups))
	for group in mutex_groups :
		if len(group) >= 2 :
			#print("{%s}" % ", ".join(map(str, group)))
			output_task.add_mutex_group( encode( group, atom_table ) )
			#print( encode( group, atom_table ) )


	output_task.set_domain_name( task.domain_name )
	output_task.set_problem_name( task.task_name )
	output_task.set_init( encode( task.init, atom_table ) )
	output_task.set_goal( encode( task.goal, atom_table ) )
	output_task.parsing_time = parsing_timer.report()


