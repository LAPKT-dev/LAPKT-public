(define (problem place-package)
(:domain containers)
(:objects
  cnt1 - container
  cnt2 - container
  cnt3 - container
  cnt4 - container
  cnt5 - container
  pkg0 - package
  pkg1 - package
  pkg2 - package
  pkg3 - package
  pkg4 - package
  pkg6 - package
  pkg7 - package
  pkg8 - package
  pkg9 - package
  pkg10 - package
  pkg11 - package
  pkg12 - package
  pkg13 - package
  sg0 - softgoalorder
  sg1 - softgoalorder
  sg2 - softgoalorder
  sg3 - softgoalorder
  sg4 - softgoalorder
  sg5 - softgoalorder
  sg6 - softgoalorder
  sg7 - softgoalorder
  sg8 - softgoalorder
  sg9 - softgoalorder
  sg10 - softgoalorder
  sg11 - softgoalorder
  sg12 - softgoalorder
  sg13 - softgoalorder
  sg14 - softgoalorder
)
(:init
  (normal-mode)
  (= (total-cost) 0)
  (= (capasity-max cnt1) 7)
  (= (capasity-max cnt2) 7)
  (= (capasity-max cnt3) 7)
  (= (capasity-max cnt4) 7)
  (= (capasity-max cnt5) 7)
  (= (capasity-left cnt1) 7)
  (= (capasity-left cnt2) 7)
  (= (capasity-left cnt3) 7)
  (= (capasity-left cnt4) 7)
  (= (capasity-left cnt5) 7)
  (= (capasity-demand pkg0) 1)
  (= (capasity-demand pkg1) 1)
  (= (capasity-demand pkg2) 1)
  (= (capasity-demand pkg3) 1)
  (= (capasity-demand pkg4) 1)
  (= (capasity-demand pkg5) 1)
  (= (capasity-demand pkg6) 1)
  (= (capasity-demand pkg7) 1)
  (= (capasity-demand pkg8) 1)
  (= (capasity-demand pkg9) 1)
  (= (capasity-demand pkg10) 1)
  (= (capasity-demand pkg11) 1)
  (= (capasity-demand pkg12) 1)
  (= (capasity-demand pkg13) 1)
  (current-softgoal sg0)
  (next-softgoal sg0 sg1)
  (next-softgoal sg1 sg2)
  (next-softgoal sg2 sg3)
  (next-softgoal sg3 sg4)
  (next-softgoal sg4 sg5)
  (next-softgoal sg5 sg6)
  (next-softgoal sg6 sg7)
  (next-softgoal sg7 sg8)
  (next-softgoal sg8 sg9)
  (next-softgoal sg9 sg10)
  (next-softgoal sg10 sg11)
  (next-softgoal sg11 sg12)
  (next-softgoal sg12 sg13)
  (next-softgoal sg13 sg14)

  (placed-softgoal-order sg0 pkg0)
  (placed-softgoal-order sg1 pkg1)
  (placed-softgoal-order sg2 pkg2)
  (placed-softgoal-order sg3 pkg3)
  (placed-softgoal-order sg4 pkg4)
  (placed-softgoal-order sg5 pkg5)
  (placed-softgoal-order sg6 pkg6)
  (placed-softgoal-order sg7 pkg7)
  (placed-softgoal-order sg8 pkg8)
  (placed-softgoal-order sg9 pkg9)
  (placed-softgoal-order sg10 pkg10)
  (placed-softgoal-order sg11 pkg11)
  (placed-softgoal-order sg12 pkg12)
  (placed-softgoal-order sg13 pkg13)
)
(:goal (and 
      (placed-softgoal pkg0)
      (placed-softgoal pkg1)
      (placed-softgoal pkg2)
      (placed-softgoal pkg3)
      (placed-softgoal pkg4)
      (placed-softgoal pkg5)
      (placed-softgoal pkg6)
      (placed-softgoal pkg7)
      (placed-softgoal pkg8)
      (placed-softgoal pkg9)
      (placed-softgoal pkg10)
      (placed-softgoal pkg11)
      (placed-softgoal pkg12)
      (placed-softgoal pkg13)
      )
)
(:metric minimize (+ (* (- (capasity-max cnt1) (capasity-left cnt1))
                       (- (capasity-max cnt1) (capasity-left cnt1)))
                     (* (- (capasity-max cnt2) (capasity-left cnt2))
                       (- (capasity-max cnt2) (capasity-left cnt2)))
                  )
)

)
