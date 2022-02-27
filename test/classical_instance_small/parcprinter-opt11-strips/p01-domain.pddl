;; parc's modular printer domain
;; compiled into pddl by rong zhou
;; to report a problem, send email to rzhou@parc.com
;; papers:
;; 1. planning for modular printers: beyond productivity
;;	minh b. do, wheeler ruml, and rong zhou. icaps'08
;; 2. on-line planning and scheduling: an application to controlling modular printers
;;	minh b. do, wheeler ruml, and rong zhou. aaai'08
;; 3. on-line planning and scheduling for high-speed manufacturing
;;	wheeler ruml, minh b. do, and markus p.j. fromherz. icaps'05
(define (domain etipp)
(:requirements :typing :action-costs)
(:types  size_t location_t side_t color_t image_t resource_t sheet_t)
(:constants
		letter - size_t

		black
		color - color_t

		front
		back - side_t

		some_feeder_tray
		some_finisher_tray
		some_purge_tray
		fe1_exit-hw1_leftentry
		hw1_rightexit-sys_entry
		uc1_entry-hw1_topleftexit
		lc1_entry-hw1_bottomleftexit
		hw1_toprightentry-uc1_exit
		lc1_exit-hw1_bottomrightentry
		uc1_exittoime-uime_entry
		uime_exit-uc1_entryfromime
		lime_entry-lc1_exittoime
		lc1_entryfromime-lime_exit
		sys_outputtray - location_t

		fe1-rsrc
		hw1-rsrc
		uc1-rsrc
		uime-rsrc
		lc1-rsrc
		lime-rsrc
		sys-rsrc - resource_t
)
(:predicates
		(sheetsize ?sheet - sheet_t ?size - size_t)
		(location ?sheet - sheet_t ?location - location_t)
		(hasimage ?sheet - sheet_t ?side - side_t ?image - image_t)
		(sideup ?sheet - sheet_t ?side - side_t)
		(stackedin ?sheet - sheet_t ?location - location_t)
		(imagecolor ?image - image_t ?color - color_t)
		(notprintedwith ?sheet - sheet_t ?side - side_t ?color - color_t)
		(oppositeside ?side1 - side_t ?side2 - side_t)
		(available ?resource - resource_t)
		(prevsheet ?sheet1 - sheet_t ?sheet2 - sheet_t)
		(uninitialized)

)
(:functions (total-cost) - number)
(:action initialize
 :parameters ()
 :precondition (and
		(uninitialized))
 :effect (and
		(not (uninitialized))
		(available fe1-rsrc)
		(available hw1-rsrc)
		(available uc1-rsrc)
		(available uime-rsrc)
		(available lc1-rsrc)
		(available lime-rsrc)
		(available sys-rsrc))
)
(:action fe1-feedmsi-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available fe1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet some_feeder_tray))
 :effect (and
		(not (available fe1-rsrc))
		(location ?sheet fe1_exit-hw1_leftentry)
		(sideup ?sheet back)
		(not (location ?sheet some_feeder_tray))
		(available fe1-rsrc)
		(increase (total-cost) 125))
)
(:action fe1-feed-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available fe1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet some_feeder_tray))
 :effect (and
		(not (available fe1-rsrc))
		(location ?sheet fe1_exit-hw1_leftentry)
		(sideup ?sheet back)
		(not (location ?sheet some_feeder_tray))
		(available fe1-rsrc)
		(increase (total-cost) 224))
)
(:action hw1-leftentrytotopleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet fe1_exit-hw1_leftentry))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet uc1_entry-hw1_topleftexit)
		(not (location ?sheet fe1_exit-hw1_leftentry))
		(available hw1-rsrc)
		(increase (total-cost) 1499))
)
(:action hw1-leftentrytobottomleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet fe1_exit-hw1_leftentry))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet lc1_entry-hw1_bottomleftexit)
		(not (location ?sheet fe1_exit-hw1_leftentry))
		(available hw1-rsrc)
		(increase (total-cost) 1499))
)
(:action hw1-toprightentrytotopleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet hw1_toprightentry-uc1_exit))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet uc1_entry-hw1_topleftexit)
		(not (location ?sheet hw1_toprightentry-uc1_exit))
		(available hw1-rsrc)
		(increase (total-cost) 8999))
)
(:action hw1-toprightentrytobottomleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet hw1_toprightentry-uc1_exit))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet lc1_entry-hw1_bottomleftexit)
		(not (location ?sheet hw1_toprightentry-uc1_exit))
		(available hw1-rsrc)
		(increase (total-cost) 8999))
)
(:action hw1-bottomrightentrytotopleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet lc1_exit-hw1_bottomrightentry))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet uc1_entry-hw1_topleftexit)
		(not (location ?sheet lc1_exit-hw1_bottomrightentry))
		(available hw1-rsrc)
		(increase (total-cost) 8999))
)
(:action hw1-bottomrightentrytobottomleftexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet lc1_exit-hw1_bottomrightentry))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet lc1_entry-hw1_bottomleftexit)
		(not (location ?sheet lc1_exit-hw1_bottomrightentry))
		(available hw1-rsrc)
		(increase (total-cost) 8999))
)
(:action hw1-toprightentrytorightexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet hw1_toprightentry-uc1_exit))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet hw1_rightexit-sys_entry)
		(not (location ?sheet hw1_toprightentry-uc1_exit))
		(available hw1-rsrc)
		(increase (total-cost) 1499))
)
(:action hw1-bottomrightentrytorightexit-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available hw1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet lc1_exit-hw1_bottomrightentry))
 :effect (and
		(not (available hw1-rsrc))
		(location ?sheet hw1_rightexit-sys_entry)
		(not (location ?sheet lc1_exit-hw1_bottomrightentry))
		(available hw1-rsrc)
		(increase (total-cost) 1499))
)
(:action uc1-toime-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available uc1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet uc1_entry-hw1_topleftexit))
 :effect (and
		(not (available uc1-rsrc))
		(location ?sheet uc1_exittoime-uime_entry)
		(not (location ?sheet uc1_entry-hw1_topleftexit))
		(available uc1-rsrc)
		(increase (total-cost) 2999))
)
(:action uc1-inverttoime-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?otherface - side_t)
 :precondition (and
		(available uc1-rsrc)
		(sheetsize ?sheet letter)
		(oppositeside ?face ?otherface)
		(location ?sheet uc1_entry-hw1_topleftexit)
		(sideup ?sheet ?face))
 :effect (and
		(not (available uc1-rsrc))
		(location ?sheet uc1_exittoime-uime_entry)
		(sideup ?sheet ?otherface)
		(not (location ?sheet uc1_entry-hw1_topleftexit))
		(not (sideup ?sheet ?face))
		(available uc1-rsrc)
		(increase (total-cost) 8000))
)
(:action uc1-fromime-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available uc1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet uime_exit-uc1_entryfromime))
 :effect (and
		(not (available uc1-rsrc))
		(location ?sheet hw1_toprightentry-uc1_exit)
		(not (location ?sheet uime_exit-uc1_entryfromime))
		(available uc1-rsrc)
		(increase (total-cost) 2999))
)
(:action uc1-invertfromime-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?otherface - side_t)
 :precondition (and
		(available uc1-rsrc)
		(sheetsize ?sheet letter)
		(oppositeside ?face ?otherface)
		(location ?sheet uime_exit-uc1_entryfromime)
		(sideup ?sheet ?face))
 :effect (and
		(not (available uc1-rsrc))
		(location ?sheet hw1_toprightentry-uc1_exit)
		(sideup ?sheet ?otherface)
		(not (location ?sheet uime_exit-uc1_entryfromime))
		(not (sideup ?sheet ?face))
		(available uc1-rsrc)
		(increase (total-cost) 8000))
)
(:action uime-simplex-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?image - image_t)
 :precondition (and
		(available uime-rsrc)
		(sheetsize ?sheet letter)
		(sideup ?sheet ?face)
		(imagecolor ?image black)
		(location ?sheet uc1_exittoime-uime_entry)
		(notprintedwith ?sheet ?face black))
 :effect (and
		(not (available uime-rsrc))
		(location ?sheet uime_exit-uc1_entryfromime)
		(hasimage ?sheet ?face ?image)
		(not (location ?sheet uc1_exittoime-uime_entry))
		(not (notprintedwith ?sheet ?face black))
		(available uime-rsrc)
		(increase (total-cost) 127790))
)
(:action lc1-toime-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available lc1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet lc1_entry-hw1_bottomleftexit))
 :effect (and
		(not (available lc1-rsrc))
		(location ?sheet lime_entry-lc1_exittoime)
		(not (location ?sheet lc1_entry-hw1_bottomleftexit))
		(available lc1-rsrc)
		(increase (total-cost) 4999))
)
(:action lc1-inverttoime-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?otherface - side_t)
 :precondition (and
		(available lc1-rsrc)
		(sheetsize ?sheet letter)
		(oppositeside ?face ?otherface)
		(location ?sheet lc1_entry-hw1_bottomleftexit)
		(sideup ?sheet ?face))
 :effect (and
		(not (available lc1-rsrc))
		(location ?sheet lime_entry-lc1_exittoime)
		(sideup ?sheet ?otherface)
		(not (location ?sheet lc1_entry-hw1_bottomleftexit))
		(not (sideup ?sheet ?face))
		(available lc1-rsrc)
		(increase (total-cost) 9999))
)
(:action lc1-fromime-letter
 :parameters ( ?sheet - sheet_t)
 :precondition (and
		(available lc1-rsrc)
		(sheetsize ?sheet letter)
		(location ?sheet lc1_entryfromime-lime_exit))
 :effect (and
		(not (available lc1-rsrc))
		(location ?sheet lc1_exit-hw1_bottomrightentry)
		(not (location ?sheet lc1_entryfromime-lime_exit))
		(available lc1-rsrc)
		(increase (total-cost) 4999))
)
(:action lc1-invertfromime-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?otherface - side_t)
 :precondition (and
		(available lc1-rsrc)
		(sheetsize ?sheet letter)
		(oppositeside ?face ?otherface)
		(location ?sheet lc1_entryfromime-lime_exit)
		(sideup ?sheet ?face))
 :effect (and
		(not (available lc1-rsrc))
		(location ?sheet lc1_exit-hw1_bottomrightentry)
		(sideup ?sheet ?otherface)
		(not (location ?sheet lc1_entryfromime-lime_exit))
		(not (sideup ?sheet ?face))
		(available lc1-rsrc)
		(increase (total-cost) 9999))
)
(:action lime-simplex-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?image - image_t)
 :precondition (and
		(available lime-rsrc)
		(sheetsize ?sheet letter)
		(sideup ?sheet ?face)
		(imagecolor ?image color)
		(location ?sheet lime_entry-lc1_exittoime)
		(notprintedwith ?sheet ?face color))
 :effect (and
		(not (available lime-rsrc))
		(location ?sheet lc1_entryfromime-lime_exit)
		(hasimage ?sheet ?face ?image)
		(not (location ?sheet lime_entry-lc1_exittoime))
		(not (notprintedwith ?sheet ?face color))
		(available lime-rsrc)
		(increase (total-cost) 212790))
)
(:action lime-simplexmono-letter
 :parameters ( ?sheet - sheet_t ?face - side_t ?image - image_t)
 :precondition (and
		(available lime-rsrc)
		(sheetsize ?sheet letter)
		(sideup ?sheet ?face)
		(imagecolor ?image black)
		(location ?sheet lime_entry-lc1_exittoime)
		(notprintedwith ?sheet ?face black))
 :effect (and
		(not (available lime-rsrc))
		(location ?sheet lc1_entryfromime-lime_exit)
		(hasimage ?sheet ?face ?image)
		(not (location ?sheet lime_entry-lc1_exittoime))
		(not (notprintedwith ?sheet ?face black))
		(available lime-rsrc)
		(increase (total-cost) 212790))
)
(:action sys-stack-letter
 :parameters ( ?sheet - sheet_t ?prevsheet - sheet_t)
 :precondition (and
		(available sys-rsrc)
		(prevsheet ?sheet ?prevsheet)
		(location ?prevsheet some_finisher_tray)
		(sheetsize ?sheet letter)
		(location ?sheet hw1_rightexit-sys_entry))
 :effect (and
		(not (available sys-rsrc))
		(location ?sheet some_finisher_tray)
		(stackedin ?sheet sys_outputtray)
		(not (location ?sheet hw1_rightexit-sys_entry))
		(available sys-rsrc)
		(increase (total-cost) 1499))
)
)


