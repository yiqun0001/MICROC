#!/bin/bash
#SBATCH --job-name=my_job
#SBATCH --out="slurm-%j.out"
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00
#SBATCH --mem=100G
#SBATCH --mail-type=ALL

image=/home/yj286/project/MICROC/yq2.sif
name=S2
dir=/home/yj286/project/CUTRUN/RQ36305/$name
src_dir=/home/yj286/docker/src/
R1=`readlink -f $dir/Unaligned/*_R1_001.fastq.gz`
R2=`readlink -f $dir/Unaligned/*_R2_001.fastq.gz`

apptainer exec $image samtools faidx ./src/mm10.fa
apptainer exec $image bwa index ./src/mm10.fa
apptainer exec $image cut -f1,2 ./src/mm10.fa.fai > mm10.genome
