#!/bin/sh

# sampler parameters
PRIOR_CONFIG=gw150914_like.ini
DATA_CONFIG=data.ini
SAMPLER_CONFIG=nessai-test.ini
OUTPUT_PATH=outdir/inference.hdf

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
    --config-file ${PRIOR_CONFIG} ${DATA_CONFIG} ${SAMPLER_CONFIG} \
    --output-file ${OUTPUT_PATH} \
    --nprocesses ${NPROCS} \
    --force
