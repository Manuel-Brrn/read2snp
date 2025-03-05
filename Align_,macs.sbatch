#!/bin/bash
#SBATCH --job-name=align_macse             # Job name for Slurm
#SBATCH --output=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_out.txt   # Log file for standard output (job ID and name included)
#SBATCH --error=/home/barrientosm/scratch/CDS_sequences/log_%j_%x_err.txt    # Log file for standard error (job ID and name included)
#SBATCH --nodes=1                            # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=6G                             # Memory allocation per job
#SBATCH --time=1:00:00                       # Time limit for the job
#SBATCH --partition=agap_normal                # Specify the job queue/partition


# AlignTwoProfiles_wrapper_macse_v1_2.pl (galaxy wrapper from popphyl, modified in the macse path to run the v.1.2)

# It runs a macse instance for each pair of reciprocal best blast hits

perl path/to/AlignTwoProfiles_wrapper_macse_v1_2.pl -p1 $ORF_alignment_1 -p2 $ORF_alignment_2 -rbh RBH_corrected.tab

#This script is a wrapper for MACSE (Multiple Alignment of Coding Sequences Accounting for Frameshifts and Stop Codons) and is used to align two sets of protein-coding sequences (CDS) based on reciprocal best BLAST hits (RBH).
#Parameters:

   # -p1:
#    Specifies the first input file containing the ORF (Open Reading Frame) alignment in FASTA format.
#    Example: $ORF_alignment_1 (a variable pointing to the first ORF alignment file).

 #   -p2:
 #   Specifies the second input file containing the ORF alignment in FASTA format.
#    Example: $ORF_alignment_2 (a variable pointing to the second ORF alignment file).

#    -rbh:
#    Specifies the file containing the reciprocal best BLAST hits (RBH) in tabular format.
 #   Example: RBH_corrected.tab (a file containing pairs of sequences that are reciprocal best hits).

#Purpose:

 #   The script runs MACSE for each pair of sequences identified as reciprocal best BLAST hits. It aligns the coding sequences while accounting for potential frameshifts and stop codons.
