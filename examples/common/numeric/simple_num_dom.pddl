(define (domain containers)
(:requirements :typing :numeric-fluents :action-costs )
(:types
        container - object
        package - object 
        softgoalorder - object
)

(:predicates
        (in ?c - container ?p - package )
        (normal-mode )
        (softgoal-mode )
        (current-softgoal ?s - softgoalorder )
        (next-softgoal ?s - softgoalorder ?s1 - softgoalorder)
        (placed-softgoal-order ?s - softgoalorder ?p - package)
        (placed-softgoal-order ?s - softgoalorder ?p - package)
        (placed-softgoal ?p - package)
)

(:functions
        (capasity-left ?c - container )
        (capasity-demand ?p - package )
        (max-capasity ?c - container )
        (total-cost )
        (at-softgoal-reward ?v0 - locatable ?v1 - location )
)

(:action place-package
    :parameters ( ?p - package ?c - container )
    :precondition (and (> (- (capasity-left ?c) (capasity-demand ?p)) 0 )
                       (not (in ?c ?p))
                       (normal-mode)
                  )
    :effect (and (decrease (capasity-left ?c) (capasity-demand ?p))
                 (in ?c ?p)
                 (increase (total-cost) 1)
            )
)

(:action remove-package
   :parameters (?p - package ?c - container )
   :precondition (and (in ?c ?p) (normal-mode))
   :effect ( and (not (in ?c ?p))
                 (increase (total-cost) 1)
           )
)

(:action start-softmode
 :parameters ()                 
 :precondition (and 
       (not (softgoal-mode )) 
       (normal-mode ))                 
 :effect (and 
    (softgoal-mode ) 
    (not (normal-mode ))
    (increase (total-cost ) 1))
)
(:action softgoal-collect-placed
  :parameters (?p - package ?sg0 - softgoalorder ?sg1 - softgoalorder ?c - container)
  :precondition (and
                 (softgoal-mode)
                 (current-softgoal ?sg0)
                 (next-softgoal ?sg0 ?sg1)
                 (placed-softgoal-order ?sg0 ?p)

                 (in ?c ?p)
                )
  :effect (and
      (increase (total-cost) 1)  
      (current-softgoal ?sg1)
      (not (current-softgoal ?sg0))
       
      (placed-softgoal ?p)
      )
)

(:action softgoal-forgo-placed
  :parameters (?p - package ?sg0 - softgoalorder ?sg1 - softgoalorder)
  :precondition ( and 
                   (softgoal-mode)
                   (current-softgoal ?sg0)
                   (next-softgoal ?sg0 ?sg1)
                   (placed-softgoal-order ?sg0 ?p)
                )
  :effect (and
      (increase (total-cost) 50)  
      (current-softgoal ?sg1)
      (not (current-softgoal ?sg0))
       
      (placed-softgoal ?p)
      )
)

)
