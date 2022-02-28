(define (problem dlog-2-2-2)
	(:domain driverlog)
	(:objects
	driver1
	driver2
	truck1
	truck2
	package1
	package2
	s0
	s1
	s2
	p1-0
	p1-2
	)
	(:init
	(at driver1 s2)
	(driver driver1)
	(at driver2 s2)
	(driver driver2)
	(at truck1 s0)
	(empty truck1)
	(truck truck1)
	(at truck2 s0)
	(empty truck2)
	(truck truck2)
	(at package1 s0)
	(obj package1)
	(at package2 s0)
	(obj package2)
	(location s0)
	(location s1)
	(location s2)
	(location p1-0)
	(location p1-2)
	(path s1 p1-0)
	(path p1-0 s1)
	(path s0 p1-0)
	(path p1-0 s0)
	(path s1 p1-2)
	(path p1-2 s1)
	(path s2 p1-2)
	(path p1-2 s2)
	(link s0 s1)
	(link s1 s0)
	(link s0 s2)
	(link s2 s0)
	(link s2 s1)
	(link s1 s2)
)
	(:goal (and
	(at driver1 s1)
	(at truck1 s1)
	(at package1 s0)
	(at package2 s0)
	))


)
