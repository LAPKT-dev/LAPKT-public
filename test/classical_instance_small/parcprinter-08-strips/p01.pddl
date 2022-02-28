(define (problem printjob)
(:domain upp)
(:objects
		dummy-sheet
		sheet1 - sheet_t
		image-1 - image_t
)
(:init
		(uninitialized)
		(= (total-cost) 0)
		(oppositeside front back)
		(oppositeside back front)
		(location dummy-sheet some_finisher_tray)
		(prevsheet sheet1 dummy-sheet)
		(sheetsize sheet1 letter)
		(location sheet1 some_feeder_tray)
		(imagecolor image-1 black)
		(notprintedwith sheet1 front black)
		(notprintedwith sheet1 back black)
		(notprintedwith sheet1 front color)
		(notprintedwith sheet1 back color)
)
(:goal (and
		(hasimage sheet1 front image-1)
		(notprintedwith sheet1 front color)
		(notprintedwith sheet1 back black)
		(notprintedwith sheet1 back color)
		(sideup sheet1 front)
		(stackedin sheet1 finisher1_tray))
)
(:metric minimize (total-cost))
)
