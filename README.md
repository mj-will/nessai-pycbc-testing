# nessai-pycbc-testing

Developing and testing integration of nessai in pycbc inference.

## Installation

The base environment can be create using conda

```
conda env create -f base_env.yaml
```

This sets a minimum version for nessai that includes new features needed to support pycbc.

You then need to install a specific version of pycbc:

- pycbc: [branch on fork](https://github.com/mj-will/pycbc/tree/add-nessai-sampler)


Note this branch is subject to change.

## Running tests

The tests can be run using the Makefile in the root directory, e.g.

```
make simple-test
```

## Simple test

Based on the examples included in pycbc inference: https://github.com/gwastro/pycbc/tree/master/examples/inference/samplers

**Note:** nessai cannot be used to sample 1-dimensional problems, so the test is 2-dimensional.

## Multiprocessing test

Test multiprocessing with nessai using the pool defined in pycbc.

`multiprocessing-test` just uses the default pool from pycbc.

`multiprocessing-test-mpi` uses MPI instead of the default pool.

## Resume test

Test that it's possible to resume the sampler. This test forces the sampler to finish before reaching the stopping criterion and then resumes it.

## BBH injection tests

### Test with GW150914-like config from pycbc

This test is based on the example BBH injection from pycbc: https://github.com/gwastro/pycbc/tree/master/examples/inference/bbh-injection

**Note:** with 8 processes this took 3-4 hours to complete.

### Test with OGC-like config

The test uses the same data as the above test but a different config, this includes sampling chirp mass and mass ratio rather than component masses.
