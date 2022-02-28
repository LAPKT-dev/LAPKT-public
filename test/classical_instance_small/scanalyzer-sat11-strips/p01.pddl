(define (problem scanalyzer3d-59)
  (:domain scanalyzer3d)
  (:objects
    car-in-1a - car
    car-in-1b - car
    car-in-2a - car
    car-in-2b - car
    car-out-1a - car
    car-out-1b - car
    car-out-2a - car
    car-out-2b - car
    seg-in-1a - segment
    seg-in-1b - segment
    seg-in-2a - segment
    seg-in-2b - segment
    seg-out-1a - segment
    seg-out-1b - segment
    seg-out-2a - segment
    seg-out-2b - segment
  )
  (:init
    (= (total-cost) 0)
    (cycle-4 seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
    (cycle-4 seg-in-1a seg-in-1b seg-out-2a seg-out-2b)
    (cycle-4 seg-in-2a seg-in-2b seg-out-1a seg-out-1b)
    (cycle-4 seg-in-2a seg-in-2b seg-out-2a seg-out-2b)
    (cycle-4-with-analysis seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
    (cycle-4-with-analysis seg-in-1a seg-in-1b seg-out-2a seg-out-2b)
    (cycle-4-with-analysis seg-in-2a seg-in-2b seg-out-1a seg-out-1b)
    (cycle-4-with-analysis seg-in-2a seg-in-2b seg-out-2a seg-out-2b)
    (on car-in-1a seg-in-1a)
    (on car-in-1b seg-in-1b)
    (on car-in-2a seg-in-2a)
    (on car-in-2b seg-in-2b)
    (on car-out-1a seg-out-1a)
    (on car-out-1b seg-out-1b)
    (on car-out-2a seg-out-2a)
    (on car-out-2b seg-out-2b)
  )
  (:goal (and
    (analyzed car-in-1a)
    (analyzed car-in-1b)
    (analyzed car-in-2a)
    (analyzed car-in-2b)
    (analyzed car-out-1a)
    (analyzed car-out-1b)
    (analyzed car-out-2a)
    (analyzed car-out-2b)
    (on car-in-1a seg-out-1b)
    (on car-in-1b seg-in-1a)
    (on car-in-2a seg-out-2b)
    (on car-in-2b seg-in-2a)
    (on car-out-1a seg-in-1b)
    (on car-out-1b seg-out-1a)
    (on car-out-2a seg-in-2b)
    (on car-out-2b seg-out-2a)
  ))
  (:metric minimize (total-cost))
)
