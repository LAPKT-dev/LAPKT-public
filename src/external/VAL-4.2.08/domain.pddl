(define (domain yandi)
(:requirements :TYPING  :ACTION-COSTS
)
(:types location
digger - vehicle
block pile - mineral
vehicle mineral - physobj )
(:constants

	L_4_1  - digger 
	L_6_1  - digger 
	node_7_3  - location 
	node_1_6  - location 
	node_3_7  - location 
	node_2_5  - location 
	node_8_5  - location 
	node_6_7  - location 
	node_10_7  - location 
	node_7_6  - location 
	node_1_1  - location 
	node_3_2  - location 
	node_2_6  - location 
	node_8_2  - location 
	node_4_5  - location 
	node_9_3  - location 
	node_7_5  - location 
	node_3_1  - location 
	node_2_1  - location 
	node_9_4  - location 
	node_10_3  - location 
	node_7_2  - location 
	node_1_5  - location 
	node_3_6  - location 
	node_2_2  - location 
	node_8_6  - location 
	node_4_1  - location 
	node_9_7  - location 
	node_6_4  - location 
	node_10_4  - location 
	node_7_1  - location 
	node_3_5  - location 
	node_2_7  - location 
	node_8_3  - location 
	node_4_6  - location 
	node_9_2  - location 
	node_6_1  - location 
	node_7_4  - location 
	node_1_3  - location 
	node_6_2  - location 
	node_1_4  - location 
	node_2_3  - location 
	node_8_7  - location 
	node_4_2  - location 
	node_9_6  - location 
	node_6_5  - location 
	node_5_3  - location 
	node_10_5  - location 
	node_1_7  - location 
	node_3_4  - location 
	node_2_4  - location 
	node_8_4  - location 
	node_4_7  - location 
	node_9_1  - location 
	node_6_6  - location 
	node_10_6  - location 
	node_7_7  - location 
	node_1_2  - location 
	node_3_3  - location 
	node_8_1  - location 
	node_4_4  - location 
	node_6_3  - location 
	node_10_1  - location 
	node_4_3  - location 
	node_9_5  - location 
	node_10_2  - location 
	block-node_3_7  - block 
	block-node_3_6  - block 
	block-node_3_5  - block 
	block-node_4_6  - block 
	block-node_3_4  - block 
	block-node_4_7  - block 
	build - pile 

)
(:predicates (conn ?from ?to - location)
(at ?x - physobj ?loc - location)

	(reset-tonnage)
	(not-reset-tonnage)
	(update-tonnage)
	(not-update-tonnage)
	(free ?d - digger)
	(clear ?loc - location)
		(digged-block-node_4_7-build-0) 
		(digged-block-node_4_6-build-0) 
		(digged-block-node_3_6-build-0) 
		(digged-block-node_3_7-build-0) 
	(partially-digged-block-node_3_4-build-0) 
		(digged-block-node_3_5-build-0) 
	(partially-digged-block-node_3_4-build-1) 

)



(:functions

(total-cost) - number
	(tonnage ?m - mineral) - number
	(tonnage-extracted ?m - mineral) - number
	(digger-capacity ?d - digger) - number
	(digger-remaining-time ?d - digger) - number
	(grade-tonnage ?b - pile) - number
	(grade ?m - mineral) - number
)


(:action move 
:parameters (?d - digger ?curpos ?nextpos - location) 
:precondition (and (>= (digger-remaining-time ?d) 0.25) (at ?d ?curpos) (conn ?curpos ?nextpos) (clear ?nextpos) (free ?d) ) 
:effect (and  
	     (at ?d ?nextpos) (not (at ?d ?curpos))  
           (not (clear ?nextpos)) (clear ?curpos) 
           (not (free ?d)) 
           (increase (total-cost) 0) 
     	     (decrease (digger-remaining-time ?d) 0.25)  
	 ) 
) 
(:action send-instructions
:parameters ( )
:precondition (and  
		(>= (tonnage build) 0.00) 
		(not-update-tonnage) (not-reset-tonnage) 
	)
:effect (and 
		(increase (total-cost) 1) 
		(free L_4_1)  
		(free L_6_1)  
	)
)

(:action check-grade-and-load-trains
:parameters ( )
:precondition (and  
		(not-update-tonnage) (not-reset-tonnage) 
		(>= (tonnage build) 0.00) 
		(<= (tonnage build) 20000.00) 
		(>= (grade-tonnage build) (* (- 280000.00 (tonnage build) ) 0.55) ) 
		(<= (grade-tonnage build) (* (- 280000.00 (tonnage build) ) 0.65) ) 
	)
:effect (and 
		(assign (tonnage build) 280000.00) 
		(assign (tonnage-extracted build) 0) 
		(assign (grade-tonnage build) 0.00) 
		(increase (total-cost) 0) 
	)
)

(:action dig-block-node_4_7
:parameters (?d - digger  ?curpos - location)
:precondition (and  
		(= (tonnage-extracted block-node_4_7) 0 ) 
		(> (tonnage block-node_4_7) 0 ) 
		(>= (tonnage build) (tonnage block-node_4_7) ) ;block fits in build  
		(>= (digger-remaining-time ?d) (/ (tonnage block-node_4_7) (digger-capacity ?d)) ) ; digger still have time 
		(at block-node_4_7 ?curpos) 
		(at ?d ?curpos) 
		(free ?d) 
	)
:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ (tonnage block-node_4_7) (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) (tonnage block-node_4_7) ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* (tonnage block-node_4_7) (grade block-node_4_7)) ) ;keep track of grade 
		(assign   (tonnage-extracted block-node_4_7) (tonnage block-node_4_7) ) ;consume tons of block 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(digged-block-node_4_7-build-0) 
	)
)

(:action dig-block-node_4_6
:parameters (?d - digger  ?curpos - location)
:precondition (and  
		(= (tonnage-extracted block-node_4_6) 0 ) 
		(> (tonnage block-node_4_6) 0 ) 
		(>= (tonnage build) (tonnage block-node_4_6) ) ;block fits in build  
		(>= (digger-remaining-time ?d) (/ (tonnage block-node_4_6) (digger-capacity ?d)) ) ; digger still have time 
		(at block-node_4_6 ?curpos) 
		(at ?d ?curpos) 
		(free ?d) 
	)
:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ (tonnage block-node_4_6) (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) (tonnage block-node_4_6) ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* (tonnage block-node_4_6) (grade block-node_4_6)) ) ;keep track of grade 
		(assign   (tonnage-extracted block-node_4_6) (tonnage block-node_4_6) ) ;consume tons of block 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(digged-block-node_4_6-build-0) 
	)
)

(:action dig-block-node_3_6
:parameters (?d - digger  ?curpos - location)
:precondition (and  
		(= (tonnage-extracted block-node_3_6) 0 ) 
		(> (tonnage block-node_3_6) 0 ) 
		(>= (tonnage build) (tonnage block-node_3_6) ) ;block fits in build  
		(>= (digger-remaining-time ?d) (/ (tonnage block-node_3_6) (digger-capacity ?d)) ) ; digger still have time 
		(at block-node_3_6 ?curpos) 
		(at ?d ?curpos) 
		(free ?d) 
	)
:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ (tonnage block-node_3_6) (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) (tonnage block-node_3_6) ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* (tonnage block-node_3_6) (grade block-node_3_6)) ) ;keep track of grade 
		(assign   (tonnage-extracted block-node_3_6) (tonnage block-node_3_6) ) ;consume tons of block 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(digged-block-node_3_6-build-0) 
	)
)

(:action dig-block-node_3_7
:parameters (?d - digger  ?curpos - location)
:precondition (and  
		(= (tonnage-extracted block-node_3_7) 0 ) 
		(> (tonnage block-node_3_7) 0 ) 
		(>= (tonnage build) (tonnage block-node_3_7) ) ;block fits in build  
		(>= (digger-remaining-time ?d) (/ (tonnage block-node_3_7) (digger-capacity ?d)) ) ; digger still have time 
		(at block-node_3_7 ?curpos) 
		(at ?d ?curpos) 
		(free ?d) 
	)
:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ (tonnage block-node_3_7) (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) (tonnage block-node_3_7) ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* (tonnage block-node_3_7) (grade block-node_3_7)) ) ;keep track of grade 
		(assign   (tonnage-extracted block-node_3_7) (tonnage block-node_3_7) ) ;consume tons of block 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(digged-block-node_3_7-build-0) 
	)
)

(:action partially-dig-block-node_3_4-build-0
	:parameters (?d - digger  ?curpos - location)
	:precondition (and  
		(free ?d) 
		(= (tonnage-extracted block-node_3_4) 0 ) 
		(> (tonnage block-node_3_4) 0 ) 
		(>= (tonnage build) 10000.00) 
		(>= (digger-remaining-time ?d) (/  10000.00 (digger-capacity ?d)) ) 
		(at block-node_3_4 ?curpos) 
		(at ?d ?curpos) 
	)
	:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ 10000.00 (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) 10000.00 ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* 10000.00 (grade block-node_3_4)) ) ;keep track of grade 
		(assign (tonnage-extracted block-node_3_4) 10000.00) 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(partially-digged-block-node_3_4-build-0) 
	)
)

(:action dig-block-node_3_5
:parameters (?d - digger  ?curpos - location)
:precondition (and  
		(= (tonnage-extracted block-node_3_5) 0 ) 
		(> (tonnage block-node_3_5) 0 ) 
		(>= (tonnage build) (tonnage block-node_3_5) ) ;block fits in build  
		(>= (digger-remaining-time ?d) (/ (tonnage block-node_3_5) (digger-capacity ?d)) ) ; digger still have time 
		(at block-node_3_5 ?curpos) 
		(at ?d ?curpos) 
		(free ?d) 
	)
:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ (tonnage block-node_3_5) (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) (tonnage block-node_3_5) ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* (tonnage block-node_3_5) (grade block-node_3_5)) ) ;keep track of grade 
		(assign   (tonnage-extracted block-node_3_5) (tonnage block-node_3_5) ) ;consume tons of block 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(digged-block-node_3_5-build-0) 
	)
)

(:action partially-dig-block-node_3_4-build-1
	:parameters (?d - digger  ?curpos - location)
	:precondition (and  
		(digged-block-node_4_7-build-0) 
		(digged-block-node_4_6-build-0) 
		(digged-block-node_3_6-build-0) 
		(digged-block-node_3_7-build-0) 
		(partially-digged-block-node_3_4-build-0) 
		(digged-block-node_3_5-build-0) 
 
		(free ?d) 
		(= (tonnage-extracted block-node_3_4) 0 ) 
		(> (tonnage block-node_3_4) 0 ) 
		(>= (tonnage build) 40000.00) 
		(>= (digger-remaining-time ?d) (/  40000.00 (digger-capacity ?d)) ) 
		(at block-node_3_4 ?curpos) 
		(at ?d ?curpos) 
	)
	:effect (and 
		(increase (total-cost) 0) 
		(decrease (digger-remaining-time ?d) (/ 40000.00 (digger-capacity ?d)) ) ; consume time digger 
		(decrease (tonnage build) 40000.00 ) ;consume tonnagge in build 
		(increase (grade-tonnage build) (* 40000.00 (grade block-node_3_4)) ) ;keep track of grade 
		(assign (tonnage-extracted block-node_3_4) 40000.00) 
		(not (free ?d)) 
		(update-tonnage) 
		(not (not-update-tonnage)) 
		(partially-digged-block-node_3_4-build-1) 
	)
)

(:action update-tonnes
:parameters ( )
:precondition (and  
		(update-tonnage)
	)
:effect (and 
		(reset-tonnage)
		(not (not-reset-tonnage)) 
		(not (update-tonnage))
	(not-update-tonnage) 
		(increase (total-cost) 0) 
		(forall (?m - mineral ) (and (decrease (tonnage ?m) (tonnage-extracted ?m)) ) ) 
	)
)

(:action reset-extracted
:parameters ()
:precondition (and  
		(not-update-tonnage)
		(reset-tonnage)
	)
:effect (and 
		(not (reset-tonnage) )
		(not-reset-tonnage) 
		(increase (total-cost) 0) 
		(forall (?m - mineral) (and (assign (tonnage-extracted ?m) 0)) ) 
	)
)



)



