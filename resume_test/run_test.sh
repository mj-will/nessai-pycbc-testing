#!/usr/bin/env bash
timeout 20 pycbc_inference --config-files resume_test.ini \
	--output-file outdir/resume_test.hdf --seed 10 --nprocesses 1 --verbose
echo Attempting to resume run
pycbc_inference --config-files resume_test.ini --force \
	--output-file outdir/resume_test.hdf --seed 10 --nprocesses 1 --verbose