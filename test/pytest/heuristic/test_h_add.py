# We process the PDDL in this code block
from os import getpid
from typing import Union

import lapkt
from lapkt.core.lib.wrapper import STRIPS_Interface, Fwd_Search_Problem, H_Add
from lapkt.pddl.tarski import ground_generate_task as process_pddl


# print("PID =", getpid())

four_action_domain="""
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS)
  (:requirements :strips)
  (:predicates (on ?x ?y)
	       (ontable ?x)
	       (clear ?x)
	       (handempty)
	       (holding ?x)
	       )

  (:action pick-up
	     :parameters (?x)
	     :precondition (and (clear ?x) (ontable ?x) (handempty))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)))

  (:action put-down
	     :parameters (?x)
	     :precondition (holding ?x)
	     :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		   (ontable ?x)))
  (:action stack
	     :parameters (?x ?y)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y)))
  (:action unstack
	     :parameters (?x ?y)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y)))))

"""

four_action_problem="""
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem BLOCKS-example)
(:domain BLOCKS)
(:objects A B C)
(:INIT (CLEAR A) (CLEAR B) (ONTABLE B) (ONTABLE C) (ON A C) (HANDEMPTY))
(:goal (AND (ON A B) (ON B C)))
)
"""

# Create the PDDL domain file
with open("blocks_domain.pddl", 'w') as file:
  file.write(four_action_domain)

# Create the PDDL problem file
with open("blocks_problem.pddl", 'w') as file:
  file.write(four_action_problem)


def test_h_add():
	four_action_blocks_problem = STRIPS_Interface("blocks_domain.pddl", "blocks_problem.pddl")

	process_pddl("blocks_domain.pddl", "blocks_problem.pddl", four_action_blocks_problem)

	#### Here we show the problem representation after parsing and grounding the 
	#### PDDL into propositional logic

	print("###### DOMAIN REPRESENTATION in PROPOSITIONAL LOGIC ######\n")

	print("Size of operator set:", four_action_blocks_problem.num_actions())
	print("Size of set of fluents:", four_action_blocks_problem.num_atoms())

	four_action_blocks_problem.print_actions()
	# Print action list
	with open("actions.list", 'r') as file:
		print(file.read())

	four_action_blocks_problem.print_fluents()
	# Print fluent list
	with open("fluents.list", 'r') as file:
		print(file.read())

	h_add = H_Add(four_action_blocks_problem)
	h_add.print_values()
	assert(h_add.compute_init_h()=='5')
	relevant_actions = dict()
	h_add.fetch_relevant_actions(relevant_actions)
	print(relevant_actions)

	best_supporters = dict()
	h_add.fetch_best_supporters(best_supporters)
	print(best_supporters)

	h_add_fluents = dict()
	h_add.fetch_hval_fluents(h_add_fluents)
	print(h_add_fluents)

	print("Success")

# del instance
# fwd = Fwd_Search_Problem(four_action_blocks_problem.instance())



# def callback_function(h: H_Add):  #Union[H_Add,  H_Max]):
#     """This callback function is called at every iteration of bellman-ford
#         variant to compute h_add or h_max

#     :param h: container for heuristic computation
#     :type h: H_Add/ H_Max
#     """
#     return 0
