(define (problem place-package)
(:domain containers)
(:objects
  cnt1 - container
  cnt2 - container
  pkg0 - package
  pkg1 - package
  pkg2 - package
  pkg3 - package
  pkg4 - package
  pkg5 - package
  sg0 - softgoalorder
  sg1 - softgoalorder
  sg2 - softgoalorder
  sg3 - softgoalorder
  sg4 - softgoalorder
  sg5 - softgoalorder
  sg6 - softgoalorder
)
(:init
  (normal-mode)
  (= (total-cost) 0)
  (= (capasity-max cnt1) 7)
  (= (capasity-max cnt2) 7)
  (= (capasity-left cnt1) 7)
  (= (capasity-left cnt2) 7)
  (= (capasity-demand pkg0) 1)
  (= (capasity-demand pkg1) 1)
  (= (capasity-demand pkg2) 1)
  (= (capasity-demand pkg3) 1)
  (= (capasity-demand pkg4) 1)
  (= (capasity-demand pkg5) 1)
  (= (capasity-demand pkg6) 1)
  (current-softgoal sg0)
  (next-softgoal sg0 sg1)
  (next-softgoal sg1 sg2)
  (next-softgoal sg2 sg3)
  (next-softgoal sg3 sg4)
  (next-softgoal sg4 sg5)
  (next-softgoal sg5 sg6)

  (placed-softgoal-order sg0 pkg0)
  (placed-softgoal-order sg1 pkg1)
  (placed-softgoal-order sg2 pkg2)
  (placed-softgoal-order sg3 pkg3)
  (placed-softgoal-order sg4 pkg4)
  (placed-softgoal-order sg5 pkg5)
)
(:goal (and 
      (placed-softgoal pkg0)
      (placed-softgoal pkg1)
      (placed-softgoal pkg2)
      (placed-softgoal pkg3)
      (placed-softgoal pkg4)
      (placed-softgoal pkg5)
      )
)
(:metric minimize (+ (* (- (capasity-max cnt1) (capasity-left cnt1))
                       (- (capasity-max cnt1) (capasity-left cnt1)))
                     (* (- (capasity-max cnt2) (capasity-left cnt2))
                       (- (capasity-max cnt2) (capasity-left cnt2)))
                     (total-cost)
                  )
)

)
