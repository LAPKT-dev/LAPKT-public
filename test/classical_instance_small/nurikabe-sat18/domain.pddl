(define (domain nurikabe)
(:requirements :typing :adl)
(:types
    cell num group - object
)
(:constants
    n0 - num
)
(:predicates
    (next ?n1 - num ?n2 - num)
    ; defines the graph structure
    (connected ?c - cell ?c2 - cell)
    ; the initial position from which the robot must start painting
    (source ?x - cell ?g - group)
    ; whether a tile has been painted
    (painted ?r - cell)
    ; a cell does not belong to any group
    (available ?x - cell)
    ; whether a cell "belongs to" a group. this happens when an adjacent cell belongs to such group
    (part-of ?x - cell ?y - group)
    ; a cell belongs to two different groups so it cannot be painted of any color
    (blocked ?x - cell)
    ; how many tiles remain to be painted for every group
    (remaining-cells ?x - group ?y - num)
    ; position of the robot
    (robot-pos ?x - cell)
    ; the robot is currently not painting
    (moving)
    ; the robot is currently painting a group
    (painting ?g - group)
    ; the robot has painted a group
    (group-painted ?g - group)
)
(:action move
    :parameters (?from - cell ?to - cell)
    :precondition
    (and
        (connected ?from ?to)
        (moving)
        (not (painted ?to))
        (robot-pos ?from)
    )
    :effect
    (and
        (robot-pos ?to)
        (not (robot-pos ?from))
    )
)

(:action start-painting
    :parameters (?c - cell ?g - group ?n1 - num ?n2 - num)
    :precondition
    (and
        (next ?n2 ?n1)
        (source ?c ?g)
        (moving)
        (robot-pos ?c)
        (remaining-cells ?g ?n1)
    )
    :effect
    (and
        (not (moving))
        (painting ?g)
        (painted ?c)
        (remaining-cells ?g ?n2)
        (not (remaining-cells ?g ?n1))
    )
)

(:action move-painting
    :parameters (?from - cell ?to - cell ?g - group ?n1 - num ?n2 - num)
    :precondition
    (and
        (next ?n2 ?n1)
        (connected ?from ?to)
        (not (painted ?to))
        (not (blocked ?to))
        (painting ?g)
        (remaining-cells ?g ?n1)
        (robot-pos ?from)
    )
    :effect
    (and
        (robot-pos ?to)
        (not (robot-pos ?from))
        (painted ?to)
        (remaining-cells ?g ?n2)
        (not (remaining-cells ?g ?n1))
        (forall (?cadj - cell)
            (when
                (and
                    (connected ?to ?cadj)
                    (available ?cadj)
                )
                (and
                    (not (available ?cadj))
                    (part-of ?cadj ?g)
                )
            )
        )
        (forall (?cadj - cell)
            (when
                (and
                    (connected ?to ?cadj)
                    (not (available ?cadj))
                    (not (part-of ?cadj ?g))
                )
                (blocked ?cadj)
            )
        )
    )
)

(:action end-painting
    :parameters (?g - group)
    :precondition
    (and
        (painting ?g)
        (remaining-cells ?g n0)
    )
    :effect
    (and
        (not (painting ?g))
        (moving)
        (group-painted ?g)
    )
)

)