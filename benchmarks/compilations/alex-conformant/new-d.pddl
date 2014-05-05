(define (domain DOORS)
(:requirements :negative-preconditions :conditional-effects)
;; Tags meaning: 
;; s3: _-AT_P1-1_-AT_P1-3_-AT_P2-1_-AT_P2-2_-AT_P2-3_-AT_P3-1_-AT_P3-2_-AT_P3-3_OPENED_P3-3_OPENED_P3-2_OPENED_P3-1_OPENED_P1-3_OPENED_P1-2_OPENED_P1-1_AT_P1-2_OPENED_P2-2_-OPENED_P2-1_-OPENED_P2-3
;; s2: _-AT_P1-1_-AT_P1-3_-AT_P2-1_-AT_P2-2_-AT_P2-3_-AT_P3-1_-AT_P3-2_-AT_P3-3_OPENED_P3-3_OPENED_P3-2_OPENED_P3-1_OPENED_P1-3_OPENED_P1-2_OPENED_P1-1_AT_P1-2_-OPENED_P2-2_OPENED_P2-1_-OPENED_P2-3
;; s1: _-AT_P1-1_-AT_P1-3_-AT_P2-1_-AT_P2-2_-AT_P2-3_-AT_P3-1_-AT_P3-2_-AT_P3-3_OPENED_P3-3_OPENED_P3-2_OPENED_P3-1_OPENED_P1-3_OPENED_P1-2_OPENED_P1-1_AT_P1-2_-OPENED_P2-2_-OPENED_P2-1_OPENED_P2-3
	(:predicates
(kdo-actions)
(kdo-axiom1)
(alev_0)
(alev_1)
(alev_2)
(alev_3)
(alev_4)
(kAT_P1-1_s1)
(kAT_P1-2_s1)
(amaybe_s1)
(xAT_P1-2)
(xAT_P1-1)
(kAT_P1-1_s2)
(kAT_P1-2_s2)
(amaybe_s2)
(kAT_P1-1_s3)
(kAT_P1-2_s3)
(amaybe_s3)
(kAT_P1-3_s1)
(xAT_P1-3)
(kAT_P1-3_s2)
(kAT_P1-3_s3)
(kAT_P2-2_s1)
(xAT_P2-2)
(kAT_P2-2_s2)
(kAT_P2-2_s3)
(xOPENED_P2-2)
(kAT_P2-3_s1)
(xAT_P2-3)
(kAT_P2-3_s2)
(kAT_P2-3_s3)
(xOPENED_P2-3)
(kAT_P2-1_s1)
(xAT_P2-1)
(kAT_P2-1_s2)
(kAT_P2-1_s3)
(xOPENED_P2-1)
(kAT_P3-2_s1)
(xAT_P3-2)
(kAT_P3-2_s2)
(kAT_P3-2_s3)
(kAT_P3-3_s1)
(xAT_P3-3)
(kAT_P3-3_s2)
(kAT_P3-3_s3)
(kAT_P3-1_s1)
(xAT_P3-1)
(kAT_P3-1_s2)
(kAT_P3-1_s3)
(alev_1_s1)
(x-OPENED_P2-3_s1)
(xOPENED_P2-2_s1)
(xOPENED_P2-1_s1)
(alev_1_s2)
(xOPENED_P2-3_s2)
(xOPENED_P2-2_s2)
(x-OPENED_P2-1_s2)
(alev_1_s3)
(xOPENED_P2-3_s3)
(x-OPENED_P2-2_s3)
(xOPENED_P2-1_s3)
(alev_2_s1)
(alev_2_s2)
(alev_2_s3)
(alev_3_s1)
(alev_3_s2)
(alev_3_s3)
(alev_4_s1)
(alev_4_s2)
(alev_4_s3)
(x-OPENED_P2-2)
(x-OPENED_P2-1)
(x-OPENED_P2-3)
)
(:action SENSE-DOOR_P2-2_P2-1__l0
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action achieve__l3
:parameters ()
:precondition (and (alev_3) (xAT_P3-2) (kdo-actions))

:effect (and  (alev_2) (not(kdo-actions)) (kdo-axiom1) (not(alev_3))
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (alev_3_s1) (and (amaybe_s1) (not(xOPENED_P2-2)) (not(xOPENED_P2-1)) (not(x-OPENED_P2-3)) (not(x-OPENED_P2-3_s1)) (not(xOPENED_P2-2_s1)) (not(xOPENED_P2-1_s1)) (not(alev_3_s1))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_3_s2) (and (amaybe_s2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s2)) (not(xOPENED_P2-2_s2)) (not(x-OPENED_P2-1_s2)) (not(alev_3_s2))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_3_s3) (and (amaybe_s3) (not(x-OPENED_P2-2)) (not(xOPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s3)) (not(x-OPENED_P2-2_s3)) (not(xOPENED_P2-1_s3)) (not(alev_3_s3))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when(and (kAT_P1-1_s1) (alev_3_s1))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s1)) (alev_3_s1))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s2) (alev_3_s2))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s2)) (alev_3_s2))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s3) (alev_3_s3))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s3)) (alev_3_s3))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-3_s1) (alev_3_s1))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s2) (alev_3_s2))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s3) (alev_3_s3))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s1) (alev_3_s1))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s2) (alev_3_s2))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s3) (alev_3_s3))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-2_s1) (alev_3_s1))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s1)) (alev_3_s1))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s2) (alev_3_s2))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s2)) (alev_3_s2))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s3) (alev_3_s3))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s3)) (alev_3_s3))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-3_s1) (alev_3_s1))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s2) (alev_3_s2))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s3) (alev_3_s3))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-2_s1)) (alev_3_s1))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s2)) (alev_3_s2))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s3)) (alev_3_s3))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-1_s1) (alev_3_s1))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s2) (alev_3_s2))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s3) (alev_3_s3))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s1) (alev_3_s1))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s2) (alev_3_s2))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s3) (alev_3_s3))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-3_s1)) (alev_3_s1))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s2)) (alev_3_s2))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s3)) (alev_3_s3))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-3_s1) (alev_3_s1))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s2) (alev_3_s2))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s3) (alev_3_s3))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-2_s1)) (alev_3_s1))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s2)) (alev_3_s2))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s3)) (alev_3_s3))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-1_s1) (alev_3_s1))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s2) (alev_3_s2))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s3) (alev_3_s3))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-3_s1)) (alev_3_s1))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s2)) (alev_3_s2))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s3)) (alev_3_s3))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s1)) (alev_3_s1))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s2)) (alev_3_s2))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s3)) (alev_3_s3))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s1)) (alev_3_s1))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s2)) (alev_3_s2))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s3)) (alev_3_s3))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s1)) (alev_3_s1))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s2)) (alev_3_s2))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s3)) (alev_3_s3))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

))
(:action SENSE-DOOR_P3-1_P2-1__l3
:parameters ()
:precondition (and (xAT_P3-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-1_P2-1__l2
:parameters ()
:precondition (and (xAT_P3-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-1_P2-1__l1
:parameters ()
:precondition (and (xAT_P3-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-1_P2-1__l0
:parameters ()
:precondition (and (xAT_P3-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action achieve__l2
:parameters ()
:precondition (and (alev_2) (xAT_P3-2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (alev_2_s1) (and (amaybe_s1) (not(xOPENED_P2-2)) (not(xOPENED_P2-1)) (not(x-OPENED_P2-3)) (not(x-OPENED_P2-3_s1)) (not(xOPENED_P2-2_s1)) (not(xOPENED_P2-1_s1)) (not(alev_2_s1))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_2_s2) (and (amaybe_s2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s2)) (not(xOPENED_P2-2_s2)) (not(x-OPENED_P2-1_s2)) (not(alev_2_s2))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_2_s3) (and (amaybe_s3) (not(x-OPENED_P2-2)) (not(xOPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s3)) (not(x-OPENED_P2-2_s3)) (not(xOPENED_P2-1_s3)) (not(alev_2_s3))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when(and (kAT_P1-1_s1) (alev_2_s1))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s1)) (alev_2_s1))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s2) (alev_2_s2))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s2)) (alev_2_s2))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s3) (alev_2_s3))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s3)) (alev_2_s3))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-3_s1) (alev_2_s1))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s2) (alev_2_s2))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s3) (alev_2_s3))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s1) (alev_2_s1))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s2) (alev_2_s2))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s3) (alev_2_s3))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-2_s1) (alev_2_s1))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s1)) (alev_2_s1))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s2) (alev_2_s2))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s2)) (alev_2_s2))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s3) (alev_2_s3))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s3)) (alev_2_s3))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-3_s1) (alev_2_s1))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s2) (alev_2_s2))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s3) (alev_2_s3))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-2_s1)) (alev_2_s1))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s2)) (alev_2_s2))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s3)) (alev_2_s3))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-1_s1) (alev_2_s1))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s2) (alev_2_s2))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s3) (alev_2_s3))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s1) (alev_2_s1))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s2) (alev_2_s2))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s3) (alev_2_s3))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-3_s1)) (alev_2_s1))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s2)) (alev_2_s2))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s3)) (alev_2_s3))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-3_s1) (alev_2_s1))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s2) (alev_2_s2))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s3) (alev_2_s3))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-2_s1)) (alev_2_s1))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s2)) (alev_2_s2))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s3)) (alev_2_s3))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-1_s1) (alev_2_s1))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s2) (alev_2_s2))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s3) (alev_2_s3))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-3_s1)) (alev_2_s1))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s2)) (alev_2_s2))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s3)) (alev_2_s3))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s1)) (alev_2_s1))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s2)) (alev_2_s2))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s3)) (alev_2_s3))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s1)) (alev_2_s1))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s2)) (alev_2_s2))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s3)) (alev_2_s3))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s1)) (alev_2_s1))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s2)) (alev_2_s2))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s3)) (alev_2_s3))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

))
(:action achieve__l1
:parameters ()
:precondition (and (alev_1) (xAT_P3-2) (kdo-actions))

:effect (and  (not(alev_1)) (not(kdo-actions)) (kdo-axiom1) (alev_0)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (alev_1_s1) (and (amaybe_s1) (not(xOPENED_P2-2)) (not(xOPENED_P2-1)) (not(x-OPENED_P2-3)) (not(alev_1_s1)) (not(x-OPENED_P2-3_s1)) (not(xOPENED_P2-2_s1)) (not(xOPENED_P2-1_s1))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_1_s2) (and (amaybe_s2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-1)) (not(xOPENED_P2-3)) (not(alev_1_s2)) (not(xOPENED_P2-3_s2)) (not(xOPENED_P2-2_s2)) (not(x-OPENED_P2-1_s2))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_1_s3) (and (amaybe_s3) (not(x-OPENED_P2-2)) (not(xOPENED_P2-1)) (not(xOPENED_P2-3)) (not(alev_1_s3)) (not(xOPENED_P2-3_s3)) (not(x-OPENED_P2-2_s3)) (not(xOPENED_P2-1_s3))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when(and (kAT_P1-1_s1) (alev_1_s1))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s1)) (alev_1_s1))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s2) (alev_1_s2))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s2)) (alev_1_s2))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s3) (alev_1_s3))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s3)) (alev_1_s3))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-3_s1) (alev_1_s1))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s2) (alev_1_s2))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s3) (alev_1_s3))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s1) (alev_1_s1))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s2) (alev_1_s2))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s3) (alev_1_s3))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-2_s1) (alev_1_s1))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s1)) (alev_1_s1))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s2) (alev_1_s2))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s2)) (alev_1_s2))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s3) (alev_1_s3))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s3)) (alev_1_s3))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-3_s1) (alev_1_s1))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s2) (alev_1_s2))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s3) (alev_1_s3))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-2_s1)) (alev_1_s1))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s2)) (alev_1_s2))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s3)) (alev_1_s3))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-1_s1) (alev_1_s1))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s2) (alev_1_s2))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s3) (alev_1_s3))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s1) (alev_1_s1))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s2) (alev_1_s2))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s3) (alev_1_s3))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-3_s1)) (alev_1_s1))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s2)) (alev_1_s2))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s3)) (alev_1_s3))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-3_s1) (alev_1_s1))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s2) (alev_1_s2))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s3) (alev_1_s3))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-2_s1)) (alev_1_s1))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s2)) (alev_1_s2))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s3)) (alev_1_s3))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-1_s1) (alev_1_s1))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s2) (alev_1_s2))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s3) (alev_1_s3))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-3_s1)) (alev_1_s1))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s2)) (alev_1_s2))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s3)) (alev_1_s3))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s1)) (alev_1_s1))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s2)) (alev_1_s2))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s3)) (alev_1_s3))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s1)) (alev_1_s1))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s2)) (alev_1_s2))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s3)) (alev_1_s3))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s1)) (alev_1_s1))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s2)) (alev_1_s2))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s3)) (alev_1_s3))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

))
(:action SENSE-DOOR_P3-3_P2-3__l3
:parameters ()
:precondition (and (xAT_P3-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-1_P2-2__l3
:parameters ()
:precondition (and (xAT_P2-1) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-1_P2-2__l2
:parameters ()
:precondition (and (xAT_P2-1) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-1_P2-2__l1
:parameters ()
:precondition (and (xAT_P2-1) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-1_P2-2__l0
:parameters ()
:precondition (and (xAT_P2-1) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-3_P2-3__l2
:parameters ()
:precondition (and (xAT_P3-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-3_P2-2__l3
:parameters ()
:precondition (and (xAT_P2-3) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-3_P2-2__l2
:parameters ()
:precondition (and (xAT_P2-3) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-3_P2-2__l1
:parameters ()
:precondition (and (xAT_P2-3) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-3_P2-3__l3
:parameters ()
:precondition (and (xAT_P1-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-3_P2-3__l2
:parameters ()
:precondition (and (xAT_P1-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-3_P2-3__l1
:parameters ()
:precondition (and (xAT_P1-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-3_P2-3__l0
:parameters ()
:precondition (and (xAT_P1-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-3_P2-2__l0
:parameters ()
:precondition (and (xAT_P2-3) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-3_P2-3__l1
:parameters ()
:precondition (and (xAT_P3-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-2_P2-2__l3
:parameters ()
:precondition (and (xAT_P3-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-2_P2-2__l2
:parameters ()
:precondition (and (xAT_P3-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-1_P2-1__l3
:parameters ()
:precondition (and (xAT_P1-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-1_P2-1__l2
:parameters ()
:precondition (and (xAT_P1-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-1_P2-1__l1
:parameters ()
:precondition (and (xAT_P1-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-1_P2-1__l0
:parameters ()
:precondition (and (xAT_P1-1) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-2_P2-2__l1
:parameters ()
:precondition (and (xAT_P3-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-2_P2-2__l0
:parameters ()
:precondition (and (xAT_P3-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P3-3_P2-3__l0
:parameters ()
:precondition (and (xAT_P3-3) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-2_P2-2__l3
:parameters ()
:precondition (and (xAT_P1-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-2_P2-2__l2
:parameters ()
:precondition (and (xAT_P1-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-2_P2-2__l1
:parameters ()
:precondition (and (xAT_P1-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P1-2_P2-2__l0
:parameters ()
:precondition (and (xAT_P1-2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-2)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s1) (and (alev_1_s1) (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action achieve__l4
:parameters ()
:precondition (and (alev_4) (xAT_P3-2) (kdo-actions))

:effect (and  (not(alev_4)) (not(kdo-actions)) (kdo-axiom1) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s) -> -m(s), And_{l undet} Xl/s. 

(when (alev_4_s1) (and (amaybe_s1) (not(xOPENED_P2-2)) (not(xOPENED_P2-1)) (not(x-OPENED_P2-3)) (not(x-OPENED_P2-3_s1)) (not(xOPENED_P2-2_s1)) (not(xOPENED_P2-1_s1)) (not(alev_4_s1))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_4_s2) (and (amaybe_s2) (not(xOPENED_P2-2)) (not(x-OPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s2)) (not(xOPENED_P2-2_s2)) (not(x-OPENED_P2-1_s2)) (not(alev_4_s2))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when (alev_4_s3) (and (amaybe_s3) (not(x-OPENED_P2-2)) (not(xOPENED_P2-1)) (not(xOPENED_P2-3)) (not(xOPENED_P2-3_s3)) (not(x-OPENED_P2-2_s3)) (not(xOPENED_P2-1_s3)) (not(alev_4_s3))));; at(s,k), -kl/s -> -xl/s, -xl. at(s,k) -> m(s), -at(s,k). 

(when(and (kAT_P1-1_s1) (alev_4_s1))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s1)) (alev_4_s1))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s2) (alev_4_s2))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s2)) (alev_4_s2))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-1_s3) (alev_4_s3))  (xAT_P1-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-2_s3)) (alev_4_s3))  (not(xAT_P1-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-3_s1) (alev_4_s1))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s2) (alev_4_s2))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-3_s3) (alev_4_s3))  (xAT_P1-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s1) (alev_4_s1))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s2) (alev_4_s2))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-2_s3) (alev_4_s3))  (xAT_P2-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P1-2_s1) (alev_4_s1))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s1)) (alev_4_s1))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s2) (alev_4_s2))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s2)) (alev_4_s2))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P1-2_s3) (alev_4_s3))  (xAT_P1-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P1-3_s3)) (alev_4_s3))  (not(xAT_P1-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-3_s1) (alev_4_s1))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s2) (alev_4_s2))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-3_s3) (alev_4_s3))  (xAT_P2-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-2_s1)) (alev_4_s1))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s2)) (alev_4_s2))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-2_s3)) (alev_4_s3))  (not(xAT_P2-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P2-1_s1) (alev_4_s1))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s2) (alev_4_s2))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P2-1_s3) (alev_4_s3))  (xAT_P2-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s1) (alev_4_s1))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s2) (alev_4_s2))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-2_s3) (alev_4_s3))  (xAT_P3-2));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P2-3_s1)) (alev_4_s1))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s2)) (alev_4_s2))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-3_s3)) (alev_4_s3))  (not(xAT_P2-3)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-3_s1) (alev_4_s1))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s2) (alev_4_s2))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-3_s3) (alev_4_s3))  (xAT_P3-3));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-2_s1)) (alev_4_s1))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s2)) (alev_4_s2))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-2_s3)) (alev_4_s3))  (not(xAT_P3-2)));; at(s,k), -kl/s -> -xl. 

(when(and (kAT_P3-1_s1) (alev_4_s1))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s2) (alev_4_s2))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (kAT_P3-1_s3) (alev_4_s3))  (xAT_P3-1));; at(s,k), kl/s -> xl. 

(when(and (not(kAT_P3-3_s1)) (alev_4_s1))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s2)) (alev_4_s2))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-3_s3)) (alev_4_s3))  (not(xAT_P3-3)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s1)) (alev_4_s1))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s2)) (alev_4_s2))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P1-1_s3)) (alev_4_s3))  (not(xAT_P1-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s1)) (alev_4_s1))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s2)) (alev_4_s2))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P2-1_s3)) (alev_4_s3))  (not(xAT_P2-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s1)) (alev_4_s1))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s2)) (alev_4_s2))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

(when(and (not(kAT_P3-1_s3)) (alev_4_s3))  (not(xAT_P3-1)));; at(s,k), -kl/s -> -xl. 

))
(:action SENSE-DOOR_P2-2_P2-3__l3
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_4_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-3__l2
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_3_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-3__l1
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s2) (and (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2) (alev_2_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-3__l0
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-3)) (not(x-OPENED_P2-3)) (alev_0) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_0)) (alev_1)
(when (amaybe_s2) (and (alev_1_s2) (not(amaybe_s2)) (xOPENED_P2-3_s2) (xOPENED_P2-2_s2) (x-OPENED_P2-1_s2)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (alev_1_s3) (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-1__l3
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_3)) (alev_4)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_4_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_4_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-1__l2
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1) (not(alev_2)) (alev_3)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_3_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_3_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action SENSE-DOOR_P2-2_P2-1__l1
:parameters ()
:precondition (and (xAT_P2-2) (not(xOPENED_P2-1)) (not(x-OPENED_P2-1)) (alev_1) (kdo-actions))

:effect (and  (not(alev_1)) (alev_2) (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(amaybe_s1)) (x-OPENED_P2-3_s1) (xOPENED_P2-2_s1) (xOPENED_P2-1_s1) (alev_2_s1)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

(when (amaybe_s3) (and (not(amaybe_s3)) (xOPENED_P2-3_s3) (x-OPENED_P2-2_s3) (xOPENED_P2-1_s3) (alev_2_s3)));; m(s), K-o/s -> -m(s), at(s,k+1), And_{l undet} Xl/s. 

))
(:action MOVE_P3-1_P3-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P3-1))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P3-2_s1) (xAT_P3-2) (not(kAT_P3-1_s1)) (not(xAT_P3-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P3-2) (kAT_P3-2_s2) (not(xAT_P3-1)) (not(kAT_P3-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P3-2) (kAT_P3-2_s3) (not(xAT_P3-1)) (not(kAT_P3-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-1_P2-1
:parameters ()
:precondition (and (xOPENED_P2-1) (xAT_P3-1) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-1_s1) (xAT_P2-1) (not(kAT_P3-1_s1)) (not(xAT_P3-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-1) (kAT_P2-1_s2) (not(xAT_P3-1)) (not(kAT_P3-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-1) (kAT_P2-1_s3) (not(xAT_P3-1)) (not(kAT_P3-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-1_P3-1
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-1))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P3-1_s1) (xAT_P3-1) (not(kAT_P2-1_s1)) (not(xAT_P2-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P3-1) (kAT_P3-1_s2) (not(xAT_P2-1)) (not(kAT_P2-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P3-1) (kAT_P3-1_s3) (not(xAT_P2-1)) (not(kAT_P2-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-1_P2-2
:parameters ()
:precondition (and (xOPENED_P2-2) (xAT_P2-1) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-2_s1) (xAT_P2-2) (not(kAT_P2-1_s1)) (not(xAT_P2-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-2) (kAT_P2-2_s2) (not(xAT_P2-1)) (not(kAT_P2-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-2) (kAT_P2-2_s3) (not(xAT_P2-1)) (not(kAT_P2-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-1_P1-1
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-1))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P1-1_s1) (xAT_P1-1) (not(kAT_P2-1_s1)) (not(xAT_P2-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P1-1) (kAT_P1-1_s2) (not(xAT_P2-1)) (not(kAT_P2-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P1-1) (kAT_P1-1_s3) (not(xAT_P2-1)) (not(kAT_P2-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-1_P2-1
:parameters ()
:precondition (and (xOPENED_P2-1) (xAT_P1-1) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-1_s1) (xAT_P2-1) (not(kAT_P1-1_s1)) (not(xAT_P1-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-1) (kAT_P2-1_s2) (not(xAT_P1-1)) (not(kAT_P1-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-1) (kAT_P2-1_s3) (not(xAT_P1-1)) (not(kAT_P1-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-1_P1-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P1-1))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (xAT_P1-2) (kAT_P1-2_s1) (not(kAT_P1-1_s1)) (not(xAT_P1-1))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P1-2) (kAT_P1-2_s2) (not(xAT_P1-1)) (not(kAT_P1-1_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P1-2) (kAT_P1-2_s3) (not(xAT_P1-1)) (not(kAT_P1-1_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-3_P3-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P3-3))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P3-2_s1) (xAT_P3-2) (not(kAT_P3-3_s1)) (not(xAT_P3-3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P3-2) (kAT_P3-2_s2) (not(xAT_P3-3)) (not(kAT_P3-3_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P3-2) (kAT_P3-2_s3) (not(xAT_P3-3)) (not(kAT_P3-3_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-3_P2-3
:parameters ()
:precondition (and (xOPENED_P2-3) (xAT_P3-3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-3_s1) (xAT_P2-3) (not(kAT_P3-3_s1)) (not(xAT_P3-3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-3) (kAT_P2-3_s2) (not(xAT_P3-3)) (not(kAT_P3-3_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-3) (kAT_P2-3_s3) (not(xAT_P3-3)) (not(kAT_P3-3_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-2_P3-3
:parameters ()
:precondition (and (kdo-actions) (xAT_P3-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P3-3_s1) (xAT_P3-3) (not(kAT_P3-2_s1)) (not(xAT_P3-2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P3-3) (kAT_P3-3_s2) (not(xAT_P3-2)) (not(kAT_P3-2_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P3-3) (kAT_P3-3_s3) (not(xAT_P3-2)) (not(kAT_P3-2_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-2_P3-1
:parameters ()
:precondition (and (kdo-actions) (xAT_P3-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P3-2_s1)) (not(xAT_P3-2)) (kAT_P3-1_s1) (xAT_P3-1)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P3-2)) (not(kAT_P3-2_s2)) (xAT_P3-1) (kAT_P3-1_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P3-2)) (not(kAT_P3-2_s3)) (xAT_P3-1) (kAT_P3-1_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P3-2_P2-2
:parameters ()
:precondition (and (xOPENED_P2-2) (xAT_P3-2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-2_s1) (xAT_P2-2) (not(kAT_P3-2_s1)) (not(xAT_P3-2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-2) (kAT_P2-2_s2) (not(xAT_P3-2)) (not(kAT_P3-2_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-2) (kAT_P2-2_s3) (not(xAT_P3-2)) (not(kAT_P3-2_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-3_P3-3
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-3))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P2-3_s1)) (not(xAT_P2-3)) (kAT_P3-3_s1) (xAT_P3-3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P2-3)) (not(kAT_P2-3_s2)) (xAT_P3-3) (kAT_P3-3_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P2-3)) (not(kAT_P2-3_s3)) (xAT_P3-3) (kAT_P3-3_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-3_P2-2
:parameters ()
:precondition (and (xOPENED_P2-2) (xAT_P2-3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-2_s1) (xAT_P2-2) (not(kAT_P2-3_s1)) (not(xAT_P2-3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-2) (kAT_P2-2_s2) (not(xAT_P2-3)) (not(kAT_P2-3_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-2) (kAT_P2-2_s3) (not(xAT_P2-3)) (not(kAT_P2-3_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-3_P1-3
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-3))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P1-3_s1) (xAT_P1-3) (not(kAT_P2-3_s1)) (not(xAT_P2-3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P1-3) (kAT_P1-3_s2) (not(xAT_P2-3)) (not(kAT_P2-3_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P1-3) (kAT_P1-3_s3) (not(xAT_P2-3)) (not(kAT_P2-3_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-2_P3-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P2-2_s1)) (not(xAT_P2-2)) (kAT_P3-2_s1) (xAT_P3-2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P2-2)) (not(kAT_P2-2_s2)) (xAT_P3-2) (kAT_P3-2_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P2-2)) (not(kAT_P2-2_s3)) (xAT_P3-2) (kAT_P3-2_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-2_P2-3
:parameters ()
:precondition (and (xOPENED_P2-3) (xAT_P2-2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P2-3_s1) (xAT_P2-3) (not(kAT_P2-2_s1)) (not(xAT_P2-2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P2-3) (kAT_P2-3_s2) (not(xAT_P2-2)) (not(kAT_P2-2_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P2-3) (kAT_P2-3_s3) (not(xAT_P2-2)) (not(kAT_P2-2_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-2_P2-1
:parameters ()
:precondition (and (xOPENED_P2-1) (xAT_P2-2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P2-2_s1)) (not(xAT_P2-2)) (kAT_P2-1_s1) (xAT_P2-1)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P2-2)) (not(kAT_P2-2_s2)) (xAT_P2-1) (kAT_P2-1_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P2-2)) (not(kAT_P2-2_s3)) (xAT_P2-1) (kAT_P2-1_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P2-2_P1-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P2-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (xAT_P1-2) (kAT_P1-2_s1) (not(kAT_P2-2_s1)) (not(xAT_P2-2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P1-2) (kAT_P1-2_s2) (not(xAT_P2-2)) (not(kAT_P2-2_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P1-2) (kAT_P1-2_s3) (not(xAT_P2-2)) (not(kAT_P2-2_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-3_P2-3
:parameters ()
:precondition (and (xOPENED_P2-3) (xAT_P1-3) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P1-3_s1)) (not(xAT_P1-3)) (kAT_P2-3_s1) (xAT_P2-3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P1-3)) (not(kAT_P1-3_s2)) (xAT_P2-3) (kAT_P2-3_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P1-3)) (not(kAT_P1-3_s3)) (xAT_P2-3) (kAT_P2-3_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-3_P1-2
:parameters ()
:precondition (and (kdo-actions) (xAT_P1-3))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (xAT_P1-2) (kAT_P1-2_s1) (not(kAT_P1-3_s1)) (not(xAT_P1-3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (xAT_P1-2) (not(xAT_P1-3)) (kAT_P1-2_s2) (not(kAT_P1-3_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (xAT_P1-2) (not(xAT_P1-3)) (kAT_P1-2_s3) (not(kAT_P1-3_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-2_P2-2
:parameters ()
:precondition (and (xOPENED_P2-2) (xAT_P1-2) (kdo-actions))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P1-2_s1)) (not(xAT_P1-2)) (kAT_P2-2_s1) (xAT_P2-2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P1-2)) (not(kAT_P1-2_s2)) (xAT_P2-2) (kAT_P2-2_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P1-2)) (not(kAT_P1-2_s3)) (xAT_P2-2) (kAT_P2-2_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-2_P1-3
:parameters ()
:precondition (and (kdo-actions) (xAT_P1-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (not(kAT_P1-2_s1)) (not(xAT_P1-2)) (kAT_P1-3_s1) (xAT_P1-3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P1-2)) (not(kAT_P1-2_s2)) (xAT_P1-3) (kAT_P1-3_s2)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P1-2)) (not(kAT_P1-2_s3)) (xAT_P1-3) (kAT_P1-3_s3)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MOVE_P1-2_P1-1
:parameters ()
:precondition (and (kdo-actions) (xAT_P1-2))

:effect (and  (not(kdo-actions)) (kdo-axiom1)
(when (amaybe_s1) (and (kAT_P1-1_s1) (not(kAT_P1-2_s1)) (not(xAT_P1-2)) (xAT_P1-1)));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s2) (and (not(xAT_P1-2)) (xAT_P1-1) (kAT_P1-1_s2) (not(kAT_P1-2_s2))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

(when (amaybe_s3) (and (not(xAT_P1-2)) (xAT_P1-1) (kAT_P1-1_s3) (not(kAT_P1-2_s3))));; support Kc/s, m(s) -> Ke/s; Xe/s if e is undet; Xe if e is det. cancellation -K-c/s, m(s) -> -K-e/s, -Xe; -X-e/s if e is undet. 

))
(:action MERGE_AXIOM1
:parameters ()
:precondition (and (kdo-axiom1))

:effect (and  (kdo-actions) (not(kdo-axiom1))
(when (x-OPENED_P2-3_s1)  (x-OPENED_P2-3));; And_s Kl/s -> Xl. 

(when(and (xOPENED_P2-2_s1) (xOPENED_P2-2_s2))  (xOPENED_P2-2));; And_s Kl/s -> Xl. 

(when(and (xOPENED_P2-1_s1) (xOPENED_P2-1_s3))  (xOPENED_P2-1));; And_s Kl/s -> Xl. 

(when (x-OPENED_P2-1_s2)  (x-OPENED_P2-1));; And_s Kl/s -> Xl. 

(when (x-OPENED_P2-2_s3)  (x-OPENED_P2-2));; And_s Kl/s -> Xl. 

(when(and (xOPENED_P2-3_s2) (xOPENED_P2-3_s3))  (xOPENED_P2-3));; And_s Kl/s -> Xl. 

))
)
