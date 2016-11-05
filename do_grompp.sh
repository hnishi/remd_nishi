#!/bin/bash

#for dir in no{1..64}; do cd $dir; grompp -f MD.mdp -c in.gro -p ../prm.top -o md; cd ..; done
#for dir in no{1..64}; do cd $dir; grompp -f MD.mdp -c in.gro -t in.cpt -p ../prm.top -o md; cd ..; done
#for dir in no{0..127}; do cd $dir; grompp -f MD.mdp -c in.gro -p ../prm.top -o md; cd ..; done
for dir in no{0..127}; do cd $dir; grompp -f MD.mdp -c in.gro -t in.cpt -p ../prm.top -o md; cd ..; done

#-t in.cpt #restart
