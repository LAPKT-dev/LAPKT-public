(define (domain cluster)
  (:requirements :typing :action-costs )
  (:types
	  resource - object
	  node - object
	  daemon - resource
	  virtualdomain - resource
	  softgoalorder
	  softgoal-mode
	  defstatus - object
	  status - object
  )
  (:constants
	  started - status
	  stopped - status
	  defined - defstatus
  )
  (:predicates
	  (on ?n - node ?d - resource)  
	  (defined_on ?n - node ?r - resource)
	  (stat ?vm - resource ?s - status)
	  (started-softgoal-order ?v0 - virtualdomain ?v1 - softgoalorder )
	  (current-softgoal ?v0 - softgoalorder )
	  (next-softgoal ?v0 - softgoalorder ?v1 - softgoalorder )
	  (started-softgoal ?vm - virtualdomain )
	  (normal-mode )
	  (softgoal-mode )
  )
  (:functions
	  (total-cost )
	  (started-softgoal-reward ?v0 - virtualdomain )
  )
  (:action start-daemon
	  :parameters (?n - node ?d - daemon)
	  :precondition (and
			  (normal-mode)
			  (not (on ?n ?d))
			)
	  :effect (and
		      (on ?n ?d)
		  )
  )
  (:action start-vm
	  :parameters (?n - node ?vm - virtualdomain)
	  :precondition (and
			  (not (on ?n ?vm))
			  (not (stat ?vm started))
			  (on ?n libvirt)
			  (stat ?vm stopped)
			  (normal-mode)
			)
	  :effect (and
		      (on ?n ?vm)
		      (stat ?vm started)
		      (not (stat ?vm stopped))
		  )
  )
  (:action stop-vm
	  :parameters (?n - node ?vm - virtualdomain)
	  :precondition (and
			  (stat ?vm started)
			  (on ?n libvirt)
			  (on ?n ?vm)
			  (normal-mode)
			)
	  :effect (and
		    (stat ?vm stopped)
		    (not (stat ?vm started))
		  )
  )
  (:action stop-daemon
	  :parameters (?n - node ?d - daemon)
	  :precondition (and
			  (on ?n ?d)
			  (normal-mode)
			)
	  :effect (and
		    (not (on ?n ?d)
		  )
		  )
  )
  (:action begin-softgoal-mode
	  :parameters ()
	  :precondition (and
		  (normal-mode )
  )
	  :effect (and
		  (not (normal-mode ))
		  (softgoal-mode ))
  )
  (:action started-softgoal-collect
	  :parameters (?vm - virtualdomain ?v1 - softgoalorder ?v2 - softgoalorder )
	  :precondition (and
		  (next-softgoal ?v1 ?v2 )
		  (current-softgoal ?v1 )
		  (started-softgoal-order ?vm ?v1 )
		  (softgoal-mode)
		  (stat ?vm started)
		  )
	  :effect (and
		  (started-softgoal ?vm )
		  (current-softgoal ?v2 )
		  (not (current-softgoal ?v1 ))
		  )	
  )
  (:action started-softgoal-forgo
	  :parameters (?vm - virtualdomain ?v1 - softgoalorder ?v2 - softgoalorder)
	  :precondition (and
		  (next-softgoal ?v1 ?v2)
		  (current-softgoal ?v1)
		  (started-softgoal-order ?vm ?v1	)
		  (softgoal-mode)
		  )
	  :effect (and
		  (started-softgoal ?vm)
		  (current-softgoal ?v2 )
		  (not (current-softgoal ?v1 ))
		  (increase (total-cost ) (started-softgoal-reward ?vm ) )
	  )
  )
)
