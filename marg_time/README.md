# Example with time marginalization

This example is based on the [time marginalization example in the docs](https://pycbc.org/pycbc/latest/html/inference/examples/margtime.html).

Running this example with nessai requires disabling the built-in check for single-valued likelihood functions. Without this, nessai will not run. To do so, set `allow_multi_valued_likelihood = True`.

With these settings, the run takes ~3 minutes.
