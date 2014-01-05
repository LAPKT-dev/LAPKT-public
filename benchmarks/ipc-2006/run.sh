#!/bin/bash


#########################
# Usage:
#    ./profile.sh
#    ./profile.sh <domain-name> <domain pddl> <problem pddl>
#
# Prerequisites:
#   - valgrind
#   - timeout
#   - dot (graphviz)
#
# For the best results, compile with the following:
#   scons -Q debug=1
#


# Set the target planner
planner="$HOME/Projects/lwaptk-ICAPS-2014/examples/agnostic-examples/siw/siw"
planner="$HOME/Projects/lwaptk-ICAPS-2014/examples/agnostic-examples/bfs_f/bfs"

# Set the time limit (in seconds)
timelimit=120


profile_domain() {

    echo
    echo Profiling $1 ...
        
    timeout $timelimit valgrind --tool=callgrind $planner --domain $2 --problem $3 > $1.out 2>&1
    
    callfile=`ls callgrind.out.*`
    python gprof2dot.py -f callgrind $callfile 2> /dev/null | dot -Tpng -o $1.png > /dev/null 2>&1
    rm $callfile
    
}


if [ -z "$1" ]
then
    # Do everything
    profile_domain openstacks openstacks/domain.pddl openstacks/problems/p15.pddl #p30.pddl
    profile_domain pathways pathways/domain_p15.pddl pathways/p15.pddl #p30.pddl
    profile_domain pipesworld pipesworld/domain.pddl pipesworld/problems/p13.pddl #p50.pddl
    profile_domain rovers rovers/domain.pddl rovers/problems/p20.pddl #p40.pddl
    profile_domain storage storage/domain.pddl storage/problems/p20.pddl #p30.pddl
    profile_domain TPP TPP/domain.pddl TPP/problems/p15.pddl #p30.pddl
    profile_domain trucks trucks/domain.pddl trucks/problems/p07.pddl #p30.pddl
else
    profile_domain $1 $2 $3
fi

echo

