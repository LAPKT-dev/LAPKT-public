


(define (problem mixed-f2-p1-u20-v5-g5-a60-n10-a20-b80-n50-f5-r0)
   (:domain miconic)
   (:objects p0 - passenger
             f0 f1 - floor)


(:init
(above f0 f1)



(origin p0 f1)
(destin p0 f0)






(lift-at f0)
)


(:goal (forall (?p - passenger) (served ?p)))
)


