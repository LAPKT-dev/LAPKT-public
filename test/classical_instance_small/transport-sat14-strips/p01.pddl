; transport city-sequential-50nodes-1000size-4degree-100mindistance-4trucks-25packages-2014seed

(define (problem transport-city-sequential-50nodes-1000size-4degree-100mindistance-4trucks-25packages-2014seed)
 (:domain transport)
 (:objects
  city-loc-1 - location
  city-loc-2 - location
  city-loc-3 - location
  city-loc-4 - location
  city-loc-5 - location
  city-loc-6 - location
  city-loc-7 - location
  city-loc-8 - location
  city-loc-9 - location
  city-loc-10 - location
  city-loc-11 - location
  city-loc-12 - location
  city-loc-13 - location
  city-loc-14 - location
  city-loc-15 - location
  city-loc-16 - location
  city-loc-17 - location
  city-loc-18 - location
  city-loc-19 - location
  city-loc-20 - location
  city-loc-21 - location
  city-loc-22 - location
  city-loc-23 - location
  city-loc-24 - location
  city-loc-25 - location
  city-loc-26 - location
  city-loc-27 - location
  city-loc-28 - location
  city-loc-29 - location
  city-loc-30 - location
  city-loc-31 - location
  city-loc-32 - location
  city-loc-33 - location
  city-loc-34 - location
  city-loc-35 - location
  city-loc-36 - location
  city-loc-37 - location
  city-loc-38 - location
  city-loc-39 - location
  city-loc-40 - location
  city-loc-41 - location
  city-loc-42 - location
  city-loc-43 - location
  city-loc-44 - location
  city-loc-45 - location
  city-loc-46 - location
  city-loc-47 - location
  city-loc-48 - location
  city-loc-49 - location
  city-loc-50 - location
  truck-1 - vehicle
  truck-2 - vehicle
  truck-3 - vehicle
  truck-4 - vehicle
  package-1 - package
  package-2 - package
  package-3 - package
  package-4 - package
  package-5 - package
  package-6 - package
  package-7 - package
  package-8 - package
  package-9 - package
  package-10 - package
  package-11 - package
  package-12 - package
  package-13 - package
  package-14 - package
  package-15 - package
  package-16 - package
  package-17 - package
  package-18 - package
  package-19 - package
  package-20 - package
  package-21 - package
  package-22 - package
  package-23 - package
  package-24 - package
  package-25 - package
  capacity-0 - capacity-number
  capacity-1 - capacity-number
  capacity-2 - capacity-number
  capacity-3 - capacity-number
  capacity-4 - capacity-number
 )
 (:init
  (= (total-cost) 0)
  (capacity-predecessor capacity-0 capacity-1)
  (capacity-predecessor capacity-1 capacity-2)
  (capacity-predecessor capacity-2 capacity-3)
  (capacity-predecessor capacity-3 capacity-4)
  ; 92,243 -> 22,400
  (road city-loc-8 city-loc-4)
  (= (road-length city-loc-8 city-loc-4) 18)
  ; 22,400 -> 92,243
  (road city-loc-4 city-loc-8)
  (= (road-length city-loc-4 city-loc-8) 18)
  ; 227,260 -> 315,398
  (road city-loc-9 city-loc-1)
  (= (road-length city-loc-9 city-loc-1) 17)
  ; 315,398 -> 227,260
  (road city-loc-1 city-loc-9)
  (= (road-length city-loc-1 city-loc-9) 17)
  ; 227,260 -> 92,243
  (road city-loc-9 city-loc-8)
  (= (road-length city-loc-9 city-loc-8) 14)
  ; 92,243 -> 227,260
  (road city-loc-8 city-loc-9)
  (= (road-length city-loc-8 city-loc-9) 14)
  ; 688,479 -> 753,644
  (road city-loc-12 city-loc-11)
  (= (road-length city-loc-12 city-loc-11) 18)
  ; 753,644 -> 688,479
  (road city-loc-11 city-loc-12)
  (= (road-length city-loc-11 city-loc-12) 18)
  ; 197,108 -> 92,243
  (road city-loc-13 city-loc-8)
  (= (road-length city-loc-13 city-loc-8) 18)
  ; 92,243 -> 197,108
  (road city-loc-8 city-loc-13)
  (= (road-length city-loc-8 city-loc-13) 18)
  ; 197,108 -> 227,260
  (road city-loc-13 city-loc-9)
  (= (road-length city-loc-13 city-loc-9) 16)
  ; 227,260 -> 197,108
  (road city-loc-9 city-loc-13)
  (= (road-length city-loc-9 city-loc-13) 16)
  ; 630,336 -> 471,258
  (road city-loc-14 city-loc-7)
  (= (road-length city-loc-14 city-loc-7) 18)
  ; 471,258 -> 630,336
  (road city-loc-7 city-loc-14)
  (= (road-length city-loc-7 city-loc-14) 18)
  ; 630,336 -> 688,479
  (road city-loc-14 city-loc-12)
  (= (road-length city-loc-14 city-loc-12) 16)
  ; 688,479 -> 630,336
  (road city-loc-12 city-loc-14)
  (= (road-length city-loc-12 city-loc-14) 16)
  ; 66,817 -> 125,677
  (road city-loc-15 city-loc-5)
  (= (road-length city-loc-15 city-loc-5) 16)
  ; 125,677 -> 66,817
  (road city-loc-5 city-loc-15)
  (= (road-length city-loc-5 city-loc-15) 16)
  ; 793,194 -> 680,79
  (road city-loc-17 city-loc-10)
  (= (road-length city-loc-17 city-loc-10) 17)
  ; 680,79 -> 793,194
  (road city-loc-10 city-loc-17)
  (= (road-length city-loc-10 city-loc-17) 17)
  ; 793,194 -> 878,76
  (road city-loc-17 city-loc-16)
  (= (road-length city-loc-17 city-loc-16) 15)
  ; 878,76 -> 793,194
  (road city-loc-16 city-loc-17)
  (= (road-length city-loc-16 city-loc-17) 15)
  ; 166,870 -> 66,817
  (road city-loc-18 city-loc-15)
  (= (road-length city-loc-18 city-loc-15) 12)
  ; 66,817 -> 166,870
  (road city-loc-15 city-loc-18)
  (= (road-length city-loc-15 city-loc-18) 12)
  ; 833,827 -> 916,940
  (road city-loc-19 city-loc-2)
  (= (road-length city-loc-19 city-loc-2) 14)
  ; 916,940 -> 833,827
  (road city-loc-2 city-loc-19)
  (= (road-length city-loc-2 city-loc-19) 14)
  ; 41,918 -> 66,817
  (road city-loc-20 city-loc-15)
  (= (road-length city-loc-20 city-loc-15) 11)
  ; 66,817 -> 41,918
  (road city-loc-15 city-loc-20)
  (= (road-length city-loc-15 city-loc-20) 11)
  ; 41,918 -> 166,870
  (road city-loc-20 city-loc-18)
  (= (road-length city-loc-20 city-loc-18) 14)
  ; 166,870 -> 41,918
  (road city-loc-18 city-loc-20)
  (= (road-length city-loc-18 city-loc-20) 14)
  ; 229,555 -> 315,398
  (road city-loc-21 city-loc-1)
  (= (road-length city-loc-21 city-loc-1) 18)
  ; 315,398 -> 229,555
  (road city-loc-1 city-loc-21)
  (= (road-length city-loc-1 city-loc-21) 18)
  ; 229,555 -> 125,677
  (road city-loc-21 city-loc-5)
  (= (road-length city-loc-21 city-loc-5) 16)
  ; 125,677 -> 229,555
  (road city-loc-5 city-loc-21)
  (= (road-length city-loc-5 city-loc-21) 16)
  ; 473,386 -> 315,398
  (road city-loc-22 city-loc-1)
  (= (road-length city-loc-22 city-loc-1) 16)
  ; 315,398 -> 473,386
  (road city-loc-1 city-loc-22)
  (= (road-length city-loc-1 city-loc-22) 16)
  ; 473,386 -> 471,258
  (road city-loc-22 city-loc-7)
  (= (road-length city-loc-22 city-loc-7) 13)
  ; 471,258 -> 473,386
  (road city-loc-7 city-loc-22)
  (= (road-length city-loc-7 city-loc-22) 13)
  ; 473,386 -> 630,336
  (road city-loc-22 city-loc-14)
  (= (road-length city-loc-22 city-loc-14) 17)
  ; 630,336 -> 473,386
  (road city-loc-14 city-loc-22)
  (= (road-length city-loc-14 city-loc-22) 17)
  ; 808,977 -> 916,940
  (road city-loc-23 city-loc-2)
  (= (road-length city-loc-23 city-loc-2) 12)
  ; 916,940 -> 808,977
  (road city-loc-2 city-loc-23)
  (= (road-length city-loc-2 city-loc-23) 12)
  ; 808,977 -> 833,827
  (road city-loc-23 city-loc-19)
  (= (road-length city-loc-23 city-loc-19) 16)
  ; 833,827 -> 808,977
  (road city-loc-19 city-loc-23)
  (= (road-length city-loc-19 city-loc-23) 16)
  ; 154,357 -> 315,398
  (road city-loc-24 city-loc-1)
  (= (road-length city-loc-24 city-loc-1) 17)
  ; 315,398 -> 154,357
  (road city-loc-1 city-loc-24)
  (= (road-length city-loc-1 city-loc-24) 17)
  ; 154,357 -> 22,400
  (road city-loc-24 city-loc-4)
  (= (road-length city-loc-24 city-loc-4) 14)
  ; 22,400 -> 154,357
  (road city-loc-4 city-loc-24)
  (= (road-length city-loc-4 city-loc-24) 14)
  ; 154,357 -> 92,243
  (road city-loc-24 city-loc-8)
  (= (road-length city-loc-24 city-loc-8) 13)
  ; 92,243 -> 154,357
  (road city-loc-8 city-loc-24)
  (= (road-length city-loc-8 city-loc-24) 13)
  ; 154,357 -> 227,260
  (road city-loc-24 city-loc-9)
  (= (road-length city-loc-24 city-loc-9) 13)
  ; 227,260 -> 154,357
  (road city-loc-9 city-loc-24)
  (= (road-length city-loc-9 city-loc-24) 13)
  ; 304,703 -> 427,691
  (road city-loc-26 city-loc-3)
  (= (road-length city-loc-26 city-loc-3) 13)
  ; 427,691 -> 304,703
  (road city-loc-3 city-loc-26)
  (= (road-length city-loc-3 city-loc-26) 13)
  ; 304,703 -> 125,677
  (road city-loc-26 city-loc-5)
  (= (road-length city-loc-26 city-loc-5) 19)
  ; 125,677 -> 304,703
  (road city-loc-5 city-loc-26)
  (= (road-length city-loc-5 city-loc-26) 19)
  ; 304,703 -> 229,555
  (road city-loc-26 city-loc-21)
  (= (road-length city-loc-26 city-loc-21) 17)
  ; 229,555 -> 304,703
  (road city-loc-21 city-loc-26)
  (= (road-length city-loc-21 city-loc-26) 17)
  ; 966,771 -> 916,940
  (road city-loc-27 city-loc-2)
  (= (road-length city-loc-27 city-loc-2) 18)
  ; 916,940 -> 966,771
  (road city-loc-2 city-loc-27)
  (= (road-length city-loc-2 city-loc-27) 18)
  ; 966,771 -> 833,827
  (road city-loc-27 city-loc-19)
  (= (road-length city-loc-27 city-loc-19) 15)
  ; 833,827 -> 966,771
  (road city-loc-19 city-loc-27)
  (= (road-length city-loc-19 city-loc-27) 15)
  ; 86,51 -> 197,108
  (road city-loc-28 city-loc-13)
  (= (road-length city-loc-28 city-loc-13) 13)
  ; 197,108 -> 86,51
  (road city-loc-13 city-loc-28)
  (= (road-length city-loc-13 city-loc-28) 13)
  ; 836,431 -> 973,444
  (road city-loc-29 city-loc-6)
  (= (road-length city-loc-29 city-loc-6) 14)
  ; 973,444 -> 836,431
  (road city-loc-6 city-loc-29)
  (= (road-length city-loc-6 city-loc-29) 14)
  ; 836,431 -> 688,479
  (road city-loc-29 city-loc-12)
  (= (road-length city-loc-29 city-loc-12) 16)
  ; 688,479 -> 836,431
  (road city-loc-12 city-loc-29)
  (= (road-length city-loc-12 city-loc-29) 16)
  ; 374,69 -> 197,108
  (road city-loc-30 city-loc-13)
  (= (road-length city-loc-30 city-loc-13) 19)
  ; 197,108 -> 374,69
  (road city-loc-13 city-loc-30)
  (= (road-length city-loc-13 city-loc-30) 19)
  ; 659,724 -> 753,644
  (road city-loc-31 city-loc-11)
  (= (road-length city-loc-31 city-loc-11) 13)
  ; 753,644 -> 659,724
  (road city-loc-11 city-loc-31)
  (= (road-length city-loc-11 city-loc-31) 13)
  ; 560,131 -> 471,258
  (road city-loc-32 city-loc-7)
  (= (road-length city-loc-32 city-loc-7) 16)
  ; 471,258 -> 560,131
  (road city-loc-7 city-loc-32)
  (= (road-length city-loc-7 city-loc-32) 16)
  ; 560,131 -> 680,79
  (road city-loc-32 city-loc-10)
  (= (road-length city-loc-32 city-loc-10) 14)
  ; 680,79 -> 560,131
  (road city-loc-10 city-loc-32)
  (= (road-length city-loc-10 city-loc-32) 14)
  ; 640,921 -> 808,977
  (road city-loc-33 city-loc-23)
  (= (road-length city-loc-33 city-loc-23) 18)
  ; 808,977 -> 640,921
  (road city-loc-23 city-loc-33)
  (= (road-length city-loc-23 city-loc-33) 18)
  ; 640,921 -> 466,905
  (road city-loc-33 city-loc-25)
  (= (road-length city-loc-33 city-loc-25) 18)
  ; 466,905 -> 640,921
  (road city-loc-25 city-loc-33)
  (= (road-length city-loc-25 city-loc-33) 18)
  ; 727,302 -> 688,479
  (road city-loc-34 city-loc-12)
  (= (road-length city-loc-34 city-loc-12) 19)
  ; 688,479 -> 727,302
  (road city-loc-12 city-loc-34)
  (= (road-length city-loc-12 city-loc-34) 19)
  ; 727,302 -> 630,336
  (road city-loc-34 city-loc-14)
  (= (road-length city-loc-34 city-loc-14) 11)
  ; 630,336 -> 727,302
  (road city-loc-14 city-loc-34)
  (= (road-length city-loc-14 city-loc-34) 11)
  ; 727,302 -> 793,194
  (road city-loc-34 city-loc-17)
  (= (road-length city-loc-34 city-loc-17) 13)
  ; 793,194 -> 727,302
  (road city-loc-17 city-loc-34)
  (= (road-length city-loc-17 city-loc-34) 13)
  ; 727,302 -> 836,431
  (road city-loc-34 city-loc-29)
  (= (road-length city-loc-34 city-loc-29) 17)
  ; 836,431 -> 727,302
  (road city-loc-29 city-loc-34)
  (= (road-length city-loc-29 city-loc-34) 17)
  ; 530,579 -> 427,691
  (road city-loc-35 city-loc-3)
  (= (road-length city-loc-35 city-loc-3) 16)
  ; 427,691 -> 530,579
  (road city-loc-3 city-loc-35)
  (= (road-length city-loc-3 city-loc-35) 16)
  ; 530,579 -> 688,479
  (road city-loc-35 city-loc-12)
  (= (road-length city-loc-35 city-loc-12) 19)
  ; 688,479 -> 530,579
  (road city-loc-12 city-loc-35)
  (= (road-length city-loc-12 city-loc-35) 19)
  ; 959,210 -> 878,76
  (road city-loc-36 city-loc-16)
  (= (road-length city-loc-36 city-loc-16) 16)
  ; 878,76 -> 959,210
  (road city-loc-16 city-loc-36)
  (= (road-length city-loc-16 city-loc-36) 16)
  ; 959,210 -> 793,194
  (road city-loc-36 city-loc-17)
  (= (road-length city-loc-36 city-loc-17) 17)
  ; 793,194 -> 959,210
  (road city-loc-17 city-loc-36)
  (= (road-length city-loc-17 city-loc-36) 17)
  ; 921,550 -> 973,444
  (road city-loc-37 city-loc-6)
  (= (road-length city-loc-37 city-loc-6) 12)
  ; 973,444 -> 921,550
  (road city-loc-6 city-loc-37)
  (= (road-length city-loc-6 city-loc-37) 12)
  ; 921,550 -> 836,431
  (road city-loc-37 city-loc-29)
  (= (road-length city-loc-37 city-loc-29) 15)
  ; 836,431 -> 921,550
  (road city-loc-29 city-loc-37)
  (= (road-length city-loc-29 city-loc-37) 15)
  ; 27,701 -> 125,677
  (road city-loc-38 city-loc-5)
  (= (road-length city-loc-38 city-loc-5) 11)
  ; 125,677 -> 27,701
  (road city-loc-5 city-loc-38)
  (= (road-length city-loc-5 city-loc-38) 11)
  ; 27,701 -> 66,817
  (road city-loc-38 city-loc-15)
  (= (road-length city-loc-38 city-loc-15) 13)
  ; 66,817 -> 27,701
  (road city-loc-15 city-loc-38)
  (= (road-length city-loc-15 city-loc-38) 13)
  ; 374,777 -> 427,691
  (road city-loc-39 city-loc-3)
  (= (road-length city-loc-39 city-loc-3) 11)
  ; 427,691 -> 374,777
  (road city-loc-3 city-loc-39)
  (= (road-length city-loc-3 city-loc-39) 11)
  ; 374,777 -> 466,905
  (road city-loc-39 city-loc-25)
  (= (road-length city-loc-39 city-loc-25) 16)
  ; 466,905 -> 374,777
  (road city-loc-25 city-loc-39)
  (= (road-length city-loc-25 city-loc-39) 16)
  ; 374,777 -> 304,703
  (road city-loc-39 city-loc-26)
  (= (road-length city-loc-39 city-loc-26) 11)
  ; 304,703 -> 374,777
  (road city-loc-26 city-loc-39)
  (= (road-length city-loc-26 city-loc-39) 11)
  ; 307,925 -> 166,870
  (road city-loc-40 city-loc-18)
  (= (road-length city-loc-40 city-loc-18) 16)
  ; 166,870 -> 307,925
  (road city-loc-18 city-loc-40)
  (= (road-length city-loc-18 city-loc-40) 16)
  ; 307,925 -> 466,905
  (road city-loc-40 city-loc-25)
  (= (road-length city-loc-40 city-loc-25) 16)
  ; 466,905 -> 307,925
  (road city-loc-25 city-loc-40)
  (= (road-length city-loc-25 city-loc-40) 16)
  ; 307,925 -> 374,777
  (road city-loc-40 city-loc-39)
  (= (road-length city-loc-40 city-loc-39) 17)
  ; 374,777 -> 307,925
  (road city-loc-39 city-loc-40)
  (= (road-length city-loc-39 city-loc-40) 17)
  ; 191,755 -> 125,677
  (road city-loc-41 city-loc-5)
  (= (road-length city-loc-41 city-loc-5) 11)
  ; 125,677 -> 191,755
  (road city-loc-5 city-loc-41)
  (= (road-length city-loc-5 city-loc-41) 11)
  ; 191,755 -> 66,817
  (road city-loc-41 city-loc-15)
  (= (road-length city-loc-41 city-loc-15) 14)
  ; 66,817 -> 191,755
  (road city-loc-15 city-loc-41)
  (= (road-length city-loc-15 city-loc-41) 14)
  ; 191,755 -> 166,870
  (road city-loc-41 city-loc-18)
  (= (road-length city-loc-41 city-loc-18) 12)
  ; 166,870 -> 191,755
  (road city-loc-18 city-loc-41)
  (= (road-length city-loc-18 city-loc-41) 12)
  ; 191,755 -> 304,703
  (road city-loc-41 city-loc-26)
  (= (road-length city-loc-41 city-loc-26) 13)
  ; 304,703 -> 191,755
  (road city-loc-26 city-loc-41)
  (= (road-length city-loc-26 city-loc-41) 13)
  ; 191,755 -> 27,701
  (road city-loc-41 city-loc-38)
  (= (road-length city-loc-41 city-loc-38) 18)
  ; 27,701 -> 191,755
  (road city-loc-38 city-loc-41)
  (= (road-length city-loc-38 city-loc-41) 18)
  ; 191,755 -> 374,777
  (road city-loc-41 city-loc-39)
  (= (road-length city-loc-41 city-loc-39) 19)
  ; 374,777 -> 191,755
  (road city-loc-39 city-loc-41)
  (= (road-length city-loc-39 city-loc-41) 19)
  ; 333,294 -> 315,398
  (road city-loc-42 city-loc-1)
  (= (road-length city-loc-42 city-loc-1) 11)
  ; 315,398 -> 333,294
  (road city-loc-1 city-loc-42)
  (= (road-length city-loc-1 city-loc-42) 11)
  ; 333,294 -> 471,258
  (road city-loc-42 city-loc-7)
  (= (road-length city-loc-42 city-loc-7) 15)
  ; 471,258 -> 333,294
  (road city-loc-7 city-loc-42)
  (= (road-length city-loc-7 city-loc-42) 15)
  ; 333,294 -> 227,260
  (road city-loc-42 city-loc-9)
  (= (road-length city-loc-42 city-loc-9) 12)
  ; 227,260 -> 333,294
  (road city-loc-9 city-loc-42)
  (= (road-length city-loc-9 city-loc-42) 12)
  ; 333,294 -> 473,386
  (road city-loc-42 city-loc-22)
  (= (road-length city-loc-42 city-loc-22) 17)
  ; 473,386 -> 333,294
  (road city-loc-22 city-loc-42)
  (= (road-length city-loc-22 city-loc-42) 17)
  ; 333,294 -> 154,357
  (road city-loc-42 city-loc-24)
  (= (road-length city-loc-42 city-loc-24) 19)
  ; 154,357 -> 333,294
  (road city-loc-24 city-loc-42)
  (= (road-length city-loc-24 city-loc-42) 19)
  ; 864,302 -> 973,444
  (road city-loc-43 city-loc-6)
  (= (road-length city-loc-43 city-loc-6) 18)
  ; 973,444 -> 864,302
  (road city-loc-6 city-loc-43)
  (= (road-length city-loc-6 city-loc-43) 18)
  ; 864,302 -> 793,194
  (road city-loc-43 city-loc-17)
  (= (road-length city-loc-43 city-loc-17) 13)
  ; 793,194 -> 864,302
  (road city-loc-17 city-loc-43)
  (= (road-length city-loc-17 city-loc-43) 13)
  ; 864,302 -> 836,431
  (road city-loc-43 city-loc-29)
  (= (road-length city-loc-43 city-loc-29) 14)
  ; 836,431 -> 864,302
  (road city-loc-29 city-loc-43)
  (= (road-length city-loc-29 city-loc-43) 14)
  ; 864,302 -> 727,302
  (road city-loc-43 city-loc-34)
  (= (road-length city-loc-43 city-loc-34) 14)
  ; 727,302 -> 864,302
  (road city-loc-34 city-loc-43)
  (= (road-length city-loc-34 city-loc-43) 14)
  ; 864,302 -> 959,210
  (road city-loc-43 city-loc-36)
  (= (road-length city-loc-43 city-loc-36) 14)
  ; 959,210 -> 864,302
  (road city-loc-36 city-loc-43)
  (= (road-length city-loc-36 city-loc-43) 14)
  ; 482,61 -> 374,69
  (road city-loc-44 city-loc-30)
  (= (road-length city-loc-44 city-loc-30) 11)
  ; 374,69 -> 482,61
  (road city-loc-30 city-loc-44)
  (= (road-length city-loc-30 city-loc-44) 11)
  ; 482,61 -> 560,131
  (road city-loc-44 city-loc-32)
  (= (road-length city-loc-44 city-loc-32) 11)
  ; 560,131 -> 482,61
  (road city-loc-32 city-loc-44)
  (= (road-length city-loc-32 city-loc-44) 11)
  ; 34,596 -> 125,677
  (road city-loc-45 city-loc-5)
  (= (road-length city-loc-45 city-loc-5) 13)
  ; 125,677 -> 34,596
  (road city-loc-5 city-loc-45)
  (= (road-length city-loc-5 city-loc-45) 13)
  ; 34,596 -> 27,701
  (road city-loc-45 city-loc-38)
  (= (road-length city-loc-45 city-loc-38) 11)
  ; 27,701 -> 34,596
  (road city-loc-38 city-loc-45)
  (= (road-length city-loc-38 city-loc-45) 11)
  ; 677,826 -> 833,827
  (road city-loc-46 city-loc-19)
  (= (road-length city-loc-46 city-loc-19) 16)
  ; 833,827 -> 677,826
  (road city-loc-19 city-loc-46)
  (= (road-length city-loc-19 city-loc-46) 16)
  ; 677,826 -> 659,724
  (road city-loc-46 city-loc-31)
  (= (road-length city-loc-46 city-loc-31) 11)
  ; 659,724 -> 677,826
  (road city-loc-31 city-loc-46)
  (= (road-length city-loc-31 city-loc-46) 11)
  ; 677,826 -> 640,921
  (road city-loc-46 city-loc-33)
  (= (road-length city-loc-46 city-loc-33) 11)
  ; 640,921 -> 677,826
  (road city-loc-33 city-loc-46)
  (= (road-length city-loc-33 city-loc-46) 11)
  ; 425,577 -> 427,691
  (road city-loc-47 city-loc-3)
  (= (road-length city-loc-47 city-loc-3) 12)
  ; 427,691 -> 425,577
  (road city-loc-3 city-loc-47)
  (= (road-length city-loc-3 city-loc-47) 12)
  ; 425,577 -> 304,703
  (road city-loc-47 city-loc-26)
  (= (road-length city-loc-47 city-loc-26) 18)
  ; 304,703 -> 425,577
  (road city-loc-26 city-loc-47)
  (= (road-length city-loc-26 city-loc-47) 18)
  ; 425,577 -> 530,579
  (road city-loc-47 city-loc-35)
  (= (road-length city-loc-47 city-loc-35) 11)
  ; 530,579 -> 425,577
  (road city-loc-35 city-loc-47)
  (= (road-length city-loc-35 city-loc-47) 11)
  ; 553,698 -> 427,691
  (road city-loc-48 city-loc-3)
  (= (road-length city-loc-48 city-loc-3) 13)
  ; 427,691 -> 553,698
  (road city-loc-3 city-loc-48)
  (= (road-length city-loc-3 city-loc-48) 13)
  ; 553,698 -> 659,724
  (road city-loc-48 city-loc-31)
  (= (road-length city-loc-48 city-loc-31) 11)
  ; 659,724 -> 553,698
  (road city-loc-31 city-loc-48)
  (= (road-length city-loc-31 city-loc-48) 11)
  ; 553,698 -> 530,579
  (road city-loc-48 city-loc-35)
  (= (road-length city-loc-48 city-loc-35) 13)
  ; 530,579 -> 553,698
  (road city-loc-35 city-loc-48)
  (= (road-length city-loc-35 city-loc-48) 13)
  ; 553,698 -> 677,826
  (road city-loc-48 city-loc-46)
  (= (road-length city-loc-48 city-loc-46) 18)
  ; 677,826 -> 553,698
  (road city-loc-46 city-loc-48)
  (= (road-length city-loc-46 city-loc-48) 18)
  ; 553,698 -> 425,577
  (road city-loc-48 city-loc-47)
  (= (road-length city-loc-48 city-loc-47) 18)
  ; 425,577 -> 553,698
  (road city-loc-47 city-loc-48)
  (= (road-length city-loc-47 city-loc-48) 18)
  ; 656,230 -> 471,258
  (road city-loc-49 city-loc-7)
  (= (road-length city-loc-49 city-loc-7) 19)
  ; 471,258 -> 656,230
  (road city-loc-7 city-loc-49)
  (= (road-length city-loc-7 city-loc-49) 19)
  ; 656,230 -> 680,79
  (road city-loc-49 city-loc-10)
  (= (road-length city-loc-49 city-loc-10) 16)
  ; 680,79 -> 656,230
  (road city-loc-10 city-loc-49)
  (= (road-length city-loc-10 city-loc-49) 16)
  ; 656,230 -> 630,336
  (road city-loc-49 city-loc-14)
  (= (road-length city-loc-49 city-loc-14) 11)
  ; 630,336 -> 656,230
  (road city-loc-14 city-loc-49)
  (= (road-length city-loc-14 city-loc-49) 11)
  ; 656,230 -> 793,194
  (road city-loc-49 city-loc-17)
  (= (road-length city-loc-49 city-loc-17) 15)
  ; 793,194 -> 656,230
  (road city-loc-17 city-loc-49)
  (= (road-length city-loc-17 city-loc-49) 15)
  ; 656,230 -> 560,131
  (road city-loc-49 city-loc-32)
  (= (road-length city-loc-49 city-loc-32) 14)
  ; 560,131 -> 656,230
  (road city-loc-32 city-loc-49)
  (= (road-length city-loc-32 city-loc-49) 14)
  ; 656,230 -> 727,302
  (road city-loc-49 city-loc-34)
  (= (road-length city-loc-49 city-loc-34) 11)
  ; 727,302 -> 656,230
  (road city-loc-34 city-loc-49)
  (= (road-length city-loc-34 city-loc-49) 11)
  ; 117,502 -> 22,400
  (road city-loc-50 city-loc-4)
  (= (road-length city-loc-50 city-loc-4) 14)
  ; 22,400 -> 117,502
  (road city-loc-4 city-loc-50)
  (= (road-length city-loc-4 city-loc-50) 14)
  ; 117,502 -> 125,677
  (road city-loc-50 city-loc-5)
  (= (road-length city-loc-50 city-loc-5) 18)
  ; 125,677 -> 117,502
  (road city-loc-5 city-loc-50)
  (= (road-length city-loc-5 city-loc-50) 18)
  ; 117,502 -> 229,555
  (road city-loc-50 city-loc-21)
  (= (road-length city-loc-50 city-loc-21) 13)
  ; 229,555 -> 117,502
  (road city-loc-21 city-loc-50)
  (= (road-length city-loc-21 city-loc-50) 13)
  ; 117,502 -> 154,357
  (road city-loc-50 city-loc-24)
  (= (road-length city-loc-50 city-loc-24) 15)
  ; 154,357 -> 117,502
  (road city-loc-24 city-loc-50)
  (= (road-length city-loc-24 city-loc-50) 15)
  ; 117,502 -> 34,596
  (road city-loc-50 city-loc-45)
  (= (road-length city-loc-50 city-loc-45) 13)
  ; 34,596 -> 117,502
  (road city-loc-45 city-loc-50)
  (= (road-length city-loc-45 city-loc-50) 13)
  (at package-1 city-loc-33)
  (at package-2 city-loc-1)
  (at package-3 city-loc-16)
  (at package-4 city-loc-46)
  (at package-5 city-loc-10)
  (at package-6 city-loc-37)
  (at package-7 city-loc-35)
  (at package-8 city-loc-3)
  (at package-9 city-loc-38)
  (at package-10 city-loc-18)
  (at package-11 city-loc-10)
  (at package-12 city-loc-25)
  (at package-13 city-loc-38)
  (at package-14 city-loc-9)
  (at package-15 city-loc-11)
  (at package-16 city-loc-1)
  (at package-17 city-loc-4)
  (at package-18 city-loc-10)
  (at package-19 city-loc-4)
  (at package-20 city-loc-13)
  (at package-21 city-loc-11)
  (at package-22 city-loc-14)
  (at package-23 city-loc-39)
  (at package-24 city-loc-49)
  (at package-25 city-loc-24)
  (at truck-1 city-loc-32)
  (capacity truck-1 capacity-3)
  (at truck-2 city-loc-14)
  (capacity truck-2 capacity-3)
  (at truck-3 city-loc-27)
  (capacity truck-3 capacity-2)
  (at truck-4 city-loc-45)
  (capacity truck-4 capacity-3)
 )
 (:goal (and
  (at package-1 city-loc-2)
  (at package-2 city-loc-18)
  (at package-3 city-loc-3)
  (at package-4 city-loc-27)
  (at package-5 city-loc-13)
  (at package-6 city-loc-39)
  (at package-7 city-loc-40)
  (at package-8 city-loc-6)
  (at package-9 city-loc-37)
  (at package-10 city-loc-13)
  (at package-11 city-loc-14)
  (at package-12 city-loc-16)
  (at package-13 city-loc-42)
  (at package-14 city-loc-34)
  (at package-15 city-loc-15)
  (at package-16 city-loc-43)
  (at package-17 city-loc-34)
  (at package-18 city-loc-32)
  (at package-19 city-loc-3)
  (at package-20 city-loc-44)
  (at package-21 city-loc-37)
  (at package-22 city-loc-41)
  (at package-23 city-loc-17)
  (at package-24 city-loc-23)
  (at package-25 city-loc-3)
 ))
 (:metric minimize (total-cost))
)
