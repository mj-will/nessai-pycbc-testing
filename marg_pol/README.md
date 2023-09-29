# Example using polarization marginalization.

This example is based on the [time marginalization example in the docs](https://pycbc.org/pycbc/latest/html/inference/examples/margtime.html) and the settings used for [4-OGC](https://github.com/gwastro/4-ogc/tree/master/inference_configuration).

## 

**Note:** This example currently fails with the following error:

```
Traceback (most recent call last):
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 502, in _trytoget
    return getattr(self._current_stats, statname)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'ModelStats' object has no attribute 'loglikelihood'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 502, in _trytoget
    return getattr(self._current_stats, statname)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'ModelStats' object has no attribute 'loglr'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/lib/python3.11/site-packages/dynesty/dynesty.py", line 910, in __call__
    return self.func(np.asarray(x).copy(), *self.args, **self.kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/base_cube.py", line 34, in call_global_loglikelihood
    return models._global_instance.log_likelihood(cube)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/base_cube.py", line 80, in log_likelihood
    return getattr(self.model, self.loglikelihood_function)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 521, in loglikelihood
    return self._trytoget('loglikelihood', self._loglikelihood,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 509, in _trytoget
    val = fallback(**kwargs)
          ^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/gaussian_noise.py", line 419, in _loglikelihood
    return self.loglr + self.lognl
           ^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base_data.py", line 116, in loglr
    return self._trytoget('loglr', self._loglr, apply_transforms=True)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 509, in _trytoget
    val = fallback(**kwargs)
          ^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/marginalized_gaussian_noise.py", line 496, in _loglr
    lr, idx, maxl = self.marginalize_loglr(sh_total, hh_total,
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/tools.py", line 274, in marginalize_loglr
    return marginalize_likelihood(sh_total, hh_total,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/tools.py", line 936, in marginalize_likelihood
    maxl = vloglr[maxv]
           ~~~~~~^^^^^^
IndexError: invalid index to scalar variable.
Traceback (most recent call last):
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 502, in _trytoget
    return getattr(self._current_stats, statname)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'ModelStats' object has no attribute 'loglikelihood'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 502, in _trytoget
    return getattr(self._current_stats, statname)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'ModelStats' object has no attribute 'loglr'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/bin/pycbc_inference", line 137, in <module>
    sampler = inference.sampler.load_from_config(
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/__init__.py", line 102, in load_from_config
    return samplers[name].from_config(cp, model, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/dynesty.py", line 341, in from_config
    obj = cls(model, nlive=nlive, nprocesses=nprocesses,
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/dynesty.py", line 151, in __init__
    self._sampler = dynesty.NestedSampler(log_likelihood_call,
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/lib/python3.11/site-packages/dynesty/dynesty.py", line 677, in __new__
    live_points, logvol_init, init_ncalls = _initialize_live_points(
                                            ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/lib/python3.11/site-packages/dynesty/dynamicsampler.py", line 432, in _initialize_live_points
    cur_live_logl = loglikelihood.map(np.asarray(cur_live_v))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/lib/python3.11/site-packages/dynesty/utils.py", line 177, in map
    for _ in self.pool.map(self.loglikelihood, pars)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/pool.py", line 122, in map
    return [f(a) for a in items]
           ^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/pool.py", line 122, in <listcomp>
    return [f(a) for a in items]
            ^^^^
  File "/mnt/lustre/shared_conda/envs/mjwill/nessai-pycbc/lib/python3.11/site-packages/dynesty/dynesty.py", line 910, in __call__
    return self.func(np.asarray(x).copy(), *self.args, **self.kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/base_cube.py", line 34, in call_global_loglikelihood
    return models._global_instance.log_likelihood(cube)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/sampler/base_cube.py", line 80, in log_likelihood
    return getattr(self.model, self.loglikelihood_function)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 521, in loglikelihood
    return self._trytoget('loglikelihood', self._loglikelihood,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 509, in _trytoget
    val = fallback(**kwargs)
          ^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/gaussian_noise.py", line 419, in _loglikelihood
    return self.loglr + self.lognl
           ^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base_data.py", line 116, in loglr
    return self._trytoget('loglr', self._loglr, apply_transforms=True)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/base.py", line 509, in _trytoget
    val = fallback(**kwargs)
          ^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/marginalized_gaussian_noise.py", line 496, in _loglr
    lr, idx, maxl = self.marginalize_loglr(sh_total, hh_total,
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/tools.py", line 274, in marginalize_loglr
    return marginalize_likelihood(sh_total, hh_total,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/users/mjwill/git_repos/pycbc/pycbc/inference/models/tools.py", line 936, in marginalize_likelihood
    maxl = vloglr[maxv]
           ~~~~~~^^^^^^
IndexError: invalid index to scalar variable.
```