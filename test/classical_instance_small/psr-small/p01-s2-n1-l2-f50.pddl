(define (problem grounded-strips-psr-s2-n1-l2-f50)
(:domain grounded-strips-psr)
(:init
(do-normal)
(not-updated-cb1)
(closed-sd2)
(closed-sd1)
(closed-cb1)
)
(:goal
(and
(do-normal)
(closed-cb1)
(updated-cb1)
)
)
)
