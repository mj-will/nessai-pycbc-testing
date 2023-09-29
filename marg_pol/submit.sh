#!/bin/bash

#SBATCH --job-name=pycbc-marg-pol

#SBATCH --nodes=1
#SBATCH --mem=2G
#SBATCH --cpus-per-task=16

#SBATCH --output=logs/marg-pol-%j.out
#SBATCH --error=logs/marg-pol-%j.err

#SBATCH -p sciama2.q

module purge
module load system anaconda3

source activate nessai-pycbc
bash run.sh