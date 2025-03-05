#!/bin/bash
#SBATCH --job-name=read2snp
#SBATCH --output=/home/barrientosm/scratch/read2snp/log_%j_%x_out.txt
#SBATCH --error=/home/barrientosm/scratch/read2snp/log_%j_%x_err.txt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=9G
#SBATCH --time=50:00:00
#SBATCH --partition=agap_long

#Run read2snp to extract SNPs
module load bioinfo-cirad
module load reads2snp/2.0-bin

BAM_LIST_PATH=/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/BAM_cleaned/speltoides/Bams_no_soft_clipped_reads
Ref_path=/home/barrientosm/scratch/GeCKO/Refs

reads2snp_2.0.64.bin -bamlist $BAM_LIST_PATH/bam_list.txt \
    -bamref $Ref_path/speltoides_transcriptome_YANG_2023.fasta \
    -th2 0.05 \
    -nbth 4 \
    -fis 0.3 \
    -pre 0.000001 \
    -rlg 50 \
    -bqt 20 \
    -rqt 30 \
    -out read2snp_output echo "SNP extraction completed."

#    Parameter	Description	Value
# -min	Minimum number of reads to call a genotype 	10
# -th1	Genotype posterior probability threshold 	0.95
# -par	Paraclean filter mode (detect and filter out SNPs that are likely to originate from paralogous sequences rather than true polymorphisms)	1 (Stringent)
# -th2	p-value threshold for Paraclean likelihood ratio test	0.05
# -nbth	Number of threads to use	4
# -fis	Assumed inbreeding coefficient	0
# -pre	optimization precision for Paraclean	0.000001
# -opt	Optimizer used in Paraclean 	newton
# -rlg	Minimum read length to consider	50
# -bqt	Minimum base quality threshold 	20
# -rqt	Minimum read mapping quality	30
