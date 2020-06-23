(define (domain DATA-CLEANING-DDDL-COMPILED)
  (:requirements :typing :equality :action-costs)

  (:types
   OBSERVABLE - OBJECT
   RECORD-TYPE - OBSERVABLE
   PF - OBSERVABLE
   LU - OBSERVABLE
   EMPLOYER - OBSERVABLE
   OBSERVATION - OBJECT
   COUNT - OBJECT
   HYPOTHESIS - OBJECT)

  (:constants
   START - RECORD-TYPE
   CEASE - RECORD-TYPE
   EXTEND - RECORD-TYPE
   CONVERT - RECORD-TYPE
   PART-TIME - PF
   FULL-TIME - PF
   LIMITED - LU
   UNLIMITED - LU
   LOST - OBSERVABLE
   SPURIOUS - OBSERVABLE
   SUBSTITUTION - OBSERVABLE
   M0 - COUNT
   M1 - COUNT
   M2 - COUNT)

  (:predicates
   (STATIC-TRUE)
   (PART-TIME-JOBS ?N - COUNT)
   (FULL-TIME-JOBS ?N - COUNT)
   (NEXT-COUNT ?N - COUNT ?NN - COUNT)
   (NO-CONTRACT ?E - EMPLOYER)
   (CONTRACT ?E - EMPLOYER ?F - PF ?D - LU)
   (MATCHES-4 ?O - OBSERVATION ?T ?E ?F ?D - OBSERVABLE)
   (FUTURE ?O - OBSERVATION)
   (PENDING ?O - OBSERVATION)
   (OBSERVED ?O - OBSERVATION)
   (PRECEDES ?O - OBSERVATION ?O1 - OBSERVATION)
   (FAULT-COUNT-2 ?A1 ?A2 - OBSERVABLE ?C - COUNT)
   (FAULT-COUNT-3 ?A1 ?A2 ?A3 - OBSERVABLE ?C - COUNT)
   (FAULT-COUNT-5 ?A1 ?A2 ?A3 ?A4 ?A5 - OBSERVABLE ?C - COUNT)
   (HYPOTHESIS-FAULT-COUNT-2 ?H - HYPOTHESIS ?A1 ?A2 - OBSERVABLE ?C - COUNT)
   (HYPOTHESIS-FAULT-COUNT-3 ?H - HYPOTHESIS ?A1 ?A2 ?A3 - OBSERVABLE ?C -
    COUNT)
   (HYPOTHESIS-FAULT-COUNT-5 ?H - HYPOTHESIS ?A1 ?A2 ?A3 ?A4 ?A5 - OBSERVABLE
    ?C - COUNT)
   (DOMINATES-2 ?H - HYPOTHESIS ?A1 ?A2 - OBSERVABLE)
   (DOMINATES-3 ?H - HYPOTHESIS ?A1 ?A2 ?A3 - OBSERVABLE)
   (DOMINATES-5 ?H - HYPOTHESIS ?A1 ?A2 ?A3 ?A4 ?A5 - OBSERVABLE))

  (:functions
   (TOTAL-COST))

  (:action NORMAL-START-PT-0
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS ?NC)
                      (FULL-TIME-JOBS M0)
                      (NEXT-COUNT ?NC ?NN)
                      (MATCHES-4 ?O0 START ?E PART-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-START-PT-1
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS ?NC)
                      (FULL-TIME-JOBS M0)
                      (NEXT-COUNT ?NC ?NN)
                      (FAULT-COUNT-5 LOST START ?E PART-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (FAULT-COUNT-5 LOST START ?E PART-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST START ?E PART-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST START ?E PART-TIME ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST START ?E PART-TIME ?D)))))
  )

  (:action NORMAL-START-FT-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS M0)
                      (FULL-TIME-JOBS M0)
                      (MATCHES-4 ?O0 START ?E FULL-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-START-FT-1
   :parameters (?E - EMPLOYER ?D - LU ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS M0)
                      (FULL-TIME-JOBS M0)
                      (FAULT-COUNT-5 LOST START ?E FULL-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (FAULT-COUNT-5 LOST START ?E FULL-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST START ?E FULL-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST START ?E FULL-TIME ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST START ?E FULL-TIME ?D)))))
  )

  (:action NORMAL-CEASE-PT-0
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS ?NC)
                      (NEXT-COUNT ?NN ?NC)
                      (MATCHES-4 ?O0 CEASE ?E PART-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (CONTRACT ?E PART-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-CEASE-PT-1
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS ?NC)
                      (NEXT-COUNT ?NN ?NC)
                      (FAULT-COUNT-5 LOST CEASE ?E PART-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (CONTRACT ?E PART-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (FAULT-COUNT-5 LOST CEASE ?E PART-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST CEASE ?E PART-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST CEASE ?E PART-TIME ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST CEASE ?E PART-TIME ?D)))))
  )

  (:action NORMAL-CEASE-FT-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (MATCHES-4 ?O0 CEASE ?E FULL-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (CONTRACT ?E FULL-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-CEASE-FT-1
   :parameters (?E - EMPLOYER ?D - LU ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (FAULT-COUNT-5 LOST CEASE ?E FULL-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (CONTRACT ?E FULL-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (FAULT-COUNT-5 LOST CEASE ?E FULL-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST CEASE ?E FULL-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST CEASE ?E FULL-TIME ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST CEASE ?E FULL-TIME ?D)))))
  )

  (:action NORMAL-EXTEND-0
   :parameters (?E - EMPLOYER ?F - PF ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E ?F LIMITED)
                      (MATCHES-4 ?O0 EXTEND ?E ?F LIMITED)
                      (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action NORMAL-EXTEND-1
   :parameters (?E - EMPLOYER ?F - PF ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E ?F LIMITED)
                      (FAULT-COUNT-5 LOST EXTEND ?E ?F LIMITED ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FAULT-COUNT-5 LOST EXTEND ?E ?F LIMITED ?FC0))
                (FAULT-COUNT-5 LOST EXTEND ?E ?F LIMITED ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST EXTEND ?E ?F LIMITED
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST EXTEND ?E ?F LIMITED)))))
  )

  (:action NORMAL-CONVERT-TO-FT-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS M1)
                      (FULL-TIME-JOBS M0)
                      (MATCHES-4 ?O0 CONVERT ?E FULL-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (CONTRACT ?E PART-TIME ?D))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PART-TIME-JOBS M1))
                (PART-TIME-JOBS M0)
                (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-CONVERT-TO-FT-1
   :parameters (?E - EMPLOYER ?D - LU ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS M1)
                      (FULL-TIME-JOBS M0)
                      (FAULT-COUNT-5 LOST CONVERT ?E FULL-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E PART-TIME ?D))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PART-TIME-JOBS M1))
                (PART-TIME-JOBS M0)
                (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (FAULT-COUNT-5 LOST CONVERT ?E FULL-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST CONVERT ?E FULL-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST CONVERT ?E FULL-TIME
                      ?D ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST CONVERT ?E FULL-TIME ?D)))))
  )

  (:action NORMAL-CONVERT-TO-PT-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (PART-TIME-JOBS M0)
                      (MATCHES-4 ?O0 CONVERT ?E PART-TIME ?D)
                      (PENDING ?O0))
   :effect (AND (NOT (CONTRACT ?E FULL-TIME ?D))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PART-TIME-JOBS M0))
                (PART-TIME-JOBS M1)
                (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-CONVERT-TO-PT-1
   :parameters (?E - EMPLOYER ?D - LU ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (PART-TIME-JOBS M0)
                      (FAULT-COUNT-5 LOST CONVERT ?E PART-TIME ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E FULL-TIME ?D))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PART-TIME-JOBS M0))
                (PART-TIME-JOBS M1)
                (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (FAULT-COUNT-5 LOST CONVERT ?E PART-TIME ?D ?FC0))
                (FAULT-COUNT-5 LOST CONVERT ?E PART-TIME ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST CONVERT ?E PART-TIME
                      ?D ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST CONVERT ?E PART-TIME ?D)))))
  )

  (:action NORMAL-CONVERT-DURATION-0
   :parameters (?E - EMPLOYER ?F - PF ?D - LU ?DN - LU ?O0 - OBSERVATION )
   :precondition (AND (CONTRACT ?E ?F ?D)
                      (= ?D LIMITED)
                      (NOT (= ?D ?DN))
                      (MATCHES-4 ?O0 CONVERT ?E ?F ?DN)
                      (PENDING ?O0))
   :effect (AND (NOT (CONTRACT ?E ?F ?D))
                (CONTRACT ?E ?F ?DN)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action NORMAL-CONVERT-DURATION-1
   :parameters (?E - EMPLOYER ?F - PF ?D - LU ?DN - LU ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E ?F ?D)
                      (= ?D LIMITED)
                      (NOT (= ?D ?DN))
                      (FAULT-COUNT-5 LOST CONVERT ?E ?F ?DN ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E ?F ?D))
                (CONTRACT ?E ?F ?DN)
                (NOT (FAULT-COUNT-5 LOST CONVERT ?E ?F ?DN ?FC0))
                (FAULT-COUNT-5 LOST CONVERT ?E ?F ?DN ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-5 ?HYP LOST CONVERT ?E ?F ?DN
                      ?NEW-FC0)
                   (NOT (DOMINATES-5 ?HYP LOST CONVERT ?E ?F ?DN)))))
  )

  (:action ERROR-EXTEND-1-0
   :parameters (?E - EMPLOYER ?F - PF ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E ?F LIMITED)
                      (MATCHES-4 ?O0 CONVERT ?E ?F LIMITED)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION CONVERT EXTEND ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION CONVERT EXTEND ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION CONVERT EXTEND ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION CONVERT EXTEND
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION CONVERT EXTEND)))))
  )

  (:action ERROR-START-PT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS ?NC)
                      (FULL-TIME-JOBS M0)
                      (NEXT-COUNT ?NC ?NN)
                      (MATCHES-4 ?O0 START ?E FULL-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION FULL-TIME
                      PART-TIME ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION FULL-TIME PART-TIME)))))
  )

  (:action ERROR-START-PT-2-0
   :parameters (?E - EMPLOYER ?D - LU ?DR - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS ?NC)
                      (FULL-TIME-JOBS M0)
                      (NEXT-COUNT ?NC ?NN)
                      (NOT (= ?D ?DR))
                      (MATCHES-4 ?O0 START ?E PART-TIME ?DR)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION ?DR ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION ?DR ?D)))))
  )

  (:action ERROR-START-FT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS M0)
                      (FULL-TIME-JOBS M0)
                      (MATCHES-4 ?O0 START ?E PART-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION PART-TIME
                      FULL-TIME ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION PART-TIME FULL-TIME)))))
  )

  (:action ERROR-START-FT-2-0
   :parameters (?E - EMPLOYER ?D - LU ?DR - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (NO-CONTRACT ?E)
                      (PART-TIME-JOBS M0)
                      (FULL-TIME-JOBS M0)
                      (NOT (= ?DR ?D))
                      (MATCHES-4 ?O0 START ?E FULL-TIME ?DR)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (NO-CONTRACT ?E))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION ?DR ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION ?DR ?D)))))
  )

  (:action ERROR-CEASE-PT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS ?NC)
                      (NEXT-COUNT ?NN ?NC)
                      (MATCHES-4 ?O0 CEASE ?E FULL-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (CONTRACT ?E PART-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION FULL-TIME PART-TIME ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION FULL-TIME
                      PART-TIME ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION FULL-TIME PART-TIME)))))
  )

  (:action ERROR-CEASE-PT-2-0
   :parameters (?E - EMPLOYER ?D - LU ?DR - LU ?NC - COUNT ?NN - COUNT ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS ?NC)
                      (NEXT-COUNT ?NN ?NC)
                      (NOT (= ?DR ?D))
                      (MATCHES-4 ?O0 CEASE ?E PART-TIME ?DR)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PART-TIME-JOBS ?NC))
                (PART-TIME-JOBS ?NN)
                (NOT (CONTRACT ?E PART-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION ?DR ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION ?DR ?D)))))
  )

  (:action ERROR-CEASE-FT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (MATCHES-4 ?O0 CEASE ?E PART-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (CONTRACT ?E FULL-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION PART-TIME FULL-TIME ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION PART-TIME
                      FULL-TIME ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION PART-TIME FULL-TIME)))))
  )

  (:action ERROR-CEASE-FT-2-0
   :parameters (?E - EMPLOYER ?D - LU ?DR - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (NOT (= ?DR ?D))
                      (MATCHES-4 ?O0 CEASE ?E FULL-TIME ?DR)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (CONTRACT ?E FULL-TIME ?D))
                (NO-CONTRACT ?E)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION ?DR ?D ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION ?DR ?D
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION ?DR ?D)))))
  )

  (:action ERROR-CONVERT-TO-FT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E PART-TIME ?D)
                      (PART-TIME-JOBS M1)
                      (FULL-TIME-JOBS M0)
                      (MATCHES-4 ?O0 EXTEND ?E FULL-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E PART-TIME ?D))
                (CONTRACT ?E FULL-TIME ?D)
                (NOT (PART-TIME-JOBS M1))
                (PART-TIME-JOBS M0)
                (NOT (FULL-TIME-JOBS M0))
                (FULL-TIME-JOBS M1)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION EXTEND CONVERT
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION EXTEND CONVERT)))))
  )

  (:action ERROR-CONVERT-TO-PT-1-0
   :parameters (?E - EMPLOYER ?D - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E FULL-TIME ?D)
                      (FULL-TIME-JOBS M1)
                      (PART-TIME-JOBS M0)
                      (MATCHES-4 ?O0 EXTEND ?E PART-TIME ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E FULL-TIME ?D))
                (CONTRACT ?E PART-TIME ?D)
                (NOT (PART-TIME-JOBS M0))
                (PART-TIME-JOBS M1)
                (NOT (FULL-TIME-JOBS M1))
                (FULL-TIME-JOBS M0)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION EXTEND CONVERT
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION EXTEND CONVERT)))))
  )

  (:action ERROR-CONVERT-DURATION-1-0
   :parameters (?E - EMPLOYER ?F - PF ?D - LU ?DN - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (CONTRACT ?E ?F ?D)
                      (= ?D LIMITED)
                      (NOT (= ?D ?DN))
                      (MATCHES-4 ?O0 EXTEND ?E ?F ?DN)
                      (PENDING ?O0)
                      (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (CONTRACT ?E ?F ?D))
                (CONTRACT ?E ?F ?DN)
                (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?FC0))
                (FAULT-COUNT-3 SUBSTITUTION EXTEND CONVERT ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN
                     (HYPOTHESIS-FAULT-COUNT-3 ?HYP SUBSTITUTION EXTEND CONVERT
                      ?NEW-FC0)
                   (NOT (DOMINATES-3 ?HYP SUBSTITUTION EXTEND CONVERT)))))
  )

  (:action DISCARD-0
   :parameters (?T - RECORD-TYPE ?E - EMPLOYER ?F - PF ?D - LU ?O0 - OBSERVATION ?FC0 - COUNT ?NEW-FC0 - COUNT )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?T ?E ?F ?D)
                      (PENDING ?O0)
                      (FAULT-COUNT-2 SPURIOUS ?T ?FC0)
                      (NEXT-COUNT ?FC0 ?NEW-FC0))
   :effect (AND (NOT (PENDING ?O0))
                (OBSERVED ?O0)
                (NOT (FAULT-COUNT-2 SPURIOUS ?T ?FC0))
                (FAULT-COUNT-2 SPURIOUS ?T ?NEW-FC0)
                (FORALL (?HYP - HYPOTHESIS)
                 (WHEN (HYPOTHESIS-FAULT-COUNT-2 ?HYP SPURIOUS ?T ?NEW-FC0)
                   (NOT (DOMINATES-2 ?HYP SPURIOUS ?T)))))
  )

  (:action ADVANCE-TO-OBS
   :parameters (?O - OBSERVATION )
   :precondition (AND
                  (FORALL (?O1 - OBSERVATION)
                   (IMPLY (PRECEDES ?O ?O1) (OBSERVED ?O1)))
                  (FUTURE ?O))
   :effect (AND (NOT (FUTURE ?O)) (PENDING ?O))
  )
 )
