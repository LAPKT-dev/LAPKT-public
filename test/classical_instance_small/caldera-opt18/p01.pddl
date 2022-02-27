;copyright 2018 the mitre corporation. all rights reserved. approved for public release. distribution unlimited 17-2122.
; for more information on caldera, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; this has 2 hosts, 4 user, 2 admin per host, 1 active account per host
(define (problem p2_hosts_trial_15)
(:domain caldera)
(:objects
    num__21 num__20 num__28 num__27 - num
    id_ttimedelta id_batimedelta - observedtimedelta
    id_zhost id_shost - observedhost
    id_ddomaincredential id_hdomaincredential id_pdomaincredential id_ldomaincredential - observeddomaincredential
    str__bf str__alpha str__bd str__j str__r str__w str__f str__y str__patricia str__mary str__e str__i str__b str__bh str__q str__m str__n str__be str__james str__john str__x - string
    id_bkshare id_blshare - observedshare
    id_adomain - observeddomain
    id_bgrat id_bjrat id_birat - observedrat
    id_bmfile id_bnfile - observedfile
    id_gdomainuser id_cdomainuser id_kdomainuser id_odomainuser - observeddomainuser
    id_boschtask id_bpschtask - observedschtask
)
(:init
    (knows id_bgrat)
    (knows id_shost)
    (knows_property id_bgrat pexecutable)
    (knows_property id_bgrat phost)
    (knows_property id_shost pfqdn)
    (mem_cached_domain_creds id_shost id_ddomaincredential)
    (mem_cached_domain_creds id_zhost id_pdomaincredential)
    (mem_domain_user_admins id_shost id_gdomainuser)
    (mem_domain_user_admins id_shost id_kdomainuser)
    (mem_domain_user_admins id_zhost id_cdomainuser)
    (mem_domain_user_admins id_zhost id_odomainuser)
    (mem_hosts id_adomain id_shost)
    (mem_hosts id_adomain id_zhost)
    (prop_cred id_cdomainuser id_ddomaincredential)
    (prop_cred id_gdomainuser id_hdomaincredential)
    (prop_cred id_kdomainuser id_ldomaincredential)
    (prop_cred id_odomainuser id_pdomaincredential)
    (prop_dc id_shost no)
    (prop_dc id_zhost no)
    (prop_dns_domain id_adomain str__b)
    (prop_dns_domain_name id_shost str__y)
    (prop_dns_domain_name id_zhost str__bf)
    (prop_domain id_cdomainuser id_adomain)
    (prop_domain id_ddomaincredential id_adomain)
    (prop_domain id_gdomainuser id_adomain)
    (prop_domain id_hdomaincredential id_adomain)
    (prop_domain id_kdomainuser id_adomain)
    (prop_domain id_ldomaincredential id_adomain)
    (prop_domain id_odomainuser id_adomain)
    (prop_domain id_pdomaincredential id_adomain)
    (prop_domain id_shost id_adomain)
    (prop_domain id_zhost id_adomain)
    (prop_elevated id_bgrat yes)
    (prop_executable id_bgrat str__bh)
    (prop_fqdn id_shost str__w)
    (prop_fqdn id_zhost str__bd)
    (prop_host id_batimedelta id_zhost)
    (prop_host id_bgrat id_shost)
    (prop_host id_ttimedelta id_shost)
    (prop_hostname id_shost str__x)
    (prop_hostname id_zhost str__be)
    (prop_is_group id_cdomainuser no)
    (prop_is_group id_gdomainuser no)
    (prop_is_group id_kdomainuser no)
    (prop_is_group id_odomainuser no)
    (prop_microseconds id_batimedelta num__28)
    (prop_microseconds id_ttimedelta num__21)
    (prop_password id_ddomaincredential str__e)
    (prop_password id_hdomaincredential str__i)
    (prop_password id_ldomaincredential str__m)
    (prop_password id_pdomaincredential str__q)
    (prop_seconds id_batimedelta num__27)
    (prop_seconds id_ttimedelta num__20)
    (prop_sid id_cdomainuser str__f)
    (prop_sid id_gdomainuser str__j)
    (prop_sid id_kdomainuser str__n)
    (prop_sid id_odomainuser str__r)
    (prop_timedelta id_shost id_ttimedelta)
    (prop_timedelta id_zhost id_batimedelta)
    (prop_user id_ddomaincredential id_cdomainuser)
    (prop_user id_hdomaincredential id_gdomainuser)
    (prop_user id_ldomaincredential id_kdomainuser)
    (prop_user id_pdomaincredential id_odomainuser)
    (prop_username id_cdomainuser str__james)
    (prop_username id_gdomainuser str__mary)
    (prop_username id_kdomainuser str__john)
    (prop_username id_odomainuser str__patricia)
    (prop_windows_domain id_adomain str__alpha)
)
(:goal
(and
    (prop_host id_birat id_zhost)
)
)
)