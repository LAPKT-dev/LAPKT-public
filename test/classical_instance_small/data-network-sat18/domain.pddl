;; data network planning domain
;; authors: manuel heusner, florian pommerening, alvaro torralba
;;
;; in a given network of servers, each server can produce data by processing
;; existing data and send the data to connected servers. each server has a disk
;; and random access memory (ram). data that is saved on the disk of a server
;; must be loaded into ram of the server in order to be processed or sent to the
;; ram of another server.
;;
;; the ability to process and distribute the data in the network is constrained
;; by
;;     - the connections between servers,
;;     - the capacity of server's ram,
;;     - the availability of scripts on servers, and
;;     - the cost of
;;         - loading and saving data, which depends on the data size and the (disk's io performance of a) server,
;;         - sending data, which depends on the data size and (bandwidth of a) connection, and
;;         - processing data, which depends on the script and (clock rate and numbers of processors of a) server.
(define (domain data-network)
(:requirements :adl :typing :negative-preconditions :equality :action-costs)
(:types
    data script server numbers
)
(:predicates
    (script-io ?s - script ?in1 - data ?in2 - data ?out - data)
    (connected ?from - server ?to - server)
    (data-size ?d - data ?n - numbers)
    (capacity ?s - server ?n - numbers)
    (sum ?n1 - numbers ?n2 - numbers ?sum - numbers)
    (less-equal ?n1 - numbers ?n2 - numbers)
    (saved ?d - data ?s - server)
    (cached ?d - data ?s - server)
    (usage ?s - server ?n - numbers)
)
(:functions
    (total-cost) - number
    (process-cost ?sc - script ?s - server) - number
    (send-cost ?from ?to - server ?size - numbers) - number
    (io-cost ?s - server ?size - numbers) - number
)
;; release data from ram.
(:action release
    :parameters (?d - data ?s - server ?size ?before ?after - numbers)
    :precondition
    (and
        (data-size ?d ?size)
        (sum ?after ?size ?before)
        (cached ?d ?s)
        (usage ?s ?before)
    )
    :effect
    (and
        (not (cached ?d ?s))
        (not (usage ?s ?before))
        (usage ?s ?after)
        (increase (total-cost) 0)
    )
)

;; save data from ram to disk.
(:action save
    :parameters (?d - data ?size - numbers ?s - server)
    :precondition
    (and
        (data-size ?d ?size)
        (cached ?d ?s)
    )
    :effect
    (and
        (saved ?d ?s)
        (increase (total-cost) (io-cost ?s ?size))
    )
)

;; load data from disk into ram.
(:action load
    :parameters (?d - data ?s - server ?size ?limit ?before ?after - numbers)
    :precondition
    (and
        (data-size ?d ?size)
        (capacity ?s ?limit)
        (sum ?before ?size ?after)
        (less-equal ?after ?limit)
        (saved ?d ?s)
        (not (cached ?d ?s))
        (usage ?s ?before)
    )
    :effect
    (and
        (cached ?d ?s)
        (not (usage ?s ?before))
        (usage ?s ?after)
        (increase (total-cost) (io-cost ?s ?size))
    )
)

;; send data from ram of one server to ram of another server.
(:action send
    :parameters (?d - data ?from ?to - server ?size ?limit ?before ?after - numbers)
    :precondition
    (and
        (connected ?from ?to)
        (data-size ?d ?size)
        (capacity ?to ?limit)
        (sum ?before ?size ?after)
        (less-equal ?after ?limit)
        (cached ?d ?from)
        (not (cached ?d ?to))
        (usage ?to ?before)
    )
    :effect
    (and
        (cached ?d ?to)
        (not (usage ?to ?before))
        (usage ?to ?after)
        (increase (total-cost) (send-cost ?from ?to ?size))
    )
)

;; executes a script that processes two data items from ram and produces another data item in ram.
(:action process
    :parameters (?in1 ?in2 ?out - data ?sc - script ?s - server ?size ?limit ?before ?after - numbers)
    :precondition
    (and
        (script-io ?sc ?in1 ?in2 ?out)
        (data-size ?out ?size)
        (capacity ?s ?limit)
        (sum ?before ?size ?after)
        (less-equal ?after ?limit)
        (cached ?in1 ?s)
        (cached ?in2 ?s)
        (not (cached ?out ?s))
        (usage ?s ?before)
    )
    :effect
    (and
        (cached ?out ?s)
        (not (usage ?s ?before))
        (usage ?s ?after)
        (increase (total-cost) (process-cost ?sc ?s))
    )
)

)