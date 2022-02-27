; ipc5 domain: openstacks propositional -- strips forced sequential version
; author: patrik haslum
; the problem instances for this domain were taken from the problem
; collection of the 2005 constraint modelling challenge, organized by
; barbara smith & ian gent (see http://www.dcs.st-and.ac.uk/~ipg/challenge/).

(define (domain openstacks-sequencedstrips)
  (:requirements :typing :adl)
  (:types order product count)
  (:predicates (includes ?o - order ?p - product)
	       (waiting ?o - order)
	       (started ?o - order)
	       (shipped ?o - order)
	       (made ?p - product)
	       (machine-available)
	       (machine-configured ?p - product)
	       (stacks-avail ?s - count)
	       (next-count ?s ?ns - count))

  (:action setup-machine
    :parameters (?p - product ?avail - count)
    :precondition (and (machine-available)
		       (not (made ?p))
		       (stacks-avail ?avail))
    :effect (and (not (machine-available)) (machine-configured ?p)))

  (:action make-product
    :parameters (?p - product ?avail - count)
    :precondition (and (machine-configured ?p)
		       (forall (?o - order)
			       (imply (includes ?o ?p) (started ?o)))
		       (stacks-avail ?avail))
    :effect (and (not (machine-configured ?p))
		 (machine-available)
		 (made ?p)))

  (:action start-order
    :parameters (?o - order ?avail ?new-avail - count)
    :precondition (and (waiting ?o)
		       (stacks-avail ?avail)
		       (next-count ?new-avail ?avail))
    :effect (and (not (waiting ?o))
		 (started ?o)
		 (not (stacks-avail ?avail))
		 (stacks-avail ?new-avail))
    )

  (:action ship-order
    :parameters (?o - order ?avail ?new-avail - count)
    :precondition (and (started ?o)
		       (forall (?p - product)
			       (imply (includes ?o ?p) (made ?p)))
		       (stacks-avail ?avail)
		       (next-count ?avail ?new-avail))
    :effect (and (not (started ?o))
		 (shipped ?o)
		 (not (stacks-avail ?avail))
		 (stacks-avail ?new-avail))
    )

  (:action open-new-stack
    :parameters (?open ?new-open - count)
    :precondition (and (stacks-avail ?open)
		       (next-count ?open ?new-open))
    :effect (and (not (stacks-avail ?open))
		 (stacks-avail ?new-open))
    )

  )
