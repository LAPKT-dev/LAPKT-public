(define (problem initialbonds11)
(:domain organic-synthesis)
(:objects
    ; setup for problem 11
    h1 - hydrogen
    h2 - hydrogen
    h3 - hydrogen
    h4 - hydrogen
    h5 - hydrogen
    h6 - hydrogen
    c1 - carbon
    c2 - carbon
    c3 - carbon
    c4 - carbon
    c5 - carbon
    c6 - carbon
    ; H2SO4
    h9 - hydrogen
    h10 - hydrogen
    su - sulfur
    o2 - oxygen
    o3 - oxygen
    o4 - oxygen
    o5 - oxygen
    ; Nitric acid HNO3
    h11 - hydrogen
    n - nitrogen
    o6 - oxygen
    o7 - oxygen
    o8 - oxygen
    ; H2 molecule
    h12 - hydrogen
    h13 - hydrogen
    ; H2 molecule
    h50 - hydrogen
    h51 - hydrogen
    ; H2 molecule
    h52 - hydrogen
    h53 - hydrogen
    ; FeBr3
    fe1 - iron
    br1 - bromine
    br2 - bromine
    br3 - bromine
    ; Br2
    br4 - bromine
    br5 - bromine
    ; second Br2
    br9 - bromine
    br10 - bromine
    ; third Br2
    br7 - bromine
    br8 - bromine
    ; NaNO2
    na - sodium
    n2 - nitrogen
    o9 - oxygen
    o10 - oxygen
    ; HCl
    cl1 - chlorine
    h16 - hydrogen
    ; caCN
    ca1 - calcium
    c7 - carbon
    n3 - nitrogen
    ;  NaCN
    na2 - sodium
    c10 - carbon
    n4 - nitrogen
    ; water
    h18 - hydrogen
    h19 - hydrogen
    o11 - oxygen
    ; Thionyl chloride
    su1 - sulfur
    o12 - oxygen
    cl3 - chlorine
    cl2 - chlorine
    ; EtOH
    c8 - carbon
    c9 - carbon
    o13 - oxygen
    h20 - hydrogen
    h21 - hydrogen
    h22 - hydrogen
    h23 - hydrogen
    h24 - hydrogen
    h25 - hydrogen
    ; PBr3
    p - phosphorus
    br11 - bromine
    br12 - bromine
    br13 - bromine
    ; LiAlH4
    li1 - lithium
    al1 - aluminium
    h26 - hydrogen
    h27 - hydrogen
    h28 - hydrogen
    h29 - hydrogen
)
(:init
    ; setup for problem 11
    (AROMATICBOND c1 c2)
    (AROMATICBOND c2 c3)
    (AROMATICBOND c3 c4)
    (AROMATICBOND c4 c5)
    (AROMATICBOND c5 c6)
    (AROMATICBOND c6 c1)
    (AROMATICBOND c2 c1)
    (AROMATICBOND c3 c2)
    (AROMATICBOND c4 c3)
    (AROMATICBOND c5 c4)
    (AROMATICBOND c6 c5)
    (AROMATICBOND c1 c6)
    (bond c1 h1)
    (bond c2 h2)
    (bond c3 h3)
    (bond c4 h4)
    (bond c5 h5)
    (bond c6 h6)
    (bond h1 c1)
    (bond h2 c2)
    (bond h3 c3)
    (bond h4 c4)
    (bond h5 c5)
    (bond h6 c6)
    ; H2SO4
    (doublebond su o2)
    (doublebond su o3)
    (doublebond o2 su)
    (doublebond o3 su)
    (bond h9 o4)
    (bond h10 o5)
    (bond o4 h9)
    (bond o5 h10)
    (bond o4 su)
    (bond o5 su)
    (bond su o4)
    (bond su o5)
    ; Nitric acid HNO3
    (bond n o6)
    (bond n o7)
    (doublebond n o8)
    (bond o6 n)
    (bond o7 n)
    (doublebond o8 n)
    (bond o6 h11)
    (bond h11 o6)
    ; H2 molecule
    (bond h12 h13)
    (bond h13 h12)
    ; H2 molecule
    (bond h50 h51)
    (bond h51 h50)
    ; H2 molecule
    (bond h52 h53)
    (bond h53 h52)
    ; FeBr3
    (bond fe1 br1)
    (bond fe1 br2)
    (bond fe1 br3)
    (bond br1 fe1)
    (bond br2 fe1)
    (bond br3 fe1)
    ; Br2
    (bond br4 br5)
    (bond br5 br4)
    ; second Br2
    (bond br9 br10)
    (bond br10 br9)
    ; third Br2
    (bond br7 br8)
    (bond br8 br7)
    ; NaNO2
    (doublebond n2 o9)
    (doublebond o9 n2)
    (bond o10 n2)
    (bond n2 o10)
    (bond na o10)
    (bond o10 na)
    ; HCl
    (bond cl1 h16)
    (bond h16 cl1)
    ; caCN
    (bond ca1 c7)
    (bond c7 ca1)
    (triplebond c7 n3)
    (triplebond n3 c7)
    ;  NaCN
    (bond na2 c10)
    (bond c10 na2)
    (triplebond c10 n4)
    (triplebond n4 c10)
    ; water
    (bond o11 h18)
    (bond o11 h19)
    (bond h18 o11)
    (bond h19 o11)
    ; Thionyl chloride
    (doublebond su1 o12)
    (doublebond o12 su1)
    (bond cl3 su1)
    (bond cl2 su1)
    (bond su1 cl3)
    (bond su1 cl2)
    ; EtOH
    (bond c8 o13)
    (bond o13 c8)
    (bond c8 h20)
    (bond c8 h21)
    (bond h20 c8)
    (bond h21 c8)
    (bond c8 c9)
    (bond c9 c8)
    (bond c9 h22)
    (bond c9 h24)
    (bond c9 h25)
    (bond h22 c9)
    (bond h24 c9)
    (bond h25 c9)
    (bond h23 o13)
    (bond o13 h23)
    ; PBr3
    (bond p br11)
    (bond p br12)
    (bond p br13)
    (bond br11 p)
    (bond br12 p)
    (bond br13 p)
    ; LiAlH4
    (bond al1 h26)
    (bond al1 h27)
    (bond al1 h28)
    (bond al1 h29)
    (bond h26 al1)
    (bond h27 al1)
    (bond h28 al1)
    (bond h29 al1)
)
(:goal
(and
    (aromaticbond c6 c5)
    (aromaticbond c5 c4)
    (aromaticbond c4 c3)
    (aromaticbond c3 c2)
    (aromaticbond c2 c1)
    (aromaticbond c6 c1)
    (bond c1 c7)
    (bond c2 br5)
    (bond c3 h3)
    (bond c4 br8)
    (bond c5 h5)
    (bond c6 br10)
    (doublebond c7 o6)
    (bond n4 c7)
    (bond n4 c10)
    (bond n4 h50)
    (bond c10 h26)
    (bond c10 h27)
    (bond c10 c8)
    (bond c8 h20)
    (bond c8 h21)
    (bond c8 c9)
    (bond c9 h22)
    (bond c9 h24)
    (bond c9 h25)
)
)
)