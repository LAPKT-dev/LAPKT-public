 
;; this problem instance specifies a 
;; particular communication protocol 
;; that is compiled from promela source 
;; (c) stefan edelkamp, 2004 
 
(define (problem instance)
(:domain protocol)
(:objects
           ;; available processes 
 
          down_station-0 
          down_station-1 
           - process 
 
          up_station-2 
          up_station-3 
           - process 
 
           ;; available comunication channels 
 
          down-0-
          station-control-0-
          up-0-
          down-1-
          station-control-1-
          up-1-
           - queue
 
           ;; available comunication channels types 
 
          queue-1
           - queuetype
 
           ;; available queue cells 
 
          qs-0
           - queue-state
           ;; available message types 
 
          empty
          start
          control
          attention
          data
          stop
           - message
 
           ;; available number tags 
 
          zero
          one
           - number_
 

           ;; available process types 
 
          down_station
          up_station
           - proctype

           ;; possible local states 
 
          state-25
          state-2
          state-14
          state-3
          state-8
          state-5
          state-11
          state-12
          state-15
          state-20
          state-17
          state-23
          state-24
           - state

           ;; possible state transitions 
 
          down-_-pid_2_-rstart
          station-control-_-pid_2_-wcontrol
          up-_-pid_2_-wattention
          down-_-pid_2_-rdata
          down-_-pid_2_-rstop
          up-_-pid_2_-wdata
          up-_-pid_2_-wstop
          station-control-_-pid_2_-rcontrol
          up-_-pid_2_-wstart
          down-_-pid_2_-rattention
          up-__-pidp1__2_-rstart
          down-__-pidp1__2_-wattention
          up-__-pidp1__2_-rdata
          up-__-pidp1__2_-rstop
          down-__-pidp1__2_-wdata
          down-__-pidp1__2_-wstop
          down-__-pidp1__2_-wstart
          up-__-pidp1__2_-rattention
           - transition
)
(:init
  (queue-next queue-1 qs-0 qs-0)
  (is-not-max queue-1 zero)
  (is-max queue-1 one)

  ;; process declaration: activeness, start state, type 
 
  (pending down_station-0)
  (at-process down_station-0 state-25)
  (is-a-process down_station-0 down_station)
 
  (pending down_station-1)
  (at-process down_station-1 state-25)
  (is-a-process down_station-1 down_station)
 
  (pending up_station-2)
  (at-process up_station-2 state-25)
  (is-a-process up_station-2 up_station)
 
  (pending up_station-3)
  (at-process up_station-3 state-25)
  (is-a-process up_station-3 up_station)
 
  ;; numerics 
 
  (is-zero zero)
  (dec one zero)
  (inc zero one)
  (is-not-zero one)
  ;; queue configuration 
 
  (is-a-queue down-0- queue-1)
  (queue-head down-0- qs-0)
  (queue-tail down-0- qs-0)
  (queue-head-msg down-0- empty)
  (queue-size down-0- zero)
  (settled down-0-)

  (is-a-queue station-control-0- queue-1)
  (queue-head station-control-0- qs-0)
  (queue-tail station-control-0- qs-0)
  (queue-head-msg station-control-0- empty)
  (queue-size station-control-0- zero)
  (settled station-control-0-)

  (is-a-queue up-0- queue-1)
  (queue-head up-0- qs-0)
  (queue-tail up-0- qs-0)
  (queue-head-msg up-0- empty)
  (queue-size up-0- zero)
  (settled up-0-)

  (is-a-queue down-1- queue-1)
  (queue-head down-1- qs-0)
  (queue-tail down-1- qs-0)
  (queue-head-msg down-1- empty)
  (queue-size down-1- zero)
  (settled down-1-)

  (is-a-queue station-control-1- queue-1)
  (queue-head station-control-1- qs-0)
  (queue-tail station-control-1- qs-0)
  (queue-head-msg station-control-1- empty)
  (queue-size station-control-1- zero)
  (settled station-control-1-)

  (is-a-queue up-1- queue-1)
  (queue-head up-1- qs-0)
  (queue-tail up-1- qs-0)
  (queue-head-msg up-1- empty)
  (queue-size up-1- zero)
  (settled up-1-)

  ;; special operations 
 
  ;; queue access operations 
 
  (reads down_station-0 down-0- down-_-pid_2_-rstart)
  (trans-msg down-_-pid_2_-rstart start)
 
  (writes down_station-0 station-control-0- station-control-_-pid_2_-wcontrol)
  (trans-msg station-control-_-pid_2_-wcontrol control)
 
 
  (writes down_station-0 up-0- up-_-pid_2_-wattention)
  (trans-msg up-_-pid_2_-wattention attention)
 
  (reads down_station-0 down-0- down-_-pid_2_-rdata)
  (trans-msg down-_-pid_2_-rdata data)
 
  (reads down_station-0 down-0- down-_-pid_2_-rstop)
  (trans-msg down-_-pid_2_-rstop stop)
 
  (writes down_station-0 up-0- up-_-pid_2_-wdata)
  (trans-msg up-_-pid_2_-wdata data)
 
  (writes down_station-0 up-0- up-_-pid_2_-wstop)
  (trans-msg up-_-pid_2_-wstop stop)
 
  (reads down_station-0 station-control-0- station-control-_-pid_2_-rcontrol)
  (trans-msg station-control-_-pid_2_-rcontrol control)
 
  (writes down_station-0 up-0- up-_-pid_2_-wstart)
  (trans-msg up-_-pid_2_-wstart start)
 
  (reads down_station-0 down-0- down-_-pid_2_-rattention)
  (trans-msg down-_-pid_2_-rattention attention)
 
 
 
 
 
 
  (reads down_station-1 down-1- down-_-pid_2_-rstart)
 
  (writes down_station-1 station-control-1- station-control-_-pid_2_-wcontrol)
 
 
  (writes down_station-1 up-1- up-_-pid_2_-wattention)
 
  (reads down_station-1 down-1- down-_-pid_2_-rdata)
 
  (reads down_station-1 down-1- down-_-pid_2_-rstop)
 
  (writes down_station-1 up-1- up-_-pid_2_-wdata)
 
  (writes down_station-1 up-1- up-_-pid_2_-wstop)
 
  (reads down_station-1 station-control-1- station-control-_-pid_2_-rcontrol)
 
  (writes down_station-1 up-1- up-_-pid_2_-wstart)
 
  (reads down_station-1 down-1- down-_-pid_2_-rattention)
 
 
 
 
 
 
  (reads up_station-2 up-1- up-__-pidp1__2_-rstart)
  (trans-msg up-__-pidp1__2_-rstart start)
 
  (writes up_station-2 station-control-0- station-control-_-pid_2_-wcontrol)
 
 
  (writes up_station-2 down-1- down-__-pidp1__2_-wattention)
  (trans-msg down-__-pidp1__2_-wattention attention)
 
  (reads up_station-2 up-1- up-__-pidp1__2_-rdata)
  (trans-msg up-__-pidp1__2_-rdata data)
 
  (reads up_station-2 up-1- up-__-pidp1__2_-rstop)
  (trans-msg up-__-pidp1__2_-rstop stop)
 
  (writes up_station-2 down-1- down-__-pidp1__2_-wdata)
  (trans-msg down-__-pidp1__2_-wdata data)
 
  (writes up_station-2 down-1- down-__-pidp1__2_-wstop)
  (trans-msg down-__-pidp1__2_-wstop stop)
 
  (reads up_station-2 station-control-0- station-control-_-pid_2_-rcontrol)
 
  (writes up_station-2 down-1- down-__-pidp1__2_-wstart)
  (trans-msg down-__-pidp1__2_-wstart start)
 
  (reads up_station-2 up-1- up-__-pidp1__2_-rattention)
  (trans-msg up-__-pidp1__2_-rattention attention)
 
 
 
 
 
 
  (reads up_station-3 up-0- up-__-pidp1__2_-rstart)
 
  (writes up_station-3 station-control-1- station-control-_-pid_2_-wcontrol)
 
 
  (writes up_station-3 down-0- down-__-pidp1__2_-wattention)
 
  (reads up_station-3 up-0- up-__-pidp1__2_-rdata)
 
  (reads up_station-3 up-0- up-__-pidp1__2_-rstop)
 
  (writes up_station-3 down-0- down-__-pidp1__2_-wdata)
 
  (writes up_station-3 down-0- down-__-pidp1__2_-wstop)
 
  (reads up_station-3 station-control-1- station-control-_-pid_2_-rcontrol)
 
  (writes up_station-3 down-0- down-__-pidp1__2_-wstart)
 
  (reads up_station-3 up-0- up-__-pidp1__2_-rattention)
 
 
 
 
 
 
  ;; state transition function: state x trans -> state 
 
  (trans down_station down-_-pid_2_-rstart state-25 state-2)
  (trans down_station station-control-_-pid_2_-wcontrol state-25 state-14)
  (trans down_station station-control-_-pid_2_-wcontrol state-2 state-3)
  (trans down_station up-_-pid_2_-wattention state-3 state-8)
  (trans down_station down-_-pid_2_-rdata state-8 state-5)
  (trans down_station down-_-pid_2_-rstop state-8 state-11)
  (trans down_station up-_-pid_2_-wdata state-5 state-8)
  (trans down_station up-_-pid_2_-wstop state-11 state-12)
  (trans down_station station-control-_-pid_2_-rcontrol state-12 state-25)
  (trans down_station up-_-pid_2_-wstart state-14 state-15)
  (trans down_station down-_-pid_2_-rattention state-15 state-20)
  (trans down_station up-_-pid_2_-wdata state-20 state-17)
  (trans down_station up-_-pid_2_-wstop state-20 state-23)
  (trans down_station down-_-pid_2_-rdata state-17 state-20)
  (trans down_station down-_-pid_2_-rstop state-23 state-24)
  (trans down_station station-control-_-pid_2_-rcontrol state-24 state-25)
  (trans up_station up-__-pidp1__2_-rstart state-25 state-2)
  (trans up_station station-control-_-pid_2_-wcontrol state-25 state-14)
  (trans up_station station-control-_-pid_2_-wcontrol state-2 state-3)
  (trans up_station down-__-pidp1__2_-wattention state-3 state-8)
  (trans up_station up-__-pidp1__2_-rdata state-8 state-5)
  (trans up_station up-__-pidp1__2_-rstop state-8 state-11)
  (trans up_station down-__-pidp1__2_-wdata state-5 state-8)
  (trans up_station down-__-pidp1__2_-wstop state-11 state-12)
  (trans up_station station-control-_-pid_2_-rcontrol state-12 state-25)
  (trans up_station down-__-pidp1__2_-wstart state-14 state-15)
  (trans up_station up-__-pidp1__2_-rattention state-15 state-20)
  (trans up_station down-__-pidp1__2_-wdata state-20 state-17)
  (trans up_station down-__-pidp1__2_-wstop state-20 state-23)
  (trans up_station up-__-pidp1__2_-rdata state-17 state-20)
  (trans up_station up-__-pidp1__2_-rstop state-23 state-24)
  (trans up_station station-control-_-pid_2_-rcontrol state-24 state-25)
)
(:goal
 (and
  ;; deadlock, all local processes are blocked 
 
  (blocked down_station-0)
  (blocked down_station-1)
  (blocked up_station-2)
  (blocked up_station-3)
 )
)
)
