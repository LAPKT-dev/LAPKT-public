(define (domain openstacks-sequencedstrips-nonADL)
(:requirements :typing :action-costs)
(:types order product count)
(:constants 
 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 - product
 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 o14 o15 o16 o17 o18 o19 o20 o21 o22 o23 o24 o25 o26 o27 o28 o29 o30 o31 o32 o33 o34 o35 o36 o37 o38 o39 o40 o41 o42 o43 o44 o45 o46 o47 o48 o49 o50 - order
)

(:predicates 
	(includes ?o - order ?p - product)
	(waiting ?o - order)
	(started ?o - order)
	(shipped ?o - order)
	(made ?p - product)
	(stacks-avail ?s - count)
	(next-count ?s ?ns - count)
)

(:functions
(total-cost)
)

(:action open-new-stack
:parameters (?open ?new-open - count)
:precondition (and (stacks-avail ?open)(next-count ?open ?new-open))
:effect (and (not (stacks-avail ?open))(stacks-avail ?new-open) (increase (total-cost) 1))
)

(:action start-order
:parameters (?o - order ?avail ?new-avail - count)
:precondition (and (waiting ?o)(stacks-avail ?avail)(next-count ?new-avail ?avail))
:effect (and (not (waiting ?o))(started ?o)(not (stacks-avail ?avail))(stacks-avail ?new-avail))
)

(:action make-product-p1
:parameters ()
:precondition (and (not (made p1))(started o6)(started o23)(started o25)(started o42))
:effect (and (made p1))
)

(:action make-product-p2
:parameters ()
:precondition (and (not (made p2))(started o28)(started o32)(started o34))
:effect (and (made p2))
)

(:action make-product-p3
:parameters ()
:precondition (and (not (made p3))(started o15)(started o32)(started o34)(started o43)(started o44))
:effect (and (made p3))
)

(:action make-product-p4
:parameters ()
:precondition (and (not (made p4))(started o2)(started o8)(started o20)(started o39))
:effect (and (made p4))
)

(:action make-product-p5
:parameters ()
:precondition (and (not (made p5))(started o7)(started o11)(started o37))
:effect (and (made p5))
)

(:action make-product-p6
:parameters ()
:precondition (and (not (made p6))(started o5)(started o28)(started o36)(started o47))
:effect (and (made p6))
)

(:action make-product-p7
:parameters ()
:precondition (and (not (made p7))(started o13)(started o22)(started o29)(started o34)(started o45)(started o48))
:effect (and (made p7))
)

(:action make-product-p8
:parameters ()
:precondition (and (not (made p8))(started o1)(started o13)(started o32))
:effect (and (made p8))
)

(:action make-product-p9
:parameters ()
:precondition (and (not (made p9))(started o2)(started o4)(started o9)(started o10)(started o14)(started o16)(started o17)(started o26)(started o37)(started o46))
:effect (and (made p9))
)

(:action make-product-p10
:parameters ()
:precondition (and (not (made p10))(started o6)(started o8)(started o25)(started o46))
:effect (and (made p10))
)

(:action make-product-p11
:parameters ()
:precondition (and (not (made p11))(started o3)(started o18)(started o27)(started o39))
:effect (and (made p11))
)

(:action make-product-p12
:parameters ()
:precondition (and (not (made p12))(started o12)(started o15)(started o28)(started o29)(started o41)(started o47)(started o49))
:effect (and (made p12))
)

(:action make-product-p13
:parameters ()
:precondition (and (not (made p13))(started o7)(started o45))
:effect (and (made p13))
)

(:action make-product-p14
:parameters ()
:precondition (and (not (made p14))(started o31)(started o33)(started o36)(started o49))
:effect (and (made p14))
)

(:action make-product-p15
:parameters ()
:precondition (and (not (made p15))(started o3)(started o4)(started o8)(started o18)(started o37))
:effect (and (made p15))
)

(:action make-product-p16
:parameters ()
:precondition (and (not (made p16))(started o6)(started o13)(started o29)(started o33)(started o43))
:effect (and (made p16))
)

(:action make-product-p17
:parameters ()
:precondition (and (not (made p17))(started o4)(started o7)(started o10)(started o14)(started o20)(started o22)(started o25)(started o26)(started o40))
:effect (and (made p17))
)

(:action make-product-p18
:parameters ()
:precondition (and (not (made p18))(started o3)(started o4)(started o9)(started o14)(started o17)(started o25)(started o48))
:effect (and (made p18))
)

(:action make-product-p19
:parameters ()
:precondition (and (not (made p19))(started o4)(started o26)(started o27)(started o42))
:effect (and (made p19))
)

(:action make-product-p20
:parameters ()
:precondition (and (not (made p20))(started o19)(started o31)(started o40)(started o50))
:effect (and (made p20))
)

(:action make-product-p21
:parameters ()
:precondition (and (not (made p21))(started o25)(started o30))
:effect (and (made p21))
)

(:action make-product-p22
:parameters ()
:precondition (and (not (made p22))(started o9)(started o14)(started o26)(started o40))
:effect (and (made p22))
)

(:action make-product-p23
:parameters ()
:precondition (and (not (made p23))(started o13)(started o15)(started o19)(started o29)(started o34)(started o41)(started o47))
:effect (and (made p23))
)

(:action make-product-p24
:parameters ()
:precondition (and (not (made p24))(started o24)(started o46))
:effect (and (made p24))
)

(:action make-product-p25
:parameters ()
:precondition (and (not (made p25))(started o10)(started o13)(started o14)(started o16)(started o22)(started o37)(started o40)(started o42))
:effect (and (made p25))
)

(:action make-product-p26
:parameters ()
:precondition (and (not (made p26))(started o22)(started o28)(started o43)(started o50))
:effect (and (made p26))
)

(:action make-product-p27
:parameters ()
:precondition (and (not (made p27))(started o34)(started o36)(started o38)(started o49))
:effect (and (made p27))
)

(:action make-product-p28
:parameters ()
:precondition (and (not (made p28))(started o12)(started o13)(started o15)(started o29)(started o32)(started o45))
:effect (and (made p28))
)

(:action make-product-p29
:parameters ()
:precondition (and (not (made p29))(started o41))
:effect (and (made p29))
)

(:action make-product-p30
:parameters ()
:precondition (and (not (made p30))(started o16)(started o25)(started o36)(started o43))
:effect (and (made p30))
)

(:action make-product-p31
:parameters ()
:precondition (and (not (made p31))(started o15)(started o20)(started o50))
:effect (and (made p31))
)

(:action make-product-p32
:parameters ()
:precondition (and (not (made p32))(started o12)(started o15)(started o33)(started o38))
:effect (and (made p32))
)

(:action make-product-p33
:parameters ()
:precondition (and (not (made p33))(started o10)(started o42))
:effect (and (made p33))
)

(:action make-product-p34
:parameters ()
:precondition (and (not (made p34))(started o3)(started o8)(started o10)(started o19)(started o25)(started o33)(started o45))
:effect (and (made p34))
)

(:action make-product-p35
:parameters ()
:precondition (and (not (made p35))(started o11)(started o18)(started o26))
:effect (and (made p35))
)

(:action make-product-p36
:parameters ()
:precondition (and (not (made p36))(started o1)(started o21)(started o36)(started o47))
:effect (and (made p36))
)

(:action make-product-p37
:parameters ()
:precondition (and (not (made p37))(started o44))
:effect (and (made p37))
)

(:action make-product-p38
:parameters ()
:precondition (and (not (made p38))(started o3)(started o4)(started o11)(started o22)(started o37))
:effect (and (made p38))
)

(:action make-product-p39
:parameters ()
:precondition (and (not (made p39))(started o1)(started o16)(started o19)(started o33)(started o34))
:effect (and (made p39))
)

(:action make-product-p40
:parameters ()
:precondition (and (not (made p40))(started o25)(started o27)(started o42)(started o50))
:effect (and (made p40))
)

(:action make-product-p41
:parameters ()
:precondition (and (not (made p41))(started o24)(started o29)(started o40)(started o44)(started o46))
:effect (and (made p41))
)

(:action make-product-p42
:parameters ()
:precondition (and (not (made p42))(started o9)(started o17)(started o20)(started o40))
:effect (and (made p42))
)

(:action make-product-p43
:parameters ()
:precondition (and (not (made p43))(started o1)(started o19)(started o20))
:effect (and (made p43))
)

(:action make-product-p44
:parameters ()
:precondition (and (not (made p44))(started o9)(started o24)(started o29)(started o47)(started o50))
:effect (and (made p44))
)

(:action make-product-p45
:parameters ()
:precondition (and (not (made p45))(started o1)(started o19)(started o43)(started o47))
:effect (and (made p45))
)

(:action make-product-p46
:parameters ()
:precondition (and (not (made p46))(started o4)(started o17)(started o42))
:effect (and (made p46))
)

(:action make-product-p47
:parameters ()
:precondition (and (not (made p47))(started o19)(started o27)(started o34)(started o41)(started o47)(started o49))
:effect (and (made p47))
)

(:action make-product-p48
:parameters ()
:precondition (and (not (made p48))(started o2)(started o8)(started o11)(started o26))
:effect (and (made p48))
)

(:action make-product-p49
:parameters ()
:precondition (and (not (made p49))(started o21))
:effect (and (made p49))
)

(:action make-product-p50
:parameters ()
:precondition (and (not (made p50))(started o1)(started o9)(started o15)(started o28)(started o34)(started o35)(started o36)(started o46)(started o47))
:effect (and (made p50))
)

(:action ship-order-o1
:parameters (?avail ?new-avail - count)
:precondition (and (started o1)(made p8)(made p36)(made p39)(made p43)(made p45)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o1))(shipped o1)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o2
:parameters (?avail ?new-avail - count)
:precondition (and (started o2)(made p4)(made p9)(made p48)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o2))(shipped o2)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o3
:parameters (?avail ?new-avail - count)
:precondition (and (started o3)(made p11)(made p15)(made p18)(made p34)(made p38)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o3))(shipped o3)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o4
:parameters (?avail ?new-avail - count)
:precondition (and (started o4)(made p9)(made p15)(made p17)(made p18)(made p19)(made p38)(made p46)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o4))(shipped o4)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o5
:parameters (?avail ?new-avail - count)
:precondition (and (started o5)(made p6)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o5))(shipped o5)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o6
:parameters (?avail ?new-avail - count)
:precondition (and (started o6)(made p1)(made p10)(made p16)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o6))(shipped o6)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o7
:parameters (?avail ?new-avail - count)
:precondition (and (started o7)(made p5)(made p13)(made p17)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o7))(shipped o7)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o8
:parameters (?avail ?new-avail - count)
:precondition (and (started o8)(made p4)(made p10)(made p15)(made p34)(made p48)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o8))(shipped o8)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o9
:parameters (?avail ?new-avail - count)
:precondition (and (started o9)(made p9)(made p18)(made p22)(made p42)(made p44)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o9))(shipped o9)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o10
:parameters (?avail ?new-avail - count)
:precondition (and (started o10)(made p9)(made p17)(made p25)(made p33)(made p34)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o10))(shipped o10)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o11
:parameters (?avail ?new-avail - count)
:precondition (and (started o11)(made p5)(made p35)(made p38)(made p48)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o11))(shipped o11)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o12
:parameters (?avail ?new-avail - count)
:precondition (and (started o12)(made p12)(made p28)(made p32)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o12))(shipped o12)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o13
:parameters (?avail ?new-avail - count)
:precondition (and (started o13)(made p7)(made p8)(made p16)(made p23)(made p25)(made p28)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o13))(shipped o13)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o14
:parameters (?avail ?new-avail - count)
:precondition (and (started o14)(made p9)(made p17)(made p18)(made p22)(made p25)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o14))(shipped o14)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o15
:parameters (?avail ?new-avail - count)
:precondition (and (started o15)(made p3)(made p12)(made p23)(made p28)(made p31)(made p32)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o15))(shipped o15)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o16
:parameters (?avail ?new-avail - count)
:precondition (and (started o16)(made p9)(made p25)(made p30)(made p39)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o16))(shipped o16)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o17
:parameters (?avail ?new-avail - count)
:precondition (and (started o17)(made p9)(made p18)(made p42)(made p46)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o17))(shipped o17)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o18
:parameters (?avail ?new-avail - count)
:precondition (and (started o18)(made p11)(made p15)(made p35)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o18))(shipped o18)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o19
:parameters (?avail ?new-avail - count)
:precondition (and (started o19)(made p20)(made p23)(made p34)(made p39)(made p43)(made p45)(made p47)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o19))(shipped o19)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o20
:parameters (?avail ?new-avail - count)
:precondition (and (started o20)(made p4)(made p17)(made p31)(made p42)(made p43)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o20))(shipped o20)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o21
:parameters (?avail ?new-avail - count)
:precondition (and (started o21)(made p36)(made p49)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o21))(shipped o21)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o22
:parameters (?avail ?new-avail - count)
:precondition (and (started o22)(made p7)(made p17)(made p25)(made p26)(made p38)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o22))(shipped o22)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o23
:parameters (?avail ?new-avail - count)
:precondition (and (started o23)(made p1)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o23))(shipped o23)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o24
:parameters (?avail ?new-avail - count)
:precondition (and (started o24)(made p24)(made p41)(made p44)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o24))(shipped o24)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o25
:parameters (?avail ?new-avail - count)
:precondition (and (started o25)(made p1)(made p10)(made p17)(made p18)(made p21)(made p30)(made p34)(made p40)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o25))(shipped o25)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o26
:parameters (?avail ?new-avail - count)
:precondition (and (started o26)(made p9)(made p17)(made p19)(made p22)(made p35)(made p48)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o26))(shipped o26)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o27
:parameters (?avail ?new-avail - count)
:precondition (and (started o27)(made p11)(made p19)(made p40)(made p47)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o27))(shipped o27)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o28
:parameters (?avail ?new-avail - count)
:precondition (and (started o28)(made p2)(made p6)(made p12)(made p26)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o28))(shipped o28)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o29
:parameters (?avail ?new-avail - count)
:precondition (and (started o29)(made p7)(made p12)(made p16)(made p23)(made p28)(made p41)(made p44)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o29))(shipped o29)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o30
:parameters (?avail ?new-avail - count)
:precondition (and (started o30)(made p21)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o30))(shipped o30)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o31
:parameters (?avail ?new-avail - count)
:precondition (and (started o31)(made p14)(made p20)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o31))(shipped o31)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o32
:parameters (?avail ?new-avail - count)
:precondition (and (started o32)(made p2)(made p3)(made p8)(made p28)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o32))(shipped o32)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o33
:parameters (?avail ?new-avail - count)
:precondition (and (started o33)(made p14)(made p16)(made p32)(made p34)(made p39)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o33))(shipped o33)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o34
:parameters (?avail ?new-avail - count)
:precondition (and (started o34)(made p2)(made p3)(made p7)(made p23)(made p27)(made p39)(made p47)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o34))(shipped o34)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o35
:parameters (?avail ?new-avail - count)
:precondition (and (started o35)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o35))(shipped o35)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o36
:parameters (?avail ?new-avail - count)
:precondition (and (started o36)(made p6)(made p14)(made p27)(made p30)(made p36)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o36))(shipped o36)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o37
:parameters (?avail ?new-avail - count)
:precondition (and (started o37)(made p5)(made p9)(made p15)(made p25)(made p38)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o37))(shipped o37)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o38
:parameters (?avail ?new-avail - count)
:precondition (and (started o38)(made p27)(made p32)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o38))(shipped o38)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o39
:parameters (?avail ?new-avail - count)
:precondition (and (started o39)(made p4)(made p11)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o39))(shipped o39)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o40
:parameters (?avail ?new-avail - count)
:precondition (and (started o40)(made p17)(made p20)(made p22)(made p25)(made p41)(made p42)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o40))(shipped o40)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o41
:parameters (?avail ?new-avail - count)
:precondition (and (started o41)(made p12)(made p23)(made p29)(made p47)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o41))(shipped o41)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o42
:parameters (?avail ?new-avail - count)
:precondition (and (started o42)(made p1)(made p19)(made p25)(made p33)(made p40)(made p46)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o42))(shipped o42)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o43
:parameters (?avail ?new-avail - count)
:precondition (and (started o43)(made p3)(made p16)(made p26)(made p30)(made p45)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o43))(shipped o43)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o44
:parameters (?avail ?new-avail - count)
:precondition (and (started o44)(made p3)(made p37)(made p41)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o44))(shipped o44)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o45
:parameters (?avail ?new-avail - count)
:precondition (and (started o45)(made p7)(made p13)(made p28)(made p34)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o45))(shipped o45)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o46
:parameters (?avail ?new-avail - count)
:precondition (and (started o46)(made p9)(made p10)(made p24)(made p41)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o46))(shipped o46)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o47
:parameters (?avail ?new-avail - count)
:precondition (and (started o47)(made p6)(made p12)(made p23)(made p36)(made p44)(made p45)(made p47)(made p50)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o47))(shipped o47)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o48
:parameters (?avail ?new-avail - count)
:precondition (and (started o48)(made p7)(made p18)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o48))(shipped o48)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o49
:parameters (?avail ?new-avail - count)
:precondition (and (started o49)(made p12)(made p14)(made p27)(made p47)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o49))(shipped o49)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

(:action ship-order-o50
:parameters (?avail ?new-avail - count)
:precondition (and (started o50)(made p20)(made p26)(made p31)(made p40)(made p44)(stacks-avail ?avail)(next-count ?avail ?new-avail))
:effect (and (not (started o50))(shipped o50)(not (stacks-avail ?avail))(stacks-avail ?new-avail)))

)

