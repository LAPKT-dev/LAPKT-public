


(define (problem hanoi-1)
(:domain hanoi)
(:objects peg1 peg2 peg3 d1 )
(:init
(smaller peg1 d1)
(smaller peg2 d1)
(smaller peg3 d1)
(clear peg2)
            (clear peg3)
            (clear d1)
(on d1 peg1)
)
(:goal
(and 
(on d1 peg3)
)
)
)


