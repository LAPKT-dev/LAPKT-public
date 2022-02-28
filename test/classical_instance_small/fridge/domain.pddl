; (c) 1993,1994 copyright (c) university of washington
;  written by tony barrett.

;  all rights reserved. use of this software is permitted for non-commercial
;  research purposes, and it may be copied only for that use.  all copies must
;  include this copyright message.  this software is made available as is, and
;  neither the authors nor the university of washington make any warranty about
;  the software or its performance.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; joerg's fridgly domain


(define (domain fridge-domain)
  (:requirements :strips :typing :quanitfied-precondition)
  (:types screw backplane compressor fridge)
  (:predicates (screwed ?s - screw)
	       (attached ?c - compressor ?f - fridge)
               (fits ?s - screw ?c -compressor)
	       (fridge-on ?f - fridge))

  
(:action fasten
	     :parameters (?x - screw)
	     :precondition (not (screwed ?x))
	     :effect (screwed ?x))
  
(:action unfasten
	     :parameters (?x - screw)
	     :precondition (and (exists (?f - fridge)
                                  (exists (?c - compressor)
                                     (and (attached ?c ?f) 
                                          (fits ?x ?c)
                                          (not (fridge-on ?f)))))
                                (screwed ?x))
	     :effect (not (screwed ?x)))
  
(:action start-fridge
	     :parameters (?f - fridge)
	     :precondition 
              (and (exists (?c - compressor) 
                   (and (attached ?c ?f)
                        (forall (?a - screw)
                           (imply (fits ?a ?c) (screwed ?a)))))
                   (not (fridge-on ?f)))
	     :effect (fridge-on ?f))
  
(:action stop-fridge
	     :parameters (?f - fridge)
	     :precondition (fridge-on ?f)
	     :effect
	     (not (fridge-on ?f)))
  
(:action remove-compressor
	     :parameters (?x - compressor ?f - fridge)
	     :precondition 
             (and (not (fridge-on ?f))
                  (attached ?x ?f)
                  (forall (?a - screw) 
                  (imply (fits ?a ?x) (not (screwed ?a)))))
             :effect (not (attached ?x ?f)))

(:action attach-compressor
	     :parameters (?x - compressor ?f - fridge)
	     :precondition 
             (and (not (fridge-on ?f))
                  (forall (?y - compressor) 
                  (not (attached ?y ?f)))
                  (forall (?a - screw) 
                  (imply (fits ?a ?x) (not (screwed ?a)))))
             :effect (attached ?x ?f)))

         




