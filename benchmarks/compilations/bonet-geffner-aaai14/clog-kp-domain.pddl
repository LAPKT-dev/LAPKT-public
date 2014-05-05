(define (domain logistics)
    (:predicates
        (K_at-tl_t0_l03)
        (K_not_at-tl_t0_l03)
        (K_at-tl_t1_l11)
        (K_not_at-tl_t1_l11)
        (K_at-tl_t2_l22)
        (K_not_at-tl_t2_l22)
        (K_at-ta_t3_l30)
        (K_not_at-ta_t3_l30)
        (K_at-tl_t4_l43)
        (K_not_at-tl_t4_l43)
        (K_at-aa_a0_l00)
        (K_not_at-aa_a0_l00)
        (K_at-oa_p0_l10)
        (K_not_at-oa_p0_l10)
        (K_at-ol_p0_l11)
        (K_not_at-ol_p0_l11)
        (K_at-ol_p0_l12)
        (K_not_at-ol_p0_l12)
        (K_at-ol_p0_l13)
        (K_not_at-ol_p0_l13)
        (K_at-ol_p0_l14)
        (K_not_at-ol_p0_l14)
        (K_at-oa_p0_l20)
        (K_not_at-oa_p0_l20)
        (K_at-ol_p0_l21)
        (K_not_at-ol_p0_l21)
        (K_at-ol_p0_l22)
        (K_not_at-ol_p0_l22)
        (K_at-ol_p0_l23)
        (K_not_at-ol_p0_l23)
        (K_at-ol_p0_l24)
        (K_not_at-ol_p0_l24)
        (K_at-oa_p0_l30)
        (K_not_at-oa_p0_l30)
        (K_at-ol_p0_l31)
        (K_not_at-ol_p0_l31)
        (K_at-ol_p0_l32)
        (K_not_at-ol_p0_l32)
        (K_at-ol_p0_l33)
        (K_not_at-ol_p0_l33)
        (K_at-ol_p0_l34)
        (K_not_at-ol_p0_l34)
        (K_at-oa_p0_l40)
        (K_not_at-oa_p0_l40)
        (K_at-ol_p0_l41)
        (K_not_at-ol_p0_l41)
        (K_at-ol_p0_l42)
        (K_not_at-ol_p0_l42)
        (K_at-ol_p0_l43)
        (K_not_at-ol_p0_l43)
        (K_at-ol_p0_l44)
        (K_not_at-ol_p0_l44)
        (K_in-ot_p0_t0)
        (K_not_in-ot_p0_t0)
        (K_in-ot_p0_t1)
        (K_not_in-ot_p0_t1)
        (K_in-ot_p0_t2)
        (K_not_in-ot_p0_t2)
        (K_in-ot_p0_t3)
        (K_not_in-ot_p0_t3)
        (K_in-ot_p0_t4)
        (K_not_in-ot_p0_t4)
        (K_in-oa_p0_a0)
        (K_not_in-oa_p0_a0)
        (K_at-oa_p1_l00)
        (K_not_at-oa_p1_l00)
        (K_at-ol_p1_l01)
        (K_not_at-ol_p1_l01)
        (K_at-ol_p1_l02)
        (K_not_at-ol_p1_l02)
        (K_at-ol_p1_l03)
        (K_not_at-ol_p1_l03)
        (K_at-ol_p1_l04)
        (K_not_at-ol_p1_l04)
        (K_at-oa_p1_l10)
        (K_not_at-oa_p1_l10)
        (K_at-ol_p1_l11)
        (K_not_at-ol_p1_l11)
        (K_at-ol_p1_l12)
        (K_not_at-ol_p1_l12)
        (K_at-ol_p1_l13)
        (K_not_at-ol_p1_l13)
        (K_at-ol_p1_l14)
        (K_not_at-ol_p1_l14)
        (K_at-oa_p1_l30)
        (K_not_at-oa_p1_l30)
        (K_at-ol_p1_l31)
        (K_not_at-ol_p1_l31)
        (K_at-ol_p1_l32)
        (K_not_at-ol_p1_l32)
        (K_at-ol_p1_l33)
        (K_not_at-ol_p1_l33)
        (K_at-ol_p1_l34)
        (K_not_at-ol_p1_l34)
        (K_at-oa_p1_l40)
        (K_not_at-oa_p1_l40)
        (K_at-ol_p1_l41)
        (K_not_at-ol_p1_l41)
        (K_at-ol_p1_l42)
        (K_not_at-ol_p1_l42)
        (K_at-ol_p1_l43)
        (K_not_at-ol_p1_l43)
        (K_at-ol_p1_l44)
        (K_not_at-ol_p1_l44)
        (K_in-ot_p1_t0)
        (K_not_in-ot_p1_t0)
        (K_in-ot_p1_t1)
        (K_not_in-ot_p1_t1)
        (K_in-ot_p1_t2)
        (K_not_in-ot_p1_t2)
        (K_in-ot_p1_t3)
        (K_not_in-ot_p1_t3)
        (K_in-ot_p1_t4)
        (K_not_in-ot_p1_t4)
        (K_in-oa_p1_a0)
        (K_not_in-oa_p1_a0)
        (K_at-oa_p2_l00)
        (K_not_at-oa_p2_l00)
        (K_at-ol_p2_l01)
        (K_not_at-ol_p2_l01)
        (K_at-ol_p2_l02)
        (K_not_at-ol_p2_l02)
        (K_at-ol_p2_l03)
        (K_not_at-ol_p2_l03)
        (K_at-ol_p2_l04)
        (K_not_at-ol_p2_l04)
        (K_at-oa_p2_l20)
        (K_not_at-oa_p2_l20)
        (K_at-ol_p2_l21)
        (K_not_at-ol_p2_l21)
        (K_at-ol_p2_l22)
        (K_not_at-ol_p2_l22)
        (K_at-ol_p2_l23)
        (K_not_at-ol_p2_l23)
        (K_at-ol_p2_l24)
        (K_not_at-ol_p2_l24)
        (K_at-oa_p2_l30)
        (K_not_at-oa_p2_l30)
        (K_at-ol_p2_l31)
        (K_not_at-ol_p2_l31)
        (K_at-ol_p2_l32)
        (K_not_at-ol_p2_l32)
        (K_at-ol_p2_l33)
        (K_not_at-ol_p2_l33)
        (K_at-ol_p2_l34)
        (K_not_at-ol_p2_l34)
        (K_at-oa_p2_l40)
        (K_not_at-oa_p2_l40)
        (K_at-ol_p2_l41)
        (K_not_at-ol_p2_l41)
        (K_at-ol_p2_l42)
        (K_not_at-ol_p2_l42)
        (K_at-ol_p2_l43)
        (K_not_at-ol_p2_l43)
        (K_at-ol_p2_l44)
        (K_not_at-ol_p2_l44)
        (K_in-ot_p2_t0)
        (K_not_in-ot_p2_t0)
        (K_in-ot_p2_t1)
        (K_not_in-ot_p2_t1)
        (K_in-ot_p2_t2)
        (K_not_in-ot_p2_t2)
        (K_in-ot_p2_t3)
        (K_not_in-ot_p2_t3)
        (K_in-ot_p2_t4)
        (K_not_in-ot_p2_t4)
        (K_in-oa_p2_a0)
        (K_not_in-oa_p2_a0)
        (K_at-oa_p3_l00)
        (K_not_at-oa_p3_l00)
        (K_at-ol_p3_l01)
        (K_not_at-ol_p3_l01)
        (K_at-ol_p3_l02)
        (K_not_at-ol_p3_l02)
        (K_at-ol_p3_l03)
        (K_not_at-ol_p3_l03)
        (K_at-ol_p3_l04)
        (K_not_at-ol_p3_l04)
        (K_at-oa_p3_l10)
        (K_not_at-oa_p3_l10)
        (K_at-ol_p3_l11)
        (K_not_at-ol_p3_l11)
        (K_at-ol_p3_l12)
        (K_not_at-ol_p3_l12)
        (K_at-ol_p3_l13)
        (K_not_at-ol_p3_l13)
        (K_at-ol_p3_l14)
        (K_not_at-ol_p3_l14)
        (K_at-oa_p3_l30)
        (K_not_at-oa_p3_l30)
        (K_at-ol_p3_l31)
        (K_not_at-ol_p3_l31)
        (K_at-ol_p3_l32)
        (K_not_at-ol_p3_l32)
        (K_at-ol_p3_l33)
        (K_not_at-ol_p3_l33)
        (K_at-ol_p3_l34)
        (K_not_at-ol_p3_l34)
        (K_at-oa_p3_l40)
        (K_not_at-oa_p3_l40)
        (K_at-ol_p3_l41)
        (K_not_at-ol_p3_l41)
        (K_at-ol_p3_l42)
        (K_not_at-ol_p3_l42)
        (K_at-ol_p3_l43)
        (K_not_at-ol_p3_l43)
        (K_at-ol_p3_l44)
        (K_not_at-ol_p3_l44)
        (K_in-ot_p3_t0)
        (K_not_in-ot_p3_t0)
        (K_in-ot_p3_t1)
        (K_not_in-ot_p3_t1)
        (K_in-ot_p3_t2)
        (K_not_in-ot_p3_t2)
        (K_in-ot_p3_t3)
        (K_not_in-ot_p3_t3)
        (K_in-ot_p3_t4)
        (K_not_in-ot_p3_t4)
        (K_in-oa_p3_a0)
        (K_not_in-oa_p3_a0)
        (K_at-oa_p4_l00)
        (K_not_at-oa_p4_l00)
        (K_at-ol_p4_l01)
        (K_not_at-ol_p4_l01)
        (K_at-ol_p4_l02)
        (K_not_at-ol_p4_l02)
        (K_at-ol_p4_l03)
        (K_not_at-ol_p4_l03)
        (K_at-ol_p4_l04)
        (K_not_at-ol_p4_l04)
        (K_at-oa_p4_l10)
        (K_not_at-oa_p4_l10)
        (K_at-ol_p4_l11)
        (K_not_at-ol_p4_l11)
        (K_at-ol_p4_l12)
        (K_not_at-ol_p4_l12)
        (K_at-ol_p4_l13)
        (K_not_at-ol_p4_l13)
        (K_at-ol_p4_l14)
        (K_not_at-ol_p4_l14)
        (K_at-oa_p4_l20)
        (K_not_at-oa_p4_l20)
        (K_at-ol_p4_l21)
        (K_not_at-ol_p4_l21)
        (K_at-ol_p4_l22)
        (K_not_at-ol_p4_l22)
        (K_at-ol_p4_l23)
        (K_not_at-ol_p4_l23)
        (K_at-ol_p4_l24)
        (K_not_at-ol_p4_l24)
        (K_at-oa_p4_l30)
        (K_not_at-oa_p4_l30)
        (K_at-ol_p4_l31)
        (K_not_at-ol_p4_l31)
        (K_at-ol_p4_l32)
        (K_not_at-ol_p4_l32)
        (K_at-ol_p4_l33)
        (K_not_at-ol_p4_l33)
        (K_at-ol_p4_l34)
        (K_not_at-ol_p4_l34)
        (K_in-ot_p4_t0)
        (K_not_in-ot_p4_t0)
        (K_in-ot_p4_t1)
        (K_not_in-ot_p4_t1)
        (K_in-ot_p4_t2)
        (K_not_in-ot_p4_t2)
        (K_in-ot_p4_t3)
        (K_not_in-ot_p4_t3)
        (K_in-ot_p4_t4)
        (K_not_in-ot_p4_t4)
        (K_in-oa_p4_a0)
        (K_not_in-oa_p4_a0)
        (K_normal-execution)
        (K_not_normal-execution)
        (K_at-oa_p0_l00)
        (K_not_at-oa_p0_l00)
        (K_at-oa_p1_l20)
        (K_not_at-oa_p1_l20)
        (K_at-oa_p2_l10)
        (K_not_at-oa_p2_l10)
        (K_at-oa_p3_l20)
        (K_not_at-oa_p3_l20)
        (K_at-oa_p4_l40)
        (K_not_at-oa_p4_l40)
        (K_at-ol_p4_l41)
        (K_not_at-ol_p4_l41)
        (K_at-ol_p4_l42)
        (K_not_at-ol_p4_l42)
        (K_at-ol_p4_l43)
        (K_not_at-ol_p4_l43)
        (K_at-ol_p4_l44)
        (K_not_at-ol_p4_l44)
        (K_at-ol_p3_l21)
        (K_not_at-ol_p3_l21)
        (K_at-ol_p3_l22)
        (K_not_at-ol_p3_l22)
        (K_at-ol_p3_l23)
        (K_not_at-ol_p3_l23)
        (K_at-ol_p3_l24)
        (K_not_at-ol_p3_l24)
        (K_at-ol_p2_l11)
        (K_not_at-ol_p2_l11)
        (K_at-ol_p2_l12)
        (K_not_at-ol_p2_l12)
        (K_at-ol_p2_l13)
        (K_not_at-ol_p2_l13)
        (K_at-ol_p2_l14)
        (K_not_at-ol_p2_l14)
        (K_at-ol_p1_l21)
        (K_not_at-ol_p1_l21)
        (K_at-ol_p1_l22)
        (K_not_at-ol_p1_l22)
        (K_at-ol_p1_l23)
        (K_not_at-ol_p1_l23)
        (K_at-ol_p1_l24)
        (K_not_at-ol_p1_l24)
        (K_at-ol_p0_l01)
        (K_not_at-ol_p0_l01)
        (K_at-ol_p0_l02)
        (K_not_at-ol_p0_l02)
        (K_at-ol_p0_l03)
        (K_not_at-ol_p0_l03)
        (K_at-ol_p0_l04)
        (K_not_at-ol_p0_l04)
        (K_at-tl_t4_l44)
        (K_not_at-tl_t4_l44)
        (K_need-post-atom-0)
        (K_not_need-post-atom-0)
        (K_sensing-for-at-ol_p0_l44)
        (K_not_sensing-for-at-ol_p0_l44)
        (K_sensing-for-at-ol_p1_l44)
        (K_not_sensing-for-at-ol_p1_l44)
        (K_sensing-for-at-ol_p2_l44)
        (K_not_sensing-for-at-ol_p2_l44)
        (K_sensing-for-at-ol_p3_l44)
        (K_not_sensing-for-at-ol_p3_l44)
        (K_sensing-for-at-ol_p4_l44)
        (K_not_sensing-for-at-ol_p4_l44)
        (K_need-post-atom-1)
        (K_not_need-post-atom-1)
        (K_sensing-for-at-oa_p0_l00)
        (K_not_sensing-for-at-oa_p0_l00)
        (K_sensing-for-at-oa_p1_l00)
        (K_not_sensing-for-at-oa_p1_l00)
        (K_sensing-for-at-oa_p2_l00)
        (K_not_sensing-for-at-oa_p2_l00)
        (K_sensing-for-at-oa_p3_l00)
        (K_not_sensing-for-at-oa_p3_l00)
        (K_sensing-for-at-oa_p4_l00)
        (K_not_sensing-for-at-oa_p4_l00)
        (K_at-aa_a0_l10)
        (K_not_at-aa_a0_l10)
        (K_need-post-atom-2)
        (K_not_need-post-atom-2)
        (K_sensing-for-at-oa_p0_l10)
        (K_not_sensing-for-at-oa_p0_l10)
        (K_sensing-for-at-oa_p1_l10)
        (K_not_sensing-for-at-oa_p1_l10)
        (K_sensing-for-at-oa_p2_l10)
        (K_not_sensing-for-at-oa_p2_l10)
        (K_sensing-for-at-oa_p3_l10)
        (K_not_sensing-for-at-oa_p3_l10)
        (K_sensing-for-at-oa_p4_l10)
        (K_not_sensing-for-at-oa_p4_l10)
        (K_at-aa_a0_l20)
        (K_not_at-aa_a0_l20)
        (K_need-post-atom-3)
        (K_not_need-post-atom-3)
        (K_sensing-for-at-oa_p0_l20)
        (K_not_sensing-for-at-oa_p0_l20)
        (K_sensing-for-at-oa_p1_l20)
        (K_not_sensing-for-at-oa_p1_l20)
        (K_sensing-for-at-oa_p2_l20)
        (K_not_sensing-for-at-oa_p2_l20)
        (K_sensing-for-at-oa_p3_l20)
        (K_not_sensing-for-at-oa_p3_l20)
        (K_sensing-for-at-oa_p4_l20)
        (K_not_sensing-for-at-oa_p4_l20)
        (K_at-aa_a0_l30)
        (K_not_at-aa_a0_l30)
        (K_need-post-atom-4)
        (K_not_need-post-atom-4)
        (K_sensing-for-at-oa_p0_l30)
        (K_not_sensing-for-at-oa_p0_l30)
        (K_sensing-for-at-oa_p1_l30)
        (K_not_sensing-for-at-oa_p1_l30)
        (K_sensing-for-at-oa_p2_l30)
        (K_not_sensing-for-at-oa_p2_l30)
        (K_sensing-for-at-oa_p3_l30)
        (K_not_sensing-for-at-oa_p3_l30)
        (K_sensing-for-at-oa_p4_l30)
        (K_not_sensing-for-at-oa_p4_l30)
        (K_at-aa_a0_l40)
        (K_not_at-aa_a0_l40)
        (K_need-post-atom-5)
        (K_not_need-post-atom-5)
        (K_sensing-for-at-oa_p0_l40)
        (K_not_sensing-for-at-oa_p0_l40)
        (K_sensing-for-at-oa_p1_l40)
        (K_not_sensing-for-at-oa_p1_l40)
        (K_sensing-for-at-oa_p2_l40)
        (K_not_sensing-for-at-oa_p2_l40)
        (K_sensing-for-at-oa_p3_l40)
        (K_not_sensing-for-at-oa_p3_l40)
        (K_sensing-for-at-oa_p4_l40)
        (K_not_sensing-for-at-oa_p4_l40)
        (K_at-ta_t0_l00)
        (K_not_at-ta_t0_l00)
        (K_at-tl_t0_l01)
        (K_not_at-tl_t0_l01)
        (K_need-post-atom-6)
        (K_not_need-post-atom-6)
        (K_sensing-for-at-ol_p0_l01)
        (K_not_sensing-for-at-ol_p0_l01)
        (K_sensing-for-at-ol_p1_l01)
        (K_not_sensing-for-at-ol_p1_l01)
        (K_sensing-for-at-ol_p2_l01)
        (K_not_sensing-for-at-ol_p2_l01)
        (K_sensing-for-at-ol_p3_l01)
        (K_not_sensing-for-at-ol_p3_l01)
        (K_sensing-for-at-ol_p4_l01)
        (K_not_sensing-for-at-ol_p4_l01)
        (K_at-tl_t0_l02)
        (K_not_at-tl_t0_l02)
        (K_need-post-atom-7)
        (K_not_need-post-atom-7)
        (K_sensing-for-at-ol_p0_l02)
        (K_not_sensing-for-at-ol_p0_l02)
        (K_sensing-for-at-ol_p1_l02)
        (K_not_sensing-for-at-ol_p1_l02)
        (K_sensing-for-at-ol_p2_l02)
        (K_not_sensing-for-at-ol_p2_l02)
        (K_sensing-for-at-ol_p3_l02)
        (K_not_sensing-for-at-ol_p3_l02)
        (K_sensing-for-at-ol_p4_l02)
        (K_not_sensing-for-at-ol_p4_l02)
        (K_need-post-atom-8)
        (K_not_need-post-atom-8)
        (K_sensing-for-at-ol_p0_l03)
        (K_not_sensing-for-at-ol_p0_l03)
        (K_sensing-for-at-ol_p1_l03)
        (K_not_sensing-for-at-ol_p1_l03)
        (K_sensing-for-at-ol_p2_l03)
        (K_not_sensing-for-at-ol_p2_l03)
        (K_sensing-for-at-ol_p3_l03)
        (K_not_sensing-for-at-ol_p3_l03)
        (K_sensing-for-at-ol_p4_l03)
        (K_not_sensing-for-at-ol_p4_l03)
        (K_at-tl_t0_l04)
        (K_not_at-tl_t0_l04)
        (K_need-post-atom-9)
        (K_not_need-post-atom-9)
        (K_sensing-for-at-ol_p0_l04)
        (K_not_sensing-for-at-ol_p0_l04)
        (K_sensing-for-at-ol_p1_l04)
        (K_not_sensing-for-at-ol_p1_l04)
        (K_sensing-for-at-ol_p2_l04)
        (K_not_sensing-for-at-ol_p2_l04)
        (K_sensing-for-at-ol_p3_l04)
        (K_not_sensing-for-at-ol_p3_l04)
        (K_sensing-for-at-ol_p4_l04)
        (K_not_sensing-for-at-ol_p4_l04)
        (K_at-ta_t1_l10)
        (K_not_at-ta_t1_l10)
        (K_need-post-atom-10)
        (K_not_need-post-atom-10)
        (K_sensing-for-at-ol_p0_l11)
        (K_not_sensing-for-at-ol_p0_l11)
        (K_sensing-for-at-ol_p1_l11)
        (K_not_sensing-for-at-ol_p1_l11)
        (K_sensing-for-at-ol_p2_l11)
        (K_not_sensing-for-at-ol_p2_l11)
        (K_sensing-for-at-ol_p3_l11)
        (K_not_sensing-for-at-ol_p3_l11)
        (K_sensing-for-at-ol_p4_l11)
        (K_not_sensing-for-at-ol_p4_l11)
        (K_at-tl_t1_l12)
        (K_not_at-tl_t1_l12)
        (K_need-post-atom-11)
        (K_not_need-post-atom-11)
        (K_sensing-for-at-ol_p0_l12)
        (K_not_sensing-for-at-ol_p0_l12)
        (K_sensing-for-at-ol_p1_l12)
        (K_not_sensing-for-at-ol_p1_l12)
        (K_sensing-for-at-ol_p2_l12)
        (K_not_sensing-for-at-ol_p2_l12)
        (K_sensing-for-at-ol_p3_l12)
        (K_not_sensing-for-at-ol_p3_l12)
        (K_sensing-for-at-ol_p4_l12)
        (K_not_sensing-for-at-ol_p4_l12)
        (K_at-tl_t1_l13)
        (K_not_at-tl_t1_l13)
        (K_need-post-atom-12)
        (K_not_need-post-atom-12)
        (K_sensing-for-at-ol_p0_l13)
        (K_not_sensing-for-at-ol_p0_l13)
        (K_sensing-for-at-ol_p1_l13)
        (K_not_sensing-for-at-ol_p1_l13)
        (K_sensing-for-at-ol_p2_l13)
        (K_not_sensing-for-at-ol_p2_l13)
        (K_sensing-for-at-ol_p3_l13)
        (K_not_sensing-for-at-ol_p3_l13)
        (K_sensing-for-at-ol_p4_l13)
        (K_not_sensing-for-at-ol_p4_l13)
        (K_at-tl_t1_l14)
        (K_not_at-tl_t1_l14)
        (K_need-post-atom-13)
        (K_not_need-post-atom-13)
        (K_sensing-for-at-ol_p0_l14)
        (K_not_sensing-for-at-ol_p0_l14)
        (K_sensing-for-at-ol_p1_l14)
        (K_not_sensing-for-at-ol_p1_l14)
        (K_sensing-for-at-ol_p2_l14)
        (K_not_sensing-for-at-ol_p2_l14)
        (K_sensing-for-at-ol_p3_l14)
        (K_not_sensing-for-at-ol_p3_l14)
        (K_sensing-for-at-ol_p4_l14)
        (K_not_sensing-for-at-ol_p4_l14)
        (K_at-ta_t2_l20)
        (K_not_at-ta_t2_l20)
        (K_at-tl_t2_l21)
        (K_not_at-tl_t2_l21)
        (K_need-post-atom-14)
        (K_not_need-post-atom-14)
        (K_sensing-for-at-ol_p0_l21)
        (K_not_sensing-for-at-ol_p0_l21)
        (K_sensing-for-at-ol_p1_l21)
        (K_not_sensing-for-at-ol_p1_l21)
        (K_sensing-for-at-ol_p2_l21)
        (K_not_sensing-for-at-ol_p2_l21)
        (K_sensing-for-at-ol_p3_l21)
        (K_not_sensing-for-at-ol_p3_l21)
        (K_sensing-for-at-ol_p4_l21)
        (K_not_sensing-for-at-ol_p4_l21)
        (K_need-post-atom-15)
        (K_not_need-post-atom-15)
        (K_sensing-for-at-ol_p0_l22)
        (K_not_sensing-for-at-ol_p0_l22)
        (K_sensing-for-at-ol_p1_l22)
        (K_not_sensing-for-at-ol_p1_l22)
        (K_sensing-for-at-ol_p2_l22)
        (K_not_sensing-for-at-ol_p2_l22)
        (K_sensing-for-at-ol_p3_l22)
        (K_not_sensing-for-at-ol_p3_l22)
        (K_sensing-for-at-ol_p4_l22)
        (K_not_sensing-for-at-ol_p4_l22)
        (K_at-tl_t2_l23)
        (K_not_at-tl_t2_l23)
        (K_need-post-atom-16)
        (K_not_need-post-atom-16)
        (K_sensing-for-at-ol_p0_l23)
        (K_not_sensing-for-at-ol_p0_l23)
        (K_sensing-for-at-ol_p1_l23)
        (K_not_sensing-for-at-ol_p1_l23)
        (K_sensing-for-at-ol_p2_l23)
        (K_not_sensing-for-at-ol_p2_l23)
        (K_sensing-for-at-ol_p3_l23)
        (K_not_sensing-for-at-ol_p3_l23)
        (K_sensing-for-at-ol_p4_l23)
        (K_not_sensing-for-at-ol_p4_l23)
        (K_at-tl_t2_l24)
        (K_not_at-tl_t2_l24)
        (K_need-post-atom-17)
        (K_not_need-post-atom-17)
        (K_sensing-for-at-ol_p0_l24)
        (K_not_sensing-for-at-ol_p0_l24)
        (K_sensing-for-at-ol_p1_l24)
        (K_not_sensing-for-at-ol_p1_l24)
        (K_sensing-for-at-ol_p2_l24)
        (K_not_sensing-for-at-ol_p2_l24)
        (K_sensing-for-at-ol_p3_l24)
        (K_not_sensing-for-at-ol_p3_l24)
        (K_sensing-for-at-ol_p4_l24)
        (K_not_sensing-for-at-ol_p4_l24)
        (K_at-tl_t3_l31)
        (K_not_at-tl_t3_l31)
        (K_need-post-atom-18)
        (K_not_need-post-atom-18)
        (K_sensing-for-at-ol_p0_l31)
        (K_not_sensing-for-at-ol_p0_l31)
        (K_sensing-for-at-ol_p1_l31)
        (K_not_sensing-for-at-ol_p1_l31)
        (K_sensing-for-at-ol_p2_l31)
        (K_not_sensing-for-at-ol_p2_l31)
        (K_sensing-for-at-ol_p3_l31)
        (K_not_sensing-for-at-ol_p3_l31)
        (K_sensing-for-at-ol_p4_l31)
        (K_not_sensing-for-at-ol_p4_l31)
        (K_at-tl_t3_l32)
        (K_not_at-tl_t3_l32)
        (K_need-post-atom-19)
        (K_not_need-post-atom-19)
        (K_sensing-for-at-ol_p0_l32)
        (K_not_sensing-for-at-ol_p0_l32)
        (K_sensing-for-at-ol_p1_l32)
        (K_not_sensing-for-at-ol_p1_l32)
        (K_sensing-for-at-ol_p2_l32)
        (K_not_sensing-for-at-ol_p2_l32)
        (K_sensing-for-at-ol_p3_l32)
        (K_not_sensing-for-at-ol_p3_l32)
        (K_sensing-for-at-ol_p4_l32)
        (K_not_sensing-for-at-ol_p4_l32)
        (K_at-tl_t3_l33)
        (K_not_at-tl_t3_l33)
        (K_need-post-atom-20)
        (K_not_need-post-atom-20)
        (K_sensing-for-at-ol_p0_l33)
        (K_not_sensing-for-at-ol_p0_l33)
        (K_sensing-for-at-ol_p1_l33)
        (K_not_sensing-for-at-ol_p1_l33)
        (K_sensing-for-at-ol_p2_l33)
        (K_not_sensing-for-at-ol_p2_l33)
        (K_sensing-for-at-ol_p3_l33)
        (K_not_sensing-for-at-ol_p3_l33)
        (K_sensing-for-at-ol_p4_l33)
        (K_not_sensing-for-at-ol_p4_l33)
        (K_at-tl_t3_l34)
        (K_not_at-tl_t3_l34)
        (K_need-post-atom-21)
        (K_not_need-post-atom-21)
        (K_sensing-for-at-ol_p0_l34)
        (K_not_sensing-for-at-ol_p0_l34)
        (K_sensing-for-at-ol_p1_l34)
        (K_not_sensing-for-at-ol_p1_l34)
        (K_sensing-for-at-ol_p2_l34)
        (K_not_sensing-for-at-ol_p2_l34)
        (K_sensing-for-at-ol_p3_l34)
        (K_not_sensing-for-at-ol_p3_l34)
        (K_sensing-for-at-ol_p4_l34)
        (K_not_sensing-for-at-ol_p4_l34)
        (K_at-ta_t4_l40)
        (K_not_at-ta_t4_l40)
        (K_at-tl_t4_l41)
        (K_not_at-tl_t4_l41)
        (K_need-post-atom-22)
        (K_not_need-post-atom-22)
        (K_sensing-for-at-ol_p0_l41)
        (K_not_sensing-for-at-ol_p0_l41)
        (K_sensing-for-at-ol_p1_l41)
        (K_not_sensing-for-at-ol_p1_l41)
        (K_sensing-for-at-ol_p2_l41)
        (K_not_sensing-for-at-ol_p2_l41)
        (K_sensing-for-at-ol_p3_l41)
        (K_not_sensing-for-at-ol_p3_l41)
        (K_sensing-for-at-ol_p4_l41)
        (K_not_sensing-for-at-ol_p4_l41)
        (K_at-tl_t4_l42)
        (K_not_at-tl_t4_l42)
        (K_need-post-atom-23)
        (K_not_need-post-atom-23)
        (K_sensing-for-at-ol_p0_l42)
        (K_not_sensing-for-at-ol_p0_l42)
        (K_sensing-for-at-ol_p1_l42)
        (K_not_sensing-for-at-ol_p1_l42)
        (K_sensing-for-at-ol_p2_l42)
        (K_not_sensing-for-at-ol_p2_l42)
        (K_sensing-for-at-ol_p3_l42)
        (K_not_sensing-for-at-ol_p3_l42)
        (K_sensing-for-at-ol_p4_l42)
        (K_not_sensing-for-at-ol_p4_l42)
        (K_need-post-atom-24)
        (K_not_need-post-atom-24)
        (K_sensing-for-at-ol_p0_l43)
        (K_not_sensing-for-at-ol_p0_l43)
        (K_sensing-for-at-ol_p1_l43)
        (K_not_sensing-for-at-ol_p1_l43)
        (K_sensing-for-at-ol_p2_l43)
        (K_not_sensing-for-at-ol_p2_l43)
        (K_sensing-for-at-ol_p3_l43)
        (K_not_sensing-for-at-ol_p3_l43)
        (K_sensing-for-at-ol_p4_l43)
        (K_not_sensing-for-at-ol_p4_l43)
        (K_at-ta_t0_l10)
        (K_not_at-ta_t0_l10)
        (K_at-ta_t0_l20)
        (K_not_at-ta_t0_l20)
        (K_at-ta_t0_l30)
        (K_not_at-ta_t0_l30)
        (K_at-ta_t0_l40)
        (K_not_at-ta_t0_l40)
        (K_at-ta_t1_l00)
        (K_not_at-ta_t1_l00)
        (K_at-ta_t1_l20)
        (K_not_at-ta_t1_l20)
        (K_at-ta_t1_l30)
        (K_not_at-ta_t1_l30)
        (K_at-ta_t1_l40)
        (K_not_at-ta_t1_l40)
        (K_at-ta_t2_l00)
        (K_not_at-ta_t2_l00)
        (K_at-ta_t2_l10)
        (K_not_at-ta_t2_l10)
        (K_at-ta_t2_l30)
        (K_not_at-ta_t2_l30)
        (K_at-ta_t2_l40)
        (K_not_at-ta_t2_l40)
        (K_at-ta_t3_l00)
        (K_not_at-ta_t3_l00)
        (K_at-ta_t3_l10)
        (K_not_at-ta_t3_l10)
        (K_at-ta_t3_l20)
        (K_not_at-ta_t3_l20)
        (K_at-ta_t3_l40)
        (K_not_at-ta_t3_l40)
        (K_at-ta_t4_l00)
        (K_not_at-ta_t4_l00)
        (K_at-ta_t4_l10)
        (K_not_at-ta_t4_l10)
        (K_at-ta_t4_l20)
        (K_not_at-ta_t4_l20)
        (K_at-ta_t4_l30)
        (K_not_at-ta_t4_l30)
        (K_at-tl_t0_l11)
        (K_not_at-tl_t0_l11)
        (K_at-tl_t0_l12)
        (K_not_at-tl_t0_l12)
        (K_at-tl_t0_l13)
        (K_not_at-tl_t0_l13)
        (K_at-tl_t0_l14)
        (K_not_at-tl_t0_l14)
        (K_at-tl_t0_l21)
        (K_not_at-tl_t0_l21)
        (K_at-tl_t0_l22)
        (K_not_at-tl_t0_l22)
        (K_at-tl_t0_l23)
        (K_not_at-tl_t0_l23)
        (K_at-tl_t0_l24)
        (K_not_at-tl_t0_l24)
        (K_at-tl_t0_l31)
        (K_not_at-tl_t0_l31)
        (K_at-tl_t0_l32)
        (K_not_at-tl_t0_l32)
        (K_at-tl_t0_l33)
        (K_not_at-tl_t0_l33)
        (K_at-tl_t0_l34)
        (K_not_at-tl_t0_l34)
        (K_at-tl_t0_l41)
        (K_not_at-tl_t0_l41)
        (K_at-tl_t0_l42)
        (K_not_at-tl_t0_l42)
        (K_at-tl_t0_l43)
        (K_not_at-tl_t0_l43)
        (K_at-tl_t0_l44)
        (K_not_at-tl_t0_l44)
        (K_at-tl_t1_l01)
        (K_not_at-tl_t1_l01)
        (K_at-tl_t1_l02)
        (K_not_at-tl_t1_l02)
        (K_at-tl_t1_l03)
        (K_not_at-tl_t1_l03)
        (K_at-tl_t1_l04)
        (K_not_at-tl_t1_l04)
        (K_at-tl_t1_l21)
        (K_not_at-tl_t1_l21)
        (K_at-tl_t1_l22)
        (K_not_at-tl_t1_l22)
        (K_at-tl_t1_l23)
        (K_not_at-tl_t1_l23)
        (K_at-tl_t1_l24)
        (K_not_at-tl_t1_l24)
        (K_at-tl_t1_l31)
        (K_not_at-tl_t1_l31)
        (K_at-tl_t1_l32)
        (K_not_at-tl_t1_l32)
        (K_at-tl_t1_l33)
        (K_not_at-tl_t1_l33)
        (K_at-tl_t1_l34)
        (K_not_at-tl_t1_l34)
        (K_at-tl_t1_l41)
        (K_not_at-tl_t1_l41)
        (K_at-tl_t1_l42)
        (K_not_at-tl_t1_l42)
        (K_at-tl_t1_l43)
        (K_not_at-tl_t1_l43)
        (K_at-tl_t1_l44)
        (K_not_at-tl_t1_l44)
        (K_at-tl_t2_l01)
        (K_not_at-tl_t2_l01)
        (K_at-tl_t2_l02)
        (K_not_at-tl_t2_l02)
        (K_at-tl_t2_l03)
        (K_not_at-tl_t2_l03)
        (K_at-tl_t2_l04)
        (K_not_at-tl_t2_l04)
        (K_at-tl_t2_l11)
        (K_not_at-tl_t2_l11)
        (K_at-tl_t2_l12)
        (K_not_at-tl_t2_l12)
        (K_at-tl_t2_l13)
        (K_not_at-tl_t2_l13)
        (K_at-tl_t2_l14)
        (K_not_at-tl_t2_l14)
        (K_at-tl_t2_l31)
        (K_not_at-tl_t2_l31)
        (K_at-tl_t2_l32)
        (K_not_at-tl_t2_l32)
        (K_at-tl_t2_l33)
        (K_not_at-tl_t2_l33)
        (K_at-tl_t2_l34)
        (K_not_at-tl_t2_l34)
        (K_at-tl_t2_l41)
        (K_not_at-tl_t2_l41)
        (K_at-tl_t2_l42)
        (K_not_at-tl_t2_l42)
        (K_at-tl_t2_l43)
        (K_not_at-tl_t2_l43)
        (K_at-tl_t2_l44)
        (K_not_at-tl_t2_l44)
        (K_at-tl_t3_l01)
        (K_not_at-tl_t3_l01)
        (K_at-tl_t3_l02)
        (K_not_at-tl_t3_l02)
        (K_at-tl_t3_l03)
        (K_not_at-tl_t3_l03)
        (K_at-tl_t3_l04)
        (K_not_at-tl_t3_l04)
        (K_at-tl_t3_l11)
        (K_not_at-tl_t3_l11)
        (K_at-tl_t3_l12)
        (K_not_at-tl_t3_l12)
        (K_at-tl_t3_l13)
        (K_not_at-tl_t3_l13)
        (K_at-tl_t3_l14)
        (K_not_at-tl_t3_l14)
        (K_at-tl_t3_l21)
        (K_not_at-tl_t3_l21)
        (K_at-tl_t3_l22)
        (K_not_at-tl_t3_l22)
        (K_at-tl_t3_l23)
        (K_not_at-tl_t3_l23)
        (K_at-tl_t3_l24)
        (K_not_at-tl_t3_l24)
        (K_at-tl_t3_l41)
        (K_not_at-tl_t3_l41)
        (K_at-tl_t3_l42)
        (K_not_at-tl_t3_l42)
        (K_at-tl_t3_l43)
        (K_not_at-tl_t3_l43)
        (K_at-tl_t3_l44)
        (K_not_at-tl_t3_l44)
        (K_at-tl_t4_l01)
        (K_not_at-tl_t4_l01)
        (K_at-tl_t4_l02)
        (K_not_at-tl_t4_l02)
        (K_at-tl_t4_l03)
        (K_not_at-tl_t4_l03)
        (K_at-tl_t4_l04)
        (K_not_at-tl_t4_l04)
        (K_at-tl_t4_l11)
        (K_not_at-tl_t4_l11)
        (K_at-tl_t4_l12)
        (K_not_at-tl_t4_l12)
        (K_at-tl_t4_l13)
        (K_not_at-tl_t4_l13)
        (K_at-tl_t4_l14)
        (K_not_at-tl_t4_l14)
        (K_at-tl_t4_l21)
        (K_not_at-tl_t4_l21)
        (K_at-tl_t4_l22)
        (K_not_at-tl_t4_l22)
        (K_at-tl_t4_l23)
        (K_not_at-tl_t4_l23)
        (K_at-tl_t4_l24)
        (K_not_at-tl_t4_l24)
        (K_at-tl_t4_l31)
        (K_not_at-tl_t4_l31)
        (K_at-tl_t4_l32)
        (K_not_at-tl_t4_l32)
        (K_at-tl_t4_l33)
        (K_not_at-tl_t4_l33)
        (K_at-tl_t4_l34)
        (K_not_at-tl_t4_l34)
        (new-goal)
    )
    (:action sense-loc-t_t4_l44__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action post-action-0
        :precondition (K_need-post-atom-0)
        :effect (and (not (K_sensing-for-at-ol_p4_l44)) (not (K_sensing-for-at-ol_p3_l44)) (not (K_sensing-for-at-ol_p2_l44)) (not (K_sensing-for-at-ol_p1_l44)) (not (K_sensing-for-at-ol_p0_l44)) (not (K_need-post-atom-0)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-0) (K_not_sensing-for-at-ol_p0_l44) (K_not_sensing-for-at-ol_p1_l44) (K_not_sensing-for-at-ol_p2_l44) (K_not_sensing-for-at-ol_p3_l44) (K_not_sensing-for-at-ol_p4_l44)))
    (:action post-action-1
        :precondition (K_need-post-atom-1)
        :effect (and (not (K_sensing-for-at-oa_p4_l00)) (not (K_sensing-for-at-oa_p3_l00)) (not (K_sensing-for-at-oa_p2_l00)) (not (K_sensing-for-at-oa_p1_l00)) (not (K_sensing-for-at-oa_p0_l00)) (not (K_need-post-atom-1)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-1) (K_not_sensing-for-at-oa_p0_l00) (K_not_sensing-for-at-oa_p1_l00) (K_not_sensing-for-at-oa_p2_l00) (K_not_sensing-for-at-oa_p3_l00) (K_not_sensing-for-at-oa_p4_l00)))
    (:action fly-airplane_a0_l00_l10__effect__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-aa_a0_l10)) (not (K_normal-execution)) (not (K_at-aa_a0_l00)) (K_not_at-aa_a0_l00) (K_not_normal-execution) (K_at-aa_a0_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action post-action-2
        :precondition (K_need-post-atom-2)
        :effect (and (not (K_sensing-for-at-oa_p4_l10)) (not (K_sensing-for-at-oa_p3_l10)) (not (K_sensing-for-at-oa_p2_l10)) (not (K_sensing-for-at-oa_p1_l10)) (not (K_sensing-for-at-oa_p0_l10)) (not (K_need-post-atom-2)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-2) (K_not_sensing-for-at-oa_p0_l10) (K_not_sensing-for-at-oa_p1_l10) (K_not_sensing-for-at-oa_p2_l10) (K_not_sensing-for-at-oa_p3_l10) (K_not_sensing-for-at-oa_p4_l10)))
    (:action fly-airplane_a0_l00_l20__effect__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-aa_a0_l20)) (not (K_normal-execution)) (not (K_at-aa_a0_l00)) (K_not_at-aa_a0_l00) (K_not_normal-execution) (K_at-aa_a0_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action post-action-3
        :precondition (K_need-post-atom-3)
        :effect (and (not (K_sensing-for-at-oa_p4_l20)) (not (K_sensing-for-at-oa_p3_l20)) (not (K_sensing-for-at-oa_p2_l20)) (not (K_sensing-for-at-oa_p1_l20)) (not (K_sensing-for-at-oa_p0_l20)) (not (K_need-post-atom-3)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-3) (K_not_sensing-for-at-oa_p0_l20) (K_not_sensing-for-at-oa_p1_l20) (K_not_sensing-for-at-oa_p2_l20) (K_not_sensing-for-at-oa_p3_l20) (K_not_sensing-for-at-oa_p4_l20)))
    (:action fly-airplane_a0_l00_l30__effect__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_not_at-aa_a0_l30)) (not (K_normal-execution)) (not (K_at-aa_a0_l00)) (K_not_at-aa_a0_l00) (K_not_normal-execution) (K_at-aa_a0_l30) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action post-action-4
        :precondition (K_need-post-atom-4)
        :effect (and (not (K_sensing-for-at-oa_p4_l30)) (not (K_sensing-for-at-oa_p3_l30)) (not (K_sensing-for-at-oa_p2_l30)) (not (K_sensing-for-at-oa_p1_l30)) (not (K_sensing-for-at-oa_p0_l30)) (not (K_need-post-atom-4)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-4) (K_not_sensing-for-at-oa_p0_l30) (K_not_sensing-for-at-oa_p1_l30) (K_not_sensing-for-at-oa_p2_l30) (K_not_sensing-for-at-oa_p3_l30) (K_not_sensing-for-at-oa_p4_l30)))
    (:action fly-airplane_a0_l00_l40__effect__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-aa_a0_l40)) (not (K_normal-execution)) (not (K_at-aa_a0_l00)) (K_not_at-aa_a0_l00) (K_not_normal-execution) (K_at-aa_a0_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action post-action-5
        :precondition (K_need-post-atom-5)
        :effect (and (not (K_sensing-for-at-oa_p4_l40)) (not (K_sensing-for-at-oa_p3_l40)) (not (K_sensing-for-at-oa_p2_l40)) (not (K_sensing-for-at-oa_p1_l40)) (not (K_sensing-for-at-oa_p0_l40)) (not (K_need-post-atom-5)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-5) (K_not_sensing-for-at-oa_p0_l40) (K_not_sensing-for-at-oa_p1_l40) (K_not_sensing-for-at-oa_p2_l40) (K_not_sensing-for-at-oa_p3_l40) (K_not_sensing-for-at-oa_p4_l40)))
    (:action fly-airplane_a0_l10_l00__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_at-aa_a0_l10)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_at-aa_a0_l00)) (K_at-aa_a0_l00) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_not_at-aa_a0_l10)))
    (:action fly-airplane_a0_l10_l20__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-aa_a0_l20)) (not (K_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l10) (K_at-aa_a0_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action fly-airplane_a0_l10_l30__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_not_at-aa_a0_l30)) (not (K_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l10) (K_at-aa_a0_l30) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action fly-airplane_a0_l10_l40__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-aa_a0_l40)) (not (K_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l10) (K_at-aa_a0_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action fly-airplane_a0_l20_l00__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_at-aa_a0_l20)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_at-aa_a0_l00)) (K_at-aa_a0_l00) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_not_at-aa_a0_l20)))
    (:action fly-airplane_a0_l20_l10__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_at-aa_a0_l20)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_not_at-aa_a0_l20)))
    (:action fly-airplane_a0_l20_l30__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_not_at-aa_a0_l30)) (not (K_at-aa_a0_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l20) (K_at-aa_a0_l30) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action fly-airplane_a0_l20_l40__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-aa_a0_l40)) (not (K_at-aa_a0_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l20) (K_at-aa_a0_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action fly-airplane_a0_l30_l00__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_at-aa_a0_l30)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_at-aa_a0_l00)) (K_at-aa_a0_l00) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_not_at-aa_a0_l30)))
    (:action fly-airplane_a0_l30_l10__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_at-aa_a0_l30)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_not_at-aa_a0_l30)))
    (:action fly-airplane_a0_l30_l20__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_at-aa_a0_l30)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-aa_a0_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_not_at-aa_a0_l30)))
    (:action fly-airplane_a0_l30_l40__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-aa_a0_l40)) (not (K_at-aa_a0_l30)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-aa_a0_l30) (K_at-aa_a0_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action fly-airplane_a0_l40_l00__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_at-aa_a0_l40)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_at-aa_a0_l00)) (K_at-aa_a0_l00) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_not_at-aa_a0_l40)))
    (:action fly-airplane_a0_l40_l10__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_at-aa_a0_l40)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-aa_a0_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_not_at-aa_a0_l40)))
    (:action fly-airplane_a0_l40_l20__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_at-aa_a0_l40)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-aa_a0_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_not_at-aa_a0_l40)))
    (:action fly-airplane_a0_l40_l30__effect__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_at-aa_a0_l40)) (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_not_at-aa_a0_l30)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-aa_a0_l30) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30) (K_not_at-aa_a0_l40)))
    (:action drive-truck-ap-loc_t0_l00_l01_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_not_at-tl_t0_l01)) (not (K_at-ta_t0_l00)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t0_l00) (K_at-tl_t0_l01) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action post-action-6
        :precondition (K_need-post-atom-6)
        :effect (and (not (K_sensing-for-at-ol_p4_l01)) (not (K_sensing-for-at-ol_p3_l01)) (not (K_sensing-for-at-ol_p2_l01)) (not (K_sensing-for-at-ol_p1_l01)) (not (K_sensing-for-at-ol_p0_l01)) (not (K_need-post-atom-6)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-6) (K_not_sensing-for-at-ol_p0_l01) (K_not_sensing-for-at-ol_p1_l01) (K_not_sensing-for-at-ol_p2_l01) (K_not_sensing-for-at-ol_p3_l01) (K_not_sensing-for-at-ol_p4_l01)))
    (:action drive-truck-ap-loc_t0_l00_l02_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_not_at-tl_t0_l02)) (not (K_at-ta_t0_l00)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t0_l00) (K_at-tl_t0_l02) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action post-action-7
        :precondition (K_need-post-atom-7)
        :effect (and (not (K_sensing-for-at-ol_p4_l02)) (not (K_sensing-for-at-ol_p3_l02)) (not (K_sensing-for-at-ol_p2_l02)) (not (K_sensing-for-at-ol_p1_l02)) (not (K_sensing-for-at-ol_p0_l02)) (not (K_need-post-atom-7)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-7) (K_not_sensing-for-at-ol_p0_l02) (K_not_sensing-for-at-ol_p1_l02) (K_not_sensing-for-at-ol_p2_l02) (K_not_sensing-for-at-ol_p3_l02) (K_not_sensing-for-at-ol_p4_l02)))
    (:action drive-truck-ap-loc_t0_l00_l03_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_at-ta_t0_l00)) (not (K_normal-execution)) (not (K_not_at-tl_t0_l03)) (K_at-tl_t0_l03) (K_not_normal-execution) (K_not_at-ta_t0_l00) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action post-action-8
        :precondition (K_need-post-atom-8)
        :effect (and (not (K_sensing-for-at-ol_p4_l03)) (not (K_sensing-for-at-ol_p3_l03)) (not (K_sensing-for-at-ol_p2_l03)) (not (K_sensing-for-at-ol_p1_l03)) (not (K_sensing-for-at-ol_p0_l03)) (not (K_need-post-atom-8)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-8) (K_not_sensing-for-at-ol_p0_l03) (K_not_sensing-for-at-ol_p1_l03) (K_not_sensing-for-at-ol_p2_l03) (K_not_sensing-for-at-ol_p3_l03) (K_not_sensing-for-at-ol_p4_l03)))
    (:action drive-truck-ap-loc_t0_l00_l04_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_not_at-tl_t0_l04)) (not (K_at-ta_t0_l00)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t0_l00) (K_at-tl_t0_l04) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action post-action-9
        :precondition (K_need-post-atom-9)
        :effect (and (not (K_sensing-for-at-ol_p4_l04)) (not (K_sensing-for-at-ol_p3_l04)) (not (K_sensing-for-at-ol_p2_l04)) (not (K_sensing-for-at-ol_p1_l04)) (not (K_sensing-for-at-ol_p0_l04)) (not (K_need-post-atom-9)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-9) (K_not_sensing-for-at-ol_p0_l04) (K_not_sensing-for-at-ol_p1_l04) (K_not_sensing-for-at-ol_p2_l04) (K_not_sensing-for-at-ol_p3_l04) (K_not_sensing-for-at-ol_p4_l04)))
    (:action drive-truck-ap-loc_t1_l10_l11_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_at-ta_t1_l10)) (not (K_normal-execution)) (not (K_not_at-tl_t1_l11)) (K_at-tl_t1_l11) (K_not_normal-execution) (K_not_at-ta_t1_l10) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action post-action-10
        :precondition (K_need-post-atom-10)
        :effect (and (not (K_sensing-for-at-ol_p4_l11)) (not (K_sensing-for-at-ol_p3_l11)) (not (K_sensing-for-at-ol_p2_l11)) (not (K_sensing-for-at-ol_p1_l11)) (not (K_sensing-for-at-ol_p0_l11)) (not (K_need-post-atom-10)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-10) (K_not_sensing-for-at-ol_p0_l11) (K_not_sensing-for-at-ol_p1_l11) (K_not_sensing-for-at-ol_p2_l11) (K_not_sensing-for-at-ol_p3_l11) (K_not_sensing-for-at-ol_p4_l11)))
    (:action drive-truck-ap-loc_t1_l10_l12_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_not_at-tl_t1_l12)) (not (K_at-ta_t1_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t1_l10) (K_at-tl_t1_l12) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action post-action-11
        :precondition (K_need-post-atom-11)
        :effect (and (not (K_sensing-for-at-ol_p4_l12)) (not (K_sensing-for-at-ol_p3_l12)) (not (K_sensing-for-at-ol_p2_l12)) (not (K_sensing-for-at-ol_p1_l12)) (not (K_sensing-for-at-ol_p0_l12)) (not (K_need-post-atom-11)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-11) (K_not_sensing-for-at-ol_p0_l12) (K_not_sensing-for-at-ol_p1_l12) (K_not_sensing-for-at-ol_p2_l12) (K_not_sensing-for-at-ol_p3_l12) (K_not_sensing-for-at-ol_p4_l12)))
    (:action drive-truck-ap-loc_t1_l10_l13_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_not_at-tl_t1_l13)) (not (K_at-ta_t1_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t1_l10) (K_at-tl_t1_l13) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action post-action-12
        :precondition (K_need-post-atom-12)
        :effect (and (not (K_sensing-for-at-ol_p4_l13)) (not (K_sensing-for-at-ol_p3_l13)) (not (K_sensing-for-at-ol_p2_l13)) (not (K_sensing-for-at-ol_p1_l13)) (not (K_sensing-for-at-ol_p0_l13)) (not (K_need-post-atom-12)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-12) (K_not_sensing-for-at-ol_p0_l13) (K_not_sensing-for-at-ol_p1_l13) (K_not_sensing-for-at-ol_p2_l13) (K_not_sensing-for-at-ol_p3_l13) (K_not_sensing-for-at-ol_p4_l13)))
    (:action drive-truck-ap-loc_t1_l10_l14_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_not_at-tl_t1_l14)) (not (K_at-ta_t1_l10)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t1_l10) (K_at-tl_t1_l14) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action post-action-13
        :precondition (K_need-post-atom-13)
        :effect (and (not (K_sensing-for-at-ol_p4_l14)) (not (K_sensing-for-at-ol_p3_l14)) (not (K_sensing-for-at-ol_p2_l14)) (not (K_sensing-for-at-ol_p1_l14)) (not (K_sensing-for-at-ol_p0_l14)) (not (K_need-post-atom-13)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-13) (K_not_sensing-for-at-ol_p0_l14) (K_not_sensing-for-at-ol_p1_l14) (K_not_sensing-for-at-ol_p2_l14) (K_not_sensing-for-at-ol_p3_l14) (K_not_sensing-for-at-ol_p4_l14)))
    (:action drive-truck-ap-loc_t2_l20_l21_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_not_at-tl_t2_l21)) (not (K_at-ta_t2_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t2_l20) (K_at-tl_t2_l21) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action post-action-14
        :precondition (K_need-post-atom-14)
        :effect (and (not (K_sensing-for-at-ol_p4_l21)) (not (K_sensing-for-at-ol_p3_l21)) (not (K_sensing-for-at-ol_p2_l21)) (not (K_sensing-for-at-ol_p1_l21)) (not (K_sensing-for-at-ol_p0_l21)) (not (K_need-post-atom-14)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-14) (K_not_sensing-for-at-ol_p0_l21) (K_not_sensing-for-at-ol_p1_l21) (K_not_sensing-for-at-ol_p2_l21) (K_not_sensing-for-at-ol_p3_l21) (K_not_sensing-for-at-ol_p4_l21)))
    (:action drive-truck-ap-loc_t2_l20_l22_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_at-ta_t2_l20)) (not (K_normal-execution)) (not (K_not_at-tl_t2_l22)) (K_at-tl_t2_l22) (K_not_normal-execution) (K_not_at-ta_t2_l20) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action post-action-15
        :precondition (K_need-post-atom-15)
        :effect (and (not (K_sensing-for-at-ol_p4_l22)) (not (K_sensing-for-at-ol_p3_l22)) (not (K_sensing-for-at-ol_p2_l22)) (not (K_sensing-for-at-ol_p1_l22)) (not (K_sensing-for-at-ol_p0_l22)) (not (K_need-post-atom-15)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-15) (K_not_sensing-for-at-ol_p0_l22) (K_not_sensing-for-at-ol_p1_l22) (K_not_sensing-for-at-ol_p2_l22) (K_not_sensing-for-at-ol_p3_l22) (K_not_sensing-for-at-ol_p4_l22)))
    (:action drive-truck-ap-loc_t2_l20_l23_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_not_at-tl_t2_l23)) (not (K_at-ta_t2_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t2_l20) (K_at-tl_t2_l23) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action post-action-16
        :precondition (K_need-post-atom-16)
        :effect (and (not (K_sensing-for-at-ol_p4_l23)) (not (K_sensing-for-at-ol_p3_l23)) (not (K_sensing-for-at-ol_p2_l23)) (not (K_sensing-for-at-ol_p1_l23)) (not (K_sensing-for-at-ol_p0_l23)) (not (K_need-post-atom-16)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-16) (K_not_sensing-for-at-ol_p0_l23) (K_not_sensing-for-at-ol_p1_l23) (K_not_sensing-for-at-ol_p2_l23) (K_not_sensing-for-at-ol_p3_l23) (K_not_sensing-for-at-ol_p4_l23)))
    (:action drive-truck-ap-loc_t2_l20_l24_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_not_at-tl_t2_l24)) (not (K_at-ta_t2_l20)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t2_l20) (K_at-tl_t2_l24) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action post-action-17
        :precondition (K_need-post-atom-17)
        :effect (and (not (K_sensing-for-at-ol_p4_l24)) (not (K_sensing-for-at-ol_p3_l24)) (not (K_sensing-for-at-ol_p2_l24)) (not (K_sensing-for-at-ol_p1_l24)) (not (K_sensing-for-at-ol_p0_l24)) (not (K_need-post-atom-17)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-17) (K_not_sensing-for-at-ol_p0_l24) (K_not_sensing-for-at-ol_p1_l24) (K_not_sensing-for-at-ol_p2_l24) (K_not_sensing-for-at-ol_p3_l24) (K_not_sensing-for-at-ol_p4_l24)))
    (:action drive-truck-ap-loc_t3_l30_l31_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_not_at-tl_t3_l31)) (not (K_normal-execution)) (not (K_at-ta_t3_l30)) (K_not_at-ta_t3_l30) (K_not_normal-execution) (K_at-tl_t3_l31) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action post-action-18
        :precondition (K_need-post-atom-18)
        :effect (and (not (K_sensing-for-at-ol_p4_l31)) (not (K_sensing-for-at-ol_p3_l31)) (not (K_sensing-for-at-ol_p2_l31)) (not (K_sensing-for-at-ol_p1_l31)) (not (K_sensing-for-at-ol_p0_l31)) (not (K_need-post-atom-18)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-18) (K_not_sensing-for-at-ol_p0_l31) (K_not_sensing-for-at-ol_p1_l31) (K_not_sensing-for-at-ol_p2_l31) (K_not_sensing-for-at-ol_p3_l31) (K_not_sensing-for-at-ol_p4_l31)))
    (:action drive-truck-ap-loc_t3_l30_l32_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_not_at-tl_t3_l32)) (not (K_normal-execution)) (not (K_at-ta_t3_l30)) (K_not_at-ta_t3_l30) (K_not_normal-execution) (K_at-tl_t3_l32) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action post-action-19
        :precondition (K_need-post-atom-19)
        :effect (and (not (K_sensing-for-at-ol_p4_l32)) (not (K_sensing-for-at-ol_p3_l32)) (not (K_sensing-for-at-ol_p2_l32)) (not (K_sensing-for-at-ol_p1_l32)) (not (K_sensing-for-at-ol_p0_l32)) (not (K_need-post-atom-19)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-19) (K_not_sensing-for-at-ol_p0_l32) (K_not_sensing-for-at-ol_p1_l32) (K_not_sensing-for-at-ol_p2_l32) (K_not_sensing-for-at-ol_p3_l32) (K_not_sensing-for-at-ol_p4_l32)))
    (:action drive-truck-ap-loc_t3_l30_l33_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_not_at-tl_t3_l33)) (not (K_normal-execution)) (not (K_at-ta_t3_l30)) (K_not_at-ta_t3_l30) (K_not_normal-execution) (K_at-tl_t3_l33) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action post-action-20
        :precondition (K_need-post-atom-20)
        :effect (and (not (K_sensing-for-at-ol_p4_l33)) (not (K_sensing-for-at-ol_p3_l33)) (not (K_sensing-for-at-ol_p2_l33)) (not (K_sensing-for-at-ol_p1_l33)) (not (K_sensing-for-at-ol_p0_l33)) (not (K_need-post-atom-20)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-20) (K_not_sensing-for-at-ol_p0_l33) (K_not_sensing-for-at-ol_p1_l33) (K_not_sensing-for-at-ol_p2_l33) (K_not_sensing-for-at-ol_p3_l33) (K_not_sensing-for-at-ol_p4_l33)))
    (:action drive-truck-ap-loc_t3_l30_l34_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_not_at-tl_t3_l34)) (not (K_normal-execution)) (not (K_at-ta_t3_l30)) (K_not_at-ta_t3_l30) (K_not_normal-execution) (K_at-tl_t3_l34) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action post-action-21
        :precondition (K_need-post-atom-21)
        :effect (and (not (K_sensing-for-at-ol_p4_l34)) (not (K_sensing-for-at-ol_p3_l34)) (not (K_sensing-for-at-ol_p2_l34)) (not (K_sensing-for-at-ol_p1_l34)) (not (K_sensing-for-at-ol_p0_l34)) (not (K_need-post-atom-21)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-21) (K_not_sensing-for-at-ol_p0_l34) (K_not_sensing-for-at-ol_p1_l34) (K_not_sensing-for-at-ol_p2_l34) (K_not_sensing-for-at-ol_p3_l34) (K_not_sensing-for-at-ol_p4_l34)))
    (:action drive-truck-ap-loc_t4_l40_l41_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_not_at-tl_t4_l41)) (not (K_at-ta_t4_l40)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t4_l40) (K_at-tl_t4_l41) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action post-action-22
        :precondition (K_need-post-atom-22)
        :effect (and (not (K_sensing-for-at-ol_p4_l41)) (not (K_sensing-for-at-ol_p3_l41)) (not (K_sensing-for-at-ol_p2_l41)) (not (K_sensing-for-at-ol_p1_l41)) (not (K_sensing-for-at-ol_p0_l41)) (not (K_need-post-atom-22)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-22) (K_not_sensing-for-at-ol_p0_l41) (K_not_sensing-for-at-ol_p1_l41) (K_not_sensing-for-at-ol_p2_l41) (K_not_sensing-for-at-ol_p3_l41) (K_not_sensing-for-at-ol_p4_l41)))
    (:action drive-truck-ap-loc_t4_l40_l42_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_not_at-tl_t4_l42)) (not (K_at-ta_t4_l40)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-ta_t4_l40) (K_at-tl_t4_l42) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action post-action-23
        :precondition (K_need-post-atom-23)
        :effect (and (not (K_sensing-for-at-ol_p4_l42)) (not (K_sensing-for-at-ol_p3_l42)) (not (K_sensing-for-at-ol_p2_l42)) (not (K_sensing-for-at-ol_p1_l42)) (not (K_sensing-for-at-ol_p0_l42)) (not (K_need-post-atom-23)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-23) (K_not_sensing-for-at-ol_p0_l42) (K_not_sensing-for-at-ol_p1_l42) (K_not_sensing-for-at-ol_p2_l42) (K_not_sensing-for-at-ol_p3_l42) (K_not_sensing-for-at-ol_p4_l42)))
    (:action drive-truck-ap-loc_t4_l40_l43_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_at-ta_t4_l40)) (not (K_normal-execution)) (not (K_not_at-tl_t4_l43)) (K_at-tl_t4_l43) (K_not_normal-execution) (K_not_at-ta_t4_l40) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action post-action-24
        :precondition (K_need-post-atom-24)
        :effect (and (not (K_sensing-for-at-ol_p4_l43)) (not (K_sensing-for-at-ol_p3_l43)) (not (K_sensing-for-at-ol_p2_l43)) (not (K_sensing-for-at-ol_p1_l43)) (not (K_sensing-for-at-ol_p0_l43)) (not (K_need-post-atom-24)) (not (K_not_normal-execution)) (K_normal-execution) (K_not_need-post-atom-24) (K_not_sensing-for-at-ol_p0_l43) (K_not_sensing-for-at-ol_p1_l43) (K_not_sensing-for-at-ol_p2_l43) (K_not_sensing-for-at-ol_p3_l43) (K_not_sensing-for-at-ol_p4_l43)))
    (:action drive-truck-ap-loc_t4_l40_l44_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_at-ta_t4_l40)) (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_not_at-tl_t4_l44)) (not (K_normal-execution)) (K_not_normal-execution) (K_at-tl_t4_l44) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44) (K_not_at-ta_t4_l40)))
    (:action drive-truck-loc-ap_t0_l01_l00_c0__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_at-tl_t0_l01)) (not (K_not_at-ta_t0_l00)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_at-ta_t0_l00) (K_not_at-tl_t0_l01)))
    (:action drive-truck-loc-ap_t0_l02_l00_c0__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_at-tl_t0_l02)) (not (K_not_at-ta_t0_l00)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_at-ta_t0_l00) (K_not_at-tl_t0_l02)))
    (:action drive-truck-loc-ap_t0_l03_l00_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_normal-execution))
        :effect (and (not (K_not_at-ta_t0_l00)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_at-tl_t0_l03)) (K_not_at-tl_t0_l03) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_at-ta_t0_l00)))
    (:action drive-truck-loc-ap_t0_l04_l00_c0__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_at-tl_t0_l04)) (not (K_not_at-ta_t0_l00)) (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00) (K_at-ta_t0_l00) (K_not_at-tl_t0_l04)))
    (:action drive-truck-loc-ap_t1_l11_l10_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_normal-execution))
        :effect (and (not (K_not_at-ta_t1_l10)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_at-tl_t1_l11)) (K_not_at-tl_t1_l11) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_at-ta_t1_l10)))
    (:action drive-truck-loc-ap_t1_l12_l10_c1__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_at-tl_t1_l12)) (not (K_not_at-ta_t1_l10)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_at-ta_t1_l10) (K_not_at-tl_t1_l12)))
    (:action drive-truck-loc-ap_t1_l13_l10_c1__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_at-tl_t1_l13)) (not (K_not_at-ta_t1_l10)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_at-ta_t1_l10) (K_not_at-tl_t1_l13)))
    (:action drive-truck-loc-ap_t1_l14_l10_c1__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_at-tl_t1_l14)) (not (K_not_at-ta_t1_l10)) (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10) (K_at-ta_t1_l10) (K_not_at-tl_t1_l14)))
    (:action drive-truck-loc-ap_t2_l21_l20_c2__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_at-tl_t2_l21)) (not (K_not_at-ta_t2_l20)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_at-ta_t2_l20) (K_not_at-tl_t2_l21)))
    (:action drive-truck-loc-ap_t2_l22_l20_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_normal-execution))
        :effect (and (not (K_not_at-ta_t2_l20)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_at-tl_t2_l22)) (K_not_at-tl_t2_l22) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_at-ta_t2_l20)))
    (:action drive-truck-loc-ap_t2_l23_l20_c2__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_at-tl_t2_l23)) (not (K_not_at-ta_t2_l20)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_at-ta_t2_l20) (K_not_at-tl_t2_l23)))
    (:action drive-truck-loc-ap_t2_l24_l20_c2__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_at-tl_t2_l24)) (not (K_not_at-ta_t2_l20)) (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20) (K_at-ta_t2_l20) (K_not_at-tl_t2_l24)))
    (:action drive-truck-loc-ap_t3_l31_l30_c3__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_at-tl_t3_l31)) (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_at-ta_t3_l30)) (K_at-ta_t3_l30) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30) (K_not_at-tl_t3_l31)))
    (:action drive-truck-loc-ap_t3_l32_l30_c3__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_at-tl_t3_l32)) (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_at-ta_t3_l30)) (K_at-ta_t3_l30) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30) (K_not_at-tl_t3_l32)))
    (:action drive-truck-loc-ap_t3_l33_l30_c3__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_at-tl_t3_l33)) (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_at-ta_t3_l30)) (K_at-ta_t3_l30) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30) (K_not_at-tl_t3_l33)))
    (:action drive-truck-loc-ap_t3_l34_l30_c3__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_at-tl_t3_l34)) (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_at-ta_t3_l30)) (K_at-ta_t3_l30) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30) (K_not_at-tl_t3_l34)))
    (:action drive-truck-loc-ap_t4_l41_l40_c4__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_at-tl_t4_l41)) (not (K_not_at-ta_t4_l40)) (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40) (K_at-ta_t4_l40) (K_not_at-tl_t4_l41)))
    (:action drive-truck-loc-ap_t4_l42_l40_c4__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_at-tl_t4_l42)) (not (K_not_at-ta_t4_l40)) (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40) (K_at-ta_t4_l40) (K_not_at-tl_t4_l42)))
    (:action drive-truck-loc-ap_t4_l43_l40_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_normal-execution))
        :effect (and (not (K_not_at-ta_t4_l40)) (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_at-tl_t4_l43)) (K_not_at-tl_t4_l43) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40) (K_at-ta_t4_l40)))
    (:action drive-truck-loc-ap_t4_l44_l40_c4__effect__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_at-ta_t4_l40)) (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_at-tl_t4_l44)) (not (K_normal-execution)) (K_not_normal-execution) (K_not_at-tl_t4_l44) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40) (K_at-ta_t4_l40)))
    (:action unload-airplane_p0_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_in-oa_p0_a0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_not_at-oa_p0_l00)) (not (K_normal-execution)) (not (K_in-oa_p0_a0)) (K_not_in-oa_p0_a0) (K_not_normal-execution) (K_at-oa_p0_l00) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-airplane_p0_a0_l10__effect__
        :precondition (and (K_in-oa_p0_a0) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-oa_p0_a0)) (not (K_not_at-oa_p0_l10)) (K_at-oa_p0_l10) (K_not_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-airplane_p0_a0_l20__effect__
        :precondition (and (K_in-oa_p0_a0) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-oa_p0_a0)) (not (K_not_at-oa_p0_l20)) (K_at-oa_p0_l20) (K_not_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-airplane_p0_a0_l30__effect__
        :precondition (and (K_in-oa_p0_a0) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-oa_p0_a0)) (not (K_not_at-oa_p0_l30)) (K_at-oa_p0_l30) (K_not_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-airplane_p0_a0_l40__effect__
        :precondition (and (K_in-oa_p0_a0) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-oa_p0_a0)) (not (K_not_at-oa_p0_l40)) (K_at-oa_p0_l40) (K_not_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-airplane_p1_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_in-oa_p1_a0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-oa_p1_a0)) (not (K_not_at-oa_p1_l00)) (K_at-oa_p1_l00) (K_not_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-airplane_p1_a0_l10__effect__
        :precondition (and (K_in-oa_p1_a0) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-oa_p1_a0)) (not (K_not_at-oa_p1_l10)) (K_at-oa_p1_l10) (K_not_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-airplane_p1_a0_l20__effect__
        :precondition (and (K_in-oa_p1_a0) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-oa_p1_l20)) (not (K_normal-execution)) (not (K_in-oa_p1_a0)) (K_not_in-oa_p1_a0) (K_not_normal-execution) (K_at-oa_p1_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-airplane_p1_a0_l30__effect__
        :precondition (and (K_in-oa_p1_a0) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-oa_p1_a0)) (not (K_not_at-oa_p1_l30)) (K_at-oa_p1_l30) (K_not_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-airplane_p1_a0_l40__effect__
        :precondition (and (K_in-oa_p1_a0) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-oa_p1_a0)) (not (K_not_at-oa_p1_l40)) (K_at-oa_p1_l40) (K_not_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-airplane_p2_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_in-oa_p2_a0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-oa_p2_a0)) (not (K_not_at-oa_p2_l00)) (K_at-oa_p2_l00) (K_not_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-airplane_p2_a0_l10__effect__
        :precondition (and (K_in-oa_p2_a0) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-oa_p2_l10)) (not (K_normal-execution)) (not (K_in-oa_p2_a0)) (K_not_in-oa_p2_a0) (K_not_normal-execution) (K_at-oa_p2_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-airplane_p2_a0_l20__effect__
        :precondition (and (K_in-oa_p2_a0) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-oa_p2_a0)) (not (K_not_at-oa_p2_l20)) (K_at-oa_p2_l20) (K_not_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-airplane_p2_a0_l30__effect__
        :precondition (and (K_in-oa_p2_a0) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-oa_p2_a0)) (not (K_not_at-oa_p2_l30)) (K_at-oa_p2_l30) (K_not_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-airplane_p2_a0_l40__effect__
        :precondition (and (K_in-oa_p2_a0) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-oa_p2_a0)) (not (K_not_at-oa_p2_l40)) (K_at-oa_p2_l40) (K_not_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-airplane_p3_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_in-oa_p3_a0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-oa_p3_a0)) (not (K_not_at-oa_p3_l00)) (K_at-oa_p3_l00) (K_not_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-airplane_p3_a0_l10__effect__
        :precondition (and (K_in-oa_p3_a0) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-oa_p3_a0)) (not (K_not_at-oa_p3_l10)) (K_at-oa_p3_l10) (K_not_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-airplane_p3_a0_l20__effect__
        :precondition (and (K_in-oa_p3_a0) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-oa_p3_l20)) (not (K_normal-execution)) (not (K_in-oa_p3_a0)) (K_not_in-oa_p3_a0) (K_not_normal-execution) (K_at-oa_p3_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-airplane_p3_a0_l30__effect__
        :precondition (and (K_in-oa_p3_a0) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-oa_p3_a0)) (not (K_not_at-oa_p3_l30)) (K_at-oa_p3_l30) (K_not_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-airplane_p3_a0_l40__effect__
        :precondition (and (K_in-oa_p3_a0) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-oa_p3_a0)) (not (K_not_at-oa_p3_l40)) (K_at-oa_p3_l40) (K_not_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-airplane_p4_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_in-oa_p4_a0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-oa_p4_a0)) (not (K_not_at-oa_p4_l00)) (K_at-oa_p4_l00) (K_not_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-airplane_p4_a0_l10__effect__
        :precondition (and (K_in-oa_p4_a0) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-oa_p4_a0)) (not (K_not_at-oa_p4_l10)) (K_at-oa_p4_l10) (K_not_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-airplane_p4_a0_l20__effect__
        :precondition (and (K_in-oa_p4_a0) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-oa_p4_a0)) (not (K_not_at-oa_p4_l20)) (K_at-oa_p4_l20) (K_not_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-airplane_p4_a0_l30__effect__
        :precondition (and (K_in-oa_p4_a0) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-oa_p4_a0)) (not (K_not_at-oa_p4_l30)) (K_at-oa_p4_l30) (K_not_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-airplane_p4_a0_l40__effect__
        :precondition (and (K_in-oa_p4_a0) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-oa_p4_l40)) (not (K_normal-execution)) (not (K_in-oa_p4_a0)) (K_not_in-oa_p4_a0) (K_not_normal-execution) (K_at-oa_p4_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-ap_p0_t0_l00_c0__effect__
        :precondition (and (K_in-ot_p0_t0) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_not_at-oa_p0_l00)) (not (K_normal-execution)) (not (K_in-ot_p0_t0)) (K_not_in-ot_p0_t0) (K_not_normal-execution) (K_at-oa_p0_l00) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-truck-ap_p0_t1_l10_c1__effect__
        :precondition (and (K_in-ot_p0_t1) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-ot_p0_t1)) (not (K_not_at-oa_p0_l10)) (K_at-oa_p0_l10) (K_not_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-truck-ap_p0_t2_l20_c2__effect__
        :precondition (and (K_in-ot_p0_t2) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-ot_p0_t2)) (not (K_not_at-oa_p0_l20)) (K_at-oa_p0_l20) (K_not_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-truck-ap_p0_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_in-ot_p0_t3) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-ot_p0_t3)) (not (K_not_at-oa_p0_l30)) (K_at-oa_p0_l30) (K_not_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-truck-ap_p0_t4_l40_c4__effect__
        :precondition (and (K_in-ot_p0_t4) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-ot_p0_t4)) (not (K_not_at-oa_p0_l40)) (K_at-oa_p0_l40) (K_not_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-ap_p1_t0_l00_c0__effect__
        :precondition (and (K_in-ot_p1_t0) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-ot_p1_t0)) (not (K_not_at-oa_p1_l00)) (K_at-oa_p1_l00) (K_not_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-truck-ap_p1_t1_l10_c1__effect__
        :precondition (and (K_in-ot_p1_t1) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-ot_p1_t1)) (not (K_not_at-oa_p1_l10)) (K_at-oa_p1_l10) (K_not_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-truck-ap_p1_t2_l20_c2__effect__
        :precondition (and (K_in-ot_p1_t2) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-oa_p1_l20)) (not (K_normal-execution)) (not (K_in-ot_p1_t2)) (K_not_in-ot_p1_t2) (K_not_normal-execution) (K_at-oa_p1_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-truck-ap_p1_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_in-ot_p1_t3) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-ot_p1_t3)) (not (K_not_at-oa_p1_l30)) (K_at-oa_p1_l30) (K_not_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-truck-ap_p1_t4_l40_c4__effect__
        :precondition (and (K_in-ot_p1_t4) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-ot_p1_t4)) (not (K_not_at-oa_p1_l40)) (K_at-oa_p1_l40) (K_not_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-ap_p2_t0_l00_c0__effect__
        :precondition (and (K_in-ot_p2_t0) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-ot_p2_t0)) (not (K_not_at-oa_p2_l00)) (K_at-oa_p2_l00) (K_not_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-truck-ap_p2_t1_l10_c1__effect__
        :precondition (and (K_in-ot_p2_t1) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_not_at-oa_p2_l10)) (not (K_normal-execution)) (not (K_in-ot_p2_t1)) (K_not_in-ot_p2_t1) (K_not_normal-execution) (K_at-oa_p2_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-truck-ap_p2_t2_l20_c2__effect__
        :precondition (and (K_in-ot_p2_t2) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-ot_p2_t2)) (not (K_not_at-oa_p2_l20)) (K_at-oa_p2_l20) (K_not_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-truck-ap_p2_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_in-ot_p2_t3) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-ot_p2_t3)) (not (K_not_at-oa_p2_l30)) (K_at-oa_p2_l30) (K_not_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-truck-ap_p2_t4_l40_c4__effect__
        :precondition (and (K_in-ot_p2_t4) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-ot_p2_t4)) (not (K_not_at-oa_p2_l40)) (K_at-oa_p2_l40) (K_not_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-ap_p3_t0_l00_c0__effect__
        :precondition (and (K_in-ot_p3_t0) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-ot_p3_t0)) (not (K_not_at-oa_p3_l00)) (K_at-oa_p3_l00) (K_not_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-truck-ap_p3_t1_l10_c1__effect__
        :precondition (and (K_in-ot_p3_t1) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-ot_p3_t1)) (not (K_not_at-oa_p3_l10)) (K_at-oa_p3_l10) (K_not_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-truck-ap_p3_t2_l20_c2__effect__
        :precondition (and (K_in-ot_p3_t2) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_not_at-oa_p3_l20)) (not (K_normal-execution)) (not (K_in-ot_p3_t2)) (K_not_in-ot_p3_t2) (K_not_normal-execution) (K_at-oa_p3_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-truck-ap_p3_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_in-ot_p3_t3) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-ot_p3_t3)) (not (K_not_at-oa_p3_l30)) (K_at-oa_p3_l30) (K_not_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-truck-ap_p3_t4_l40_c4__effect__
        :precondition (and (K_in-ot_p3_t4) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_in-ot_p3_t4)) (not (K_not_at-oa_p3_l40)) (K_at-oa_p3_l40) (K_not_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-ap_p4_t0_l00_c0__effect__
        :precondition (and (K_in-ot_p4_t0) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_in-ot_p4_t0)) (not (K_not_at-oa_p4_l00)) (K_at-oa_p4_l00) (K_not_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action unload-truck-ap_p4_t1_l10_c1__effect__
        :precondition (and (K_in-ot_p4_t1) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_in-ot_p4_t1)) (not (K_not_at-oa_p4_l10)) (K_at-oa_p4_l10) (K_not_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action unload-truck-ap_p4_t2_l20_c2__effect__
        :precondition (and (K_in-ot_p4_t2) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_in-ot_p4_t2)) (not (K_not_at-oa_p4_l20)) (K_at-oa_p4_l20) (K_not_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action unload-truck-ap_p4_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_in-ot_p4_t3) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_in-ot_p4_t3)) (not (K_not_at-oa_p4_l30)) (K_at-oa_p4_l30) (K_not_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action unload-truck-ap_p4_t4_l40_c4__effect__
        :precondition (and (K_in-ot_p4_t4) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_not_at-oa_p4_l40)) (not (K_normal-execution)) (not (K_in-ot_p4_t4)) (K_not_in-ot_p4_t4) (K_not_normal-execution) (K_at-oa_p4_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action unload-truck-loc_p0_t0_l01_c0__effect__
        :precondition (and (K_in-ot_p0_t0) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_not_at-ol_p0_l01)) (not (K_normal-execution)) (not (K_in-ot_p0_t0)) (K_not_in-ot_p0_t0) (K_not_normal-execution) (K_at-ol_p0_l01) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action unload-truck-loc_p0_t0_l02_c0__effect__
        :precondition (and (K_in-ot_p0_t0) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_not_at-ol_p0_l02)) (not (K_normal-execution)) (not (K_in-ot_p0_t0)) (K_not_in-ot_p0_t0) (K_not_normal-execution) (K_at-ol_p0_l02) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action unload-truck-loc_p0_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_in-ot_p0_t0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_not_at-ol_p0_l03)) (not (K_normal-execution)) (not (K_in-ot_p0_t0)) (K_not_in-ot_p0_t0) (K_not_normal-execution) (K_at-ol_p0_l03) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action unload-truck-loc_p0_t0_l04_c0__effect__
        :precondition (and (K_in-ot_p0_t0) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_not_at-ol_p0_l04)) (not (K_normal-execution)) (not (K_in-ot_p0_t0)) (K_not_in-ot_p0_t0) (K_not_normal-execution) (K_at-ol_p0_l04) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action unload-truck-loc_p0_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_in-ot_p0_t1) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_in-ot_p0_t1)) (not (K_not_at-ol_p0_l11)) (K_at-ol_p0_l11) (K_not_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action unload-truck-loc_p0_t1_l12_c1__effect__
        :precondition (and (K_in-ot_p0_t1) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_in-ot_p0_t1)) (not (K_not_at-ol_p0_l12)) (K_at-ol_p0_l12) (K_not_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action unload-truck-loc_p0_t1_l13_c1__effect__
        :precondition (and (K_in-ot_p0_t1) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_in-ot_p0_t1)) (not (K_not_at-ol_p0_l13)) (K_at-ol_p0_l13) (K_not_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action unload-truck-loc_p0_t1_l14_c1__effect__
        :precondition (and (K_in-ot_p0_t1) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_in-ot_p0_t1)) (not (K_not_at-ol_p0_l14)) (K_at-ol_p0_l14) (K_not_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action unload-truck-loc_p0_t2_l21_c2__effect__
        :precondition (and (K_in-ot_p0_t2) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_in-ot_p0_t2)) (not (K_not_at-ol_p0_l21)) (K_at-ol_p0_l21) (K_not_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action unload-truck-loc_p0_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_in-ot_p0_t2) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_in-ot_p0_t2)) (not (K_not_at-ol_p0_l22)) (K_at-ol_p0_l22) (K_not_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action unload-truck-loc_p0_t2_l23_c2__effect__
        :precondition (and (K_in-ot_p0_t2) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_in-ot_p0_t2)) (not (K_not_at-ol_p0_l23)) (K_at-ol_p0_l23) (K_not_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action unload-truck-loc_p0_t2_l24_c2__effect__
        :precondition (and (K_in-ot_p0_t2) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_in-ot_p0_t2)) (not (K_not_at-ol_p0_l24)) (K_at-ol_p0_l24) (K_not_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action unload-truck-loc_p0_t3_l31_c3__effect__
        :precondition (and (K_in-ot_p0_t3) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_in-ot_p0_t3)) (not (K_not_at-ol_p0_l31)) (K_at-ol_p0_l31) (K_not_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action unload-truck-loc_p0_t3_l32_c3__effect__
        :precondition (and (K_in-ot_p0_t3) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_in-ot_p0_t3)) (not (K_not_at-ol_p0_l32)) (K_at-ol_p0_l32) (K_not_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action unload-truck-loc_p0_t3_l33_c3__effect__
        :precondition (and (K_in-ot_p0_t3) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_in-ot_p0_t3)) (not (K_not_at-ol_p0_l33)) (K_at-ol_p0_l33) (K_not_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action unload-truck-loc_p0_t3_l34_c3__effect__
        :precondition (and (K_in-ot_p0_t3) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_in-ot_p0_t3)) (not (K_not_at-ol_p0_l34)) (K_at-ol_p0_l34) (K_not_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action unload-truck-loc_p0_t4_l41_c4__effect__
        :precondition (and (K_in-ot_p0_t4) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_in-ot_p0_t4)) (not (K_not_at-ol_p0_l41)) (K_at-ol_p0_l41) (K_not_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action unload-truck-loc_p0_t4_l42_c4__effect__
        :precondition (and (K_in-ot_p0_t4) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_in-ot_p0_t4)) (not (K_not_at-ol_p0_l42)) (K_at-ol_p0_l42) (K_not_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action unload-truck-loc_p0_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_in-ot_p0_t4) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_in-ot_p0_t4)) (not (K_not_at-ol_p0_l43)) (K_at-ol_p0_l43) (K_not_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action unload-truck-loc_p0_t4_l44_c4__effect__
        :precondition (and (K_in-ot_p0_t4) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_in-ot_p0_t4)) (not (K_not_at-ol_p0_l44)) (K_at-ol_p0_l44) (K_not_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action unload-truck-loc_p1_t0_l01_c0__effect__
        :precondition (and (K_in-ot_p1_t0) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_in-ot_p1_t0)) (not (K_not_at-ol_p1_l01)) (K_at-ol_p1_l01) (K_not_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action unload-truck-loc_p1_t0_l02_c0__effect__
        :precondition (and (K_in-ot_p1_t0) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_in-ot_p1_t0)) (not (K_not_at-ol_p1_l02)) (K_at-ol_p1_l02) (K_not_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action unload-truck-loc_p1_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_in-ot_p1_t0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_in-ot_p1_t0)) (not (K_not_at-ol_p1_l03)) (K_at-ol_p1_l03) (K_not_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action unload-truck-loc_p1_t0_l04_c0__effect__
        :precondition (and (K_in-ot_p1_t0) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_in-ot_p1_t0)) (not (K_not_at-ol_p1_l04)) (K_at-ol_p1_l04) (K_not_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action unload-truck-loc_p1_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_in-ot_p1_t1) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_in-ot_p1_t1)) (not (K_not_at-ol_p1_l11)) (K_at-ol_p1_l11) (K_not_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action unload-truck-loc_p1_t1_l12_c1__effect__
        :precondition (and (K_in-ot_p1_t1) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_in-ot_p1_t1)) (not (K_not_at-ol_p1_l12)) (K_at-ol_p1_l12) (K_not_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action unload-truck-loc_p1_t1_l13_c1__effect__
        :precondition (and (K_in-ot_p1_t1) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_in-ot_p1_t1)) (not (K_not_at-ol_p1_l13)) (K_at-ol_p1_l13) (K_not_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action unload-truck-loc_p1_t1_l14_c1__effect__
        :precondition (and (K_in-ot_p1_t1) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_in-ot_p1_t1)) (not (K_not_at-ol_p1_l14)) (K_at-ol_p1_l14) (K_not_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action unload-truck-loc_p1_t2_l21_c2__effect__
        :precondition (and (K_in-ot_p1_t2) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_not_at-ol_p1_l21)) (not (K_normal-execution)) (not (K_in-ot_p1_t2)) (K_not_in-ot_p1_t2) (K_not_normal-execution) (K_at-ol_p1_l21) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action unload-truck-loc_p1_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_in-ot_p1_t2) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_not_at-ol_p1_l22)) (not (K_normal-execution)) (not (K_in-ot_p1_t2)) (K_not_in-ot_p1_t2) (K_not_normal-execution) (K_at-ol_p1_l22) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action unload-truck-loc_p1_t2_l23_c2__effect__
        :precondition (and (K_in-ot_p1_t2) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_not_at-ol_p1_l23)) (not (K_normal-execution)) (not (K_in-ot_p1_t2)) (K_not_in-ot_p1_t2) (K_not_normal-execution) (K_at-ol_p1_l23) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action unload-truck-loc_p1_t2_l24_c2__effect__
        :precondition (and (K_in-ot_p1_t2) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_not_at-ol_p1_l24)) (not (K_normal-execution)) (not (K_in-ot_p1_t2)) (K_not_in-ot_p1_t2) (K_not_normal-execution) (K_at-ol_p1_l24) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action unload-truck-loc_p1_t3_l31_c3__effect__
        :precondition (and (K_in-ot_p1_t3) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_in-ot_p1_t3)) (not (K_not_at-ol_p1_l31)) (K_at-ol_p1_l31) (K_not_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action unload-truck-loc_p1_t3_l32_c3__effect__
        :precondition (and (K_in-ot_p1_t3) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_in-ot_p1_t3)) (not (K_not_at-ol_p1_l32)) (K_at-ol_p1_l32) (K_not_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action unload-truck-loc_p1_t3_l33_c3__effect__
        :precondition (and (K_in-ot_p1_t3) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_in-ot_p1_t3)) (not (K_not_at-ol_p1_l33)) (K_at-ol_p1_l33) (K_not_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action unload-truck-loc_p1_t3_l34_c3__effect__
        :precondition (and (K_in-ot_p1_t3) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_in-ot_p1_t3)) (not (K_not_at-ol_p1_l34)) (K_at-ol_p1_l34) (K_not_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action unload-truck-loc_p1_t4_l41_c4__effect__
        :precondition (and (K_in-ot_p1_t4) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_in-ot_p1_t4)) (not (K_not_at-ol_p1_l41)) (K_at-ol_p1_l41) (K_not_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action unload-truck-loc_p1_t4_l42_c4__effect__
        :precondition (and (K_in-ot_p1_t4) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_in-ot_p1_t4)) (not (K_not_at-ol_p1_l42)) (K_at-ol_p1_l42) (K_not_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action unload-truck-loc_p1_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_in-ot_p1_t4) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_in-ot_p1_t4)) (not (K_not_at-ol_p1_l43)) (K_at-ol_p1_l43) (K_not_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action unload-truck-loc_p1_t4_l44_c4__effect__
        :precondition (and (K_in-ot_p1_t4) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_in-ot_p1_t4)) (not (K_not_at-ol_p1_l44)) (K_at-ol_p1_l44) (K_not_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action unload-truck-loc_p2_t0_l01_c0__effect__
        :precondition (and (K_in-ot_p2_t0) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_in-ot_p2_t0)) (not (K_not_at-ol_p2_l01)) (K_at-ol_p2_l01) (K_not_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action unload-truck-loc_p2_t0_l02_c0__effect__
        :precondition (and (K_in-ot_p2_t0) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_in-ot_p2_t0)) (not (K_not_at-ol_p2_l02)) (K_at-ol_p2_l02) (K_not_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action unload-truck-loc_p2_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_in-ot_p2_t0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_in-ot_p2_t0)) (not (K_not_at-ol_p2_l03)) (K_at-ol_p2_l03) (K_not_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action unload-truck-loc_p2_t0_l04_c0__effect__
        :precondition (and (K_in-ot_p2_t0) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_in-ot_p2_t0)) (not (K_not_at-ol_p2_l04)) (K_at-ol_p2_l04) (K_not_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action unload-truck-loc_p2_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_in-ot_p2_t1) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_not_at-ol_p2_l11)) (not (K_normal-execution)) (not (K_in-ot_p2_t1)) (K_not_in-ot_p2_t1) (K_not_normal-execution) (K_at-ol_p2_l11) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action unload-truck-loc_p2_t1_l12_c1__effect__
        :precondition (and (K_in-ot_p2_t1) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_not_at-ol_p2_l12)) (not (K_normal-execution)) (not (K_in-ot_p2_t1)) (K_not_in-ot_p2_t1) (K_not_normal-execution) (K_at-ol_p2_l12) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action unload-truck-loc_p2_t1_l13_c1__effect__
        :precondition (and (K_in-ot_p2_t1) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_not_at-ol_p2_l13)) (not (K_normal-execution)) (not (K_in-ot_p2_t1)) (K_not_in-ot_p2_t1) (K_not_normal-execution) (K_at-ol_p2_l13) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action unload-truck-loc_p2_t1_l14_c1__effect__
        :precondition (and (K_in-ot_p2_t1) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_not_at-ol_p2_l14)) (not (K_normal-execution)) (not (K_in-ot_p2_t1)) (K_not_in-ot_p2_t1) (K_not_normal-execution) (K_at-ol_p2_l14) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action unload-truck-loc_p2_t2_l21_c2__effect__
        :precondition (and (K_in-ot_p2_t2) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_in-ot_p2_t2)) (not (K_not_at-ol_p2_l21)) (K_at-ol_p2_l21) (K_not_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action unload-truck-loc_p2_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_in-ot_p2_t2) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_in-ot_p2_t2)) (not (K_not_at-ol_p2_l22)) (K_at-ol_p2_l22) (K_not_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action unload-truck-loc_p2_t2_l23_c2__effect__
        :precondition (and (K_in-ot_p2_t2) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_in-ot_p2_t2)) (not (K_not_at-ol_p2_l23)) (K_at-ol_p2_l23) (K_not_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action unload-truck-loc_p2_t2_l24_c2__effect__
        :precondition (and (K_in-ot_p2_t2) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_in-ot_p2_t2)) (not (K_not_at-ol_p2_l24)) (K_at-ol_p2_l24) (K_not_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action unload-truck-loc_p2_t3_l31_c3__effect__
        :precondition (and (K_in-ot_p2_t3) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_in-ot_p2_t3)) (not (K_not_at-ol_p2_l31)) (K_at-ol_p2_l31) (K_not_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action unload-truck-loc_p2_t3_l32_c3__effect__
        :precondition (and (K_in-ot_p2_t3) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_in-ot_p2_t3)) (not (K_not_at-ol_p2_l32)) (K_at-ol_p2_l32) (K_not_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action unload-truck-loc_p2_t3_l33_c3__effect__
        :precondition (and (K_in-ot_p2_t3) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_in-ot_p2_t3)) (not (K_not_at-ol_p2_l33)) (K_at-ol_p2_l33) (K_not_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action unload-truck-loc_p2_t3_l34_c3__effect__
        :precondition (and (K_in-ot_p2_t3) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_in-ot_p2_t3)) (not (K_not_at-ol_p2_l34)) (K_at-ol_p2_l34) (K_not_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action unload-truck-loc_p2_t4_l41_c4__effect__
        :precondition (and (K_in-ot_p2_t4) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_in-ot_p2_t4)) (not (K_not_at-ol_p2_l41)) (K_at-ol_p2_l41) (K_not_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action unload-truck-loc_p2_t4_l42_c4__effect__
        :precondition (and (K_in-ot_p2_t4) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_in-ot_p2_t4)) (not (K_not_at-ol_p2_l42)) (K_at-ol_p2_l42) (K_not_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action unload-truck-loc_p2_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_in-ot_p2_t4) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_in-ot_p2_t4)) (not (K_not_at-ol_p2_l43)) (K_at-ol_p2_l43) (K_not_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action unload-truck-loc_p2_t4_l44_c4__effect__
        :precondition (and (K_in-ot_p2_t4) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_in-ot_p2_t4)) (not (K_not_at-ol_p2_l44)) (K_at-ol_p2_l44) (K_not_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action unload-truck-loc_p3_t0_l01_c0__effect__
        :precondition (and (K_in-ot_p3_t0) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_in-ot_p3_t0)) (not (K_not_at-ol_p3_l01)) (K_at-ol_p3_l01) (K_not_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action unload-truck-loc_p3_t0_l02_c0__effect__
        :precondition (and (K_in-ot_p3_t0) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_in-ot_p3_t0)) (not (K_not_at-ol_p3_l02)) (K_at-ol_p3_l02) (K_not_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action unload-truck-loc_p3_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_in-ot_p3_t0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_in-ot_p3_t0)) (not (K_not_at-ol_p3_l03)) (K_at-ol_p3_l03) (K_not_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action unload-truck-loc_p3_t0_l04_c0__effect__
        :precondition (and (K_in-ot_p3_t0) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_in-ot_p3_t0)) (not (K_not_at-ol_p3_l04)) (K_at-ol_p3_l04) (K_not_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action unload-truck-loc_p3_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_in-ot_p3_t1) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_in-ot_p3_t1)) (not (K_not_at-ol_p3_l11)) (K_at-ol_p3_l11) (K_not_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action unload-truck-loc_p3_t1_l12_c1__effect__
        :precondition (and (K_in-ot_p3_t1) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_in-ot_p3_t1)) (not (K_not_at-ol_p3_l12)) (K_at-ol_p3_l12) (K_not_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action unload-truck-loc_p3_t1_l13_c1__effect__
        :precondition (and (K_in-ot_p3_t1) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_in-ot_p3_t1)) (not (K_not_at-ol_p3_l13)) (K_at-ol_p3_l13) (K_not_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action unload-truck-loc_p3_t1_l14_c1__effect__
        :precondition (and (K_in-ot_p3_t1) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_in-ot_p3_t1)) (not (K_not_at-ol_p3_l14)) (K_at-ol_p3_l14) (K_not_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action unload-truck-loc_p3_t2_l21_c2__effect__
        :precondition (and (K_in-ot_p3_t2) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_not_at-ol_p3_l21)) (not (K_normal-execution)) (not (K_in-ot_p3_t2)) (K_not_in-ot_p3_t2) (K_not_normal-execution) (K_at-ol_p3_l21) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action unload-truck-loc_p3_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_in-ot_p3_t2) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_not_at-ol_p3_l22)) (not (K_normal-execution)) (not (K_in-ot_p3_t2)) (K_not_in-ot_p3_t2) (K_not_normal-execution) (K_at-ol_p3_l22) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action unload-truck-loc_p3_t2_l23_c2__effect__
        :precondition (and (K_in-ot_p3_t2) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_not_at-ol_p3_l23)) (not (K_normal-execution)) (not (K_in-ot_p3_t2)) (K_not_in-ot_p3_t2) (K_not_normal-execution) (K_at-ol_p3_l23) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action unload-truck-loc_p3_t2_l24_c2__effect__
        :precondition (and (K_in-ot_p3_t2) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_not_at-ol_p3_l24)) (not (K_normal-execution)) (not (K_in-ot_p3_t2)) (K_not_in-ot_p3_t2) (K_not_normal-execution) (K_at-ol_p3_l24) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action unload-truck-loc_p3_t3_l31_c3__effect__
        :precondition (and (K_in-ot_p3_t3) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_in-ot_p3_t3)) (not (K_not_at-ol_p3_l31)) (K_at-ol_p3_l31) (K_not_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action unload-truck-loc_p3_t3_l32_c3__effect__
        :precondition (and (K_in-ot_p3_t3) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_in-ot_p3_t3)) (not (K_not_at-ol_p3_l32)) (K_at-ol_p3_l32) (K_not_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action unload-truck-loc_p3_t3_l33_c3__effect__
        :precondition (and (K_in-ot_p3_t3) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_in-ot_p3_t3)) (not (K_not_at-ol_p3_l33)) (K_at-ol_p3_l33) (K_not_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action unload-truck-loc_p3_t3_l34_c3__effect__
        :precondition (and (K_in-ot_p3_t3) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_in-ot_p3_t3)) (not (K_not_at-ol_p3_l34)) (K_at-ol_p3_l34) (K_not_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action unload-truck-loc_p3_t4_l41_c4__effect__
        :precondition (and (K_in-ot_p3_t4) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_in-ot_p3_t4)) (not (K_not_at-ol_p3_l41)) (K_at-ol_p3_l41) (K_not_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action unload-truck-loc_p3_t4_l42_c4__effect__
        :precondition (and (K_in-ot_p3_t4) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_in-ot_p3_t4)) (not (K_not_at-ol_p3_l42)) (K_at-ol_p3_l42) (K_not_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action unload-truck-loc_p3_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_in-ot_p3_t4) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_in-ot_p3_t4)) (not (K_not_at-ol_p3_l43)) (K_at-ol_p3_l43) (K_not_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action unload-truck-loc_p3_t4_l44_c4__effect__
        :precondition (and (K_in-ot_p3_t4) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_in-ot_p3_t4)) (not (K_not_at-ol_p3_l44)) (K_at-ol_p3_l44) (K_not_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action unload-truck-loc_p4_t0_l01_c0__effect__
        :precondition (and (K_in-ot_p4_t0) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_in-ot_p4_t0)) (not (K_not_at-ol_p4_l01)) (K_at-ol_p4_l01) (K_not_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action unload-truck-loc_p4_t0_l02_c0__effect__
        :precondition (and (K_in-ot_p4_t0) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_in-ot_p4_t0)) (not (K_not_at-ol_p4_l02)) (K_at-ol_p4_l02) (K_not_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action unload-truck-loc_p4_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_in-ot_p4_t0) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_in-ot_p4_t0)) (not (K_not_at-ol_p4_l03)) (K_at-ol_p4_l03) (K_not_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action unload-truck-loc_p4_t0_l04_c0__effect__
        :precondition (and (K_in-ot_p4_t0) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_in-ot_p4_t0)) (not (K_not_at-ol_p4_l04)) (K_at-ol_p4_l04) (K_not_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action unload-truck-loc_p4_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_in-ot_p4_t1) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_in-ot_p4_t1)) (not (K_not_at-ol_p4_l11)) (K_at-ol_p4_l11) (K_not_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action unload-truck-loc_p4_t1_l12_c1__effect__
        :precondition (and (K_in-ot_p4_t1) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_in-ot_p4_t1)) (not (K_not_at-ol_p4_l12)) (K_at-ol_p4_l12) (K_not_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action unload-truck-loc_p4_t1_l13_c1__effect__
        :precondition (and (K_in-ot_p4_t1) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_in-ot_p4_t1)) (not (K_not_at-ol_p4_l13)) (K_at-ol_p4_l13) (K_not_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action unload-truck-loc_p4_t1_l14_c1__effect__
        :precondition (and (K_in-ot_p4_t1) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_in-ot_p4_t1)) (not (K_not_at-ol_p4_l14)) (K_at-ol_p4_l14) (K_not_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action unload-truck-loc_p4_t2_l21_c2__effect__
        :precondition (and (K_in-ot_p4_t2) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_in-ot_p4_t2)) (not (K_not_at-ol_p4_l21)) (K_at-ol_p4_l21) (K_not_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action unload-truck-loc_p4_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_in-ot_p4_t2) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_in-ot_p4_t2)) (not (K_not_at-ol_p4_l22)) (K_at-ol_p4_l22) (K_not_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action unload-truck-loc_p4_t2_l23_c2__effect__
        :precondition (and (K_in-ot_p4_t2) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_in-ot_p4_t2)) (not (K_not_at-ol_p4_l23)) (K_at-ol_p4_l23) (K_not_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action unload-truck-loc_p4_t2_l24_c2__effect__
        :precondition (and (K_in-ot_p4_t2) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_in-ot_p4_t2)) (not (K_not_at-ol_p4_l24)) (K_at-ol_p4_l24) (K_not_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action unload-truck-loc_p4_t3_l31_c3__effect__
        :precondition (and (K_in-ot_p4_t3) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_in-ot_p4_t3)) (not (K_not_at-ol_p4_l31)) (K_at-ol_p4_l31) (K_not_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action unload-truck-loc_p4_t3_l32_c3__effect__
        :precondition (and (K_in-ot_p4_t3) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_in-ot_p4_t3)) (not (K_not_at-ol_p4_l32)) (K_at-ol_p4_l32) (K_not_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action unload-truck-loc_p4_t3_l33_c3__effect__
        :precondition (and (K_in-ot_p4_t3) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_in-ot_p4_t3)) (not (K_not_at-ol_p4_l33)) (K_at-ol_p4_l33) (K_not_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action unload-truck-loc_p4_t3_l34_c3__effect__
        :precondition (and (K_in-ot_p4_t3) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_in-ot_p4_t3)) (not (K_not_at-ol_p4_l34)) (K_at-ol_p4_l34) (K_not_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action unload-truck-loc_p4_t4_l41_c4__effect__
        :precondition (and (K_in-ot_p4_t4) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_not_at-ol_p4_l41)) (not (K_normal-execution)) (not (K_in-ot_p4_t4)) (K_not_in-ot_p4_t4) (K_not_normal-execution) (K_at-ol_p4_l41) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action unload-truck-loc_p4_t4_l42_c4__effect__
        :precondition (and (K_in-ot_p4_t4) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_not_at-ol_p4_l42)) (not (K_normal-execution)) (not (K_in-ot_p4_t4)) (K_not_in-ot_p4_t4) (K_not_normal-execution) (K_at-ol_p4_l42) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action unload-truck-loc_p4_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_in-ot_p4_t4) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_not_at-ol_p4_l43)) (not (K_normal-execution)) (not (K_in-ot_p4_t4)) (K_not_in-ot_p4_t4) (K_not_normal-execution) (K_at-ol_p4_l43) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action unload-truck-loc_p4_t4_l44_c4__effect__
        :precondition (and (K_in-ot_p4_t4) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_not_at-ol_p4_l44)) (not (K_normal-execution)) (not (K_in-ot_p4_t4)) (K_not_in-ot_p4_t4) (K_not_normal-execution) (K_at-ol_p4_l44) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action load-airplane_p0_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution) (K_at-oa_p0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_at-oa_p0_l00)) (not (K_normal-execution)) (not (K_not_in-oa_p0_a0)) (K_in-oa_p0_a0) (K_not_normal-execution) (K_not_at-oa_p0_l00) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-airplane_p0_a0_l10__effect__
        :precondition (and (K_at-oa_p0_l10) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-oa_p0_a0)) (not (K_at-oa_p0_l10)) (K_not_at-oa_p0_l10) (K_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-airplane_p0_a0_l20__effect__
        :precondition (and (K_at-oa_p0_l20) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-oa_p0_a0)) (not (K_at-oa_p0_l20)) (K_not_at-oa_p0_l20) (K_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-airplane_p0_a0_l30__effect__
        :precondition (and (K_at-oa_p0_l30) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-oa_p0_a0)) (not (K_at-oa_p0_l30)) (K_not_at-oa_p0_l30) (K_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-airplane_p0_a0_l40__effect__
        :precondition (and (K_at-oa_p0_l40) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-oa_p0_a0)) (not (K_at-oa_p0_l40)) (K_not_at-oa_p0_l40) (K_in-oa_p0_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-airplane_p1_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_at-oa_p1_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-oa_p1_a0)) (not (K_at-oa_p1_l00)) (K_not_at-oa_p1_l00) (K_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-airplane_p1_a0_l10__effect__
        :precondition (and (K_at-oa_p1_l10) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-oa_p1_a0)) (not (K_at-oa_p1_l10)) (K_not_at-oa_p1_l10) (K_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-airplane_p1_a0_l20__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p1_l20) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_at-oa_p1_l20)) (not (K_normal-execution)) (not (K_not_in-oa_p1_a0)) (K_in-oa_p1_a0) (K_not_normal-execution) (K_not_at-oa_p1_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-airplane_p1_a0_l30__effect__
        :precondition (and (K_at-oa_p1_l30) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-oa_p1_a0)) (not (K_at-oa_p1_l30)) (K_not_at-oa_p1_l30) (K_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-airplane_p1_a0_l40__effect__
        :precondition (and (K_at-oa_p1_l40) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-oa_p1_a0)) (not (K_at-oa_p1_l40)) (K_not_at-oa_p1_l40) (K_in-oa_p1_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-airplane_p2_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_at-oa_p2_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-oa_p2_a0)) (not (K_at-oa_p2_l00)) (K_not_at-oa_p2_l00) (K_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-airplane_p2_a0_l10__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p2_l10) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_at-oa_p2_l10)) (not (K_normal-execution)) (not (K_not_in-oa_p2_a0)) (K_in-oa_p2_a0) (K_not_normal-execution) (K_not_at-oa_p2_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-airplane_p2_a0_l20__effect__
        :precondition (and (K_at-oa_p2_l20) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-oa_p2_a0)) (not (K_at-oa_p2_l20)) (K_not_at-oa_p2_l20) (K_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-airplane_p2_a0_l30__effect__
        :precondition (and (K_at-oa_p2_l30) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-oa_p2_a0)) (not (K_at-oa_p2_l30)) (K_not_at-oa_p2_l30) (K_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-airplane_p2_a0_l40__effect__
        :precondition (and (K_at-oa_p2_l40) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-oa_p2_a0)) (not (K_at-oa_p2_l40)) (K_not_at-oa_p2_l40) (K_in-oa_p2_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-airplane_p3_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_at-oa_p3_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-oa_p3_a0)) (not (K_at-oa_p3_l00)) (K_not_at-oa_p3_l00) (K_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-airplane_p3_a0_l10__effect__
        :precondition (and (K_at-oa_p3_l10) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-oa_p3_a0)) (not (K_at-oa_p3_l10)) (K_not_at-oa_p3_l10) (K_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-airplane_p3_a0_l20__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p3_l20) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_at-oa_p3_l20)) (not (K_normal-execution)) (not (K_not_in-oa_p3_a0)) (K_in-oa_p3_a0) (K_not_normal-execution) (K_not_at-oa_p3_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-airplane_p3_a0_l30__effect__
        :precondition (and (K_at-oa_p3_l30) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-oa_p3_a0)) (not (K_at-oa_p3_l30)) (K_not_at-oa_p3_l30) (K_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-airplane_p3_a0_l40__effect__
        :precondition (and (K_at-oa_p3_l40) (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-oa_p3_a0)) (not (K_at-oa_p3_l40)) (K_not_at-oa_p3_l40) (K_in-oa_p3_a0) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-airplane_p4_a0_l00__effect__
        :precondition (and (K_at-aa_a0_l00) (K_at-oa_p4_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-oa_p4_a0)) (not (K_at-oa_p4_l00)) (K_not_at-oa_p4_l00) (K_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-airplane_p4_a0_l10__effect__
        :precondition (and (K_at-oa_p4_l10) (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-oa_p4_a0)) (not (K_at-oa_p4_l10)) (K_not_at-oa_p4_l10) (K_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-airplane_p4_a0_l20__effect__
        :precondition (and (K_at-oa_p4_l20) (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-oa_p4_a0)) (not (K_at-oa_p4_l20)) (K_not_at-oa_p4_l20) (K_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-airplane_p4_a0_l30__effect__
        :precondition (and (K_at-oa_p4_l30) (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-oa_p4_a0)) (not (K_at-oa_p4_l30)) (K_not_at-oa_p4_l30) (K_in-oa_p4_a0) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-airplane_p4_a0_l40__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p4_l40) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_at-oa_p4_l40)) (not (K_normal-execution)) (not (K_not_in-oa_p4_a0)) (K_in-oa_p4_a0) (K_not_normal-execution) (K_not_at-oa_p4_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-ap_p0_t0_l00_c0__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p0_l00) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_at-oa_p0_l00)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t0)) (K_in-ot_p0_t0) (K_not_normal-execution) (K_not_at-oa_p0_l00) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-truck-ap_p0_t1_l10_c1__effect__
        :precondition (and (K_at-oa_p0_l10) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t1)) (not (K_at-oa_p0_l10)) (K_not_at-oa_p0_l10) (K_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-truck-ap_p0_t2_l20_c2__effect__
        :precondition (and (K_at-oa_p0_l20) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t2)) (not (K_at-oa_p0_l20)) (K_not_at-oa_p0_l20) (K_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-truck-ap_p0_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_at-oa_p0_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t3)) (not (K_at-oa_p0_l30)) (K_not_at-oa_p0_l30) (K_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-truck-ap_p0_t4_l40_c4__effect__
        :precondition (and (K_at-oa_p0_l40) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t4)) (not (K_at-oa_p0_l40)) (K_not_at-oa_p0_l40) (K_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-ap_p1_t0_l00_c0__effect__
        :precondition (and (K_at-oa_p1_l00) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t0)) (not (K_at-oa_p1_l00)) (K_not_at-oa_p1_l00) (K_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-truck-ap_p1_t1_l10_c1__effect__
        :precondition (and (K_at-oa_p1_l10) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t1)) (not (K_at-oa_p1_l10)) (K_not_at-oa_p1_l10) (K_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-truck-ap_p1_t2_l20_c2__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p1_l20) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_at-oa_p1_l20)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t2)) (K_in-ot_p1_t2) (K_not_normal-execution) (K_not_at-oa_p1_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-truck-ap_p1_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_at-oa_p1_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t3)) (not (K_at-oa_p1_l30)) (K_not_at-oa_p1_l30) (K_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-truck-ap_p1_t4_l40_c4__effect__
        :precondition (and (K_at-oa_p1_l40) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t4)) (not (K_at-oa_p1_l40)) (K_not_at-oa_p1_l40) (K_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-ap_p2_t0_l00_c0__effect__
        :precondition (and (K_at-oa_p2_l00) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t0)) (not (K_at-oa_p2_l00)) (K_not_at-oa_p2_l00) (K_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-truck-ap_p2_t1_l10_c1__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p2_l10) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_at-oa_p2_l10)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t1)) (K_in-ot_p2_t1) (K_not_normal-execution) (K_not_at-oa_p2_l10) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-truck-ap_p2_t2_l20_c2__effect__
        :precondition (and (K_at-oa_p2_l20) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t2)) (not (K_at-oa_p2_l20)) (K_not_at-oa_p2_l20) (K_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-truck-ap_p2_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_at-oa_p2_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t3)) (not (K_at-oa_p2_l30)) (K_not_at-oa_p2_l30) (K_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-truck-ap_p2_t4_l40_c4__effect__
        :precondition (and (K_at-oa_p2_l40) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t4)) (not (K_at-oa_p2_l40)) (K_not_at-oa_p2_l40) (K_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-ap_p3_t0_l00_c0__effect__
        :precondition (and (K_at-oa_p3_l00) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t0)) (not (K_at-oa_p3_l00)) (K_not_at-oa_p3_l00) (K_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-truck-ap_p3_t1_l10_c1__effect__
        :precondition (and (K_at-oa_p3_l10) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t1)) (not (K_at-oa_p3_l10)) (K_not_at-oa_p3_l10) (K_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-truck-ap_p3_t2_l20_c2__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p3_l20) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_at-oa_p3_l20)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t2)) (K_in-ot_p3_t2) (K_not_normal-execution) (K_not_at-oa_p3_l20) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-truck-ap_p3_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_at-oa_p3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t3)) (not (K_at-oa_p3_l30)) (K_not_at-oa_p3_l30) (K_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-truck-ap_p3_t4_l40_c4__effect__
        :precondition (and (K_at-oa_p3_l40) (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t4)) (not (K_at-oa_p3_l40)) (K_not_at-oa_p3_l40) (K_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-ap_p4_t0_l00_c0__effect__
        :precondition (and (K_at-oa_p4_l00) (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t0)) (not (K_at-oa_p4_l00)) (K_not_at-oa_p4_l00) (K_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action load-truck-ap_p4_t1_l10_c1__effect__
        :precondition (and (K_at-oa_p4_l10) (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t1)) (not (K_at-oa_p4_l10)) (K_not_at-oa_p4_l10) (K_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action load-truck-ap_p4_t2_l20_c2__effect__
        :precondition (and (K_at-oa_p4_l20) (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t2)) (not (K_at-oa_p4_l20)) (K_not_at-oa_p4_l20) (K_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action load-truck-ap_p4_t3_l30_c3__effect__
        :precondition (and (K_at-ta_t3_l30) (K_at-oa_p4_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t3)) (not (K_at-oa_p4_l30)) (K_not_at-oa_p4_l30) (K_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action load-truck-ap_p4_t4_l40_c4__effect__
        :precondition (and (K_normal-execution) (K_at-oa_p4_l40) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_at-oa_p4_l40)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t4)) (K_in-ot_p4_t4) (K_not_normal-execution) (K_not_at-oa_p4_l40) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action load-truck-loc_p0_t0_l01_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p0_l01) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_at-ol_p0_l01)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t0)) (K_in-ot_p0_t0) (K_not_normal-execution) (K_not_at-ol_p0_l01) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action load-truck-loc_p0_t0_l02_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p0_l02) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_at-ol_p0_l02)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t0)) (K_in-ot_p0_t0) (K_not_normal-execution) (K_not_at-ol_p0_l02) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action load-truck-loc_p0_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_normal-execution) (K_at-ol_p0_l03))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_at-ol_p0_l03)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t0)) (K_in-ot_p0_t0) (K_not_normal-execution) (K_not_at-ol_p0_l03) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action load-truck-loc_p0_t0_l04_c0__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p0_l04) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_at-ol_p0_l04)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t0)) (K_in-ot_p0_t0) (K_not_normal-execution) (K_not_at-ol_p0_l04) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action load-truck-loc_p0_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_at-ol_p0_l11) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t1)) (not (K_at-ol_p0_l11)) (K_not_at-ol_p0_l11) (K_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action load-truck-loc_p0_t1_l12_c1__effect__
        :precondition (and (K_at-ol_p0_l12) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t1)) (not (K_at-ol_p0_l12)) (K_not_at-ol_p0_l12) (K_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action load-truck-loc_p0_t1_l13_c1__effect__
        :precondition (and (K_at-ol_p0_l13) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t1)) (not (K_at-ol_p0_l13)) (K_not_at-ol_p0_l13) (K_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action load-truck-loc_p0_t1_l14_c1__effect__
        :precondition (and (K_at-ol_p0_l14) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t1)) (not (K_at-ol_p0_l14)) (K_not_at-ol_p0_l14) (K_in-ot_p0_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action load-truck-loc_p0_t2_l21_c2__effect__
        :precondition (and (K_at-ol_p0_l21) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t2)) (not (K_at-ol_p0_l21)) (K_not_at-ol_p0_l21) (K_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action load-truck-loc_p0_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_at-ol_p0_l22) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t2)) (not (K_at-ol_p0_l22)) (K_not_at-ol_p0_l22) (K_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action load-truck-loc_p0_t2_l23_c2__effect__
        :precondition (and (K_at-ol_p0_l23) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t2)) (not (K_at-ol_p0_l23)) (K_not_at-ol_p0_l23) (K_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action load-truck-loc_p0_t2_l24_c2__effect__
        :precondition (and (K_at-ol_p0_l24) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t2)) (not (K_at-ol_p0_l24)) (K_not_at-ol_p0_l24) (K_in-ot_p0_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action load-truck-loc_p0_t3_l31_c3__effect__
        :precondition (and (K_at-ol_p0_l31) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t3)) (not (K_at-ol_p0_l31)) (K_not_at-ol_p0_l31) (K_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action load-truck-loc_p0_t3_l32_c3__effect__
        :precondition (and (K_at-ol_p0_l32) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t3)) (not (K_at-ol_p0_l32)) (K_not_at-ol_p0_l32) (K_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action load-truck-loc_p0_t3_l33_c3__effect__
        :precondition (and (K_at-ol_p0_l33) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t3)) (not (K_at-ol_p0_l33)) (K_not_at-ol_p0_l33) (K_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action load-truck-loc_p0_t3_l34_c3__effect__
        :precondition (and (K_at-ol_p0_l34) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t3)) (not (K_at-ol_p0_l34)) (K_not_at-ol_p0_l34) (K_in-ot_p0_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action load-truck-loc_p0_t4_l41_c4__effect__
        :precondition (and (K_at-ol_p0_l41) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t4)) (not (K_at-ol_p0_l41)) (K_not_at-ol_p0_l41) (K_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action load-truck-loc_p0_t4_l42_c4__effect__
        :precondition (and (K_at-ol_p0_l42) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t4)) (not (K_at-ol_p0_l42)) (K_not_at-ol_p0_l42) (K_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action load-truck-loc_p0_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_at-ol_p0_l43) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t4)) (not (K_at-ol_p0_l43)) (K_not_at-ol_p0_l43) (K_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action load-truck-loc_p0_t4_l44_c4__effect__
        :precondition (and (K_at-ol_p0_l44) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_not_in-ot_p0_t4)) (not (K_at-ol_p0_l44)) (K_not_at-ol_p0_l44) (K_in-ot_p0_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action load-truck-loc_p1_t0_l01_c0__effect__
        :precondition (and (K_at-ol_p1_l01) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t0)) (not (K_at-ol_p1_l01)) (K_not_at-ol_p1_l01) (K_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action load-truck-loc_p1_t0_l02_c0__effect__
        :precondition (and (K_at-ol_p1_l02) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t0)) (not (K_at-ol_p1_l02)) (K_not_at-ol_p1_l02) (K_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action load-truck-loc_p1_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_at-ol_p1_l03) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t0)) (not (K_at-ol_p1_l03)) (K_not_at-ol_p1_l03) (K_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action load-truck-loc_p1_t0_l04_c0__effect__
        :precondition (and (K_at-ol_p1_l04) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t0)) (not (K_at-ol_p1_l04)) (K_not_at-ol_p1_l04) (K_in-ot_p1_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action load-truck-loc_p1_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_at-ol_p1_l11) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t1)) (not (K_at-ol_p1_l11)) (K_not_at-ol_p1_l11) (K_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action load-truck-loc_p1_t1_l12_c1__effect__
        :precondition (and (K_at-ol_p1_l12) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t1)) (not (K_at-ol_p1_l12)) (K_not_at-ol_p1_l12) (K_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action load-truck-loc_p1_t1_l13_c1__effect__
        :precondition (and (K_at-ol_p1_l13) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t1)) (not (K_at-ol_p1_l13)) (K_not_at-ol_p1_l13) (K_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action load-truck-loc_p1_t1_l14_c1__effect__
        :precondition (and (K_at-ol_p1_l14) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t1)) (not (K_at-ol_p1_l14)) (K_not_at-ol_p1_l14) (K_in-ot_p1_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action load-truck-loc_p1_t2_l21_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p1_l21) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_at-ol_p1_l21)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t2)) (K_in-ot_p1_t2) (K_not_normal-execution) (K_not_at-ol_p1_l21) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action load-truck-loc_p1_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_normal-execution) (K_at-ol_p1_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_at-ol_p1_l22)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t2)) (K_in-ot_p1_t2) (K_not_normal-execution) (K_not_at-ol_p1_l22) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action load-truck-loc_p1_t2_l23_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p1_l23) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_at-ol_p1_l23)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t2)) (K_in-ot_p1_t2) (K_not_normal-execution) (K_not_at-ol_p1_l23) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action load-truck-loc_p1_t2_l24_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p1_l24) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_at-ol_p1_l24)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t2)) (K_in-ot_p1_t2) (K_not_normal-execution) (K_not_at-ol_p1_l24) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action load-truck-loc_p1_t3_l31_c3__effect__
        :precondition (and (K_at-ol_p1_l31) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t3)) (not (K_at-ol_p1_l31)) (K_not_at-ol_p1_l31) (K_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action load-truck-loc_p1_t3_l32_c3__effect__
        :precondition (and (K_at-ol_p1_l32) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t3)) (not (K_at-ol_p1_l32)) (K_not_at-ol_p1_l32) (K_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action load-truck-loc_p1_t3_l33_c3__effect__
        :precondition (and (K_at-ol_p1_l33) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t3)) (not (K_at-ol_p1_l33)) (K_not_at-ol_p1_l33) (K_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action load-truck-loc_p1_t3_l34_c3__effect__
        :precondition (and (K_at-ol_p1_l34) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t3)) (not (K_at-ol_p1_l34)) (K_not_at-ol_p1_l34) (K_in-ot_p1_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action load-truck-loc_p1_t4_l41_c4__effect__
        :precondition (and (K_at-ol_p1_l41) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t4)) (not (K_at-ol_p1_l41)) (K_not_at-ol_p1_l41) (K_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action load-truck-loc_p1_t4_l42_c4__effect__
        :precondition (and (K_at-ol_p1_l42) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t4)) (not (K_at-ol_p1_l42)) (K_not_at-ol_p1_l42) (K_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action load-truck-loc_p1_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_at-ol_p1_l43) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t4)) (not (K_at-ol_p1_l43)) (K_not_at-ol_p1_l43) (K_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action load-truck-loc_p1_t4_l44_c4__effect__
        :precondition (and (K_at-ol_p1_l44) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_not_in-ot_p1_t4)) (not (K_at-ol_p1_l44)) (K_not_at-ol_p1_l44) (K_in-ot_p1_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action load-truck-loc_p2_t0_l01_c0__effect__
        :precondition (and (K_at-ol_p2_l01) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t0)) (not (K_at-ol_p2_l01)) (K_not_at-ol_p2_l01) (K_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action load-truck-loc_p2_t0_l02_c0__effect__
        :precondition (and (K_at-ol_p2_l02) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t0)) (not (K_at-ol_p2_l02)) (K_not_at-ol_p2_l02) (K_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action load-truck-loc_p2_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_at-ol_p2_l03) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t0)) (not (K_at-ol_p2_l03)) (K_not_at-ol_p2_l03) (K_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action load-truck-loc_p2_t0_l04_c0__effect__
        :precondition (and (K_at-ol_p2_l04) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t0)) (not (K_at-ol_p2_l04)) (K_not_at-ol_p2_l04) (K_in-ot_p2_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action load-truck-loc_p2_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_normal-execution) (K_at-ol_p2_l11))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_at-ol_p2_l11)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t1)) (K_in-ot_p2_t1) (K_not_normal-execution) (K_not_at-ol_p2_l11) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action load-truck-loc_p2_t1_l12_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p2_l12) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_at-ol_p2_l12)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t1)) (K_in-ot_p2_t1) (K_not_normal-execution) (K_not_at-ol_p2_l12) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action load-truck-loc_p2_t1_l13_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p2_l13) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_at-ol_p2_l13)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t1)) (K_in-ot_p2_t1) (K_not_normal-execution) (K_not_at-ol_p2_l13) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action load-truck-loc_p2_t1_l14_c1__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p2_l14) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_at-ol_p2_l14)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t1)) (K_in-ot_p2_t1) (K_not_normal-execution) (K_not_at-ol_p2_l14) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action load-truck-loc_p2_t2_l21_c2__effect__
        :precondition (and (K_at-ol_p2_l21) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t2)) (not (K_at-ol_p2_l21)) (K_not_at-ol_p2_l21) (K_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action load-truck-loc_p2_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_at-ol_p2_l22) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t2)) (not (K_at-ol_p2_l22)) (K_not_at-ol_p2_l22) (K_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action load-truck-loc_p2_t2_l23_c2__effect__
        :precondition (and (K_at-ol_p2_l23) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t2)) (not (K_at-ol_p2_l23)) (K_not_at-ol_p2_l23) (K_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action load-truck-loc_p2_t2_l24_c2__effect__
        :precondition (and (K_at-ol_p2_l24) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t2)) (not (K_at-ol_p2_l24)) (K_not_at-ol_p2_l24) (K_in-ot_p2_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action load-truck-loc_p2_t3_l31_c3__effect__
        :precondition (and (K_at-ol_p2_l31) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t3)) (not (K_at-ol_p2_l31)) (K_not_at-ol_p2_l31) (K_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action load-truck-loc_p2_t3_l32_c3__effect__
        :precondition (and (K_at-ol_p2_l32) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t3)) (not (K_at-ol_p2_l32)) (K_not_at-ol_p2_l32) (K_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action load-truck-loc_p2_t3_l33_c3__effect__
        :precondition (and (K_at-ol_p2_l33) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t3)) (not (K_at-ol_p2_l33)) (K_not_at-ol_p2_l33) (K_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action load-truck-loc_p2_t3_l34_c3__effect__
        :precondition (and (K_at-ol_p2_l34) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t3)) (not (K_at-ol_p2_l34)) (K_not_at-ol_p2_l34) (K_in-ot_p2_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action load-truck-loc_p2_t4_l41_c4__effect__
        :precondition (and (K_at-ol_p2_l41) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t4)) (not (K_at-ol_p2_l41)) (K_not_at-ol_p2_l41) (K_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action load-truck-loc_p2_t4_l42_c4__effect__
        :precondition (and (K_at-ol_p2_l42) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t4)) (not (K_at-ol_p2_l42)) (K_not_at-ol_p2_l42) (K_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action load-truck-loc_p2_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_at-ol_p2_l43) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t4)) (not (K_at-ol_p2_l43)) (K_not_at-ol_p2_l43) (K_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action load-truck-loc_p2_t4_l44_c4__effect__
        :precondition (and (K_at-ol_p2_l44) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_not_in-ot_p2_t4)) (not (K_at-ol_p2_l44)) (K_not_at-ol_p2_l44) (K_in-ot_p2_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action load-truck-loc_p3_t0_l01_c0__effect__
        :precondition (and (K_at-ol_p3_l01) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t0)) (not (K_at-ol_p3_l01)) (K_not_at-ol_p3_l01) (K_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action load-truck-loc_p3_t0_l02_c0__effect__
        :precondition (and (K_at-ol_p3_l02) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t0)) (not (K_at-ol_p3_l02)) (K_not_at-ol_p3_l02) (K_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action load-truck-loc_p3_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_at-ol_p3_l03) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t0)) (not (K_at-ol_p3_l03)) (K_not_at-ol_p3_l03) (K_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action load-truck-loc_p3_t0_l04_c0__effect__
        :precondition (and (K_at-ol_p3_l04) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t0)) (not (K_at-ol_p3_l04)) (K_not_at-ol_p3_l04) (K_in-ot_p3_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action load-truck-loc_p3_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_at-ol_p3_l11) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t1)) (not (K_at-ol_p3_l11)) (K_not_at-ol_p3_l11) (K_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action load-truck-loc_p3_t1_l12_c1__effect__
        :precondition (and (K_at-ol_p3_l12) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t1)) (not (K_at-ol_p3_l12)) (K_not_at-ol_p3_l12) (K_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action load-truck-loc_p3_t1_l13_c1__effect__
        :precondition (and (K_at-ol_p3_l13) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t1)) (not (K_at-ol_p3_l13)) (K_not_at-ol_p3_l13) (K_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action load-truck-loc_p3_t1_l14_c1__effect__
        :precondition (and (K_at-ol_p3_l14) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t1)) (not (K_at-ol_p3_l14)) (K_not_at-ol_p3_l14) (K_in-ot_p3_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action load-truck-loc_p3_t2_l21_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p3_l21) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_at-ol_p3_l21)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t2)) (K_in-ot_p3_t2) (K_not_normal-execution) (K_not_at-ol_p3_l21) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action load-truck-loc_p3_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_normal-execution) (K_at-ol_p3_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_at-ol_p3_l22)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t2)) (K_in-ot_p3_t2) (K_not_normal-execution) (K_not_at-ol_p3_l22) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action load-truck-loc_p3_t2_l23_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p3_l23) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_at-ol_p3_l23)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t2)) (K_in-ot_p3_t2) (K_not_normal-execution) (K_not_at-ol_p3_l23) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action load-truck-loc_p3_t2_l24_c2__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p3_l24) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_at-ol_p3_l24)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t2)) (K_in-ot_p3_t2) (K_not_normal-execution) (K_not_at-ol_p3_l24) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action load-truck-loc_p3_t3_l31_c3__effect__
        :precondition (and (K_at-ol_p3_l31) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t3)) (not (K_at-ol_p3_l31)) (K_not_at-ol_p3_l31) (K_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action load-truck-loc_p3_t3_l32_c3__effect__
        :precondition (and (K_at-ol_p3_l32) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t3)) (not (K_at-ol_p3_l32)) (K_not_at-ol_p3_l32) (K_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action load-truck-loc_p3_t3_l33_c3__effect__
        :precondition (and (K_at-ol_p3_l33) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t3)) (not (K_at-ol_p3_l33)) (K_not_at-ol_p3_l33) (K_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action load-truck-loc_p3_t3_l34_c3__effect__
        :precondition (and (K_at-ol_p3_l34) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t3)) (not (K_at-ol_p3_l34)) (K_not_at-ol_p3_l34) (K_in-ot_p3_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action load-truck-loc_p3_t4_l41_c4__effect__
        :precondition (and (K_at-ol_p3_l41) (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t4)) (not (K_at-ol_p3_l41)) (K_not_at-ol_p3_l41) (K_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action load-truck-loc_p3_t4_l42_c4__effect__
        :precondition (and (K_at-ol_p3_l42) (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t4)) (not (K_at-ol_p3_l42)) (K_not_at-ol_p3_l42) (K_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action load-truck-loc_p3_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_at-ol_p3_l43) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t4)) (not (K_at-ol_p3_l43)) (K_not_at-ol_p3_l43) (K_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action load-truck-loc_p3_t4_l44_c4__effect__
        :precondition (and (K_at-ol_p3_l44) (K_normal-execution) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (not (K_not_in-ot_p3_t4)) (not (K_at-ol_p3_l44)) (K_not_at-ol_p3_l44) (K_in-ot_p3_t4) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action load-truck-loc_p4_t0_l01_c0__effect__
        :precondition (and (K_at-ol_p4_l01) (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t0)) (not (K_at-ol_p4_l01)) (K_not_at-ol_p4_l01) (K_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action load-truck-loc_p4_t0_l02_c0__effect__
        :precondition (and (K_at-ol_p4_l02) (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t0)) (not (K_at-ol_p4_l02)) (K_not_at-ol_p4_l02) (K_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action load-truck-loc_p4_t0_l03_c0__effect__
        :precondition (and (K_at-tl_t0_l03) (K_at-ol_p4_l03) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t0)) (not (K_at-ol_p4_l03)) (K_not_at-ol_p4_l03) (K_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action load-truck-loc_p4_t0_l04_c0__effect__
        :precondition (and (K_at-ol_p4_l04) (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t0)) (not (K_at-ol_p4_l04)) (K_not_at-ol_p4_l04) (K_in-ot_p4_t0) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action load-truck-loc_p4_t1_l11_c1__effect__
        :precondition (and (K_at-tl_t1_l11) (K_at-ol_p4_l11) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t1)) (not (K_at-ol_p4_l11)) (K_not_at-ol_p4_l11) (K_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action load-truck-loc_p4_t1_l12_c1__effect__
        :precondition (and (K_at-ol_p4_l12) (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t1)) (not (K_at-ol_p4_l12)) (K_not_at-ol_p4_l12) (K_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action load-truck-loc_p4_t1_l13_c1__effect__
        :precondition (and (K_at-ol_p4_l13) (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t1)) (not (K_at-ol_p4_l13)) (K_not_at-ol_p4_l13) (K_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action load-truck-loc_p4_t1_l14_c1__effect__
        :precondition (and (K_at-ol_p4_l14) (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t1)) (not (K_at-ol_p4_l14)) (K_not_at-ol_p4_l14) (K_in-ot_p4_t1) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action load-truck-loc_p4_t2_l21_c2__effect__
        :precondition (and (K_at-ol_p4_l21) (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t2)) (not (K_at-ol_p4_l21)) (K_not_at-ol_p4_l21) (K_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action load-truck-loc_p4_t2_l22_c2__effect__
        :precondition (and (K_at-tl_t2_l22) (K_at-ol_p4_l22) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t2)) (not (K_at-ol_p4_l22)) (K_not_at-ol_p4_l22) (K_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action load-truck-loc_p4_t2_l23_c2__effect__
        :precondition (and (K_at-ol_p4_l23) (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t2)) (not (K_at-ol_p4_l23)) (K_not_at-ol_p4_l23) (K_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action load-truck-loc_p4_t2_l24_c2__effect__
        :precondition (and (K_at-ol_p4_l24) (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t2)) (not (K_at-ol_p4_l24)) (K_not_at-ol_p4_l24) (K_in-ot_p4_t2) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action load-truck-loc_p4_t3_l31_c3__effect__
        :precondition (and (K_at-ol_p4_l31) (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t3)) (not (K_at-ol_p4_l31)) (K_not_at-ol_p4_l31) (K_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action load-truck-loc_p4_t3_l32_c3__effect__
        :precondition (and (K_at-ol_p4_l32) (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t3)) (not (K_at-ol_p4_l32)) (K_not_at-ol_p4_l32) (K_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action load-truck-loc_p4_t3_l33_c3__effect__
        :precondition (and (K_at-ol_p4_l33) (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t3)) (not (K_at-ol_p4_l33)) (K_not_at-ol_p4_l33) (K_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action load-truck-loc_p4_t3_l34_c3__effect__
        :precondition (and (K_at-ol_p4_l34) (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t3)) (not (K_at-ol_p4_l34)) (K_not_at-ol_p4_l34) (K_in-ot_p4_t3) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action load-truck-loc_p4_t4_l41_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p4_l41) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_at-ol_p4_l41)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t4)) (K_in-ot_p4_t4) (K_not_normal-execution) (K_not_at-ol_p4_l41) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action load-truck-loc_p4_t4_l42_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p4_l42) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_at-ol_p4_l42)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t4)) (K_in-ot_p4_t4) (K_not_normal-execution) (K_not_at-ol_p4_l42) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action load-truck-loc_p4_t4_l43_c4__effect__
        :precondition (and (K_at-tl_t4_l43) (K_normal-execution) (K_at-ol_p4_l43))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_at-ol_p4_l43)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t4)) (K_in-ot_p4_t4) (K_not_normal-execution) (K_not_at-ol_p4_l43) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action load-truck-loc_p4_t4_l44_c4__effect__
        :precondition (and (K_normal-execution) (K_at-ol_p4_l44) (K_at-tl_t4_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_at-ol_p4_l44)) (not (K_normal-execution)) (not (K_not_in-ot_p4_t4)) (K_in-ot_p4_t4) (K_not_normal-execution) (K_not_at-ol_p4_l44) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action sense-ap-a_a0_l00__turn_on_sensor__
        :precondition (and (K_at-aa_a0_l00) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-a_a0_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-a_a0_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-a_a0_l30__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-a_a0_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-aa_a0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-ap-t_t0_l00__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-t_t0_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-t_t0_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-t_t0_l30__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-t_t0_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t0_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-ap-t_t1_l00__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-t_t1_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-t_t1_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-t_t1_l30__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-t_t1_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t1_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-ap-t_t2_l00__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-t_t2_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-t_t2_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-t_t2_l30__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-t_t2_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t2_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-ap-t_t3_l00__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t3_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-t_t3_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t3_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-t_t3_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t3_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-t_t3_l30__turn_on_sensor__
        :precondition (and (K_at-ta_t3_l30) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-t_t3_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t3_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-ap-t_t4_l00__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l00))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l00)) (not (K_not_sensing-for-at-oa_p3_l00)) (not (K_not_sensing-for-at-oa_p2_l00)) (not (K_not_sensing-for-at-oa_p1_l00)) (not (K_not_sensing-for-at-oa_p0_l00)) (not (K_not_need-post-atom-1)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-1) (K_sensing-for-at-oa_p0_l00) (K_sensing-for-at-oa_p1_l00) (K_sensing-for-at-oa_p2_l00) (K_sensing-for-at-oa_p3_l00) (K_sensing-for-at-oa_p4_l00)))
    (:action sense-ap-t_t4_l10__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l10))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l10)) (not (K_not_sensing-for-at-oa_p3_l10)) (not (K_not_sensing-for-at-oa_p2_l10)) (not (K_not_sensing-for-at-oa_p1_l10)) (not (K_not_sensing-for-at-oa_p0_l10)) (not (K_not_need-post-atom-2)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-2) (K_sensing-for-at-oa_p0_l10) (K_sensing-for-at-oa_p1_l10) (K_sensing-for-at-oa_p2_l10) (K_sensing-for-at-oa_p3_l10) (K_sensing-for-at-oa_p4_l10)))
    (:action sense-ap-t_t4_l20__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l20))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l20)) (not (K_not_sensing-for-at-oa_p3_l20)) (not (K_not_sensing-for-at-oa_p2_l20)) (not (K_not_sensing-for-at-oa_p1_l20)) (not (K_not_sensing-for-at-oa_p0_l20)) (not (K_not_need-post-atom-3)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-3) (K_sensing-for-at-oa_p0_l20) (K_sensing-for-at-oa_p1_l20) (K_sensing-for-at-oa_p2_l20) (K_sensing-for-at-oa_p3_l20) (K_sensing-for-at-oa_p4_l20)))
    (:action sense-ap-t_t4_l30__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l30))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l30)) (not (K_not_sensing-for-at-oa_p3_l30)) (not (K_not_sensing-for-at-oa_p2_l30)) (not (K_not_sensing-for-at-oa_p1_l30)) (not (K_not_sensing-for-at-oa_p0_l30)) (not (K_not_need-post-atom-4)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-4) (K_sensing-for-at-oa_p0_l30) (K_sensing-for-at-oa_p1_l30) (K_sensing-for-at-oa_p2_l30) (K_sensing-for-at-oa_p3_l30) (K_sensing-for-at-oa_p4_l30)))
    (:action sense-ap-t_t4_l40__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-ta_t4_l40))
        :effect (and (not (K_not_sensing-for-at-oa_p4_l40)) (not (K_not_sensing-for-at-oa_p3_l40)) (not (K_not_sensing-for-at-oa_p2_l40)) (not (K_not_sensing-for-at-oa_p1_l40)) (not (K_not_sensing-for-at-oa_p0_l40)) (not (K_not_need-post-atom-5)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-5) (K_sensing-for-at-oa_p0_l40) (K_sensing-for-at-oa_p1_l40) (K_sensing-for-at-oa_p2_l40) (K_sensing-for-at-oa_p3_l40) (K_sensing-for-at-oa_p4_l40)))
    (:action sense-loc-t_t0_l01__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action sense-loc-t_t0_l02__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action sense-loc-t_t0_l03__turn_on_sensor__
        :precondition (and (K_at-tl_t0_l03) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action sense-loc-t_t0_l04__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action sense-loc-t_t0_l11__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l11))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action sense-loc-t_t0_l12__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action sense-loc-t_t0_l13__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action sense-loc-t_t0_l14__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action sense-loc-t_t0_l21__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action sense-loc-t_t0_l22__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action sense-loc-t_t0_l23__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action sense-loc-t_t0_l24__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action sense-loc-t_t0_l31__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action sense-loc-t_t0_l32__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action sense-loc-t_t0_l33__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action sense-loc-t_t0_l34__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action sense-loc-t_t0_l41__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action sense-loc-t_t0_l42__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action sense-loc-t_t0_l43__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l43))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action sense-loc-t_t0_l44__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t0_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action sense-loc-t_t1_l01__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action sense-loc-t_t1_l02__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action sense-loc-t_t1_l03__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l03))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action sense-loc-t_t1_l04__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action sense-loc-t_t1_l11__turn_on_sensor__
        :precondition (and (K_at-tl_t1_l11) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action sense-loc-t_t1_l12__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action sense-loc-t_t1_l13__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action sense-loc-t_t1_l14__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action sense-loc-t_t1_l21__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action sense-loc-t_t1_l22__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action sense-loc-t_t1_l23__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action sense-loc-t_t1_l24__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action sense-loc-t_t1_l31__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action sense-loc-t_t1_l32__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action sense-loc-t_t1_l33__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action sense-loc-t_t1_l34__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action sense-loc-t_t1_l41__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action sense-loc-t_t1_l42__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action sense-loc-t_t1_l43__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l43))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action sense-loc-t_t1_l44__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t1_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action sense-loc-t_t2_l01__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action sense-loc-t_t2_l02__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action sense-loc-t_t2_l03__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l03))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action sense-loc-t_t2_l04__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action sense-loc-t_t2_l11__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l11))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action sense-loc-t_t2_l12__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action sense-loc-t_t2_l13__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action sense-loc-t_t2_l14__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action sense-loc-t_t2_l21__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action sense-loc-t_t2_l22__turn_on_sensor__
        :precondition (and (K_at-tl_t2_l22) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action sense-loc-t_t2_l23__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action sense-loc-t_t2_l24__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action sense-loc-t_t2_l31__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action sense-loc-t_t2_l32__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action sense-loc-t_t2_l33__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action sense-loc-t_t2_l34__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action sense-loc-t_t2_l41__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action sense-loc-t_t2_l42__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action sense-loc-t_t2_l43__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l43))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action sense-loc-t_t2_l44__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t2_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action sense-loc-t_t3_l01__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action sense-loc-t_t3_l02__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action sense-loc-t_t3_l03__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l03))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action sense-loc-t_t3_l04__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action sense-loc-t_t3_l11__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l11))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action sense-loc-t_t3_l12__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action sense-loc-t_t3_l13__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action sense-loc-t_t3_l14__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action sense-loc-t_t3_l21__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action sense-loc-t_t3_l22__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action sense-loc-t_t3_l23__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action sense-loc-t_t3_l24__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action sense-loc-t_t3_l31__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action sense-loc-t_t3_l32__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action sense-loc-t_t3_l33__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action sense-loc-t_t3_l34__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action sense-loc-t_t3_l41__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action sense-loc-t_t3_l42__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action sense-loc-t_t3_l43__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l43))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action sense-loc-t_t3_l44__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t3_l44))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l44)) (not (K_not_sensing-for-at-ol_p3_l44)) (not (K_not_sensing-for-at-ol_p2_l44)) (not (K_not_sensing-for-at-ol_p1_l44)) (not (K_not_sensing-for-at-ol_p0_l44)) (not (K_not_need-post-atom-0)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-0) (K_sensing-for-at-ol_p0_l44) (K_sensing-for-at-ol_p1_l44) (K_sensing-for-at-ol_p2_l44) (K_sensing-for-at-ol_p3_l44) (K_sensing-for-at-ol_p4_l44)))
    (:action sense-loc-t_t4_l01__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l01))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l01)) (not (K_not_sensing-for-at-ol_p3_l01)) (not (K_not_sensing-for-at-ol_p2_l01)) (not (K_not_sensing-for-at-ol_p1_l01)) (not (K_not_sensing-for-at-ol_p0_l01)) (not (K_not_need-post-atom-6)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-6) (K_sensing-for-at-ol_p0_l01) (K_sensing-for-at-ol_p1_l01) (K_sensing-for-at-ol_p2_l01) (K_sensing-for-at-ol_p3_l01) (K_sensing-for-at-ol_p4_l01)))
    (:action sense-loc-t_t4_l02__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l02))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l02)) (not (K_not_sensing-for-at-ol_p3_l02)) (not (K_not_sensing-for-at-ol_p2_l02)) (not (K_not_sensing-for-at-ol_p1_l02)) (not (K_not_sensing-for-at-ol_p0_l02)) (not (K_not_need-post-atom-7)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-7) (K_sensing-for-at-ol_p0_l02) (K_sensing-for-at-ol_p1_l02) (K_sensing-for-at-ol_p2_l02) (K_sensing-for-at-ol_p3_l02) (K_sensing-for-at-ol_p4_l02)))
    (:action sense-loc-t_t4_l03__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l03))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l03)) (not (K_not_sensing-for-at-ol_p3_l03)) (not (K_not_sensing-for-at-ol_p2_l03)) (not (K_not_sensing-for-at-ol_p1_l03)) (not (K_not_sensing-for-at-ol_p0_l03)) (not (K_not_need-post-atom-8)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-8) (K_sensing-for-at-ol_p0_l03) (K_sensing-for-at-ol_p1_l03) (K_sensing-for-at-ol_p2_l03) (K_sensing-for-at-ol_p3_l03) (K_sensing-for-at-ol_p4_l03)))
    (:action sense-loc-t_t4_l04__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l04))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l04)) (not (K_not_sensing-for-at-ol_p3_l04)) (not (K_not_sensing-for-at-ol_p2_l04)) (not (K_not_sensing-for-at-ol_p1_l04)) (not (K_not_sensing-for-at-ol_p0_l04)) (not (K_not_need-post-atom-9)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-9) (K_sensing-for-at-ol_p0_l04) (K_sensing-for-at-ol_p1_l04) (K_sensing-for-at-ol_p2_l04) (K_sensing-for-at-ol_p3_l04) (K_sensing-for-at-ol_p4_l04)))
    (:action sense-loc-t_t4_l11__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l11))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l11)) (not (K_not_sensing-for-at-ol_p3_l11)) (not (K_not_sensing-for-at-ol_p2_l11)) (not (K_not_sensing-for-at-ol_p1_l11)) (not (K_not_sensing-for-at-ol_p0_l11)) (not (K_not_need-post-atom-10)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-10) (K_sensing-for-at-ol_p0_l11) (K_sensing-for-at-ol_p1_l11) (K_sensing-for-at-ol_p2_l11) (K_sensing-for-at-ol_p3_l11) (K_sensing-for-at-ol_p4_l11)))
    (:action sense-loc-t_t4_l12__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l12))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l12)) (not (K_not_sensing-for-at-ol_p3_l12)) (not (K_not_sensing-for-at-ol_p2_l12)) (not (K_not_sensing-for-at-ol_p1_l12)) (not (K_not_sensing-for-at-ol_p0_l12)) (not (K_not_need-post-atom-11)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-11) (K_sensing-for-at-ol_p0_l12) (K_sensing-for-at-ol_p1_l12) (K_sensing-for-at-ol_p2_l12) (K_sensing-for-at-ol_p3_l12) (K_sensing-for-at-ol_p4_l12)))
    (:action sense-loc-t_t4_l13__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l13))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l13)) (not (K_not_sensing-for-at-ol_p3_l13)) (not (K_not_sensing-for-at-ol_p2_l13)) (not (K_not_sensing-for-at-ol_p1_l13)) (not (K_not_sensing-for-at-ol_p0_l13)) (not (K_not_need-post-atom-12)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-12) (K_sensing-for-at-ol_p0_l13) (K_sensing-for-at-ol_p1_l13) (K_sensing-for-at-ol_p2_l13) (K_sensing-for-at-ol_p3_l13) (K_sensing-for-at-ol_p4_l13)))
    (:action sense-loc-t_t4_l14__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l14))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l14)) (not (K_not_sensing-for-at-ol_p3_l14)) (not (K_not_sensing-for-at-ol_p2_l14)) (not (K_not_sensing-for-at-ol_p1_l14)) (not (K_not_sensing-for-at-ol_p0_l14)) (not (K_not_need-post-atom-13)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-13) (K_sensing-for-at-ol_p0_l14) (K_sensing-for-at-ol_p1_l14) (K_sensing-for-at-ol_p2_l14) (K_sensing-for-at-ol_p3_l14) (K_sensing-for-at-ol_p4_l14)))
    (:action sense-loc-t_t4_l21__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l21))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l21)) (not (K_not_sensing-for-at-ol_p3_l21)) (not (K_not_sensing-for-at-ol_p2_l21)) (not (K_not_sensing-for-at-ol_p1_l21)) (not (K_not_sensing-for-at-ol_p0_l21)) (not (K_not_need-post-atom-14)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-14) (K_sensing-for-at-ol_p0_l21) (K_sensing-for-at-ol_p1_l21) (K_sensing-for-at-ol_p2_l21) (K_sensing-for-at-ol_p3_l21) (K_sensing-for-at-ol_p4_l21)))
    (:action sense-loc-t_t4_l22__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l22))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l22)) (not (K_not_sensing-for-at-ol_p3_l22)) (not (K_not_sensing-for-at-ol_p2_l22)) (not (K_not_sensing-for-at-ol_p1_l22)) (not (K_not_sensing-for-at-ol_p0_l22)) (not (K_not_need-post-atom-15)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-15) (K_sensing-for-at-ol_p0_l22) (K_sensing-for-at-ol_p1_l22) (K_sensing-for-at-ol_p2_l22) (K_sensing-for-at-ol_p3_l22) (K_sensing-for-at-ol_p4_l22)))
    (:action sense-loc-t_t4_l23__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l23))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l23)) (not (K_not_sensing-for-at-ol_p3_l23)) (not (K_not_sensing-for-at-ol_p2_l23)) (not (K_not_sensing-for-at-ol_p1_l23)) (not (K_not_sensing-for-at-ol_p0_l23)) (not (K_not_need-post-atom-16)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-16) (K_sensing-for-at-ol_p0_l23) (K_sensing-for-at-ol_p1_l23) (K_sensing-for-at-ol_p2_l23) (K_sensing-for-at-ol_p3_l23) (K_sensing-for-at-ol_p4_l23)))
    (:action sense-loc-t_t4_l24__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l24))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l24)) (not (K_not_sensing-for-at-ol_p3_l24)) (not (K_not_sensing-for-at-ol_p2_l24)) (not (K_not_sensing-for-at-ol_p1_l24)) (not (K_not_sensing-for-at-ol_p0_l24)) (not (K_not_need-post-atom-17)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-17) (K_sensing-for-at-ol_p0_l24) (K_sensing-for-at-ol_p1_l24) (K_sensing-for-at-ol_p2_l24) (K_sensing-for-at-ol_p3_l24) (K_sensing-for-at-ol_p4_l24)))
    (:action sense-loc-t_t4_l31__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l31))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l31)) (not (K_not_sensing-for-at-ol_p3_l31)) (not (K_not_sensing-for-at-ol_p2_l31)) (not (K_not_sensing-for-at-ol_p1_l31)) (not (K_not_sensing-for-at-ol_p0_l31)) (not (K_not_need-post-atom-18)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-18) (K_sensing-for-at-ol_p0_l31) (K_sensing-for-at-ol_p1_l31) (K_sensing-for-at-ol_p2_l31) (K_sensing-for-at-ol_p3_l31) (K_sensing-for-at-ol_p4_l31)))
    (:action sense-loc-t_t4_l32__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l32))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l32)) (not (K_not_sensing-for-at-ol_p3_l32)) (not (K_not_sensing-for-at-ol_p2_l32)) (not (K_not_sensing-for-at-ol_p1_l32)) (not (K_not_sensing-for-at-ol_p0_l32)) (not (K_not_need-post-atom-19)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-19) (K_sensing-for-at-ol_p0_l32) (K_sensing-for-at-ol_p1_l32) (K_sensing-for-at-ol_p2_l32) (K_sensing-for-at-ol_p3_l32) (K_sensing-for-at-ol_p4_l32)))
    (:action sense-loc-t_t4_l33__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l33))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l33)) (not (K_not_sensing-for-at-ol_p3_l33)) (not (K_not_sensing-for-at-ol_p2_l33)) (not (K_not_sensing-for-at-ol_p1_l33)) (not (K_not_sensing-for-at-ol_p0_l33)) (not (K_not_need-post-atom-20)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-20) (K_sensing-for-at-ol_p0_l33) (K_sensing-for-at-ol_p1_l33) (K_sensing-for-at-ol_p2_l33) (K_sensing-for-at-ol_p3_l33) (K_sensing-for-at-ol_p4_l33)))
    (:action sense-loc-t_t4_l34__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l34))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l34)) (not (K_not_sensing-for-at-ol_p3_l34)) (not (K_not_sensing-for-at-ol_p2_l34)) (not (K_not_sensing-for-at-ol_p1_l34)) (not (K_not_sensing-for-at-ol_p0_l34)) (not (K_not_need-post-atom-21)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-21) (K_sensing-for-at-ol_p0_l34) (K_sensing-for-at-ol_p1_l34) (K_sensing-for-at-ol_p2_l34) (K_sensing-for-at-ol_p3_l34) (K_sensing-for-at-ol_p4_l34)))
    (:action sense-loc-t_t4_l41__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l41))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l41)) (not (K_not_sensing-for-at-ol_p3_l41)) (not (K_not_sensing-for-at-ol_p2_l41)) (not (K_not_sensing-for-at-ol_p1_l41)) (not (K_not_sensing-for-at-ol_p0_l41)) (not (K_not_need-post-atom-22)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-22) (K_sensing-for-at-ol_p0_l41) (K_sensing-for-at-ol_p1_l41) (K_sensing-for-at-ol_p2_l41) (K_sensing-for-at-ol_p3_l41) (K_sensing-for-at-ol_p4_l41)))
    (:action sense-loc-t_t4_l42__turn_on_sensor__
        :precondition (and (K_normal-execution) (K_at-tl_t4_l42))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l42)) (not (K_not_sensing-for-at-ol_p3_l42)) (not (K_not_sensing-for-at-ol_p2_l42)) (not (K_not_sensing-for-at-ol_p1_l42)) (not (K_not_sensing-for-at-ol_p0_l42)) (not (K_not_need-post-atom-23)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-23) (K_sensing-for-at-ol_p0_l42) (K_sensing-for-at-ol_p1_l42) (K_sensing-for-at-ol_p2_l42) (K_sensing-for-at-ol_p3_l42) (K_sensing-for-at-ol_p4_l42)))
    (:action sense-loc-t_t4_l43__turn_on_sensor__
        :precondition (and (K_at-tl_t4_l43) (K_normal-execution))
        :effect (and (not (K_not_sensing-for-at-ol_p4_l43)) (not (K_not_sensing-for-at-ol_p3_l43)) (not (K_not_sensing-for-at-ol_p2_l43)) (not (K_not_sensing-for-at-ol_p1_l43)) (not (K_not_sensing-for-at-ol_p0_l43)) (not (K_not_need-post-atom-24)) (not (K_normal-execution)) (K_not_normal-execution) (K_need-post-atom-24) (K_sensing-for-at-ol_p0_l43) (K_sensing-for-at-ol_p1_l43) (K_sensing-for-at-ol_p2_l43) (K_sensing-for-at-ol_p3_l43) (K_sensing-for-at-ol_p4_l43)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l13
        :precondition (and (not (K_not_at-ol_p4_l13)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l13))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l13
        :precondition (K_at-ol_p4_l13)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l01
        :precondition (and (not (K_not_at-ol_p4_l01)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l01))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l01
        :precondition (K_at-ol_p4_l01)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l02
        :precondition (and (not (K_not_at-ol_p4_l02)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l02))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l02
        :precondition (K_at-ol_p4_l02)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l03
        :precondition (and (not (K_not_at-ol_p4_l03)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l03))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l03
        :precondition (K_at-ol_p4_l03)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l04
        :precondition (and (not (K_not_at-ol_p4_l04)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l04))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l04
        :precondition (K_at-ol_p4_l04)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l11
        :precondition (and (not (K_not_at-ol_p4_l11)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l11))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l11
        :precondition (K_at-ol_p4_l11)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l12
        :precondition (and (not (K_not_at-ol_p4_l12)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l12))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l12
        :precondition (K_at-ol_p4_l12)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l14
        :precondition (and (not (K_not_at-ol_p4_l14)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l14))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l14
        :precondition (K_at-ol_p4_l14)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l21
        :precondition (and (not (K_not_at-ol_p4_l21)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l21))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l21
        :precondition (K_at-ol_p4_l21)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l22
        :precondition (and (not (K_not_at-ol_p4_l22)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l22))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l22
        :precondition (K_at-ol_p4_l22)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l23
        :precondition (and (not (K_not_at-ol_p4_l23)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l23))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l23
        :precondition (K_at-ol_p4_l23)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l24
        :precondition (and (not (K_not_at-ol_p4_l24)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l24))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l24
        :precondition (K_at-ol_p4_l24)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l31
        :precondition (and (not (K_not_at-ol_p4_l31)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l31))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l31
        :precondition (K_at-ol_p4_l31)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l32
        :precondition (and (not (K_not_at-ol_p4_l32)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l32))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l32
        :precondition (K_at-ol_p4_l32)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l33
        :precondition (and (not (K_not_at-ol_p4_l33)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l33))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l33
        :precondition (K_at-ol_p4_l33)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l34
        :precondition (and (not (K_not_at-ol_p4_l34)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l34))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l34
        :precondition (K_at-ol_p4_l34)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l41
        :precondition (and (not (K_not_at-ol_p4_l41)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l41))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l41
        :precondition (K_at-ol_p4_l41)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l42
        :precondition (and (not (K_not_at-ol_p4_l42)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l42))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l42
        :precondition (K_at-ol_p4_l42)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l43
        :precondition (and (not (K_not_at-ol_p4_l43)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l44))
        :effect (K_at-ol_p4_l43))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l43
        :precondition (K_at-ol_p4_l43)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-ol_p4_l44
        :precondition (and (not (K_not_at-ol_p4_l44)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43))
        :effect (K_at-ol_p4_l44))
    (:action drule-var-type2-obj-pos_p4-at-ol_p4_l44
        :precondition (K_at-ol_p4_l44)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43)))
    (:action drule-var-type1-obj-pos_p4-at-oa_p4_l20
        :precondition (and (not (K_not_at-oa_p4_l20)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-oa_p4_l20))
    (:action drule-var-type2-obj-pos_p4-at-oa_p4_l20
        :precondition (K_at-oa_p4_l20)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-oa_p4_l30
        :precondition (and (not (K_not_at-oa_p4_l30)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-oa_p4_l30))
    (:action drule-var-type2-obj-pos_p4-at-oa_p4_l30
        :precondition (K_at-oa_p4_l30)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-oa_p4_l00
        :precondition (and (not (K_not_at-oa_p4_l00)) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-oa_p4_l00))
    (:action drule-var-type2-obj-pos_p4-at-oa_p4_l00
        :precondition (K_at-oa_p4_l00)
        :effect (and (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-oa_p4_l10
        :precondition (and (not (K_not_at-oa_p4_l10)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-oa_p4_l10))
    (:action drule-var-type2-obj-pos_p4-at-oa_p4_l10
        :precondition (K_at-oa_p4_l10)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-at-oa_p4_l40
        :precondition (and (not (K_not_at-oa_p4_l40)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_at-oa_p4_l40))
    (:action drule-var-type2-obj-pos_p4-at-oa_p4_l40
        :precondition (K_at-oa_p4_l40)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-ot_p4_t0
        :precondition (and (not (K_not_in-ot_p4_t0)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-ot_p4_t0))
    (:action drule-var-type2-obj-pos_p4-in-ot_p4_t0
        :precondition (K_in-ot_p4_t0)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-ot_p4_t1
        :precondition (and (not (K_not_in-ot_p4_t1)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-ot_p4_t1))
    (:action drule-var-type2-obj-pos_p4-in-ot_p4_t1
        :precondition (K_in-ot_p4_t1)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-ot_p4_t2
        :precondition (and (not (K_not_in-ot_p4_t2)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-ot_p4_t2))
    (:action drule-var-type2-obj-pos_p4-in-ot_p4_t2
        :precondition (K_in-ot_p4_t2)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-ot_p4_t3
        :precondition (and (not (K_not_in-ot_p4_t3)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-ot_p4_t3))
    (:action drule-var-type2-obj-pos_p4-in-ot_p4_t3
        :precondition (K_in-ot_p4_t3)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t4) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-ot_p4_t4
        :precondition (and (not (K_not_in-ot_p4_t4)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-ot_p4_t4))
    (:action drule-var-type2-obj-pos_p4-in-ot_p4_t4
        :precondition (K_in-ot_p4_t4)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-oa_p4_a0) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p4-in-oa_p4_a0
        :precondition (and (not (K_not_in-oa_p4_a0)) (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44))
        :effect (K_in-oa_p4_a0))
    (:action drule-var-type2-obj-pos_p4-in-oa_p4_a0
        :precondition (K_in-oa_p4_a0)
        :effect (and (K_not_at-oa_p4_l00) (K_not_at-ol_p4_l01) (K_not_at-ol_p4_l02) (K_not_at-ol_p4_l03) (K_not_at-ol_p4_l04) (K_not_at-oa_p4_l10) (K_not_at-ol_p4_l11) (K_not_at-ol_p4_l12) (K_not_at-ol_p4_l13) (K_not_at-ol_p4_l14) (K_not_at-oa_p4_l20) (K_not_at-ol_p4_l21) (K_not_at-ol_p4_l22) (K_not_at-ol_p4_l23) (K_not_at-ol_p4_l24) (K_not_at-oa_p4_l30) (K_not_at-ol_p4_l31) (K_not_at-ol_p4_l32) (K_not_at-ol_p4_l33) (K_not_at-ol_p4_l34) (K_not_in-ot_p4_t0) (K_not_in-ot_p4_t1) (K_not_in-ot_p4_t2) (K_not_in-ot_p4_t3) (K_not_in-ot_p4_t4) (K_not_at-oa_p4_l40) (K_not_at-ol_p4_l41) (K_not_at-ol_p4_l42) (K_not_at-ol_p4_l43) (K_not_at-ol_p4_l44)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l13
        :precondition (and (not (K_not_at-ol_p3_l13)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l13))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l13
        :precondition (K_at-ol_p3_l13)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l01
        :precondition (and (not (K_not_at-ol_p3_l01)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l01))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l01
        :precondition (K_at-ol_p3_l01)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l02
        :precondition (and (not (K_not_at-ol_p3_l02)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l02))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l02
        :precondition (K_at-ol_p3_l02)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l03
        :precondition (and (not (K_not_at-ol_p3_l03)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l03))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l03
        :precondition (K_at-ol_p3_l03)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l04
        :precondition (and (not (K_not_at-ol_p3_l04)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l04))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l04
        :precondition (K_at-ol_p3_l04)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l11
        :precondition (and (not (K_not_at-ol_p3_l11)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l11))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l11
        :precondition (K_at-ol_p3_l11)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l12
        :precondition (and (not (K_not_at-ol_p3_l12)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l12))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l12
        :precondition (K_at-ol_p3_l12)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l14
        :precondition (and (not (K_not_at-ol_p3_l14)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l14))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l14
        :precondition (K_at-ol_p3_l14)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l21
        :precondition (and (not (K_not_at-ol_p3_l21)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l21))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l21
        :precondition (K_at-ol_p3_l21)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l22
        :precondition (and (not (K_not_at-ol_p3_l22)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l22))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l22
        :precondition (K_at-ol_p3_l22)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l23
        :precondition (and (not (K_not_at-ol_p3_l23)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l23))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l23
        :precondition (K_at-ol_p3_l23)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l24
        :precondition (and (not (K_not_at-ol_p3_l24)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23))
        :effect (K_at-ol_p3_l24))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l24
        :precondition (K_at-ol_p3_l24)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l31
        :precondition (and (not (K_not_at-ol_p3_l31)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l31))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l31
        :precondition (K_at-ol_p3_l31)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l32
        :precondition (and (not (K_not_at-ol_p3_l32)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l32))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l32
        :precondition (K_at-ol_p3_l32)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l33
        :precondition (and (not (K_not_at-ol_p3_l33)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l33))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l33
        :precondition (K_at-ol_p3_l33)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l34
        :precondition (and (not (K_not_at-ol_p3_l34)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l34))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l34
        :precondition (K_at-ol_p3_l34)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l41
        :precondition (and (not (K_not_at-ol_p3_l41)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l41))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l41
        :precondition (K_at-ol_p3_l41)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l42
        :precondition (and (not (K_not_at-ol_p3_l42)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l42))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l42
        :precondition (K_at-ol_p3_l42)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l43
        :precondition (and (not (K_not_at-ol_p3_l43)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l43))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l43
        :precondition (K_at-ol_p3_l43)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-ol_p3_l44
        :precondition (and (not (K_not_at-ol_p3_l44)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-ol_p3_l44))
    (:action drule-var-type2-obj-pos_p3-at-ol_p3_l44
        :precondition (K_at-ol_p3_l44)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-oa_p3_l20
        :precondition (and (not (K_not_at-oa_p3_l20)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-oa_p3_l20))
    (:action drule-var-type2-obj-pos_p3-at-oa_p3_l20
        :precondition (K_at-oa_p3_l20)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-oa_p3_l30
        :precondition (and (not (K_not_at-oa_p3_l30)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-oa_p3_l30))
    (:action drule-var-type2-obj-pos_p3-at-oa_p3_l30
        :precondition (K_at-oa_p3_l30)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-oa_p3_l00
        :precondition (and (not (K_not_at-oa_p3_l00)) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-oa_p3_l00))
    (:action drule-var-type2-obj-pos_p3-at-oa_p3_l00
        :precondition (K_at-oa_p3_l00)
        :effect (and (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-oa_p3_l10
        :precondition (and (not (K_not_at-oa_p3_l10)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-oa_p3_l10))
    (:action drule-var-type2-obj-pos_p3-at-oa_p3_l10
        :precondition (K_at-oa_p3_l10)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-at-oa_p3_l40
        :precondition (and (not (K_not_at-oa_p3_l40)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_at-oa_p3_l40))
    (:action drule-var-type2-obj-pos_p3-at-oa_p3_l40
        :precondition (K_at-oa_p3_l40)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-ot_p3_t0
        :precondition (and (not (K_not_in-ot_p3_t0)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-ot_p3_t0))
    (:action drule-var-type2-obj-pos_p3-in-ot_p3_t0
        :precondition (K_in-ot_p3_t0)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-ot_p3_t1
        :precondition (and (not (K_not_in-ot_p3_t1)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-ot_p3_t1))
    (:action drule-var-type2-obj-pos_p3-in-ot_p3_t1
        :precondition (K_in-ot_p3_t1)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-ot_p3_t2
        :precondition (and (not (K_not_in-ot_p3_t2)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-ot_p3_t2))
    (:action drule-var-type2-obj-pos_p3-in-ot_p3_t2
        :precondition (K_in-ot_p3_t2)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-ot_p3_t3
        :precondition (and (not (K_not_in-ot_p3_t3)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-ot_p3_t3))
    (:action drule-var-type2-obj-pos_p3-in-ot_p3_t3
        :precondition (K_in-ot_p3_t3)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t4) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-ot_p3_t4
        :precondition (and (not (K_not_in-ot_p3_t4)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-ot_p3_t4))
    (:action drule-var-type2-obj-pos_p3-in-ot_p3_t4
        :precondition (K_in-ot_p3_t4)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-oa_p3_a0) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p3-in-oa_p3_a0
        :precondition (and (not (K_not_in-oa_p3_a0)) (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24))
        :effect (K_in-oa_p3_a0))
    (:action drule-var-type2-obj-pos_p3-in-oa_p3_a0
        :precondition (K_in-oa_p3_a0)
        :effect (and (K_not_at-oa_p3_l00) (K_not_at-ol_p3_l01) (K_not_at-ol_p3_l02) (K_not_at-ol_p3_l03) (K_not_at-ol_p3_l04) (K_not_at-oa_p3_l10) (K_not_at-ol_p3_l11) (K_not_at-ol_p3_l12) (K_not_at-ol_p3_l13) (K_not_at-ol_p3_l14) (K_not_at-oa_p3_l30) (K_not_at-ol_p3_l31) (K_not_at-ol_p3_l32) (K_not_at-ol_p3_l33) (K_not_at-ol_p3_l34) (K_not_at-oa_p3_l40) (K_not_at-ol_p3_l41) (K_not_at-ol_p3_l42) (K_not_at-ol_p3_l43) (K_not_at-ol_p3_l44) (K_not_in-ot_p3_t0) (K_not_in-ot_p3_t1) (K_not_in-ot_p3_t2) (K_not_in-ot_p3_t3) (K_not_in-ot_p3_t4) (K_not_at-oa_p3_l20) (K_not_at-ol_p3_l21) (K_not_at-ol_p3_l22) (K_not_at-ol_p3_l23) (K_not_at-ol_p3_l24)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l13
        :precondition (and (not (K_not_at-ol_p2_l13)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l13))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l13
        :precondition (K_at-ol_p2_l13)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l01
        :precondition (and (not (K_not_at-ol_p2_l01)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l01))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l01
        :precondition (K_at-ol_p2_l01)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l02
        :precondition (and (not (K_not_at-ol_p2_l02)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l02))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l02
        :precondition (K_at-ol_p2_l02)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l03
        :precondition (and (not (K_not_at-ol_p2_l03)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l03))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l03
        :precondition (K_at-ol_p2_l03)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l04
        :precondition (and (not (K_not_at-ol_p2_l04)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l04))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l04
        :precondition (K_at-ol_p2_l04)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l11
        :precondition (and (not (K_not_at-ol_p2_l11)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l11))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l11
        :precondition (K_at-ol_p2_l11)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l12
        :precondition (and (not (K_not_at-ol_p2_l12)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l12))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l12
        :precondition (K_at-ol_p2_l12)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l14
        :precondition (and (not (K_not_at-ol_p2_l14)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13))
        :effect (K_at-ol_p2_l14))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l14
        :precondition (K_at-ol_p2_l14)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l21
        :precondition (and (not (K_not_at-ol_p2_l21)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l21))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l21
        :precondition (K_at-ol_p2_l21)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l22
        :precondition (and (not (K_not_at-ol_p2_l22)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l22))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l22
        :precondition (K_at-ol_p2_l22)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l23
        :precondition (and (not (K_not_at-ol_p2_l23)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l23))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l23
        :precondition (K_at-ol_p2_l23)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l24
        :precondition (and (not (K_not_at-ol_p2_l24)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l24))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l24
        :precondition (K_at-ol_p2_l24)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l31
        :precondition (and (not (K_not_at-ol_p2_l31)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l31))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l31
        :precondition (K_at-ol_p2_l31)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l32
        :precondition (and (not (K_not_at-ol_p2_l32)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l32))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l32
        :precondition (K_at-ol_p2_l32)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l33
        :precondition (and (not (K_not_at-ol_p2_l33)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l33))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l33
        :precondition (K_at-ol_p2_l33)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l34
        :precondition (and (not (K_not_at-ol_p2_l34)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l34))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l34
        :precondition (K_at-ol_p2_l34)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l41
        :precondition (and (not (K_not_at-ol_p2_l41)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l41))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l41
        :precondition (K_at-ol_p2_l41)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l42
        :precondition (and (not (K_not_at-ol_p2_l42)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l42))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l42
        :precondition (K_at-ol_p2_l42)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l43
        :precondition (and (not (K_not_at-ol_p2_l43)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l43))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l43
        :precondition (K_at-ol_p2_l43)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-ol_p2_l44
        :precondition (and (not (K_not_at-ol_p2_l44)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-ol_p2_l44))
    (:action drule-var-type2-obj-pos_p2-at-ol_p2_l44
        :precondition (K_at-ol_p2_l44)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-oa_p2_l20
        :precondition (and (not (K_not_at-oa_p2_l20)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-oa_p2_l20))
    (:action drule-var-type2-obj-pos_p2-at-oa_p2_l20
        :precondition (K_at-oa_p2_l20)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-oa_p2_l30
        :precondition (and (not (K_not_at-oa_p2_l30)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-oa_p2_l30))
    (:action drule-var-type2-obj-pos_p2-at-oa_p2_l30
        :precondition (K_at-oa_p2_l30)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-oa_p2_l00
        :precondition (and (not (K_not_at-oa_p2_l00)) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-oa_p2_l00))
    (:action drule-var-type2-obj-pos_p2-at-oa_p2_l00
        :precondition (K_at-oa_p2_l00)
        :effect (and (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-oa_p2_l10
        :precondition (and (not (K_not_at-oa_p2_l10)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-oa_p2_l10))
    (:action drule-var-type2-obj-pos_p2-at-oa_p2_l10
        :precondition (K_at-oa_p2_l10)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-at-oa_p2_l40
        :precondition (and (not (K_not_at-oa_p2_l40)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_at-oa_p2_l40))
    (:action drule-var-type2-obj-pos_p2-at-oa_p2_l40
        :precondition (K_at-oa_p2_l40)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-ot_p2_t0
        :precondition (and (not (K_not_in-ot_p2_t0)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-ot_p2_t0))
    (:action drule-var-type2-obj-pos_p2-in-ot_p2_t0
        :precondition (K_in-ot_p2_t0)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-ot_p2_t1
        :precondition (and (not (K_not_in-ot_p2_t1)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-ot_p2_t1))
    (:action drule-var-type2-obj-pos_p2-in-ot_p2_t1
        :precondition (K_in-ot_p2_t1)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-ot_p2_t2
        :precondition (and (not (K_not_in-ot_p2_t2)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-ot_p2_t2))
    (:action drule-var-type2-obj-pos_p2-in-ot_p2_t2
        :precondition (K_in-ot_p2_t2)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-ot_p2_t3
        :precondition (and (not (K_not_in-ot_p2_t3)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-ot_p2_t3))
    (:action drule-var-type2-obj-pos_p2-in-ot_p2_t3
        :precondition (K_in-ot_p2_t3)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t4) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-ot_p2_t4
        :precondition (and (not (K_not_in-ot_p2_t4)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-ot_p2_t4))
    (:action drule-var-type2-obj-pos_p2-in-ot_p2_t4
        :precondition (K_in-ot_p2_t4)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-oa_p2_a0) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p2-in-oa_p2_a0
        :precondition (and (not (K_not_in-oa_p2_a0)) (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14))
        :effect (K_in-oa_p2_a0))
    (:action drule-var-type2-obj-pos_p2-in-oa_p2_a0
        :precondition (K_in-oa_p2_a0)
        :effect (and (K_not_at-oa_p2_l00) (K_not_at-ol_p2_l01) (K_not_at-ol_p2_l02) (K_not_at-ol_p2_l03) (K_not_at-ol_p2_l04) (K_not_at-oa_p2_l20) (K_not_at-ol_p2_l21) (K_not_at-ol_p2_l22) (K_not_at-ol_p2_l23) (K_not_at-ol_p2_l24) (K_not_at-oa_p2_l30) (K_not_at-ol_p2_l31) (K_not_at-ol_p2_l32) (K_not_at-ol_p2_l33) (K_not_at-ol_p2_l34) (K_not_at-oa_p2_l40) (K_not_at-ol_p2_l41) (K_not_at-ol_p2_l42) (K_not_at-ol_p2_l43) (K_not_at-ol_p2_l44) (K_not_in-ot_p2_t0) (K_not_in-ot_p2_t1) (K_not_in-ot_p2_t2) (K_not_in-ot_p2_t3) (K_not_in-ot_p2_t4) (K_not_at-oa_p2_l10) (K_not_at-ol_p2_l11) (K_not_at-ol_p2_l12) (K_not_at-ol_p2_l13) (K_not_at-ol_p2_l14)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l13
        :precondition (and (not (K_not_at-ol_p1_l13)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l13))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l13
        :precondition (K_at-ol_p1_l13)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l01
        :precondition (and (not (K_not_at-ol_p1_l01)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l01))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l01
        :precondition (K_at-ol_p1_l01)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l02
        :precondition (and (not (K_not_at-ol_p1_l02)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l02))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l02
        :precondition (K_at-ol_p1_l02)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l03
        :precondition (and (not (K_not_at-ol_p1_l03)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l03))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l03
        :precondition (K_at-ol_p1_l03)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l04
        :precondition (and (not (K_not_at-ol_p1_l04)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l04))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l04
        :precondition (K_at-ol_p1_l04)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l11
        :precondition (and (not (K_not_at-ol_p1_l11)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l11))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l11
        :precondition (K_at-ol_p1_l11)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l12
        :precondition (and (not (K_not_at-ol_p1_l12)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l12))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l12
        :precondition (K_at-ol_p1_l12)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l14
        :precondition (and (not (K_not_at-ol_p1_l14)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l14))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l14
        :precondition (K_at-ol_p1_l14)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l21
        :precondition (and (not (K_not_at-ol_p1_l21)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l21))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l21
        :precondition (K_at-ol_p1_l21)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l22
        :precondition (and (not (K_not_at-ol_p1_l22)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l22))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l22
        :precondition (K_at-ol_p1_l22)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l23
        :precondition (and (not (K_not_at-ol_p1_l23)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l23))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l23
        :precondition (K_at-ol_p1_l23)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l24
        :precondition (and (not (K_not_at-ol_p1_l24)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23))
        :effect (K_at-ol_p1_l24))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l24
        :precondition (K_at-ol_p1_l24)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l31
        :precondition (and (not (K_not_at-ol_p1_l31)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l31))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l31
        :precondition (K_at-ol_p1_l31)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l32
        :precondition (and (not (K_not_at-ol_p1_l32)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l32))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l32
        :precondition (K_at-ol_p1_l32)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l33
        :precondition (and (not (K_not_at-ol_p1_l33)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l33))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l33
        :precondition (K_at-ol_p1_l33)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l34
        :precondition (and (not (K_not_at-ol_p1_l34)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l34))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l34
        :precondition (K_at-ol_p1_l34)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l41
        :precondition (and (not (K_not_at-ol_p1_l41)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l41))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l41
        :precondition (K_at-ol_p1_l41)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l42
        :precondition (and (not (K_not_at-ol_p1_l42)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l42))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l42
        :precondition (K_at-ol_p1_l42)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l43
        :precondition (and (not (K_not_at-ol_p1_l43)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l43))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l43
        :precondition (K_at-ol_p1_l43)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-ol_p1_l44
        :precondition (and (not (K_not_at-ol_p1_l44)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-ol_p1_l44))
    (:action drule-var-type2-obj-pos_p1-at-ol_p1_l44
        :precondition (K_at-ol_p1_l44)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-oa_p1_l20
        :precondition (and (not (K_not_at-oa_p1_l20)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-oa_p1_l20))
    (:action drule-var-type2-obj-pos_p1-at-oa_p1_l20
        :precondition (K_at-oa_p1_l20)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-oa_p1_l30
        :precondition (and (not (K_not_at-oa_p1_l30)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-oa_p1_l30))
    (:action drule-var-type2-obj-pos_p1-at-oa_p1_l30
        :precondition (K_at-oa_p1_l30)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-oa_p1_l00
        :precondition (and (not (K_not_at-oa_p1_l00)) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-oa_p1_l00))
    (:action drule-var-type2-obj-pos_p1-at-oa_p1_l00
        :precondition (K_at-oa_p1_l00)
        :effect (and (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-oa_p1_l10
        :precondition (and (not (K_not_at-oa_p1_l10)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-oa_p1_l10))
    (:action drule-var-type2-obj-pos_p1-at-oa_p1_l10
        :precondition (K_at-oa_p1_l10)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-at-oa_p1_l40
        :precondition (and (not (K_not_at-oa_p1_l40)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_at-oa_p1_l40))
    (:action drule-var-type2-obj-pos_p1-at-oa_p1_l40
        :precondition (K_at-oa_p1_l40)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-ot_p1_t0
        :precondition (and (not (K_not_in-ot_p1_t0)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-ot_p1_t0))
    (:action drule-var-type2-obj-pos_p1-in-ot_p1_t0
        :precondition (K_in-ot_p1_t0)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-ot_p1_t1
        :precondition (and (not (K_not_in-ot_p1_t1)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-ot_p1_t1))
    (:action drule-var-type2-obj-pos_p1-in-ot_p1_t1
        :precondition (K_in-ot_p1_t1)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-ot_p1_t2
        :precondition (and (not (K_not_in-ot_p1_t2)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-ot_p1_t2))
    (:action drule-var-type2-obj-pos_p1-in-ot_p1_t2
        :precondition (K_in-ot_p1_t2)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-ot_p1_t3
        :precondition (and (not (K_not_in-ot_p1_t3)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-ot_p1_t3))
    (:action drule-var-type2-obj-pos_p1-in-ot_p1_t3
        :precondition (K_in-ot_p1_t3)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t4) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-ot_p1_t4
        :precondition (and (not (K_not_in-ot_p1_t4)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-ot_p1_t4))
    (:action drule-var-type2-obj-pos_p1-in-ot_p1_t4
        :precondition (K_in-ot_p1_t4)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-oa_p1_a0) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p1-in-oa_p1_a0
        :precondition (and (not (K_not_in-oa_p1_a0)) (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24))
        :effect (K_in-oa_p1_a0))
    (:action drule-var-type2-obj-pos_p1-in-oa_p1_a0
        :precondition (K_in-oa_p1_a0)
        :effect (and (K_not_at-oa_p1_l00) (K_not_at-ol_p1_l01) (K_not_at-ol_p1_l02) (K_not_at-ol_p1_l03) (K_not_at-ol_p1_l04) (K_not_at-oa_p1_l10) (K_not_at-ol_p1_l11) (K_not_at-ol_p1_l12) (K_not_at-ol_p1_l13) (K_not_at-ol_p1_l14) (K_not_at-oa_p1_l30) (K_not_at-ol_p1_l31) (K_not_at-ol_p1_l32) (K_not_at-ol_p1_l33) (K_not_at-ol_p1_l34) (K_not_at-oa_p1_l40) (K_not_at-ol_p1_l41) (K_not_at-ol_p1_l42) (K_not_at-ol_p1_l43) (K_not_at-ol_p1_l44) (K_not_in-ot_p1_t0) (K_not_in-ot_p1_t1) (K_not_in-ot_p1_t2) (K_not_in-ot_p1_t3) (K_not_in-ot_p1_t4) (K_not_at-oa_p1_l20) (K_not_at-ol_p1_l21) (K_not_at-ol_p1_l22) (K_not_at-ol_p1_l23) (K_not_at-ol_p1_l24)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l13
        :precondition (and (not (K_not_at-ol_p0_l13)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l13))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l13
        :precondition (K_at-ol_p0_l13)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l01
        :precondition (and (not (K_not_at-ol_p0_l01)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l01))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l01
        :precondition (K_at-ol_p0_l01)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l02
        :precondition (and (not (K_not_at-ol_p0_l02)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l02))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l02
        :precondition (K_at-ol_p0_l02)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l03
        :precondition (and (not (K_not_at-ol_p0_l03)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l03))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l03
        :precondition (K_at-ol_p0_l03)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l04
        :precondition (and (not (K_not_at-ol_p0_l04)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03))
        :effect (K_at-ol_p0_l04))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l04
        :precondition (K_at-ol_p0_l04)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l11
        :precondition (and (not (K_not_at-ol_p0_l11)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l11))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l11
        :precondition (K_at-ol_p0_l11)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l12
        :precondition (and (not (K_not_at-ol_p0_l12)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l12))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l12
        :precondition (K_at-ol_p0_l12)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l14
        :precondition (and (not (K_not_at-ol_p0_l14)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l14))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l14
        :precondition (K_at-ol_p0_l14)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l21
        :precondition (and (not (K_not_at-ol_p0_l21)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l21))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l21
        :precondition (K_at-ol_p0_l21)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l22
        :precondition (and (not (K_not_at-ol_p0_l22)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l22))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l22
        :precondition (K_at-ol_p0_l22)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l23
        :precondition (and (not (K_not_at-ol_p0_l23)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l23))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l23
        :precondition (K_at-ol_p0_l23)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l24
        :precondition (and (not (K_not_at-ol_p0_l24)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l24))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l24
        :precondition (K_at-ol_p0_l24)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l31
        :precondition (and (not (K_not_at-ol_p0_l31)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l31))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l31
        :precondition (K_at-ol_p0_l31)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l32
        :precondition (and (not (K_not_at-ol_p0_l32)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l32))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l32
        :precondition (K_at-ol_p0_l32)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l33
        :precondition (and (not (K_not_at-ol_p0_l33)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l33))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l33
        :precondition (K_at-ol_p0_l33)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l34
        :precondition (and (not (K_not_at-ol_p0_l34)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l34))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l34
        :precondition (K_at-ol_p0_l34)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l41
        :precondition (and (not (K_not_at-ol_p0_l41)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l41))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l41
        :precondition (K_at-ol_p0_l41)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l42
        :precondition (and (not (K_not_at-ol_p0_l42)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l42))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l42
        :precondition (K_at-ol_p0_l42)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l43
        :precondition (and (not (K_not_at-ol_p0_l43)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l43))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l43
        :precondition (K_at-ol_p0_l43)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-ol_p0_l44
        :precondition (and (not (K_not_at-ol_p0_l44)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-ol_p0_l44))
    (:action drule-var-type2-obj-pos_p0-at-ol_p0_l44
        :precondition (K_at-ol_p0_l44)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-oa_p0_l20
        :precondition (and (not (K_not_at-oa_p0_l20)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-oa_p0_l20))
    (:action drule-var-type2-obj-pos_p0-at-oa_p0_l20
        :precondition (K_at-oa_p0_l20)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-oa_p0_l30
        :precondition (and (not (K_not_at-oa_p0_l30)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-oa_p0_l30))
    (:action drule-var-type2-obj-pos_p0-at-oa_p0_l30
        :precondition (K_at-oa_p0_l30)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-oa_p0_l00
        :precondition (and (not (K_not_at-oa_p0_l00)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-oa_p0_l00))
    (:action drule-var-type2-obj-pos_p0-at-oa_p0_l00
        :precondition (K_at-oa_p0_l00)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-oa_p0_l10
        :precondition (and (not (K_not_at-oa_p0_l10)) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-oa_p0_l10))
    (:action drule-var-type2-obj-pos_p0-at-oa_p0_l10
        :precondition (K_at-oa_p0_l10)
        :effect (and (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-at-oa_p0_l40
        :precondition (and (not (K_not_at-oa_p0_l40)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_at-oa_p0_l40))
    (:action drule-var-type2-obj-pos_p0-at-oa_p0_l40
        :precondition (K_at-oa_p0_l40)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-ot_p0_t0
        :precondition (and (not (K_not_in-ot_p0_t0)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-ot_p0_t0))
    (:action drule-var-type2-obj-pos_p0-in-ot_p0_t0
        :precondition (K_in-ot_p0_t0)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-ot_p0_t1
        :precondition (and (not (K_not_in-ot_p0_t1)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-ot_p0_t1))
    (:action drule-var-type2-obj-pos_p0-in-ot_p0_t1
        :precondition (K_in-ot_p0_t1)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-ot_p0_t2
        :precondition (and (not (K_not_in-ot_p0_t2)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-ot_p0_t2))
    (:action drule-var-type2-obj-pos_p0-in-ot_p0_t2
        :precondition (K_in-ot_p0_t2)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-ot_p0_t3
        :precondition (and (not (K_not_in-ot_p0_t3)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-ot_p0_t3))
    (:action drule-var-type2-obj-pos_p0-in-ot_p0_t3
        :precondition (K_in-ot_p0_t3)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t4) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-ot_p0_t4
        :precondition (and (not (K_not_in-ot_p0_t4)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-ot_p0_t4))
    (:action drule-var-type2-obj-pos_p0-in-ot_p0_t4
        :precondition (K_in-ot_p0_t4)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-oa_p0_a0) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-obj-pos_p0-in-oa_p0_a0
        :precondition (and (not (K_not_in-oa_p0_a0)) (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04))
        :effect (K_in-oa_p0_a0))
    (:action drule-var-type2-obj-pos_p0-in-oa_p0_a0
        :precondition (K_in-oa_p0_a0)
        :effect (and (K_not_at-oa_p0_l10) (K_not_at-ol_p0_l11) (K_not_at-ol_p0_l12) (K_not_at-ol_p0_l13) (K_not_at-ol_p0_l14) (K_not_at-oa_p0_l20) (K_not_at-ol_p0_l21) (K_not_at-ol_p0_l22) (K_not_at-ol_p0_l23) (K_not_at-ol_p0_l24) (K_not_at-oa_p0_l30) (K_not_at-ol_p0_l31) (K_not_at-ol_p0_l32) (K_not_at-ol_p0_l33) (K_not_at-ol_p0_l34) (K_not_at-oa_p0_l40) (K_not_at-ol_p0_l41) (K_not_at-ol_p0_l42) (K_not_at-ol_p0_l43) (K_not_at-ol_p0_l44) (K_not_in-ot_p0_t0) (K_not_in-ot_p0_t1) (K_not_in-ot_p0_t2) (K_not_in-ot_p0_t3) (K_not_in-ot_p0_t4) (K_not_at-oa_p0_l00) (K_not_at-ol_p0_l01) (K_not_at-ol_p0_l02) (K_not_at-ol_p0_l03) (K_not_at-ol_p0_l04)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l13
        :precondition (and (not (K_not_at-tl_t4_l13)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l13))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l13
        :precondition (K_at-tl_t4_l13)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l01
        :precondition (and (not (K_not_at-tl_t4_l01)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l01))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l01
        :precondition (K_at-tl_t4_l01)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l02
        :precondition (and (not (K_not_at-tl_t4_l02)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l02))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l02
        :precondition (K_at-tl_t4_l02)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l03
        :precondition (and (not (K_not_at-tl_t4_l03)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l03))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l03
        :precondition (K_at-tl_t4_l03)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l04
        :precondition (and (not (K_not_at-tl_t4_l04)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l04))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l04
        :precondition (K_at-tl_t4_l04)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l11
        :precondition (and (not (K_not_at-tl_t4_l11)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l11))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l11
        :precondition (K_at-tl_t4_l11)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l12
        :precondition (and (not (K_not_at-tl_t4_l12)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l12))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l12
        :precondition (K_at-tl_t4_l12)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l14
        :precondition (and (not (K_not_at-tl_t4_l14)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l14))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l14
        :precondition (K_at-tl_t4_l14)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l21
        :precondition (and (not (K_not_at-tl_t4_l21)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l21))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l21
        :precondition (K_at-tl_t4_l21)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l22
        :precondition (and (not (K_not_at-tl_t4_l22)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l22))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l22
        :precondition (K_at-tl_t4_l22)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l23
        :precondition (and (not (K_not_at-tl_t4_l23)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l23))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l23
        :precondition (K_at-tl_t4_l23)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l24
        :precondition (and (not (K_not_at-tl_t4_l24)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l24))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l24
        :precondition (K_at-tl_t4_l24)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l31
        :precondition (and (not (K_not_at-tl_t4_l31)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l31))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l31
        :precondition (K_at-tl_t4_l31)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l32
        :precondition (and (not (K_not_at-tl_t4_l32)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l32))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l32
        :precondition (K_at-tl_t4_l32)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l33
        :precondition (and (not (K_not_at-tl_t4_l33)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l33))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l33
        :precondition (K_at-tl_t4_l33)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l34
        :precondition (and (not (K_not_at-tl_t4_l34)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33))
        :effect (K_at-tl_t4_l34))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l34
        :precondition (K_at-tl_t4_l34)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l41
        :precondition (and (not (K_not_at-tl_t4_l41)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l41))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l41
        :precondition (K_at-tl_t4_l41)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l42
        :precondition (and (not (K_not_at-tl_t4_l42)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l42))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l42
        :precondition (K_at-tl_t4_l42)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l43
        :precondition (and (not (K_not_at-tl_t4_l43)) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l43))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l43
        :precondition (K_at-tl_t4_l43)
        :effect (and (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-tl_t4_l44
        :precondition (and (not (K_not_at-tl_t4_l44)) (K_not_at-tl_t4_l43) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-tl_t4_l44))
    (:action drule-var-type2-truck-pos_t4-at-tl_t4_l44
        :precondition (K_at-tl_t4_l44)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-ta_t4_l20
        :precondition (and (not (K_not_at-ta_t4_l20)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-ta_t4_l20))
    (:action drule-var-type2-truck-pos_t4-at-ta_t4_l20
        :precondition (K_at-ta_t4_l20)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-ta_t4_l30
        :precondition (and (not (K_not_at-ta_t4_l30)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-ta_t4_l30))
    (:action drule-var-type2-truck-pos_t4-at-ta_t4_l30
        :precondition (K_at-ta_t4_l30)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-ta_t4_l00
        :precondition (and (not (K_not_at-ta_t4_l00)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-ta_t4_l00))
    (:action drule-var-type2-truck-pos_t4-at-ta_t4_l00
        :precondition (K_at-ta_t4_l00)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-ta_t4_l10
        :precondition (and (not (K_not_at-ta_t4_l10)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-ta_t4_l10))
    (:action drule-var-type2-truck-pos_t4-at-ta_t4_l10
        :precondition (K_at-ta_t4_l10)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-ta_t4_l40) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t4-at-ta_t4_l40
        :precondition (and (not (K_not_at-ta_t4_l40)) (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34))
        :effect (K_at-ta_t4_l40))
    (:action drule-var-type2-truck-pos_t4-at-ta_t4_l40
        :precondition (K_at-ta_t4_l40)
        :effect (and (K_not_at-tl_t4_l43) (K_not_at-tl_t4_l44) (K_not_at-tl_t4_l41) (K_not_at-tl_t4_l42) (K_not_at-ta_t4_l00) (K_not_at-ta_t4_l10) (K_not_at-ta_t4_l20) (K_not_at-ta_t4_l30) (K_not_at-tl_t4_l01) (K_not_at-tl_t4_l02) (K_not_at-tl_t4_l03) (K_not_at-tl_t4_l04) (K_not_at-tl_t4_l11) (K_not_at-tl_t4_l12) (K_not_at-tl_t4_l13) (K_not_at-tl_t4_l14) (K_not_at-tl_t4_l21) (K_not_at-tl_t4_l22) (K_not_at-tl_t4_l23) (K_not_at-tl_t4_l24) (K_not_at-tl_t4_l31) (K_not_at-tl_t4_l32) (K_not_at-tl_t4_l33) (K_not_at-tl_t4_l34)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l13
        :precondition (and (not (K_not_at-tl_t3_l13)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l13))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l13
        :precondition (K_at-tl_t3_l13)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l01
        :precondition (and (not (K_not_at-tl_t3_l01)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l01))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l01
        :precondition (K_at-tl_t3_l01)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l02
        :precondition (and (not (K_not_at-tl_t3_l02)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l02))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l02
        :precondition (K_at-tl_t3_l02)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l03
        :precondition (and (not (K_not_at-tl_t3_l03)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l03))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l03
        :precondition (K_at-tl_t3_l03)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l04
        :precondition (and (not (K_not_at-tl_t3_l04)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l04))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l04
        :precondition (K_at-tl_t3_l04)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l11
        :precondition (and (not (K_not_at-tl_t3_l11)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l11))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l11
        :precondition (K_at-tl_t3_l11)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l12
        :precondition (and (not (K_not_at-tl_t3_l12)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l12))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l12
        :precondition (K_at-tl_t3_l12)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l14
        :precondition (and (not (K_not_at-tl_t3_l14)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l14))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l14
        :precondition (K_at-tl_t3_l14)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l21
        :precondition (and (not (K_not_at-tl_t3_l21)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l21))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l21
        :precondition (K_at-tl_t3_l21)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l22
        :precondition (and (not (K_not_at-tl_t3_l22)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l22))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l22
        :precondition (K_at-tl_t3_l22)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l23
        :precondition (and (not (K_not_at-tl_t3_l23)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l23))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l23
        :precondition (K_at-tl_t3_l23)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l24
        :precondition (and (not (K_not_at-tl_t3_l24)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l24))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l24
        :precondition (K_at-tl_t3_l24)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l31
        :precondition (and (not (K_not_at-tl_t3_l31)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l31))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l31
        :precondition (K_at-tl_t3_l31)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l32
        :precondition (and (not (K_not_at-tl_t3_l32)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l32))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l32
        :precondition (K_at-tl_t3_l32)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l33
        :precondition (and (not (K_not_at-tl_t3_l33)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l33))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l33
        :precondition (K_at-tl_t3_l33)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l34
        :precondition (and (not (K_not_at-tl_t3_l34)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l34))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l34
        :precondition (K_at-tl_t3_l34)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l41
        :precondition (and (not (K_not_at-tl_t3_l41)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l41))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l41
        :precondition (K_at-tl_t3_l41)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l42
        :precondition (and (not (K_not_at-tl_t3_l42)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l42))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l42
        :precondition (K_at-tl_t3_l42)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l43
        :precondition (and (not (K_not_at-tl_t3_l43)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l44))
        :effect (K_at-tl_t3_l43))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l43
        :precondition (K_at-tl_t3_l43)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-tl_t3_l44
        :precondition (and (not (K_not_at-tl_t3_l44)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43))
        :effect (K_at-tl_t3_l44))
    (:action drule-var-type2-truck-pos_t3-at-tl_t3_l44
        :precondition (K_at-tl_t3_l44)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43)))
    (:action drule-var-type1-truck-pos_t3-at-ta_t3_l20
        :precondition (and (not (K_not_at-ta_t3_l20)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-ta_t3_l20))
    (:action drule-var-type2-truck-pos_t3-at-ta_t3_l20
        :precondition (K_at-ta_t3_l20)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-ta_t3_l30
        :precondition (and (not (K_not_at-ta_t3_l30)) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-ta_t3_l30))
    (:action drule-var-type2-truck-pos_t3-at-ta_t3_l30
        :precondition (K_at-ta_t3_l30)
        :effect (and (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-ta_t3_l00
        :precondition (and (not (K_not_at-ta_t3_l00)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-ta_t3_l00))
    (:action drule-var-type2-truck-pos_t3-at-ta_t3_l00
        :precondition (K_at-ta_t3_l00)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-ta_t3_l10
        :precondition (and (not (K_not_at-ta_t3_l10)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-ta_t3_l10))
    (:action drule-var-type2-truck-pos_t3-at-ta_t3_l10
        :precondition (K_at-ta_t3_l10)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l20) (K_not_at-ta_t3_l40) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t3-at-ta_t3_l40
        :precondition (and (not (K_not_at-ta_t3_l40)) (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44))
        :effect (K_at-ta_t3_l40))
    (:action drule-var-type2-truck-pos_t3-at-ta_t3_l40
        :precondition (K_at-ta_t3_l40)
        :effect (and (K_not_at-ta_t3_l30) (K_not_at-tl_t3_l31) (K_not_at-tl_t3_l32) (K_not_at-tl_t3_l33) (K_not_at-tl_t3_l34) (K_not_at-ta_t3_l00) (K_not_at-ta_t3_l10) (K_not_at-ta_t3_l20) (K_not_at-tl_t3_l01) (K_not_at-tl_t3_l02) (K_not_at-tl_t3_l03) (K_not_at-tl_t3_l04) (K_not_at-tl_t3_l11) (K_not_at-tl_t3_l12) (K_not_at-tl_t3_l13) (K_not_at-tl_t3_l14) (K_not_at-tl_t3_l21) (K_not_at-tl_t3_l22) (K_not_at-tl_t3_l23) (K_not_at-tl_t3_l24) (K_not_at-tl_t3_l41) (K_not_at-tl_t3_l42) (K_not_at-tl_t3_l43) (K_not_at-tl_t3_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l13
        :precondition (and (not (K_not_at-tl_t2_l13)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l13))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l13
        :precondition (K_at-tl_t2_l13)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l01
        :precondition (and (not (K_not_at-tl_t2_l01)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l01))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l01
        :precondition (K_at-tl_t2_l01)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l02
        :precondition (and (not (K_not_at-tl_t2_l02)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l02))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l02
        :precondition (K_at-tl_t2_l02)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l03
        :precondition (and (not (K_not_at-tl_t2_l03)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l03))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l03
        :precondition (K_at-tl_t2_l03)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l04
        :precondition (and (not (K_not_at-tl_t2_l04)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l04))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l04
        :precondition (K_at-tl_t2_l04)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l11
        :precondition (and (not (K_not_at-tl_t2_l11)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l11))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l11
        :precondition (K_at-tl_t2_l11)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l12
        :precondition (and (not (K_not_at-tl_t2_l12)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l12))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l12
        :precondition (K_at-tl_t2_l12)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l14
        :precondition (and (not (K_not_at-tl_t2_l14)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l14))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l14
        :precondition (K_at-tl_t2_l14)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l21
        :precondition (and (not (K_not_at-tl_t2_l21)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l21))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l21
        :precondition (K_at-tl_t2_l21)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l22
        :precondition (and (not (K_not_at-tl_t2_l22)) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l22))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l22
        :precondition (K_at-tl_t2_l22)
        :effect (and (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l23
        :precondition (and (not (K_not_at-tl_t2_l23)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l23))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l23
        :precondition (K_at-tl_t2_l23)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l24
        :precondition (and (not (K_not_at-tl_t2_l24)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l24))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l24
        :precondition (K_at-tl_t2_l24)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l31
        :precondition (and (not (K_not_at-tl_t2_l31)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l31))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l31
        :precondition (K_at-tl_t2_l31)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l32
        :precondition (and (not (K_not_at-tl_t2_l32)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l32))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l32
        :precondition (K_at-tl_t2_l32)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l33
        :precondition (and (not (K_not_at-tl_t2_l33)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l33))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l33
        :precondition (K_at-tl_t2_l33)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l34
        :precondition (and (not (K_not_at-tl_t2_l34)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l34))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l34
        :precondition (K_at-tl_t2_l34)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l41
        :precondition (and (not (K_not_at-tl_t2_l41)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l41))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l41
        :precondition (K_at-tl_t2_l41)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l42
        :precondition (and (not (K_not_at-tl_t2_l42)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l42))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l42
        :precondition (K_at-tl_t2_l42)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l43
        :precondition (and (not (K_not_at-tl_t2_l43)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l44))
        :effect (K_at-tl_t2_l43))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l43
        :precondition (K_at-tl_t2_l43)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-tl_t2_l44
        :precondition (and (not (K_not_at-tl_t2_l44)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43))
        :effect (K_at-tl_t2_l44))
    (:action drule-var-type2-truck-pos_t2-at-tl_t2_l44
        :precondition (K_at-tl_t2_l44)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43)))
    (:action drule-var-type1-truck-pos_t2-at-ta_t2_l20
        :precondition (and (not (K_not_at-ta_t2_l20)) (K_not_at-tl_t2_l22) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-ta_t2_l20))
    (:action drule-var-type2-truck-pos_t2-at-ta_t2_l20
        :precondition (K_at-ta_t2_l20)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-ta_t2_l30
        :precondition (and (not (K_not_at-ta_t2_l30)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-ta_t2_l30))
    (:action drule-var-type2-truck-pos_t2-at-ta_t2_l30
        :precondition (K_at-ta_t2_l30)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-ta_t2_l00
        :precondition (and (not (K_not_at-ta_t2_l00)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-ta_t2_l00))
    (:action drule-var-type2-truck-pos_t2-at-ta_t2_l00
        :precondition (K_at-ta_t2_l00)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-ta_t2_l10
        :precondition (and (not (K_not_at-ta_t2_l10)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-ta_t2_l10))
    (:action drule-var-type2-truck-pos_t2-at-ta_t2_l10
        :precondition (K_at-ta_t2_l10)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l30) (K_not_at-ta_t2_l40) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t2-at-ta_t2_l40
        :precondition (and (not (K_not_at-ta_t2_l40)) (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44))
        :effect (K_at-ta_t2_l40))
    (:action drule-var-type2-truck-pos_t2-at-ta_t2_l40
        :precondition (K_at-ta_t2_l40)
        :effect (and (K_not_at-tl_t2_l22) (K_not_at-ta_t2_l20) (K_not_at-tl_t2_l21) (K_not_at-tl_t2_l23) (K_not_at-tl_t2_l24) (K_not_at-ta_t2_l00) (K_not_at-ta_t2_l10) (K_not_at-ta_t2_l30) (K_not_at-tl_t2_l01) (K_not_at-tl_t2_l02) (K_not_at-tl_t2_l03) (K_not_at-tl_t2_l04) (K_not_at-tl_t2_l11) (K_not_at-tl_t2_l12) (K_not_at-tl_t2_l13) (K_not_at-tl_t2_l14) (K_not_at-tl_t2_l31) (K_not_at-tl_t2_l32) (K_not_at-tl_t2_l33) (K_not_at-tl_t2_l34) (K_not_at-tl_t2_l41) (K_not_at-tl_t2_l42) (K_not_at-tl_t2_l43) (K_not_at-tl_t2_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l13
        :precondition (and (not (K_not_at-tl_t1_l13)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l13))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l13
        :precondition (K_at-tl_t1_l13)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l01
        :precondition (and (not (K_not_at-tl_t1_l01)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l01))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l01
        :precondition (K_at-tl_t1_l01)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l02
        :precondition (and (not (K_not_at-tl_t1_l02)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l02))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l02
        :precondition (K_at-tl_t1_l02)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l03
        :precondition (and (not (K_not_at-tl_t1_l03)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l03))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l03
        :precondition (K_at-tl_t1_l03)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l04
        :precondition (and (not (K_not_at-tl_t1_l04)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l04))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l04
        :precondition (K_at-tl_t1_l04)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l11
        :precondition (and (not (K_not_at-tl_t1_l11)) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l11))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l11
        :precondition (K_at-tl_t1_l11)
        :effect (and (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l12
        :precondition (and (not (K_not_at-tl_t1_l12)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l12))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l12
        :precondition (K_at-tl_t1_l12)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l14
        :precondition (and (not (K_not_at-tl_t1_l14)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l14))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l14
        :precondition (K_at-tl_t1_l14)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l21
        :precondition (and (not (K_not_at-tl_t1_l21)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l21))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l21
        :precondition (K_at-tl_t1_l21)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l22
        :precondition (and (not (K_not_at-tl_t1_l22)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l22))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l22
        :precondition (K_at-tl_t1_l22)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l23
        :precondition (and (not (K_not_at-tl_t1_l23)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l23))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l23
        :precondition (K_at-tl_t1_l23)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l24
        :precondition (and (not (K_not_at-tl_t1_l24)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l24))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l24
        :precondition (K_at-tl_t1_l24)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l31
        :precondition (and (not (K_not_at-tl_t1_l31)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l31))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l31
        :precondition (K_at-tl_t1_l31)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l32
        :precondition (and (not (K_not_at-tl_t1_l32)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l32))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l32
        :precondition (K_at-tl_t1_l32)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l33
        :precondition (and (not (K_not_at-tl_t1_l33)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l33))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l33
        :precondition (K_at-tl_t1_l33)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l34
        :precondition (and (not (K_not_at-tl_t1_l34)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l34))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l34
        :precondition (K_at-tl_t1_l34)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l41
        :precondition (and (not (K_not_at-tl_t1_l41)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l41))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l41
        :precondition (K_at-tl_t1_l41)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l42
        :precondition (and (not (K_not_at-tl_t1_l42)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l42))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l42
        :precondition (K_at-tl_t1_l42)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l43
        :precondition (and (not (K_not_at-tl_t1_l43)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l44))
        :effect (K_at-tl_t1_l43))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l43
        :precondition (K_at-tl_t1_l43)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-tl_t1_l44
        :precondition (and (not (K_not_at-tl_t1_l44)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43))
        :effect (K_at-tl_t1_l44))
    (:action drule-var-type2-truck-pos_t1-at-tl_t1_l44
        :precondition (K_at-tl_t1_l44)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43)))
    (:action drule-var-type1-truck-pos_t1-at-ta_t1_l20
        :precondition (and (not (K_not_at-ta_t1_l20)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-ta_t1_l20))
    (:action drule-var-type2-truck-pos_t1-at-ta_t1_l20
        :precondition (K_at-ta_t1_l20)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-ta_t1_l30
        :precondition (and (not (K_not_at-ta_t1_l30)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-ta_t1_l30))
    (:action drule-var-type2-truck-pos_t1-at-ta_t1_l30
        :precondition (K_at-ta_t1_l30)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-ta_t1_l00
        :precondition (and (not (K_not_at-ta_t1_l00)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-ta_t1_l00))
    (:action drule-var-type2-truck-pos_t1-at-ta_t1_l00
        :precondition (K_at-ta_t1_l00)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-ta_t1_l10
        :precondition (and (not (K_not_at-ta_t1_l10)) (K_not_at-tl_t1_l11) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-ta_t1_l10))
    (:action drule-var-type2-truck-pos_t1-at-ta_t1_l10
        :precondition (K_at-ta_t1_l10)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-ta_t1_l40) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t1-at-ta_t1_l40
        :precondition (and (not (K_not_at-ta_t1_l40)) (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44))
        :effect (K_at-ta_t1_l40))
    (:action drule-var-type2-truck-pos_t1-at-ta_t1_l40
        :precondition (K_at-ta_t1_l40)
        :effect (and (K_not_at-tl_t1_l11) (K_not_at-ta_t1_l10) (K_not_at-tl_t1_l12) (K_not_at-tl_t1_l13) (K_not_at-tl_t1_l14) (K_not_at-ta_t1_l00) (K_not_at-ta_t1_l20) (K_not_at-ta_t1_l30) (K_not_at-tl_t1_l01) (K_not_at-tl_t1_l02) (K_not_at-tl_t1_l03) (K_not_at-tl_t1_l04) (K_not_at-tl_t1_l21) (K_not_at-tl_t1_l22) (K_not_at-tl_t1_l23) (K_not_at-tl_t1_l24) (K_not_at-tl_t1_l31) (K_not_at-tl_t1_l32) (K_not_at-tl_t1_l33) (K_not_at-tl_t1_l34) (K_not_at-tl_t1_l41) (K_not_at-tl_t1_l42) (K_not_at-tl_t1_l43) (K_not_at-tl_t1_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l13
        :precondition (and (not (K_not_at-tl_t0_l13)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l13))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l13
        :precondition (K_at-tl_t0_l13)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l01
        :precondition (and (not (K_not_at-tl_t0_l01)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l01))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l01
        :precondition (K_at-tl_t0_l01)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l02
        :precondition (and (not (K_not_at-tl_t0_l02)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l02))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l02
        :precondition (K_at-tl_t0_l02)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l03
        :precondition (and (not (K_not_at-tl_t0_l03)) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l03))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l03
        :precondition (K_at-tl_t0_l03)
        :effect (and (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l04
        :precondition (and (not (K_not_at-tl_t0_l04)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l04))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l04
        :precondition (K_at-tl_t0_l04)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l11
        :precondition (and (not (K_not_at-tl_t0_l11)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l11))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l11
        :precondition (K_at-tl_t0_l11)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l12
        :precondition (and (not (K_not_at-tl_t0_l12)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l12))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l12
        :precondition (K_at-tl_t0_l12)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l14
        :precondition (and (not (K_not_at-tl_t0_l14)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l14))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l14
        :precondition (K_at-tl_t0_l14)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l21
        :precondition (and (not (K_not_at-tl_t0_l21)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l21))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l21
        :precondition (K_at-tl_t0_l21)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l22
        :precondition (and (not (K_not_at-tl_t0_l22)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l22))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l22
        :precondition (K_at-tl_t0_l22)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l23
        :precondition (and (not (K_not_at-tl_t0_l23)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l23))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l23
        :precondition (K_at-tl_t0_l23)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l24
        :precondition (and (not (K_not_at-tl_t0_l24)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l24))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l24
        :precondition (K_at-tl_t0_l24)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l31
        :precondition (and (not (K_not_at-tl_t0_l31)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l31))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l31
        :precondition (K_at-tl_t0_l31)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l32
        :precondition (and (not (K_not_at-tl_t0_l32)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l32))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l32
        :precondition (K_at-tl_t0_l32)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l33
        :precondition (and (not (K_not_at-tl_t0_l33)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l33))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l33
        :precondition (K_at-tl_t0_l33)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l34
        :precondition (and (not (K_not_at-tl_t0_l34)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l34))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l34
        :precondition (K_at-tl_t0_l34)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l41
        :precondition (and (not (K_not_at-tl_t0_l41)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l41))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l41
        :precondition (K_at-tl_t0_l41)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l42
        :precondition (and (not (K_not_at-tl_t0_l42)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l42))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l42
        :precondition (K_at-tl_t0_l42)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l43
        :precondition (and (not (K_not_at-tl_t0_l43)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l44))
        :effect (K_at-tl_t0_l43))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l43
        :precondition (K_at-tl_t0_l43)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-tl_t0_l44
        :precondition (and (not (K_not_at-tl_t0_l44)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43))
        :effect (K_at-tl_t0_l44))
    (:action drule-var-type2-truck-pos_t0-at-tl_t0_l44
        :precondition (K_at-tl_t0_l44)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43)))
    (:action drule-var-type1-truck-pos_t0-at-ta_t0_l20
        :precondition (and (not (K_not_at-ta_t0_l20)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-ta_t0_l20))
    (:action drule-var-type2-truck-pos_t0-at-ta_t0_l20
        :precondition (K_at-ta_t0_l20)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-ta_t0_l30
        :precondition (and (not (K_not_at-ta_t0_l30)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-ta_t0_l30))
    (:action drule-var-type2-truck-pos_t0-at-ta_t0_l30
        :precondition (K_at-ta_t0_l30)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-ta_t0_l00
        :precondition (and (not (K_not_at-ta_t0_l00)) (K_not_at-tl_t0_l03) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-ta_t0_l00))
    (:action drule-var-type2-truck-pos_t0-at-ta_t0_l00
        :precondition (K_at-ta_t0_l00)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-ta_t0_l10
        :precondition (and (not (K_not_at-ta_t0_l10)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-ta_t0_l10))
    (:action drule-var-type2-truck-pos_t0-at-ta_t0_l10
        :precondition (K_at-ta_t0_l10)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-ta_t0_l40) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-truck-pos_t0-at-ta_t0_l40
        :precondition (and (not (K_not_at-ta_t0_l40)) (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44))
        :effect (K_at-ta_t0_l40))
    (:action drule-var-type2-truck-pos_t0-at-ta_t0_l40
        :precondition (K_at-ta_t0_l40)
        :effect (and (K_not_at-tl_t0_l03) (K_not_at-ta_t0_l00) (K_not_at-tl_t0_l01) (K_not_at-tl_t0_l02) (K_not_at-tl_t0_l04) (K_not_at-ta_t0_l10) (K_not_at-ta_t0_l20) (K_not_at-ta_t0_l30) (K_not_at-tl_t0_l11) (K_not_at-tl_t0_l12) (K_not_at-tl_t0_l13) (K_not_at-tl_t0_l14) (K_not_at-tl_t0_l21) (K_not_at-tl_t0_l22) (K_not_at-tl_t0_l23) (K_not_at-tl_t0_l24) (K_not_at-tl_t0_l31) (K_not_at-tl_t0_l32) (K_not_at-tl_t0_l33) (K_not_at-tl_t0_l34) (K_not_at-tl_t0_l41) (K_not_at-tl_t0_l42) (K_not_at-tl_t0_l43) (K_not_at-tl_t0_l44)))
    (:action drule-var-type1-airplane-pos_a0-at-aa_a0_l20
        :precondition (and (not (K_not_at-aa_a0_l20)) (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40))
        :effect (K_at-aa_a0_l20))
    (:action drule-var-type2-airplane-pos_a0-at-aa_a0_l20
        :precondition (K_at-aa_a0_l20)
        :effect (and (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40)))
    (:action drule-var-type1-airplane-pos_a0-at-aa_a0_l30
        :precondition (and (not (K_not_at-aa_a0_l30)) (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l40))
        :effect (K_at-aa_a0_l30))
    (:action drule-var-type2-airplane-pos_a0-at-aa_a0_l30
        :precondition (K_at-aa_a0_l30)
        :effect (and (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l40)))
    (:action drule-var-type1-airplane-pos_a0-at-aa_a0_l00
        :precondition (and (not (K_not_at-aa_a0_l00)) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40))
        :effect (K_at-aa_a0_l00))
    (:action drule-var-type2-airplane-pos_a0-at-aa_a0_l00
        :precondition (K_at-aa_a0_l00)
        :effect (and (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40)))
    (:action drule-var-type1-airplane-pos_a0-at-aa_a0_l10
        :precondition (and (not (K_not_at-aa_a0_l10)) (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40))
        :effect (K_at-aa_a0_l10))
    (:action drule-var-type2-airplane-pos_a0-at-aa_a0_l10
        :precondition (K_at-aa_a0_l10)
        :effect (and (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30) (K_not_at-aa_a0_l40)))
    (:action drule-var-type1-airplane-pos_a0-at-aa_a0_l40
        :precondition (and (not (K_not_at-aa_a0_l40)) (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30))
        :effect (K_at-aa_a0_l40))
    (:action drule-var-type2-airplane-pos_a0-at-aa_a0_l40
        :precondition (K_at-aa_a0_l40)
        :effect (and (K_not_at-aa_a0_l00) (K_not_at-aa_a0_l10) (K_not_at-aa_a0_l20) (K_not_at-aa_a0_l30)))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l44-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_not_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l44))
        :effect (K_at-ol_p0_l44))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l44-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_not_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l44))
        :effect (K_at-ol_p1_l44))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l44-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_not_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l44))
        :effect (K_at-ol_p2_l44))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l44-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_not_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l44))
        :effect (K_at-ol_p3_l44))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l44-true
        :precondition (and (not (K_not_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l44))
        :effect (K_at-ol_p4_l44))
    (:action sensor-for-obj-pos_p0-at-oa_p0_l00-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_not_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-oa_p0_l00))
        :effect (K_at-oa_p0_l00))
    (:action sensor-for-obj-pos_p1-at-oa_p1_l00-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_not_at-oa_p1_l00)) (K_sensing-for-at-oa_p1_l00))
        :effect (K_at-oa_p1_l00))
    (:action sensor-for-obj-pos_p2-at-oa_p2_l00-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_not_at-oa_p2_l00)) (K_sensing-for-at-oa_p2_l00))
        :effect (K_at-oa_p2_l00))
    (:action sensor-for-obj-pos_p3-at-oa_p3_l00-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_not_at-oa_p3_l00)) (K_sensing-for-at-oa_p3_l00))
        :effect (K_at-oa_p3_l00))
    (:action sensor-for-obj-pos_p4-at-oa_p4_l00-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_not_at-oa_p4_l00)) (K_sensing-for-at-oa_p4_l00))
        :effect (K_at-oa_p4_l00))
    (:action sensor-for-obj-pos_p0-at-oa_p0_l10-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_not_at-oa_p0_l10)) (K_sensing-for-at-oa_p0_l10))
        :effect (K_at-oa_p0_l10))
    (:action sensor-for-obj-pos_p1-at-oa_p1_l10-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_not_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-oa_p1_l10))
        :effect (K_at-oa_p1_l10))
    (:action sensor-for-obj-pos_p2-at-oa_p2_l10-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_not_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-oa_p2_l10))
        :effect (K_at-oa_p2_l10))
    (:action sensor-for-obj-pos_p3-at-oa_p3_l10-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_not_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-oa_p3_l10))
        :effect (K_at-oa_p3_l10))
    (:action sensor-for-obj-pos_p4-at-oa_p4_l10-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_not_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-oa_p4_l10))
        :effect (K_at-oa_p4_l10))
    (:action sensor-for-obj-pos_p0-at-oa_p0_l20-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_not_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-oa_p0_l20))
        :effect (K_at-oa_p0_l20))
    (:action sensor-for-obj-pos_p1-at-oa_p1_l20-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_not_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-oa_p1_l20))
        :effect (K_at-oa_p1_l20))
    (:action sensor-for-obj-pos_p2-at-oa_p2_l20-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_not_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-oa_p2_l20))
        :effect (K_at-oa_p2_l20))
    (:action sensor-for-obj-pos_p3-at-oa_p3_l20-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_not_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-oa_p3_l20))
        :effect (K_at-oa_p3_l20))
    (:action sensor-for-obj-pos_p4-at-oa_p4_l20-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_not_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-oa_p4_l20))
        :effect (K_at-oa_p4_l20))
    (:action sensor-for-obj-pos_p0-at-oa_p0_l30-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_not_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-oa_p0_l30))
        :effect (K_at-oa_p0_l30))
    (:action sensor-for-obj-pos_p1-at-oa_p1_l30-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_not_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-oa_p1_l30))
        :effect (K_at-oa_p1_l30))
    (:action sensor-for-obj-pos_p2-at-oa_p2_l30-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_not_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-oa_p2_l30))
        :effect (K_at-oa_p2_l30))
    (:action sensor-for-obj-pos_p3-at-oa_p3_l30-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_not_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-oa_p3_l30))
        :effect (K_at-oa_p3_l30))
    (:action sensor-for-obj-pos_p4-at-oa_p4_l30-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_not_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-oa_p4_l30))
        :effect (K_at-oa_p4_l30))
    (:action sensor-for-obj-pos_p0-at-oa_p0_l40-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_not_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-oa_p0_l40))
        :effect (K_at-oa_p0_l40))
    (:action sensor-for-obj-pos_p1-at-oa_p1_l40-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_not_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-oa_p1_l40))
        :effect (K_at-oa_p1_l40))
    (:action sensor-for-obj-pos_p2-at-oa_p2_l40-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_not_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-oa_p2_l40))
        :effect (K_at-oa_p2_l40))
    (:action sensor-for-obj-pos_p3-at-oa_p3_l40-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_not_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-oa_p3_l40))
        :effect (K_at-oa_p3_l40))
    (:action sensor-for-obj-pos_p4-at-oa_p4_l40-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_not_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-oa_p4_l40))
        :effect (K_at-oa_p4_l40))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l01-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_not_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l01))
        :effect (K_at-ol_p0_l01))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l01-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_not_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l01))
        :effect (K_at-ol_p1_l01))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l01-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_not_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l01))
        :effect (K_at-ol_p2_l01))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l01-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_not_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l01))
        :effect (K_at-ol_p3_l01))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l01-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_not_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l01))
        :effect (K_at-ol_p4_l01))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l02-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_not_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l02))
        :effect (K_at-ol_p0_l02))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l02-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_not_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l02))
        :effect (K_at-ol_p1_l02))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l02-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_not_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l02))
        :effect (K_at-ol_p2_l02))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l02-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_not_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l02))
        :effect (K_at-ol_p3_l02))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l02-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_not_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l02))
        :effect (K_at-ol_p4_l02))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l03-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_not_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l03))
        :effect (K_at-ol_p0_l03))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l03-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_not_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l03))
        :effect (K_at-ol_p1_l03))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l03-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_not_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l03))
        :effect (K_at-ol_p2_l03))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l03-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_not_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l03))
        :effect (K_at-ol_p3_l03))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l03-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_not_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l03))
        :effect (K_at-ol_p4_l03))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l04-true
        :precondition (and (not (K_not_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l04))
        :effect (K_at-ol_p0_l04))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l04-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_not_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l04))
        :effect (K_at-ol_p1_l04))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l04-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_not_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l04))
        :effect (K_at-ol_p2_l04))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l04-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_not_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l04))
        :effect (K_at-ol_p3_l04))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l04-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_not_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l04))
        :effect (K_at-ol_p4_l04))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l11-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_not_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l11))
        :effect (K_at-ol_p0_l11))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l11-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_not_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l11))
        :effect (K_at-ol_p1_l11))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l11-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_not_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l11))
        :effect (K_at-ol_p2_l11))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l11-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_not_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l11))
        :effect (K_at-ol_p3_l11))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l11-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_not_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l11))
        :effect (K_at-ol_p4_l11))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l12-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_not_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l12))
        :effect (K_at-ol_p0_l12))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l12-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_not_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l12))
        :effect (K_at-ol_p1_l12))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l12-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_not_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l12))
        :effect (K_at-ol_p2_l12))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l12-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_not_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l12))
        :effect (K_at-ol_p3_l12))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l12-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_not_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l12))
        :effect (K_at-ol_p4_l12))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l13-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_not_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l13))
        :effect (K_at-ol_p0_l13))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l13-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_not_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l13))
        :effect (K_at-ol_p1_l13))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l13-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_not_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l13))
        :effect (K_at-ol_p2_l13))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l13-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_not_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l13))
        :effect (K_at-ol_p3_l13))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l13-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_not_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l13))
        :effect (K_at-ol_p4_l13))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l14-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_not_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l14))
        :effect (K_at-ol_p0_l14))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l14-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_not_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l14))
        :effect (K_at-ol_p1_l14))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l14-true
        :precondition (and (not (K_not_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l14))
        :effect (K_at-ol_p2_l14))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l14-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_not_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l14))
        :effect (K_at-ol_p3_l14))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l14-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_not_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l14))
        :effect (K_at-ol_p4_l14))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l21-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_not_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l21))
        :effect (K_at-ol_p0_l21))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l21-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_not_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l21))
        :effect (K_at-ol_p1_l21))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l21-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_not_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l21))
        :effect (K_at-ol_p2_l21))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l21-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_not_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l21))
        :effect (K_at-ol_p3_l21))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l21-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_not_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l21))
        :effect (K_at-ol_p4_l21))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l22-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_not_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l22))
        :effect (K_at-ol_p0_l22))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l22-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_not_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l22))
        :effect (K_at-ol_p1_l22))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l22-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_not_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l22))
        :effect (K_at-ol_p2_l22))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l22-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_not_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l22))
        :effect (K_at-ol_p3_l22))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l22-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_not_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l22))
        :effect (K_at-ol_p4_l22))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l23-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_not_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l23))
        :effect (K_at-ol_p0_l23))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l23-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_not_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l23))
        :effect (K_at-ol_p1_l23))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l23-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_not_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l23))
        :effect (K_at-ol_p2_l23))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l23-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_not_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l23))
        :effect (K_at-ol_p3_l23))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l23-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_not_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l23))
        :effect (K_at-ol_p4_l23))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l24-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_not_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l24))
        :effect (K_at-ol_p0_l24))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l24-true
        :precondition (and (not (K_not_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l24))
        :effect (K_at-ol_p1_l24))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l24-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_not_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l24))
        :effect (K_at-ol_p2_l24))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l24-true
        :precondition (and (not (K_not_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l24))
        :effect (K_at-ol_p3_l24))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l24-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_not_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l24))
        :effect (K_at-ol_p4_l24))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l31-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_not_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l31))
        :effect (K_at-ol_p0_l31))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l31-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_not_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l31))
        :effect (K_at-ol_p1_l31))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l31-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_not_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l31))
        :effect (K_at-ol_p2_l31))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l31-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_not_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l31))
        :effect (K_at-ol_p3_l31))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l31-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_not_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l31))
        :effect (K_at-ol_p4_l31))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l32-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_not_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l32))
        :effect (K_at-ol_p0_l32))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l32-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_not_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l32))
        :effect (K_at-ol_p1_l32))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l32-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_not_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l32))
        :effect (K_at-ol_p2_l32))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l32-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_not_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l32))
        :effect (K_at-ol_p3_l32))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l32-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_not_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l32))
        :effect (K_at-ol_p4_l32))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l33-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_not_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l33))
        :effect (K_at-ol_p0_l33))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l33-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_not_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l33))
        :effect (K_at-ol_p1_l33))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l33-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_not_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l33))
        :effect (K_at-ol_p2_l33))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l33-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_not_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l33))
        :effect (K_at-ol_p3_l33))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l33-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_not_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l33))
        :effect (K_at-ol_p4_l33))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l34-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_not_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l34))
        :effect (K_at-ol_p0_l34))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l34-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_not_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l34))
        :effect (K_at-ol_p1_l34))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l34-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_not_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l34))
        :effect (K_at-ol_p2_l34))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l34-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_not_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l34))
        :effect (K_at-ol_p3_l34))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l34-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_not_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l34))
        :effect (K_at-ol_p4_l34))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l41-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_not_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l41))
        :effect (K_at-ol_p0_l41))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l41-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_not_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l41))
        :effect (K_at-ol_p1_l41))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l41-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_not_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l41))
        :effect (K_at-ol_p2_l41))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l41-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_not_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l41))
        :effect (K_at-ol_p3_l41))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l41-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_not_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l41))
        :effect (K_at-ol_p4_l41))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l42-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_at-ol_p0_l43)) (not (K_not_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l42))
        :effect (K_at-ol_p0_l42))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l42-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_at-ol_p1_l43)) (not (K_not_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l42))
        :effect (K_at-ol_p1_l42))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l42-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_at-ol_p2_l43)) (not (K_not_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l42))
        :effect (K_at-ol_p2_l42))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l42-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_at-ol_p3_l43)) (not (K_not_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l42))
        :effect (K_at-ol_p3_l42))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l42-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_at-ol_p4_l43)) (not (K_not_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l42))
        :effect (K_at-ol_p4_l42))
    (:action sensor-for-obj-pos_p0-at-ol_p0_l43-true
        :precondition (and (not (K_at-ol_p0_l04)) (not (K_at-ol_p0_l03)) (not (K_at-ol_p0_l02)) (not (K_at-ol_p0_l01)) (not (K_at-oa_p0_l00)) (not (K_in-oa_p0_a0)) (not (K_in-ot_p0_t4)) (not (K_in-ot_p0_t3)) (not (K_in-ot_p0_t2)) (not (K_in-ot_p0_t1)) (not (K_in-ot_p0_t0)) (not (K_at-ol_p0_l44)) (not (K_not_at-ol_p0_l43)) (not (K_at-ol_p0_l42)) (not (K_at-ol_p0_l41)) (not (K_at-oa_p0_l40)) (not (K_at-ol_p0_l34)) (not (K_at-ol_p0_l33)) (not (K_at-ol_p0_l32)) (not (K_at-ol_p0_l31)) (not (K_at-oa_p0_l30)) (not (K_at-ol_p0_l24)) (not (K_at-ol_p0_l23)) (not (K_at-ol_p0_l22)) (not (K_at-ol_p0_l21)) (not (K_at-oa_p0_l20)) (not (K_at-ol_p0_l14)) (not (K_at-ol_p0_l13)) (not (K_at-ol_p0_l12)) (not (K_at-ol_p0_l11)) (not (K_at-oa_p0_l10)) (K_sensing-for-at-ol_p0_l43))
        :effect (K_at-ol_p0_l43))
    (:action sensor-for-obj-pos_p1-at-ol_p1_l43-true
        :precondition (and (not (K_at-ol_p1_l24)) (not (K_at-ol_p1_l23)) (not (K_at-ol_p1_l22)) (not (K_at-ol_p1_l21)) (not (K_at-oa_p1_l20)) (not (K_in-oa_p1_a0)) (not (K_in-ot_p1_t4)) (not (K_in-ot_p1_t3)) (not (K_in-ot_p1_t2)) (not (K_in-ot_p1_t1)) (not (K_in-ot_p1_t0)) (not (K_at-ol_p1_l44)) (not (K_not_at-ol_p1_l43)) (not (K_at-ol_p1_l42)) (not (K_at-ol_p1_l41)) (not (K_at-oa_p1_l40)) (not (K_at-ol_p1_l34)) (not (K_at-ol_p1_l33)) (not (K_at-ol_p1_l32)) (not (K_at-ol_p1_l31)) (not (K_at-oa_p1_l30)) (not (K_at-ol_p1_l14)) (not (K_at-ol_p1_l13)) (not (K_at-ol_p1_l12)) (not (K_at-ol_p1_l11)) (not (K_at-oa_p1_l10)) (not (K_at-ol_p1_l04)) (not (K_at-ol_p1_l03)) (not (K_at-ol_p1_l02)) (not (K_at-ol_p1_l01)) (not (K_at-oa_p1_l00)) (K_sensing-for-at-ol_p1_l43))
        :effect (K_at-ol_p1_l43))
    (:action sensor-for-obj-pos_p2-at-ol_p2_l43-true
        :precondition (and (not (K_at-ol_p2_l14)) (not (K_at-ol_p2_l13)) (not (K_at-ol_p2_l12)) (not (K_at-ol_p2_l11)) (not (K_at-oa_p2_l10)) (not (K_in-oa_p2_a0)) (not (K_in-ot_p2_t4)) (not (K_in-ot_p2_t3)) (not (K_in-ot_p2_t2)) (not (K_in-ot_p2_t1)) (not (K_in-ot_p2_t0)) (not (K_at-ol_p2_l44)) (not (K_not_at-ol_p2_l43)) (not (K_at-ol_p2_l42)) (not (K_at-ol_p2_l41)) (not (K_at-oa_p2_l40)) (not (K_at-ol_p2_l34)) (not (K_at-ol_p2_l33)) (not (K_at-ol_p2_l32)) (not (K_at-ol_p2_l31)) (not (K_at-oa_p2_l30)) (not (K_at-ol_p2_l24)) (not (K_at-ol_p2_l23)) (not (K_at-ol_p2_l22)) (not (K_at-ol_p2_l21)) (not (K_at-oa_p2_l20)) (not (K_at-ol_p2_l04)) (not (K_at-ol_p2_l03)) (not (K_at-ol_p2_l02)) (not (K_at-ol_p2_l01)) (not (K_at-oa_p2_l00)) (K_sensing-for-at-ol_p2_l43))
        :effect (K_at-ol_p2_l43))
    (:action sensor-for-obj-pos_p3-at-ol_p3_l43-true
        :precondition (and (not (K_at-ol_p3_l24)) (not (K_at-ol_p3_l23)) (not (K_at-ol_p3_l22)) (not (K_at-ol_p3_l21)) (not (K_at-oa_p3_l20)) (not (K_in-oa_p3_a0)) (not (K_in-ot_p3_t4)) (not (K_in-ot_p3_t3)) (not (K_in-ot_p3_t2)) (not (K_in-ot_p3_t1)) (not (K_in-ot_p3_t0)) (not (K_at-ol_p3_l44)) (not (K_not_at-ol_p3_l43)) (not (K_at-ol_p3_l42)) (not (K_at-ol_p3_l41)) (not (K_at-oa_p3_l40)) (not (K_at-ol_p3_l34)) (not (K_at-ol_p3_l33)) (not (K_at-ol_p3_l32)) (not (K_at-ol_p3_l31)) (not (K_at-oa_p3_l30)) (not (K_at-ol_p3_l14)) (not (K_at-ol_p3_l13)) (not (K_at-ol_p3_l12)) (not (K_at-ol_p3_l11)) (not (K_at-oa_p3_l10)) (not (K_at-ol_p3_l04)) (not (K_at-ol_p3_l03)) (not (K_at-ol_p3_l02)) (not (K_at-ol_p3_l01)) (not (K_at-oa_p3_l00)) (K_sensing-for-at-ol_p3_l43))
        :effect (K_at-ol_p3_l43))
    (:action sensor-for-obj-pos_p4-at-ol_p4_l43-true
        :precondition (and (not (K_at-ol_p4_l44)) (not (K_not_at-ol_p4_l43)) (not (K_at-ol_p4_l42)) (not (K_at-ol_p4_l41)) (not (K_at-oa_p4_l40)) (not (K_in-oa_p4_a0)) (not (K_in-ot_p4_t4)) (not (K_in-ot_p4_t3)) (not (K_in-ot_p4_t2)) (not (K_in-ot_p4_t1)) (not (K_in-ot_p4_t0)) (not (K_at-ol_p4_l34)) (not (K_at-ol_p4_l33)) (not (K_at-ol_p4_l32)) (not (K_at-ol_p4_l31)) (not (K_at-oa_p4_l30)) (not (K_at-ol_p4_l24)) (not (K_at-ol_p4_l23)) (not (K_at-ol_p4_l22)) (not (K_at-ol_p4_l21)) (not (K_at-oa_p4_l20)) (not (K_at-ol_p4_l14)) (not (K_at-ol_p4_l13)) (not (K_at-ol_p4_l12)) (not (K_at-ol_p4_l11)) (not (K_at-oa_p4_l10)) (not (K_at-ol_p4_l04)) (not (K_at-ol_p4_l03)) (not (K_at-ol_p4_l02)) (not (K_at-ol_p4_l01)) (not (K_at-oa_p4_l00)) (K_sensing-for-at-ol_p4_l43))
        :effect (K_at-ol_p4_l43))
    (:action reach_new_goal_through_original_goal__
        :precondition (and (K_at-oa_p0_l10) (K_at-ol_p1_l12) (K_at-ol_p3_l32) (K_normal-execution) (K_at-ol_p4_l42) (K_at-ol_p2_l11))
        :effect (new-goal))
)
