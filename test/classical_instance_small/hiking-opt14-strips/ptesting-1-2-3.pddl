(define (problem hiking-1-2)
(:domain hiking)
(:objects 
 car0 car1 - car
 tent0 - tent
 couple0 - couple
 place0 place1 place2 - place
 guy0 girl0 - person
)
(:init
(partners couple0 guy0 girl0)
(at_person guy0 place0)
(at_person girl0 place0)
(walked couple0 place0)
(at_tent tent0 place0)
(up tent0)
(at_car car0 place0)
(at_car car1 place0)
(next place0 place1)
(next place1 place2)
)
(:goal
(and
(walked couple0 place2)
)
)
)
