
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem BLOCKS-example)
(:domain BLOCKS)
(:objects A B C)
(:INIT (CLEAR A) (CLEAR B) (ONTABLE B) (ONTABLE C) (ON A C) (HANDEMPTY))
(:goal (AND (ON A B) (ON B C)))
)
