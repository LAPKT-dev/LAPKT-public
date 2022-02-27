;copyright 2018 the mitre corporation. all rights reserved. approved for public release. distribution unlimited 17-2122.
; for more information on caldera, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
(define (domain caldera)
(:requirements :equality :typing :conditional-effects :negative-preconditions)
(:types
    value property - object
    object_type boolean string num - value
    observedschtask observedconnection observeddomain observedfile observedlocalcredential observedtimedelta observedhost observedshare observeddomainuser observeddomaincredential observedlocaluser observedrat - object_type
)
(:constants
    pdns_domain - property
    psrc_host - property
    pstart_time - property
    c__dollar__ - string
    puser - property
    pshare_name - property
    plocal_user_admins - property
    pstatus - property
    pdns_domain_name - property
    pis_group - property
    pdc - property
    pmicroseconds - property
    pexe_path - property
    pdomain - property
    pwindows_domain - property
    premote_host - property
    ptimedelta - property
    pcred - property
    phostname - property
    parguments - property
    ppassword - property
    whatever - string
    pelevated - property
    pcached_local_creds - property
    phosts - property
    ppath - property
    pcached_domain_creds - property
    pseconds - property
    psid - property
    yes - boolean
    phost - property
    pname - property
    pdest - property
    pdomain_user_admins - property
    psrc - property
    pshare_path - property
    pexecutable - property
    pusername - property
    pfqdn - property
    no - boolean
    somepath - string
    pdest_host - property
    psrc_path - property
)
(:predicates
    (knows ?obj - object_type)
    (created ?obj - object_type)
    (knows_property ?obj - object_type ?prop - property)
    (prop_timedelta ?a - observedhost ?b - observedtimedelta)
    (prop_src_host ?a - observedshare ?b - observedhost)
    (prop_dns_domain_name ?a - observedhost ?b - string)
    (prop_fqdn ?a - observedhost ?b - string)
    (prop_password ?a - observeddomaincredential ?b - string)
    (prop_host ?a - object_type ?b - object_type)
    (prop_share_name ?a - observedshare ?b - string)
    (prop_dc ?a - observedhost ?b - boolean)
    (mem_cached_domain_creds ?a - observedhost ?b - observeddomaincredential)
    (prop_executable ?a - observedrat ?b - string)
    (prop_user ?a - observeddomaincredential ?b - observeddomainuser)
    (prop_cred ?a - observeddomainuser ?b - observeddomaincredential)
    (prop_share_path ?a - observedshare ?b - string)
    (prop_hostname ?a - observedhost ?b - string)
    (mem_hosts ?a - observeddomain ?b - observedhost)
    (prop_is_group ?a - observeddomainuser ?b - boolean)
    (mem_domain_user_admins ?a - observedhost ?b - observeddomainuser)
    (prop_seconds ?a - observedtimedelta ?b - num)
    (prop_microseconds ?a - observedtimedelta ?b - num)
    (prop_windows_domain ?a - observeddomain ?b - string)
    (prop_domain ?a - object_type ?b - object_type)
    (prop_dest_host ?a - observedshare ?b - observedhost)
    (prop_dns_domain ?a - observeddomain ?b - string)
    (prop_elevated ?a - observedrat ?b - boolean)
    (prop_username ?a - observeddomainuser ?b - string)
    (prop_path ?a - observedfile ?b - string)
    (prop_sid ?a - observeddomainuser ?b - string)
)
; enumerates the windows domain
(:action get_domain
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - string)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (prop_host ?v00 ?v01)
        (knows_property ?v00 phost)
        (prop_fqdn ?v01 ?v02)
        (knows_property ?v01 pfqdn)
    )
    :effect
    (forall (?v03 - observeddomain)
        (when
            (prop_domain ?v01 ?v03)
            (and
                (knows ?v03)
                (knows_property ?v01 pdomain)
                (mem_hosts ?v03 ?v01)
                (knows_property ?v03 phosts)
                (knows_property ?v03 pwindows_domain)
                (knows_property ?v03 pdns_domain)
            )
        )
    )
)

; gets all computers in the domain
(:action get_computers
    :parameters (?v00 - observedrat ?v02 - observeddomain)
    :precondition
    (and
        (knows ?v00)
        (knows ?v02)
    )
    :effect
    (and
        (knows_property ?v02 phosts)
        (forall (?v01 - observedhost)
            (when
                (prop_domain ?v01 ?v02)
                (and
                    (knows ?v01)
                    (knows_property ?v01 pdomain)
                    (mem_hosts ?v02 ?v01)
                    (knows_property ?v01 pfqdn)
                )
            )
        )
    )
)

; all admins of a host
(:action get_admin
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - observeddomain)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (knows ?v02)
    )
    :effect
    (and
        (knows_property ?v01 pdomain_user_admins)
        (forall (?v04 - observeddomainuser)
            (when
                (mem_domain_user_admins ?v01 ?v04)
                (and
                    (knows ?v04)
                    (knows_property ?v04 pusername)
                    (knows_property ?v04 psid)
                    (knows_property ?v04 pis_group)
                    (knows_property ?v04 pdomain)
                )
            )
        )
    )
)

; gets all credentials on the target host that have logged in since last reboot
(:action creds
    :parameters (?v00 - observedrat ?v01 - observedhost ?v08 - observeddomain)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (prop_host ?v00 ?v01)
        (knows_property ?v00 phost)
        (knows ?v08)
    )
    :effect
    (and
        (forall (?v03 - observeddomaincredential ?v05 - observeddomainuser)
            (when
                (and
                    (mem_cached_domain_creds ?v01 ?v03)
                    (prop_cred ?v05 ?v03)
                    (prop_elevated ?v00 yes)
                )
                (and
                    (knows ?v03)
                    (knows_property ?v03 ppassword)
                    (knows ?v05)
                    (knows_property ?v03 puser)
                    (prop_cred ?v05 ?v03)
                    (knows_property ?v05 pcred)
                    (knows_property ?v05 pusername)
                    (knows_property ?v05 pis_group)
                    (knows ?v08)
                    (knows_property ?v05 pdomain)
                    (knows_property ?v08 pwindows_domain)
                )
            )
        )
    )
)

; mounts a network share
(:action net_use
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - observedhost ?v03 - string ?v04 - observeddomaincredential ?v05 - string ?v06 - observeddomainuser ?v07 - string ?v08 - observeddomain ?v09 - string ?v10 - observedshare)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (prop_host ?v00 ?v01)
        (knows_property ?v00 phost)
        (knows ?v02)
        (prop_fqdn ?v02 ?v03)
        (knows_property ?v02 pfqdn)
        (knows ?v04)
        (prop_password ?v04 ?v05)
        (knows_property ?v04 ppassword)
        (knows ?v06)
        (prop_user ?v04 ?v06)
        (knows_property ?v04 puser)
        (prop_username ?v06 ?v07)
        (knows_property ?v06 pusername)
        (knows ?v08)
        (prop_domain ?v06 ?v08)
        (knows_property ?v06 pdomain)
        (prop_windows_domain ?v08 ?v09)
        (knows_property ?v08 pwindows_domain)
        (not (= ?v01 ?v02))
        (not (created ?v10))
    )
    :effect
    (when
        (mem_domain_user_admins ?v02 ?v06)
        (and
            (knows ?v10)
            (created ?v10)
            (knows_property ?v10 psrc_host)
            (prop_src_host ?v10 ?v01)
            (knows_property ?v10 pdest_host)
            (prop_dest_host ?v10 ?v02)
            (knows_property ?v10 pshare_name)
            (prop_share_name ?v10 c__dollar__)
            (knows_property ?v10 pshare_path)
            (prop_share_path ?v10 whatever)
        )
    )
)

; copies a file over a mounted network share
(:action smb_copy
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - string ?v03 - observedshare ?v04 - observedhost ?v05 - observedhost ?v06 - string ?v07 - observedfile)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (prop_host ?v00 ?v01)
        (knows_property ?v00 phost)
        (prop_executable ?v00 ?v02)
        (knows_property ?v00 pexecutable)
        (knows ?v03)
        (knows ?v04)
        (prop_src_host ?v03 ?v04)
        (knows_property ?v03 psrc_host)
        (knows ?v05)
        (prop_dest_host ?v03 ?v05)
        (knows_property ?v03 pdest_host)
        (prop_share_path ?v03 ?v06)
        (knows_property ?v03 pshare_path)
        (= ?v01 ?v04)
        (not (= ?v01 ?v05))
        (not (created ?v07))
    )
    :effect
    (when
        (prop_elevated ?v00 yes)
        (and
            (knows ?v07)
            (created ?v07)
            (knows_property ?v07 ppath)
            (prop_path ?v07 somepath)
            (knows_property ?v07 phost)
            (prop_host ?v07 ?v05)
        )
    )
)

; get the time on another computer
(:action net_time
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - observedtimedelta)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
    )
    :effect
    (and
        (knows ?v02)
        (knows_property ?v01 ptimedelta)
        (prop_host ?v02 ?v01)
        (knows_property ?v02 phost)
        (knows_property ?v02 pmicroseconds)
        (knows_property ?v02 pseconds)
    )
)

; run a process remotely with wmic
(:action wmic
    :parameters (?v00 - observedrat ?v01 - observedhost ?v02 - observedhost ?v03 - observedfile ?v04 - string ?v06 - observeddomaincredential ?v07 - observeddomainuser ?v08 - observeddomain ?v09 - string ?v10 - string ?v11 - observedrat)
    :precondition
    (and
        (knows ?v00)
        (knows ?v01)
        (prop_host ?v00 ?v01)
        (knows_property ?v00 phost)
        (knows ?v02)
        (knows_property ?v02 pdomain_user_admins)
        (knows ?v03)
        (prop_path ?v03 ?v04)
        (knows_property ?v03 ppath)
        (prop_host ?v03 ?v02)
        (knows_property ?v03 phost)
        (knows ?v06)
        (knows ?v07)
        (prop_user ?v06 ?v07)
        (knows_property ?v06 puser)
        (knows ?v08)
        (prop_domain ?v07 ?v08)
        (knows_property ?v07 pdomain)
        (prop_windows_domain ?v08 ?v09)
        (knows_property ?v08 pwindows_domain)
        (prop_password ?v06 ?v10)
        (knows_property ?v06 ppassword)
        (not (= ?v01 ?v02))
        (not (created ?v11))
    )
    :effect
    (when
        (mem_domain_user_admins ?v02 ?v07)
        (and
            (knows ?v11)
            (created ?v11)
            (knows_property ?v11 phost)
            (prop_host ?v11 ?v02)
            (knows_property ?v11 pelevated)
            (prop_elevated ?v11 yes)
            (knows_property ?v11 pexecutable)
            (prop_executable ?v11 ?v04)
        )
    )
)

)