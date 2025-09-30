#!/bin/bash
#SBATCH --job-name=my_job
#SBATCH --out="slurm-%j.out"
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00
#SBATCH --mem=100G
#SBATCH --mail-type=ALL

image=/home/yj286/project/MICROC/yq2.sif
name=S2

apptainer exec $image 
