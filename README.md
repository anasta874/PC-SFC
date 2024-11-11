## Repository Structure
- **Gromacs/**: Contains PDB files from molecular dynamics simulations after 200 ns of relaxation, a `.sh` script (e.g., for P720Q) with commands to run Gromacs, and the configuration files used for the analysis.
- **Phylogeny/**: Includes files related to phylogenetic analysis, such as tree files (`.treefile`) and visualizations.
- **ProLif_Interactions_analysis/**:
  - **.pkl/**: Stores `.pkl` files representing data frames with interaction data for the proteins.
  - **.png/**: Contains heatmap images showing interactions for regions of interest.
  - **ProLif.ipynb**: Jupyter Notebook for analyzing protein-ligand interactions using ProLIF.
  - **DUB_interactions_df_CSV**: Contains `.csv`data frames that include all interactions for all DUB regions against the rest of the protein.
  - **DUB_N_F_interactions_df.ipynb**: Code for processing `.pkl` data and generating all relevant data frames.
- **Protein-protein_docking/**: Files related to docking analysis, including interaction lists and a PyMOL script.
- **XVG_MD_Trajectory_Visualization/**: Jupyter Notebook for visualizing molecular dynamics trajectories.


