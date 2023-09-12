#!/bin/sh

# sampler parameters
DATA_CONFIG=data.ini
INFERENCE_CONFIG=bbh_ogc_config.ini
OUTPUT_PATH=outdir_ogc/inference.hdf

# the following sets the number of cores to use; adjust as needed to
# your computer's capabilities
NPROCS=8

# run sampler
# Running with OMP_NUM_THREADS=1 stops lalsimulation
# from spawning multiple jobs that would otherwise be used
# by pycbc_inference and cause a reduced runtime.
export OMP_NUM_THREADS=1
pycbc_inference --verbose \
    --seed 12 \
    --config-file ${INFERENCE_CONFIG} ${DATA_CONFIG}\
    --output-file ${OUTPUT_PATH} \
    --nprocesses ${NPROCS} \
    --force
