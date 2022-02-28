(define (domain grounded-strips-openstacks-sequencedstrips)
(:requirements
:strips
)
(:predicates
(machine-configured-p1)
(machine-configured-p2)
(machine-configured-p3)
(machine-configured-p4)
(machine-configured-p5)
(stacks-avail-n1)
(started-o1)
(started-o2)
(started-o3)
(started-o4)
(started-o5)
(stacks-avail-n2)
(made-p1)
(made-p2)
(made-p3)
(made-p4)
(made-p5)
(shipped-o1)
(stacks-avail-n3)
(stacks-avail-n4)
(stacks-avail-n5)
(shipped-o2)
(shipped-o3)
(shipped-o4)
(shipped-o5)
(not-made-p5)
(not-made-p4)
(not-made-p3)
(not-made-p2)
(not-made-p1)
(waiting-o5)
(waiting-o4)
(waiting-o3)
(waiting-o2)
(waiting-o1)
(machine-available-)
(stacks-avail-n0)
)
(:action make-product-p5-n5
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n5)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p5-n4
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n4)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p5-n3
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n3)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p4-n5
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n5)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p4-n4
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n4)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p4-n3
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n3)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p3-n5
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n5)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p3-n4
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n4)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p3-n3
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n3)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p2-n5
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n5)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p2-n4
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n4)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p2-n3
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n3)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p1-n5
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n5)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action make-product-p1-n4
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n4)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action make-product-p1-n3
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n3)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action open-new-stack-n2-n3
:parameters ()
:precondition
(and
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(not (stacks-avail-n2))
)
)
(:action open-new-stack-n3-n4
:parameters ()
:precondition
(and
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(not (stacks-avail-n3))
)
)
(:action open-new-stack-n4-n5
:parameters ()
:precondition
(and
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(not (stacks-avail-n4))
)
)
(:action start-order-o5-n2-n1
:parameters ()
:precondition
(and
(stacks-avail-n2)
(waiting-o5)
)
:effect
(and
(started-o5)
(stacks-avail-n1)
(not (waiting-o5))
(not (stacks-avail-n2))
)
)
(:action start-order-o4-n2-n1
:parameters ()
:precondition
(and
(stacks-avail-n2)
(waiting-o4)
)
:effect
(and
(started-o4)
(stacks-avail-n1)
(not (waiting-o4))
(not (stacks-avail-n2))
)
)
(:action start-order-o3-n2-n1
:parameters ()
:precondition
(and
(stacks-avail-n2)
(waiting-o3)
)
:effect
(and
(started-o3)
(stacks-avail-n1)
(not (waiting-o3))
(not (stacks-avail-n2))
)
)
(:action start-order-o2-n2-n1
:parameters ()
:precondition
(and
(stacks-avail-n2)
(waiting-o2)
)
:effect
(and
(started-o2)
(stacks-avail-n1)
(not (waiting-o2))
(not (stacks-avail-n2))
)
)
(:action start-order-o1-n2-n1
:parameters ()
:precondition
(and
(stacks-avail-n2)
(waiting-o1)
)
:effect
(and
(started-o1)
(stacks-avail-n1)
(not (waiting-o1))
(not (stacks-avail-n2))
)
)
(:action start-order-o5-n3-n2
:parameters ()
:precondition
(and
(stacks-avail-n3)
(waiting-o5)
)
:effect
(and
(started-o5)
(stacks-avail-n2)
(not (waiting-o5))
(not (stacks-avail-n3))
)
)
(:action start-order-o4-n3-n2
:parameters ()
:precondition
(and
(stacks-avail-n3)
(waiting-o4)
)
:effect
(and
(started-o4)
(stacks-avail-n2)
(not (waiting-o4))
(not (stacks-avail-n3))
)
)
(:action start-order-o3-n3-n2
:parameters ()
:precondition
(and
(stacks-avail-n3)
(waiting-o3)
)
:effect
(and
(started-o3)
(stacks-avail-n2)
(not (waiting-o3))
(not (stacks-avail-n3))
)
)
(:action start-order-o2-n3-n2
:parameters ()
:precondition
(and
(stacks-avail-n3)
(waiting-o2)
)
:effect
(and
(started-o2)
(stacks-avail-n2)
(not (waiting-o2))
(not (stacks-avail-n3))
)
)
(:action start-order-o1-n3-n2
:parameters ()
:precondition
(and
(stacks-avail-n3)
(waiting-o1)
)
:effect
(and
(started-o1)
(stacks-avail-n2)
(not (waiting-o1))
(not (stacks-avail-n3))
)
)
(:action start-order-o5-n4-n3
:parameters ()
:precondition
(and
(stacks-avail-n4)
(waiting-o5)
)
:effect
(and
(started-o5)
(stacks-avail-n3)
(not (waiting-o5))
(not (stacks-avail-n4))
)
)
(:action start-order-o4-n4-n3
:parameters ()
:precondition
(and
(stacks-avail-n4)
(waiting-o4)
)
:effect
(and
(started-o4)
(stacks-avail-n3)
(not (waiting-o4))
(not (stacks-avail-n4))
)
)
(:action start-order-o3-n4-n3
:parameters ()
:precondition
(and
(stacks-avail-n4)
(waiting-o3)
)
:effect
(and
(started-o3)
(stacks-avail-n3)
(not (waiting-o3))
(not (stacks-avail-n4))
)
)
(:action start-order-o2-n4-n3
:parameters ()
:precondition
(and
(stacks-avail-n4)
(waiting-o2)
)
:effect
(and
(started-o2)
(stacks-avail-n3)
(not (waiting-o2))
(not (stacks-avail-n4))
)
)
(:action start-order-o1-n4-n3
:parameters ()
:precondition
(and
(stacks-avail-n4)
(waiting-o1)
)
:effect
(and
(started-o1)
(stacks-avail-n3)
(not (waiting-o1))
(not (stacks-avail-n4))
)
)
(:action start-order-o5-n5-n4
:parameters ()
:precondition
(and
(stacks-avail-n5)
(waiting-o5)
)
:effect
(and
(started-o5)
(stacks-avail-n4)
(not (waiting-o5))
(not (stacks-avail-n5))
)
)
(:action start-order-o4-n5-n4
:parameters ()
:precondition
(and
(stacks-avail-n5)
(waiting-o4)
)
:effect
(and
(started-o4)
(stacks-avail-n4)
(not (waiting-o4))
(not (stacks-avail-n5))
)
)
(:action start-order-o3-n5-n4
:parameters ()
:precondition
(and
(stacks-avail-n5)
(waiting-o3)
)
:effect
(and
(started-o3)
(stacks-avail-n4)
(not (waiting-o3))
(not (stacks-avail-n5))
)
)
(:action start-order-o2-n5-n4
:parameters ()
:precondition
(and
(stacks-avail-n5)
(waiting-o2)
)
:effect
(and
(started-o2)
(stacks-avail-n4)
(not (waiting-o2))
(not (stacks-avail-n5))
)
)
(:action start-order-o1-n5-n4
:parameters ()
:precondition
(and
(stacks-avail-n5)
(waiting-o1)
)
:effect
(and
(started-o1)
(stacks-avail-n4)
(not (waiting-o1))
(not (stacks-avail-n5))
)
)
(:action setup-machine-p5-n5
:parameters ()
:precondition
(and
(stacks-avail-n5)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p5-n4
:parameters ()
:precondition
(and
(stacks-avail-n4)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p5-n3
:parameters ()
:precondition
(and
(stacks-avail-n3)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p5-n2
:parameters ()
:precondition
(and
(stacks-avail-n2)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p4-n5
:parameters ()
:precondition
(and
(stacks-avail-n5)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p4-n4
:parameters ()
:precondition
(and
(stacks-avail-n4)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p4-n3
:parameters ()
:precondition
(and
(stacks-avail-n3)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p4-n2
:parameters ()
:precondition
(and
(stacks-avail-n2)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p3-n5
:parameters ()
:precondition
(and
(stacks-avail-n5)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p3-n4
:parameters ()
:precondition
(and
(stacks-avail-n4)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p3-n3
:parameters ()
:precondition
(and
(stacks-avail-n3)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p3-n2
:parameters ()
:precondition
(and
(stacks-avail-n2)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p2-n5
:parameters ()
:precondition
(and
(stacks-avail-n5)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p2-n4
:parameters ()
:precondition
(and
(stacks-avail-n4)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p2-n3
:parameters ()
:precondition
(and
(stacks-avail-n3)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p2-n2
:parameters ()
:precondition
(and
(stacks-avail-n2)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p1-n5
:parameters ()
:precondition
(and
(stacks-avail-n5)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
(:action setup-machine-p1-n4
:parameters ()
:precondition
(and
(stacks-avail-n4)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
(:action setup-machine-p1-n3
:parameters ()
:precondition
(and
(stacks-avail-n3)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
(:action setup-machine-p1-n2
:parameters ()
:precondition
(and
(stacks-avail-n2)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
(:action ship-order-o5-n4-n5
:parameters ()
:precondition
(and
(started-o5)
(made-p4)
(made-p2)
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(shipped-o5)
(not (stacks-avail-n4))
(not (started-o5))
)
)
(:action ship-order-o5-n3-n4
:parameters ()
:precondition
(and
(started-o5)
(made-p4)
(made-p2)
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(shipped-o5)
(not (stacks-avail-n3))
(not (started-o5))
)
)
(:action ship-order-o5-n2-n3
:parameters ()
:precondition
(and
(started-o5)
(made-p4)
(made-p2)
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(shipped-o5)
(not (stacks-avail-n2))
(not (started-o5))
)
)
(:action ship-order-o5-n1-n2
:parameters ()
:precondition
(and
(started-o5)
(made-p4)
(made-p2)
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(shipped-o5)
(not (stacks-avail-n1))
(not (started-o5))
)
)
(:action ship-order-o5-n0-n1
:parameters ()
:precondition
(and
(started-o5)
(made-p4)
(made-p2)
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(shipped-o5)
(not (stacks-avail-n0))
(not (started-o5))
)
)
(:action ship-order-o4-n4-n5
:parameters ()
:precondition
(and
(started-o4)
(made-p5)
(made-p3)
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(shipped-o4)
(not (stacks-avail-n4))
(not (started-o4))
)
)
(:action ship-order-o4-n3-n4
:parameters ()
:precondition
(and
(started-o4)
(made-p5)
(made-p3)
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(shipped-o4)
(not (stacks-avail-n3))
(not (started-o4))
)
)
(:action ship-order-o4-n2-n3
:parameters ()
:precondition
(and
(started-o4)
(made-p5)
(made-p3)
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(shipped-o4)
(not (stacks-avail-n2))
(not (started-o4))
)
)
(:action ship-order-o4-n1-n2
:parameters ()
:precondition
(and
(started-o4)
(made-p5)
(made-p3)
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(shipped-o4)
(not (stacks-avail-n1))
(not (started-o4))
)
)
(:action ship-order-o4-n0-n1
:parameters ()
:precondition
(and
(started-o4)
(made-p5)
(made-p3)
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(shipped-o4)
(not (stacks-avail-n0))
(not (started-o4))
)
)
(:action ship-order-o3-n4-n5
:parameters ()
:precondition
(and
(started-o3)
(made-p5)
(made-p1)
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(shipped-o3)
(not (stacks-avail-n4))
(not (started-o3))
)
)
(:action ship-order-o3-n3-n4
:parameters ()
:precondition
(and
(started-o3)
(made-p5)
(made-p1)
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(shipped-o3)
(not (stacks-avail-n3))
(not (started-o3))
)
)
(:action ship-order-o3-n2-n3
:parameters ()
:precondition
(and
(started-o3)
(made-p5)
(made-p1)
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(shipped-o3)
(not (stacks-avail-n2))
(not (started-o3))
)
)
(:action ship-order-o3-n1-n2
:parameters ()
:precondition
(and
(started-o3)
(made-p5)
(made-p1)
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(shipped-o3)
(not (stacks-avail-n1))
(not (started-o3))
)
)
(:action ship-order-o3-n0-n1
:parameters ()
:precondition
(and
(started-o3)
(made-p5)
(made-p1)
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(shipped-o3)
(not (stacks-avail-n0))
(not (started-o3))
)
)
(:action ship-order-o2-n4-n5
:parameters ()
:precondition
(and
(started-o2)
(made-p4)
(made-p3)
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(shipped-o2)
(not (stacks-avail-n4))
(not (started-o2))
)
)
(:action ship-order-o2-n3-n4
:parameters ()
:precondition
(and
(started-o2)
(made-p4)
(made-p3)
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(shipped-o2)
(not (stacks-avail-n3))
(not (started-o2))
)
)
(:action ship-order-o2-n2-n3
:parameters ()
:precondition
(and
(started-o2)
(made-p4)
(made-p3)
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(shipped-o2)
(not (stacks-avail-n2))
(not (started-o2))
)
)
(:action ship-order-o2-n1-n2
:parameters ()
:precondition
(and
(started-o2)
(made-p4)
(made-p3)
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(shipped-o2)
(not (stacks-avail-n1))
(not (started-o2))
)
)
(:action ship-order-o2-n0-n1
:parameters ()
:precondition
(and
(started-o2)
(made-p4)
(made-p3)
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(shipped-o2)
(not (stacks-avail-n0))
(not (started-o2))
)
)
(:action ship-order-o1-n4-n5
:parameters ()
:precondition
(and
(started-o1)
(made-p2)
(made-p1)
(stacks-avail-n4)
)
:effect
(and
(stacks-avail-n5)
(shipped-o1)
(not (stacks-avail-n4))
(not (started-o1))
)
)
(:action ship-order-o1-n3-n4
:parameters ()
:precondition
(and
(started-o1)
(made-p2)
(made-p1)
(stacks-avail-n3)
)
:effect
(and
(stacks-avail-n4)
(shipped-o1)
(not (stacks-avail-n3))
(not (started-o1))
)
)
(:action ship-order-o1-n2-n3
:parameters ()
:precondition
(and
(started-o1)
(made-p2)
(made-p1)
(stacks-avail-n2)
)
:effect
(and
(stacks-avail-n3)
(shipped-o1)
(not (stacks-avail-n2))
(not (started-o1))
)
)
(:action ship-order-o1-n1-n2
:parameters ()
:precondition
(and
(started-o1)
(made-p2)
(made-p1)
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(shipped-o1)
(not (stacks-avail-n1))
(not (started-o1))
)
)
(:action ship-order-o1-n0-n1
:parameters ()
:precondition
(and
(started-o1)
(made-p2)
(made-p1)
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(shipped-o1)
(not (stacks-avail-n0))
(not (started-o1))
)
)
(:action make-product-p5-n2
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n2)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p5-n1
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n1)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p5-n0
:parameters ()
:precondition
(and
(machine-configured-p5)
(started-o4)
(started-o3)
(stacks-avail-n0)
)
:effect
(and
(made-p5)
(machine-available-)
(not (not-made-p5))
(not (machine-configured-p5))
)
)
(:action make-product-p4-n2
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n2)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p4-n1
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n1)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p4-n0
:parameters ()
:precondition
(and
(machine-configured-p4)
(started-o5)
(started-o2)
(stacks-avail-n0)
)
:effect
(and
(made-p4)
(machine-available-)
(not (not-made-p4))
(not (machine-configured-p4))
)
)
(:action make-product-p3-n2
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n2)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p3-n1
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n1)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p3-n0
:parameters ()
:precondition
(and
(machine-configured-p3)
(started-o4)
(started-o2)
(stacks-avail-n0)
)
:effect
(and
(made-p3)
(machine-available-)
(not (not-made-p3))
(not (machine-configured-p3))
)
)
(:action make-product-p2-n2
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n2)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p2-n1
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n1)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p2-n0
:parameters ()
:precondition
(and
(machine-configured-p2)
(started-o5)
(started-o1)
(stacks-avail-n0)
)
:effect
(and
(made-p2)
(machine-available-)
(not (not-made-p2))
(not (machine-configured-p2))
)
)
(:action make-product-p1-n2
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n2)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action make-product-p1-n1
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n1)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action make-product-p1-n0
:parameters ()
:precondition
(and
(machine-configured-p1)
(started-o3)
(started-o1)
(stacks-avail-n0)
)
:effect
(and
(made-p1)
(machine-available-)
(not (not-made-p1))
(not (machine-configured-p1))
)
)
(:action open-new-stack-n1-n2
:parameters ()
:precondition
(and
(stacks-avail-n1)
)
:effect
(and
(stacks-avail-n2)
(not (stacks-avail-n1))
)
)
(:action start-order-o5-n1-n0
:parameters ()
:precondition
(and
(stacks-avail-n1)
(waiting-o5)
)
:effect
(and
(started-o5)
(stacks-avail-n0)
(not (waiting-o5))
(not (stacks-avail-n1))
)
)
(:action start-order-o4-n1-n0
:parameters ()
:precondition
(and
(stacks-avail-n1)
(waiting-o4)
)
:effect
(and
(started-o4)
(stacks-avail-n0)
(not (waiting-o4))
(not (stacks-avail-n1))
)
)
(:action start-order-o3-n1-n0
:parameters ()
:precondition
(and
(stacks-avail-n1)
(waiting-o3)
)
:effect
(and
(started-o3)
(stacks-avail-n0)
(not (waiting-o3))
(not (stacks-avail-n1))
)
)
(:action start-order-o2-n1-n0
:parameters ()
:precondition
(and
(stacks-avail-n1)
(waiting-o2)
)
:effect
(and
(started-o2)
(stacks-avail-n0)
(not (waiting-o2))
(not (stacks-avail-n1))
)
)
(:action start-order-o1-n1-n0
:parameters ()
:precondition
(and
(stacks-avail-n1)
(waiting-o1)
)
:effect
(and
(started-o1)
(stacks-avail-n0)
(not (waiting-o1))
(not (stacks-avail-n1))
)
)
(:action setup-machine-p5-n1
:parameters ()
:precondition
(and
(stacks-avail-n1)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p4-n1
:parameters ()
:precondition
(and
(stacks-avail-n1)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p3-n1
:parameters ()
:precondition
(and
(stacks-avail-n1)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p2-n1
:parameters ()
:precondition
(and
(stacks-avail-n1)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p1-n1
:parameters ()
:precondition
(and
(stacks-avail-n1)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
(:action open-new-stack-n0-n1
:parameters ()
:precondition
(and
(stacks-avail-n0)
)
:effect
(and
(stacks-avail-n1)
(not (stacks-avail-n0))
)
)
(:action setup-machine-p5-n0
:parameters ()
:precondition
(and
(stacks-avail-n0)
(not-made-p5)
(machine-available-)
)
:effect
(and
(machine-configured-p5)
(not (machine-available-))
)
)
(:action setup-machine-p4-n0
:parameters ()
:precondition
(and
(stacks-avail-n0)
(not-made-p4)
(machine-available-)
)
:effect
(and
(machine-configured-p4)
(not (machine-available-))
)
)
(:action setup-machine-p3-n0
:parameters ()
:precondition
(and
(stacks-avail-n0)
(not-made-p3)
(machine-available-)
)
:effect
(and
(machine-configured-p3)
(not (machine-available-))
)
)
(:action setup-machine-p2-n0
:parameters ()
:precondition
(and
(stacks-avail-n0)
(not-made-p2)
(machine-available-)
)
:effect
(and
(machine-configured-p2)
(not (machine-available-))
)
)
(:action setup-machine-p1-n0
:parameters ()
:precondition
(and
(stacks-avail-n0)
(not-made-p1)
(machine-available-)
)
:effect
(and
(machine-configured-p1)
(not (machine-available-))
)
)
)
