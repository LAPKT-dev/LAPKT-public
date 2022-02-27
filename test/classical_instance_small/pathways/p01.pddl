;; note [malte]: i modified this file from the original ipc file
;; because it contained duplicate object definitions. please check the
;; repository log for the revision where this comment was added for
;; details.

(define (problem pathways-01)
(:domain pathways-propositional)
(:objects
	sp1 - simple
	raf1 - simple
	prbp2 - simple
	prb-e2f4p1-dp12 - simple
	pcaf - simple
	p300 - simple
	p16 - simple
	p130-e2f5p1-dp12 - simple
	e2f13 - simple
	dmp1 - simple
	chk1 - simple
	cdk7 - simple
	cdk46p3-cycdp1 - simple
	cdk46p3-cycd - simple
	cdc25c - simple
	ap2 - simple
	dmp1p1 - complex
	cdc25cp2 - complex
	p16-cdk7 - complex
	;; pcaf-p300 - complex ;; duplicate
	prbp2-ap2 - complex
	prbp1p2 - complex
	raf1-p130-e2f5p1-dp12 - complex
	raf1-prb-e2f4p1-dp12 - complex
	sp1-e2f13 - complex
	l0 - level
	l1 - level
	l2 - level
	l3 - level)


(:init
	(possible sp1)
	(possible raf1)
	(possible prbp2)
	(possible prb-e2f4p1-dp12)
	(possible pcaf)
	(possible p300)
	(possible p16)
	(possible p130-e2f5p1-dp12)
	(possible e2f13)
	(possible dmp1)
	(possible chk1)
	(possible cdk7)
	(possible cdk46p3-cycdp1)
	(possible cdk46p3-cycd)
	(possible cdc25c)
	(possible ap2)
	(catalyzed-association-reaction cdc25c chk1 cdc25cp2)
	(catalyzed-association-reaction dmp1 cdk46p3-cycd dmp1p1)
	(catalyzed-association-reaction dmp1 cdk46p3-cycdp1 dmp1p1)
	(association-reaction p16 cdk7 p16-cdk7)
	(association-reaction pcaf p300 pcaf-p300)
	(association-reaction prbp1p2 ap2 prbp1p2-ap2)
	(association-reaction prbp2 ap2 prbp2-ap2)
	(catalyzed-association-reaction prbp2 cdk46p3-cycdp1 prbp1p2)
	(catalyzed-association-reaction prbp2 cdk46p3-cycd prbp1p2)
	(association-reaction raf1 p130-e2f5p1-dp12 raf1-p130-e2f5p1-dp12)
	(association-reaction raf1 prb-e2f4p1-dp12 raf1-prb-e2f4p1-dp12)
	(association-reaction sp1 e2f13 sp1-e2f13)
	(num-subs l0)
	(next l1 l0)
	(next l2 l1)
	(next l3 l2))


(:goal
	(and
	(goal1)))

)