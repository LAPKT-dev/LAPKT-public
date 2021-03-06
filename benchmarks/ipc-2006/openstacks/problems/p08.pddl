
(define (problem os-sequencedstrips-nwrssmaller4-3)
        (:domain openstacks-sequencedstrips)
        (:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 - count
         o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 o14 o15 - order p1 p2 p3 p4
         p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23
         p24 p25 - product)
        (:init (machine-available) (next-count n0 n1) (next-count n1 n2)
         (next-count n2 n3) (next-count n3 n4) (next-count n4 n5)
         (next-count n5 n6) (next-count n6 n7) (next-count n7 n8)
         (next-count n8 n9) (next-count n9 n10) (next-count n10 n11)
         (next-count n11 n12) (next-count n12 n13) (next-count n13 n14)
         (next-count n14 n15) (stacks-avail n0) (waiting o1) (includes o1 p2)
         (includes o1 p9) (includes o1 p10) (includes o1 p12) (includes o1 p23)
         (includes o1 p24) (waiting o2) (includes o2 p3) (includes o2 p8)
         (includes o2 p14) (includes o2 p17) (includes o2 p18)
         (includes o2 p25) (waiting o3) (includes o3 p5) (includes o3 p7)
         (includes o3 p13) (includes o3 p16) (includes o3 p21)
         (includes o3 p22) (waiting o4) (includes o4 p2) (includes o4 p4)
         (includes o4 p12) (includes o4 p17) (includes o4 p19)
         (includes o4 p25) (waiting o5) (includes o5 p1) (includes o5 p9)
         (includes o5 p10) (includes o5 p12) (includes o5 p19)
         (includes o5 p23) (waiting o6) (includes o6 p6) (includes o6 p7)
         (includes o6 p13) (includes o6 p15) (includes o6 p16)
         (includes o6 p21) (waiting o7) (includes o7 p1) (includes o7 p10)
         (includes o7 p15) (includes o7 p16) (includes o7 p22)
         (includes o7 p23) (waiting o8) (includes o8 p6) (includes o8 p7)
         (includes o8 p13) (includes o8 p15) (includes o8 p16)
         (includes o8 p21) (waiting o9) (includes o9 p5) (includes o9 p6)
         (includes o9 p7) (includes o9 p11) (includes o9 p13) (includes o9 p15)
         (waiting o10) (includes o10 p5) (includes o10 p9) (includes o10 p15)
         (includes o10 p16) (includes o10 p22) (includes o10 p23) (waiting o11)
         (includes o11 p4) (includes o11 p8) (includes o11 p14)
         (includes o11 p17) (includes o11 p20) (includes o11 p25) (waiting o12)
         (includes o12 p1) (includes o12 p5) (includes o12 p7)
         (includes o12 p15) (includes o12 p21) (includes o12 p22) (waiting o13)
         (includes o13 p1) (includes o13 p9) (includes o13 p10)
         (includes o13 p16) (includes o13 p22) (includes o13 p24) (waiting o14)
         (includes o14 p4) (includes o14 p8) (includes o14 p10)
         (includes o14 p12) (includes o14 p19) (includes o14 p24) (waiting o15)
         (includes o15 p2) (includes o15 p4) (includes o15 p8)
         (includes o15 p12) (includes o15 p17) (includes o15 p18))
        (:goal
         (and (shipped o1)
              (shipped o2)
              (shipped o3)
              (shipped o4)
              (shipped o5)
              (shipped o6)
              (shipped o7)
              (shipped o8)
              (shipped o9)
              (shipped o10)
              (shipped o11)
              (shipped o12)
              (shipped o13)
              (shipped o14)
              (shipped o15))))
