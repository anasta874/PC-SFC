## Overview

This repository contains scripts and output files for the structural and functional comparative analysis of the wild-type protein and its disease-associated mutant forms.

## Phylogenetic Analysis

A BLAST search was performed using the protein sequence as the query in the NCBI database. Sequence alignment was carried out with the MAFFT algorithm, and phylogenetic trees were constructed using the IQ-TREE software with 1000 bootstrap iterations. The resulting tree was used to identify a clade of orthologs for conservation analysis. Visualization and annotation of the tree were done with the iTOL web tool. Clades with an average branch length >0.05 were collapsed, and aligned sequences were mapped to the tree by matching names and RefSeq numbers.

## Protein Structure Modeling

Molecular modeling of the protein was conducted to create a structurally validated model for further molecular dynamics simulations. The full-length AlphaFold model covering residues 1-1118 served as the template. The model was refined to include residues 402-1118, which encompasses the catalytic domain and regions potentially involved in regulatory functions. Alignment was performed with the Prime Maestro 13.4 software, incorporating a Zinc ion to maintain structural integrity. The model achieved an Alignment Score of 0.051 and an RMSD of 1.123 Å, confirming its suitability for dynamic simulations.

## Molecular Dynamics Simulations

The AF-model underwent energy minimization and relaxation using GROMACS 2023.3 for 200 ns to ensure structural stabilization. The simulation applied the steepest descent algorithm with 50,000 steps, using SPC water and the AMBER99SB-ILDN force field. The NVT ensemble was maintained at 300 K with the V-rescale thermostat, and the NPT ensemble used the Parrinello-Rahman barostat for pressure control. The final productive phase lasted 200 ns in physiological saline (0.15M NaCl). This simulation's final frame was used as a template to study mutant forms. Mutations were introduced using Maestro Schrödinger 13.4, and molecular dynamics trajectories were analyzed using ProLIF and MDAnalysis. Interaction analysis focused on the mutation region (718–721, 739) and the WW-like domain (645–684).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/anasta874/Structure-function_analysis_of_mutant_proteins/blob/main/XVG_MD_Trajectory_Visualization/Figure3.png" alt="Molecular Dynamics Visualization" width="400" />


## Protein-Protein Docking

Protein-protein docking studies investigated interactions between wild-type and mutants with the 14-3-3β protein (PDB-ID 2BQ0). The ClusPro server was used for docking analysis, with models selected based on binding energy and geometric stability. Visualization and evaluation of interaction interfaces were performed using PyMOL.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/anasta874/Structure-function_analysis_of_mutant_proteins/blob/main/Protein-protein_docking/docking.png" alt="Docking Visualization" width="400" />

## Repository Structure
- **Gromacs/**: Contains PDB files from molecular dynamics simulations after 200 ns of relaxation, a .sh script (e.g., for P720Q) with commands to run Gromacs, and the configuration files (`md.mdp`, `npt.mdp`, `nvt.mdp`) used for the analysis.
- **Phylogeny/**: Includes files related to phylogenetic analysis, such as tree files (`.treefile`) and visualizations (`.png`, `.tif`).
- **ProLif_Interactions_analysis/**:
  - **Data_Frames_pkl/**: Stores `.pkl` files representing interaction data for the proteins being compared.
  - **Interactions_maps_png/**: Contains heatmap images showing interaction regions for various mutations.
  - **ProLif.ipynb**: Jupyter Notebook for analyzing protein-ligand interactions using ProLIF.
- **Protein-protein_docking/**: Files related to docking analysis, including interaction lists and a PyMOL script.
- **XVG_MD_Trajectory_Visualization/**: Jupyter Notebook and scripts for visualizing molecular dynamics trajectories.

