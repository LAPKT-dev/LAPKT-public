(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0
	instrument0
	image1
	spectrograph2
	thermograph0
	star0
	groundstation1
	groundstation2
	phenomenon3
	phenomenon4
	star5
	phenomenon6
)
(:init
	(satellite satellite0)
	(instrument instrument0)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 groundstation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 phenomenon6)
	(mode image1)
	(mode spectrograph2)
	(mode thermograph0)
	(direction star0)
	(direction groundstation1)
	(direction groundstation2)
	(direction phenomenon3)
	(direction phenomenon4)
	(direction star5)
	(direction phenomenon6)
)
(:goal (and
	(have_image phenomenon4 thermograph0)
	(have_image star5 thermograph0)
	(have_image phenomenon6 thermograph0)
))

)
