#!/bin/bash
#SBATCH --job-name=dNdSpiNpiS             # Job name for Slurm
#SBATCH --output=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_out.txt   # Log file for standard output (job ID and name included)
#SBATCH --error=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_err.txt    # Log file for standard error (job ID and name included)
#SBATCH --nodes=1                            # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=6G                             # Memory allocation per job
#SBATCH --time=1:00:00                       # Time limit for the job
#SBATCH --partition=agap_normal                # Specify the job queue/partition


# dNdSpiNpiS (version 1.0 from popphyl webpage)
# for n>5 set gapN_site=10

path/to/dNdSpiNpiS_1.0 -alignment_file=RBH_corrected.tab.fusion_DNA.fasta \
                       -ingroup="$sp_1" \ 
                       -outgroup="$sp_2" \ 
                       -gc_bin=8 \
                       -gapN_site=10 \
                       -kappa=1 \
                       -compute_distances=yes \
                       -print_header=yes  \
                       -contig_usage=all  \
                       -out=dNdSpiNpiS_output >> dNdSpiNpiS.log


#dNdSpiNpiS_1.0 Command

# This tool calculates evolutionary metrics dN/dS (ratio of non-synonymous to synonymous substitutions), piN/piS (ratio of non-synonymous to synonymous polymorphism).
#Parameters:

#    -alignment_file:
#    Specifies the input alignment file in FASTA format.
#    Example: RBH_corrected.tab.fusion_DNA.fasta (a file containing the fused DNA sequences from the RBH results).

  #  -ingroup:
#    Specifies the ingroup species or population.
 #   Example: "$sp_1" (a variable pointing to the name or identifier of the ingroup species).

 #   -outgroup:
 #   Specifies the outgroup species or population.
 #   Example: "$sp_2" (a variable pointing to the name or identifier of the outgroup species).

  #  -gc_bin:
 #   Specifies the number of bins for GC content classification.
  #  Example: 8 (GC content is divided into 8 bins for analysis).

 #   -gapN_site:
 #   Specifies the threshold for the number of gaps allowed in a site (column) for it to be included in the analysis.
 #   Example: 10 (sites with more than 10 gaps are excluded).

 #   -kappa:
  #  Specifies the transition/transversion ratio (κ).
#    Example: 1 (assumes equal rates for transitions and transversions).

 #   -compute_distances:
 #   Specifies whether to compute genetic distances between sequences.
 #   Example: yes (enables distance computation).

#   -print_header:
 #   Specifies whether to print a header in the output file.
  #  Example: yes (enables header printing).

#    -contig_usage:
 #   Specifies how contigs are used in the analysis.
#    Example: all (all contigs are used).

  #  -out:
 #   Specifies the output file name for the results.
#    Example: dNdSpiNpiS_output (the file where results will be saved).

 #   >> dNdSpiNpiS.log:
  #  Redirects the standard output (log messages) to a log file named dNdSpiS.log.

#Purpose:

   # This tool calculates evolutionary metrics (dN/dS, piN/piS) and genetic distances between sequences, using an ingroup and outgroup for comparative analysis. It also accounts for GC content and gap thresholds.
