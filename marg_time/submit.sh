#!/bin/bash

#SBATCH --job-name=nessai-pycbc-marg-time

#SBATCH --ntasks=1
#SBATCH --mem=2G
#SBATCH --cpus-per-task=2

#SBATCH --output=logs/marg-time-test-%j.out
#SBATCH --error=logs/marg-time-test-%j.err

#SBATCH -p sciama2.q

module load system/intel64
module load intel_comp/2019.2
module load openmpi/4.1.4
module load anaconda3

export OMP_NUM_THREADS=1
export OMPI_MCA_mtl=^psm 

source activate nessai-pycbc
bash run.sh