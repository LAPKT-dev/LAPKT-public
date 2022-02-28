(define (problem spider-1-4-3-3-2-1400)
(:domain spider)
; using 1 decks of cards with 4 suits per deck and 3 values per suit
;
; deals
; deal 0: d0-s3-v1 d0-s0-v0 d0-s1-v0
; deal 1: d0-s3-v0 d0-s0-v2 d0-s1-v1
;
; initial configuration of piles
; pile 0: d0-s1-v2 d0-s3-v2
; pile 1: d0-s2-v1 d0-s2-v2
; pile 2: d0-s2-v0 d0-s0-v1
(:objects
    card-d0-s0-v0 - card
    card-d0-s0-v1 - card
    card-d0-s0-v2 - card
    card-d0-s1-v0 - card
    card-d0-s1-v1 - card
    card-d0-s1-v2 - card
    card-d0-s2-v0 - card
    card-d0-s2-v1 - card
    card-d0-s2-v2 - card
    card-d0-s3-v0 - card
    card-d0-s3-v1 - card
    card-d0-s3-v2 - card
    pile-0 - tableau
    pile-1 - tableau
    pile-2 - tableau
    deal-0 - deal
    deal-1 - deal
    deal-2 - deal
)
(:init
    (on card-d0-s3-v2 card-d0-s1-v2)
    (on card-d0-s1-v2 pile-0)
    (clear card-d0-s3-v2)
    (part-of-tableau pile-0 pile-0)
    (part-of-tableau card-d0-s1-v2 pile-0)
    (part-of-tableau card-d0-s3-v2 pile-0)
    (movable card-d0-s3-v2)
    (in-play card-d0-s1-v2)
    (in-play card-d0-s3-v2)
    (on card-d0-s2-v2 card-d0-s2-v1)
    (on card-d0-s2-v1 pile-1)
    (clear card-d0-s2-v2)
    (part-of-tableau pile-1 pile-1)
    (part-of-tableau card-d0-s2-v1 pile-1)
    (part-of-tableau card-d0-s2-v2 pile-1)
    (movable card-d0-s2-v2)
    (in-play card-d0-s2-v1)
    (in-play card-d0-s2-v2)
    (on card-d0-s0-v1 card-d0-s2-v0)
    (on card-d0-s2-v0 pile-2)
    (clear card-d0-s0-v1)
    (part-of-tableau pile-2 pile-2)
    (part-of-tableau card-d0-s2-v0 pile-2)
    (part-of-tableau card-d0-s0-v1 pile-2)
    (movable card-d0-s0-v1)
    (in-play card-d0-s2-v0)
    (in-play card-d0-s0-v1)
    (on card-d0-s3-v1 deal-0)
    (on card-d0-s0-v0 card-d0-s3-v1)
    (on card-d0-s1-v0 card-d0-s0-v0)
    (clear card-d0-s1-v0)
    (on card-d0-s3-v0 deal-1)
    (on card-d0-s0-v2 card-d0-s3-v0)
    (on card-d0-s1-v1 card-d0-s0-v2)
    (clear card-d0-s1-v1)
    (current-deal deal-0)
    (can-continue-group card-d0-s0-v0 card-d0-s0-v1)
    (can-continue-group card-d0-s0-v1 card-d0-s0-v2)
    (can-continue-group card-d0-s1-v0 card-d0-s1-v1)
    (can-continue-group card-d0-s1-v1 card-d0-s1-v2)
    (can-continue-group card-d0-s2-v0 card-d0-s2-v1)
    (can-continue-group card-d0-s2-v1 card-d0-s2-v2)
    (can-continue-group card-d0-s3-v0 card-d0-s3-v1)
    (can-continue-group card-d0-s3-v1 card-d0-s3-v2)
    (can-be-placed-on card-d0-s0-v0 card-d0-s0-v1)
    (can-be-placed-on card-d0-s0-v1 card-d0-s0-v2)
    (can-be-placed-on card-d0-s0-v0 card-d0-s1-v1)
    (can-be-placed-on card-d0-s0-v1 card-d0-s1-v2)
    (can-be-placed-on card-d0-s0-v0 card-d0-s2-v1)
    (can-be-placed-on card-d0-s0-v1 card-d0-s2-v2)
    (can-be-placed-on card-d0-s0-v0 card-d0-s3-v1)
    (can-be-placed-on card-d0-s0-v1 card-d0-s3-v2)
    (can-be-placed-on card-d0-s1-v0 card-d0-s0-v1)
    (can-be-placed-on card-d0-s1-v1 card-d0-s0-v2)
    (can-be-placed-on card-d0-s1-v0 card-d0-s1-v1)
    (can-be-placed-on card-d0-s1-v1 card-d0-s1-v2)
    (can-be-placed-on card-d0-s1-v0 card-d0-s2-v1)
    (can-be-placed-on card-d0-s1-v1 card-d0-s2-v2)
    (can-be-placed-on card-d0-s1-v0 card-d0-s3-v1)
    (can-be-placed-on card-d0-s1-v1 card-d0-s3-v2)
    (can-be-placed-on card-d0-s2-v0 card-d0-s0-v1)
    (can-be-placed-on card-d0-s2-v1 card-d0-s0-v2)
    (can-be-placed-on card-d0-s2-v0 card-d0-s1-v1)
    (can-be-placed-on card-d0-s2-v1 card-d0-s1-v2)
    (can-be-placed-on card-d0-s2-v0 card-d0-s2-v1)
    (can-be-placed-on card-d0-s2-v1 card-d0-s2-v2)
    (can-be-placed-on card-d0-s2-v0 card-d0-s3-v1)
    (can-be-placed-on card-d0-s2-v1 card-d0-s3-v2)
    (can-be-placed-on card-d0-s3-v0 card-d0-s0-v1)
    (can-be-placed-on card-d0-s3-v1 card-d0-s0-v2)
    (can-be-placed-on card-d0-s3-v0 card-d0-s1-v1)
    (can-be-placed-on card-d0-s3-v1 card-d0-s1-v2)
    (can-be-placed-on card-d0-s3-v0 card-d0-s2-v1)
    (can-be-placed-on card-d0-s3-v1 card-d0-s2-v2)
    (can-be-placed-on card-d0-s3-v0 card-d0-s3-v1)
    (can-be-placed-on card-d0-s3-v1 card-d0-s3-v2)
    (is-ace card-d0-s0-v0)
    (is-ace card-d0-s1-v0)
    (is-ace card-d0-s2-v0)
    (is-ace card-d0-s3-v0)
    (is-king card-d0-s0-v2)
    (is-king card-d0-s1-v2)
    (is-king card-d0-s2-v2)
    (is-king card-d0-s3-v2)
    (next-deal deal-0 deal-1)
    (next-deal deal-1 deal-2)
    (to-deal card-d0-s3-v1 pile-2 deal-0 deal-0)
    (to-deal card-d0-s1-v0 pile-0 deal-0 card-d0-s0-v0)
    (to-deal card-d0-s0-v0 pile-1 deal-0 card-d0-s3-v1)
    (to-deal card-d0-s3-v0 pile-2 deal-1 deal-1)
    (to-deal card-d0-s1-v1 pile-0 deal-1 card-d0-s0-v2)
    (to-deal card-d0-s0-v2 pile-1 deal-1 card-d0-s3-v0)
    (= (total-cost) 0)
)
(:goal
(and
    (clear pile-0)
    (clear pile-1)
    (clear pile-2)
    (clear deal-0)
    (clear deal-1)
    (on card-d0-s0-v0 discard)
    (on card-d0-s0-v1 discard)
    (on card-d0-s0-v2 discard)
    (on card-d0-s1-v0 discard)
    (on card-d0-s1-v1 discard)
    (on card-d0-s1-v2 discard)
    (on card-d0-s2-v0 discard)
    (on card-d0-s2-v1 discard)
    (on card-d0-s2-v2 discard)
    (on card-d0-s3-v0 discard)
    (on card-d0-s3-v1 discard)
    (on card-d0-s3-v2 discard)
)
)
(:metric minimize (total-cost))
)