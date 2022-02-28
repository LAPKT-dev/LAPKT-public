;; the following problem is taken from the problem library of solipeg 2.2:
;; 
;; solipeg, a classic marble puzzle game for the
;; psion series 3a, 3c and siena
;; version 2.2 (and 2.2 lite)
;; copyright (c) 1993, 1994, 1995, 1996 j cade roux
;; 
;; this program is free software; you can redistribute it and/or modify
;; it under the terms of the gnu general public license as published by
;; the free software foundation; either version 2 of the license, or
;; (at your option) any later version.
;; 
;; this program is distributed in the hope that it will be useful,
;; but without any warranty; without even the implied warranty of
;; merchantability or fitness for a particular purpose.  see the
;; gnu general public license for more details.
;; 
;; you should have received a copy of the gnu general public license
;; along with this program; if not, write to the free software
;; foundation, inc., 675 mass ave, cambridge, ma 02139, usa.
;; 
;; (see http://ourworld.compuserve.com/homepages/cade/psionsof.htm,
;; http://ourworld.compuserve.com/homepages/cade/solsrc22.zip)
;; 
;; the solipeg problem library in turn is derived from the booklet
;; "problems in puzzle-peg" included in the game puzzle-peg (third
;; edition, 1924, lubbers & bell mfg. co.,clinton, iowa, usa).
;; 
;; original problem number and name: "30 gridley"
;; 
;; number of pegs:                  16
;; number of diagonal moves needed: 0
;; 
;; problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;; 
;;     o * o     
;;     o * o     
;; o o * * * o o 
;; * * * o * * * 
;; o o * * * o o 
;;     o * o     
;;     o * o     
;; 
;; target position = (3,3)
;; 
(define (problem pegsolitaire-sequential-030)
    (:domain pegsolitaire-sequential)
    (:objects
        pos-0-2 - location
        pos-0-3 - location
        pos-0-4 - location
        pos-1-2 - location
        pos-1-3 - location
        pos-1-4 - location
        pos-2-0 - location
        pos-2-1 - location
        pos-2-2 - location
        pos-2-3 - location
        pos-2-4 - location
        pos-2-5 - location
        pos-2-6 - location
        pos-3-0 - location
        pos-3-1 - location
        pos-3-2 - location
        pos-3-3 - location
        pos-3-4 - location
        pos-3-5 - location
        pos-3-6 - location
        pos-4-0 - location
        pos-4-1 - location
        pos-4-2 - location
        pos-4-3 - location
        pos-4-4 - location
        pos-4-5 - location
        pos-4-6 - location
        pos-5-2 - location
        pos-5-3 - location
        pos-5-4 - location
        pos-6-2 - location
        pos-6-3 - location
        pos-6-4 - location
    )
    (:init
        (= (total-cost) 0)
        (move-ended)
        (in-line pos-0-2 pos-0-3 pos-0-4)
        (in-line pos-0-4 pos-0-3 pos-0-2)
        (in-line pos-0-2 pos-1-2 pos-2-2)
        (in-line pos-2-2 pos-1-2 pos-0-2)
        (in-line pos-0-3 pos-1-3 pos-2-3)
        (in-line pos-2-3 pos-1-3 pos-0-3)
        (in-line pos-0-4 pos-1-4 pos-2-4)
        (in-line pos-2-4 pos-1-4 pos-0-4)
        (in-line pos-1-2 pos-1-3 pos-1-4)
        (in-line pos-1-4 pos-1-3 pos-1-2)
        (in-line pos-1-2 pos-2-2 pos-3-2)
        (in-line pos-3-2 pos-2-2 pos-1-2)
        (in-line pos-1-3 pos-2-3 pos-3-3)
        (in-line pos-3-3 pos-2-3 pos-1-3)
        (in-line pos-1-4 pos-2-4 pos-3-4)
        (in-line pos-3-4 pos-2-4 pos-1-4)
        (in-line pos-2-0 pos-2-1 pos-2-2)
        (in-line pos-2-2 pos-2-1 pos-2-0)
        (in-line pos-2-0 pos-3-0 pos-4-0)
        (in-line pos-4-0 pos-3-0 pos-2-0)
        (in-line pos-2-1 pos-2-2 pos-2-3)
        (in-line pos-2-3 pos-2-2 pos-2-1)
        (in-line pos-2-1 pos-3-1 pos-4-1)
        (in-line pos-4-1 pos-3-1 pos-2-1)
        (in-line pos-2-2 pos-2-3 pos-2-4)
        (in-line pos-2-4 pos-2-3 pos-2-2)
        (in-line pos-2-2 pos-3-2 pos-4-2)
        (in-line pos-4-2 pos-3-2 pos-2-2)
        (in-line pos-2-3 pos-2-4 pos-2-5)
        (in-line pos-2-5 pos-2-4 pos-2-3)
        (in-line pos-2-3 pos-3-3 pos-4-3)
        (in-line pos-4-3 pos-3-3 pos-2-3)
        (in-line pos-2-4 pos-2-5 pos-2-6)
        (in-line pos-2-6 pos-2-5 pos-2-4)
        (in-line pos-2-4 pos-3-4 pos-4-4)
        (in-line pos-4-4 pos-3-4 pos-2-4)
        (in-line pos-2-5 pos-3-5 pos-4-5)
        (in-line pos-4-5 pos-3-5 pos-2-5)
        (in-line pos-2-6 pos-3-6 pos-4-6)
        (in-line pos-4-6 pos-3-6 pos-2-6)
        (in-line pos-3-0 pos-3-1 pos-3-2)
        (in-line pos-3-2 pos-3-1 pos-3-0)
        (in-line pos-3-1 pos-3-2 pos-3-3)
        (in-line pos-3-3 pos-3-2 pos-3-1)
        (in-line pos-3-2 pos-3-3 pos-3-4)
        (in-line pos-3-4 pos-3-3 pos-3-2)
        (in-line pos-3-2 pos-4-2 pos-5-2)
        (in-line pos-5-2 pos-4-2 pos-3-2)
        (in-line pos-3-3 pos-3-4 pos-3-5)
        (in-line pos-3-5 pos-3-4 pos-3-3)
        (in-line pos-3-3 pos-4-3 pos-5-3)
        (in-line pos-5-3 pos-4-3 pos-3-3)
        (in-line pos-3-4 pos-3-5 pos-3-6)
        (in-line pos-3-6 pos-3-5 pos-3-4)
        (in-line pos-3-4 pos-4-4 pos-5-4)
        (in-line pos-5-4 pos-4-4 pos-3-4)
        (in-line pos-4-0 pos-4-1 pos-4-2)
        (in-line pos-4-2 pos-4-1 pos-4-0)
        (in-line pos-4-1 pos-4-2 pos-4-3)
        (in-line pos-4-3 pos-4-2 pos-4-1)
        (in-line pos-4-2 pos-4-3 pos-4-4)
        (in-line pos-4-4 pos-4-3 pos-4-2)
        (in-line pos-4-2 pos-5-2 pos-6-2)
        (in-line pos-6-2 pos-5-2 pos-4-2)
        (in-line pos-4-3 pos-4-4 pos-4-5)
        (in-line pos-4-5 pos-4-4 pos-4-3)
        (in-line pos-4-3 pos-5-3 pos-6-3)
        (in-line pos-6-3 pos-5-3 pos-4-3)
        (in-line pos-4-4 pos-4-5 pos-4-6)
        (in-line pos-4-6 pos-4-5 pos-4-4)
        (in-line pos-4-4 pos-5-4 pos-6-4)
        (in-line pos-6-4 pos-5-4 pos-4-4)
        (in-line pos-5-2 pos-5-3 pos-5-4)
        (in-line pos-5-4 pos-5-3 pos-5-2)
        (in-line pos-6-2 pos-6-3 pos-6-4)
        (in-line pos-6-4 pos-6-3 pos-6-2)
        (free pos-0-2)
        (free pos-0-4)
        (free pos-1-2)
        (free pos-1-4)
        (free pos-2-0)
        (free pos-2-1)
        (free pos-2-5)
        (free pos-2-6)
        (free pos-3-3)
        (free pos-4-0)
        (free pos-4-1)
        (free pos-4-5)
        (free pos-4-6)
        (free pos-5-2)
        (free pos-5-4)
        (free pos-6-2)
        (free pos-6-4)
        (occupied pos-0-3)
        (occupied pos-1-3)
        (occupied pos-2-2)
        (occupied pos-2-3)
        (occupied pos-2-4)
        (occupied pos-3-0)
        (occupied pos-3-1)
        (occupied pos-3-2)
        (occupied pos-3-4)
        (occupied pos-3-5)
        (occupied pos-3-6)
        (occupied pos-4-2)
        (occupied pos-4-3)
        (occupied pos-4-4)
        (occupied pos-5-3)
        (occupied pos-6-3)
    )
    (:goal (and
        (free pos-0-2)
        (free pos-0-3)
        (free pos-0-4)
        (free pos-1-2)
        (free pos-1-3)
        (free pos-1-4)
        (free pos-2-0)
        (free pos-2-1)
        (free pos-2-2)
        (free pos-2-3)
        (free pos-2-4)
        (free pos-2-5)
        (free pos-2-6)
        (free pos-3-0)
        (free pos-3-1)
        (free pos-3-2)
        (free pos-3-4)
        (free pos-3-5)
        (free pos-3-6)
        (free pos-4-0)
        (free pos-4-1)
        (free pos-4-2)
        (free pos-4-3)
        (free pos-4-4)
        (free pos-4-5)
        (free pos-4-6)
        (free pos-5-2)
        (free pos-5-3)
        (free pos-5-4)
        (free pos-6-2)
        (free pos-6-3)
        (free pos-6-4)
        (occupied pos-3-3)
           )
    )
    (:metric minimize (total-cost))
)
