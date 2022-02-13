(define (domain ER-domain)
    (:requirements :strips)
    ; (:predicates    (at ?x ?y) (adj ?x ?y) (rob ?x)
    ;                 (busy ?x) (person ?x) (request ?x ?y ?z) (conv ?topic) 
    ;                 (Pdata ?patient-data) (issue ?x) (Preq ?patient-request ?return) (req-done ?request-done)
    ;                 (Pwater ?water) (move-with-human ?accompany) (time4appt ?appt-time ?to) 
    ;                 (do-request ?completed-req ?from))

    (:predicates    (at ?x ?y) (adj ?x ?y) (rob ?x)
                    (busy ?x) (person ?x) (request ?x ?y ?z) (conv ?topic) 
                    (Pdata ?patient-data) (issue ?x) (do-request ?completed-req ?from))
                    
                    
    (:action move-robot
        :parameters (?robot ?from ?to)
        :precondition (and (at ?robot ?from)
        		       (adj ?from ?to)
                       (rob ?robot)
                       (not (busy ?to)))
                       
        :effect (and (not (at ?robot ?from)) 
                          (at ?robot ?to)))
                          
    (:action move-human
        :parameters (?human ?from ?to)
        :precondition (and (at ?human ?from)
        		       (adj ?from ?to)
                       (person ?human)
                       (not (busy ?to)))
                       
        :effect (and (not (at ?human ?from)) 
                          (at ?human ?to)))

    (:action speak
        :parameters (?robot ?topic  ?human ?loc)
        :precondition (and (at ?robot ?loc)
                           (at ?human ?loc)
                           (rob ?robot)
                           (person ?human)
                           (conv ?topic)
                           (not (request ?robot ?human ?topic)))
        :effect (and (request ?robot ?human ?topic)))
        
    (:action listen
        :parameters (?human ?topic ?robot ?loc)
        :precondition (and (at ?robot ?loc)
                           (at ?human ?loc)
                           (rob ?robot)
                           (person ?human)
                           (conv ?topic)
                           (request ?robot ?human ?topic)
                           (not (request ?human ?robot ?topic)))
        :effect (and (request ?human ?robot ?topic)))

    (:action resolve-issue
        :parameters (?problem ?robot ?topic ?human ?loc)
        :precondition (and (at ?robot ?loc)
                           (at ?human ?loc)
                           (rob ?robot)
                           (person ?human)
                           (issue ?problem)
                           (request ?human ?robot ?topic))
        :effect (and (not (issue ?problem))))
           
    (:action get-patient-data
        :parameters (?patient-data ?robot ?topic ?human ?loc)
        :precondition (and (at ?robot ?loc)
                           (at ?human ?loc)
                           (rob ?robot)
                           (person ?human)
                           (not (Pdata ?patient-data))
                           (request ?human ?robot ?topic))
        :effect (and (Pdata ?patient-data)))
        
    ; (:action resolve-request
    ;     :parameters (?request-done ?robot ?patient-request ?human ?return ?patient-data ?completed-req)
    ;     :precondition (and (rob ?robot)
    ;                       (person ?human)
    ;                       (Preq ?patient-request ?return)
    ;                     ;   (do-request ?completed-req ?from)
    ;                       (Pdata ?patient-data)
    ;                       (at ?robot ?return)
    ;                     ;   (adj ?from ?loc)
    ;                       (not (req-done ?request-done)))
    ;     :effect (and (req-done ?request-done)))   
        
    ; (:action get-water
    ;     :parameters (?robot ?patient-request ?human ?water ?Wloc ?request-done ?patient-data ?completed-req ?return)
    ;     :precondition (and  (rob ?robot)
    ;                         (person ?human)
    ;                         (Pwater ?water)
    ;                         (Preq ?patient-request ?return)
    ;                         ; (req-done ?request-done)
    ;                         (not (do-request ?completed-req ?Wloc))
    ;                         (at ?robot ?Wloc)
    ;                         (at ?water ?Wloc)
    ;                         (Pdata ?patient-data)
    ;                         (not (at ?water ?return)))
    ;     :effect (and    (do-request ?completed-req ?Wloc)
    ;                     (at ?water ?return)
    ;                     ; (not (at ?water ?Wloc)) 
    ;                     ; (at ?robot ?return)
    ;                     ; (not (req-done ?request-done))
    ;                     ))  
          
    ; (:action take-patient2doc
    ;     ; :parameters (?robot ?human ?from ?to ?accompany ?appt-time ?patient-data ?patient-request ?completed-req ?return)
    ;     :parameters (?robot ?human ?from ?patient-data ?completed-req)
    ;     :precondition (and    (rob ?robot)
    ;                           (person ?human)
    ;                         ;   (at ?robot ?from)
    ;                         ;   (at ?human ?from)
    ;                           (Pdata ?patient-data)
    ;                         ;   (at ?robot ?to)
    ;                         ;   (at ?human ?to)
    ;                         ;   (adj ?from ?to)
    ;                         ;   (time4appt ?appt-time ?to)
    ;                         ;   (not (busy ?to))
    ;                           (not (do-request ?completed-req ?from))
    ;                         ;   (not (Preq ?patient-request ?return))
                            
    ;                           )
                          
    ;     :effect (and    (do-request ?completed-req ?from)
    ;                     ; (move-with-human ?accompany)
    ;                     ; (not (time4appt ?appt-time ?to))
    ;                     ; (Preq ?patient-request ?return)
                        
    ;                     ; (not (at ?human ?from)) 
    ;                     ; (at ?human ?to)
    ;                     ; (not (at ?robot ?from)) 
    ;                     ; (at ?robot ?to)
    ;                     ))          
   
   
    (:action take-patient2doc
        :parameters (?robot ?human ?patient-data ?completed-req ?from)
        :precondition (and    (rob ?robot)
                              (person ?human)
                              (Pdata ?patient-data)
                              (not (do-request ?completed-req ?from))
                              )
                          
        :effect (and    (do-request ?completed-req ?from)
                        ))    
                     
)