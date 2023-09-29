OMP_NUM_THREADS=1 pycbc_inference \
--config-file marg_pol.ini \
--nprocesses 4 \
--processing-scheme mkl \
--output-file marg_pol.hdf \
--seed 0 \
--force \
--verbose