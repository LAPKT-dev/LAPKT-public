;; pipesworld

(define (domain pipesworld_strips)

(:requirements :strips :typing )

;; types
;;  pipe: a pipeline segment
;;  area: operational areas
;;  product: an oil derivative product, such as gasoline,
;;    kerosene, etc.
;;  batch-atom: an unitary batch

(:types pipe area product batch-atom )

;; define the products (petroleum derivatives)
(:constants lco gasoleo rat-a oca1 oc1b - product )
(:predicates

  ;; indicates that a pipeline segment connects
  ;; two areas
  (connect ?from ?to - area ?pipe - pipe)

  ;; special case for unitary pipes
  (unitary ?pipe - pipe)
  (not-unitary ?pipe - pipe)

  ;; these predicates represent the pipeline segment contents
  ;; we define the first (nearest to  ``from'' area) and 
  ;; last (nearest to  ``to'' area) batch-atom in a pipeline 
  ;; segment, and their sequence is represented by the
  ;; (follow) predicate
  (last ?batch-atom - batch-atom ?pipe - pipe)
  (first ?batch-atom - batch-atom ?pipe - pipe)
  (follow ?next ?previous - batch-atom)

  ;; an unitary batch product
  (is-product ?batch-atom - batch-atom ?product - product)

  ;; unitary batches that are on areas
  (on ?batch-atom - batch-atom ?area - area)

  ;; indicates that two products may interface in the
  ;; pipeline segment
  (may-interface ?product-a ?product-b - product)

  ;; to control splitting process (push/pop vs. update)
  (normal ?pipe - pipe)
  (push-updating ?pipe - pipe)
  (pop-updating ?pipe - pipe)
)

;; push-start action
;; moves a batch-atom from a tankage to a pipeline segment
;; the push-start action moves the pipeline segment contents towards
;; the ``to-area'' defined in the ``connect'' predicate
;; first part -- initialise the push and turn control
;; over to contents update operators

(:action push-start
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?batch-atom-in - batch-atom
    ?from-area - area
    ?to-area - area
    ?first-batch-atom - batch-atom
    ?product-batch-atom-in - product
    ?product-first-batch - product
  )
  :precondition
   (and

   ;; normal planning mode
   (normal ?pipe)
   ;; binds :vars section
   (first ?first-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; inserted batch must be in 'from-area'
   (on ?batch-atom-in ?from-area)
   ;; action is applicable only in non-unitary pipeline segments
   (not-unitary ?pipe)
   ;; bind batch-atom products
   (is-product ?batch-atom-in ?product-batch-atom-in)
   (is-product ?first-batch-atom ?product-first-batch)
   ;; interface restriction
   (may-interface ?product-batch-atom-in ?product-first-batch)

 )
  :effect
   (and 
     ;; switch into correct update mode for this pipe
     (push-updating ?pipe)
     (not (normal ?pipe))
     ;; the inserted unitary batch will be the pipeline segment
     ;; new first batch
     (first ?batch-atom-in ?pipe)
     (not (first ?first-batch-atom ?pipe))

     ;; updates the follow and last relationship to the new
     ;; pipeline segment configuration
     (follow ?first-batch-atom ?batch-atom-in)
     ;; inserted batch-atom is removed from area
     (not (on ?batch-atom-in ?from-area))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
)
)
;; push-end action
;; moves a batch-atom from a tankage to a pipeline segment
;; the push-end action moves the pipeline segment contents towards
;; the ``to-area'' defined in the ``connect'' predicate
;; second part -- when start of pipe has been done, care about the
;; end of the pipe

(:action push-end
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?from-area - area
    ?to-area - area
    ?last-batch-atom - batch-atom
    ?next-last-batch-atom - batch-atom
  )
  :precondition
   (and

   ;; are we in the correct mode?
   (push-updating ?pipe)
   ;; binds :vars section
   (last ?last-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; action is applicable only in non-unitary pipeline segments
   (not-unitary ?pipe)
   (follow ?last-batch-atom ?next-last-batch-atom)

 )
  :effect
   (and 
     ;; back to normal mode
     (not (push-updating ?pipe))
     (normal ?pipe)

     ;; updates the follow and last relationship to the new
     ;; pipeline segment configuration
     (not (follow ?last-batch-atom ?next-last-batch-atom))
     (last ?next-last-batch-atom ?pipe)
     ;; previous last batch is not last anymore
     (not (last ?last-batch-atom ?pipe))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
     (on ?last-batch-atom ?to-area)
)
)
;; pop-start action
;; moves a batch-atom from a tankage to a pipeline segment
;; the pop-start action moves the pipeline segment contents towards
;; the ``from-area'' defined in the ``connect'' predicate
;; first part -- initialise the pop and turn control
;; over to contents update operators

(:action pop-start
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?batch-atom-in - batch-atom
    ?from-area - area
    ?to-area - area
    ?last-batch-atom - batch-atom
    ?product-batch-atom-in - product
    ?product-last-batch - product
  )
  :precondition
   (and

   ;; normal planning mode
   (normal ?pipe)
   ;; binds :vars section
   (last ?last-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; inserted batch must be in 'to-area'
   (on ?batch-atom-in ?to-area)
   ;; action is applicable only in non-unitary pipeline segments
   (not-unitary ?pipe)
   ;; bind batch-atom products
   (is-product ?batch-atom-in ?product-batch-atom-in)
   (is-product ?last-batch-atom ?product-last-batch)
   ;; interface restriction
   (may-interface ?product-batch-atom-in ?product-last-batch)

 )
  :effect
   (and 
     ;; switch into correct update mode for this pipe
     (pop-updating ?pipe)
     (not (normal ?pipe))
     ;; the inserted unitary batch will be the pipeline segment
     ;; new last batch
     (last ?batch-atom-in ?pipe)
     (not (last ?last-batch-atom ?pipe))

     ;; updates the follow and first relationship to the new
     ;; pipeline segment configuration
     (follow ?batch-atom-in ?last-batch-atom)
     ;; inserted batch-atom is removed from area
     (not (on ?batch-atom-in ?to-area))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
)
)
;; pop-end action
;; moves a batch-atom from a tankage to a pipeline segment
;; the pop-end action moves the pipeline segment contents towards
;; the ``from-area'' defined in the ``connect'' predicate
;; second part -- when start of pipe has been done, care about the
;; end of the pipe

(:action pop-end
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?from-area - area
    ?to-area - area
    ?first-batch-atom - batch-atom
    ?next-first-batch-atom - batch-atom
  )
  :precondition
   (and

   ;; are we in the correct mode?
   (pop-updating ?pipe)
   ;; binds :vars section
   (first ?first-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; action is applicable only in non-unitary pipeline segments
   (not-unitary ?pipe)
   (follow ?next-first-batch-atom ?first-batch-atom)

 )
  :effect
   (and 
     ;; back to normal mode
     (not (pop-updating ?pipe))
     (normal ?pipe)

     ;; updates the follow and first relationship to the new
     ;; pipeline segment configuration
     (not (follow ?next-first-batch-atom ?first-batch-atom))
     (first ?next-first-batch-atom ?pipe)
     ;; previous first batch is not first anymore
     (not (first ?first-batch-atom ?pipe))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
     (on ?first-batch-atom ?from-area)
)
)
;; push-unitarypipe action
;; moves a batch-atom from a tankage to a pipeline segment
;; the push-unitarypipe action moves the pipeline segment contents towards
;; the ``to-area'' defined in the ``connect'' predicate
;; first part -- initialise the push and turn control
;; over to contents update operators

(:action push-unitarypipe
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?batch-atom-in - batch-atom
    ?from-area - area
    ?to-area - area
    ?first-batch-atom - batch-atom
    ?product-batch-atom-in - product
    ?product-first-batch - product
  )
  :precondition
   (and

   ;; binds :vars section
   (first ?first-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; inserted batch must be in 'from-area'
   (on ?batch-atom-in ?from-area)
   ;; action is applicable only in unitary pipeline segments
   (unitary ?pipe)
   ;; bind batch-atom products
   (is-product ?batch-atom-in ?product-batch-atom-in)
   (is-product ?first-batch-atom ?product-first-batch)
   ;; interface restriction
   (may-interface ?product-batch-atom-in ?product-first-batch)

 )
  :effect
   (and 
     ;; the inserted unitary batch will be the pipeline segment
     ;; new first batch
     (first ?batch-atom-in ?pipe)
     (not (first ?first-batch-atom ?pipe))

     ;; updates the follow and last relationship to the new
     ;; pipeline segment configuration
     (last ?batch-atom-in ?pipe)
     (not (last ?first-batch-atom ?pipe))
     ;; inserted batch-atom is removed from area
     (not (on ?batch-atom-in ?from-area))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
     (on ?first-batch-atom ?to-area)
)
)
;; pop-unitarypipe action
;; moves a batch-atom from a tankage to a pipeline segment
;; the pop-unitarypipe action moves the pipeline segment contents towards
;; the ``from-area'' defined in the ``connect'' predicate
;; first part -- initialise the pop and turn control
;; over to contents update operators

(:action pop-unitarypipe
  :parameters(
    ;; pipeline segment that will be moved
    ?pipe - pipe
    ;; unitary batch that will be inserted into the pipeline
    ;; segment
    ?batch-atom-in - batch-atom
    ?from-area - area
    ?to-area - area
    ?last-batch-atom - batch-atom
    ?product-batch-atom-in - product
    ?product-last-batch - product
  )
  :precondition
   (and

   ;; binds :vars section
   (last ?last-batch-atom ?pipe)
   (connect ?from-area ?to-area ?pipe)
   ;; inserted batch must be in 'to-area'
   (on ?batch-atom-in ?to-area)
   ;; action is applicable only in unitary pipeline segments
   (unitary ?pipe)
   ;; bind batch-atom products
   (is-product ?batch-atom-in ?product-batch-atom-in)
   (is-product ?last-batch-atom ?product-last-batch)
   ;; interface restriction
   (may-interface ?product-batch-atom-in ?product-last-batch)

 )
  :effect
   (and 
     ;; the inserted unitary batch will be the pipeline segment
     ;; new last batch
     (last ?batch-atom-in ?pipe)
     (not (last ?last-batch-atom ?pipe))

     ;; updates the follow and first relationship to the new
     ;; pipeline segment configuration
     (first ?batch-atom-in ?pipe)
     (not (first ?last-batch-atom ?pipe))
     ;; inserted batch-atom is removed from area
     (not (on ?batch-atom-in ?to-area))
    ;; batch-atom removed from pipeline segment is inserted
    ;; into the destination area
     (on ?last-batch-atom ?from-area)
)
)
)
