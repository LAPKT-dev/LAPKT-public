(define (problem start-vms)
(:domain cluster)
(:objects

vm1 - virtualdomain
vm2 - virtualdomain
libvirt - daemon
freeda1 - node
freeda2 - node

sg0 - softgoalorder
sg1 - softgoalorder
sg2 - softgoalorder
)

(:init
  (= (total-cost ) 0)
  (current-softgoal sg0 )
  (next-softgoal sg0 sg1 )
  (next-softgoal sg1 sg2 )
  (normal-mode )

  (stat vm2 stopped)
  (stat vm1 stopped)
  (= (started-softgoal-reward vm1 ) 40.0)
  (started-softgoal-order vm1 sg0 )
)

(:goal
  ( and
    (started-softgoal vm1 )
  )
)
(:metric minimize
(total-cost)
)
)

