(define (problem ER-problem-patient2doc)
    (:domain ER-domain)
    (:objects   main-enterance
                main-admission
                main-corridor
                main-triage
                
                waiting-room
                bathrooms-patients
                bathrooms-staff
                staff-lounge
                storage-equipment
                admin-checkout
                
                ambulance-enterance
                ambulance-admission
                ambulance-triage
                ambulance-corridor
                
                consulting-room-1
                consulting-room-2
                consulting-room-3
                consulting-room-4
                consulting-corridor
                
                bed-1 bed-2 bed-3
                bed-4 bed-5 bed-6
                bed-7
                bed-corridor
                
                examination-xray
                operating-room
                operating-corridor
                
                
                robot
                human
                error2solve
                topic
                patient-data
                request-done
                patient-request
                water
                accompany
                appt-time
                leave-water
                completed-req
                leave-patient
                )

    (:init  (adj main-corridor main-admission) (adj main-admission main-corridor)
            (adj main-corridor admin-checkout) (adj admin-checkout main-corridor)
            (adj main-corridor main-triage) (adj main-triage main-corridor) 
            (adj main-corridor main-enterance) (adj main-enterance main-corridor) 
            (adj main-corridor waiting-room) (adj waiting-room main-corridor) 
            (adj main-corridor bathrooms-patients) (adj bathrooms-patients main-corridor)
            
            (adj waiting-room bathrooms-patients) (adj bathrooms-patients waiting-room)
            (adj bathrooms-staff staff-lounge) (adj staff-lounge bathrooms-staff)
            (adj main-admission admin-checkout) (adj admin-checkout main-admission)
            
            (adj main-corridor ambulance-corridor) (adj ambulance-corridor main-corridor)
            (adj ambulance-corridor consulting-corridor) (adj consulting-corridor ambulance-corridor)
            (adj consulting-corridor operating-corridor) (adj operating-corridor consulting-corridor)
            (adj operating-corridor bed-corridor) (adj bed-corridor operating-corridor)
            (adj bed-corridor ambulance-corridor) (adj ambulance-corridor bed-corridor)
            
            (adj ambulance-corridor ambulance-triage) (adj ambulance-triage ambulance-corridor)
            (adj ambulance-corridor storage-equipment) (adj storage-equipment ambulance-corridor)
            (adj ambulance-corridor ambulance-enterance) (adj ambulance-enterance ambulance-corridor)
            (adj ambulance-corridor ambulance-admission) (adj ambulance-admission ambulance-corridor)
            (adj ambulance-corridor bathrooms-staff) (adj bathrooms-staff ambulance-corridor)
            (adj ambulance-corridor staff-lounge) (adj staff-lounge ambulance-corridor)
            
            (adj consulting-corridor consulting-room-1) (adj consulting-room-1 consulting-corridor)
            (adj consulting-corridor consulting-room-2) (adj consulting-room-2 consulting-corridor)
            (adj consulting-corridor consulting-room-3) (adj consulting-room-3 consulting-corridor)
            (adj consulting-corridor consulting-room-4) (adj consulting-room-4 consulting-corridor)
            (adj consulting-corridor examination-xray) (adj examination-xray consulting-corridor)
            (adj consulting-corridor operating-room) (adj operating-room consulting-corridor)
            
            (adj operating-corridor examination-xray) (adj examination-xray operating-corridor)
            (adj operating-corridor operating-room) (adj operating-room operating-corridor)
            
            (adj examination-xray storage-equipment) (adj storage-equipment examination-xray)
            
            (adj bed-corridor bed-1) (adj bed-1 bed-corridor)
            (adj bed-corridor bed-2) (adj bed-2 bed-corridor)
            (adj bed-corridor bed-3) (adj bed-3 bed-corridor)
            (adj bed-corridor bed-4) (adj bed-4 bed-corridor)
            (adj bed-corridor bed-5) (adj bed-5 bed-corridor)
            (adj bed-corridor bed-6) (adj bed-6 bed-corridor)
            (adj bed-corridor bed-7) (adj bed-7 bed-corridor)
            (adj bed-corridor examination-xray) (adj examination-xray bed-corridor)
            (adj bed-corridor operating-room) (adj operating-room bed-corridor)
            
            (busy bed-2) (busy bed-6) (busy consulting-room-3) (busy bathrooms-patients)
            
            (at human waiting-room) 
            (person human)
            
            (at robot main-triage)
            (rob robot)
            
            (conv topic)
            ; (not (request robot human topic))
            (issue error2solve)
            ; (not (Pdata patient-data))
            ; (not (do-request leave-patient waiting-room))

            ; (Pwater water)
        
        
                    ; (request ?x ?y ?z) 
                    ;  (Preq ?patient-request ?return) 
                    ;  (req-done ?request-done)
                    ; (move-with-human ?accompany) 
                    ; (time4appt ?appt-time ?to) 


            ; (Preq leave-patient main-triage)
            
            ; (not (do-request leave-patient waiting-room))
            
            ; (time4appt appt-time consulting-room-1)
            
            
            ; (at water storage-equipment)
            ; (not (do-request leave-water storage-equipment))
            ; (Preq leave-water waiting-room)
            ; (not (req-done leave-water))
            
            ; (not (Preq leave-patient main-triage))
            ; (not (move-with-human accompany))
            ; (Preq leave-patient main-triage)
            ; (time4appt appt-time consulting-room-1)
            ; (not (req-done leave-patient))
            
            ; (not (do-request leave-patient main-triage))
            
            )

    (:goal (and (Pdata patient-data)
                (do-request leave-patient waiting-room)
                ; (at robot storage-equipment)
                
                ; (at water waiting-room)
                ; (move-with-human accompany)
                ; (req-done leave-water)
                
                ; (req-done leave-patient)
                
                ; (at robot main-triage)
                )))