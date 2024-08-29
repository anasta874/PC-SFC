#!/bin/bash

echo_stage() {
    echo -e "\e[1;33m------------------------------------------------"
    echo -e "\e[1;32m Stage: $1"
    echo -e "\e[1;33m------------------------------------------------\e[0m"
}

# Stage 1:
echo_stage "PDB to GRO Conversion"
gmx pdb2gmx -f P720Q.pdb -o P720Q_proc.gro -water spc

# Stage 2:
echo_stage "Box Creation"
gmx editconf -f P720Q_proc.gro -o P720Q_box.gro -c -d 1.0 -bt cubic

# Stage 3:
echo_stage "Solvation"
gmx solvate -cp P720Q_box.gro -cs spc216.gro -o P720Q_solv.gro -p topol.top

# Stage 4:
echo_stage "Ion Preparation"
gmx grompp -f ions.mdp -c P720Q_solv.gro -p topol.top -o ions.tpr
gmx genion -s ions.tpr -o P720Q_solv_ions.gro -p topol.top -pname NA -nname CL -neutral

# Stage 5:
echo_stage "Energy Minimization"
gmx grompp -f minim.mdp -c P720Q_solv_ions.gro -p topol.top -o em.tpr
gmx mdrun -v -deffnm em -nt 32
#gmx energy -f em.edr -o potential.xvg

# Stage 6:
echo_stage "NVT Equilibration"
gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr
gmx mdrun -deffnm nvt -v -nt 32

# Stage 7:
echo_stage "NPT Equilibration"
gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr
gmx mdrun -v -deffnm npt -nt 32

# Stage 8:
echo_stage "Molecular Dynamics"
gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_0_1.tpr
gmx mdrun -v -deffnm md_P720Q -nt 32
