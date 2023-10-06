"""Test resuming nessai from the pycbc inference checkpoint files"""
import os

import numpy as np
import pycbc
from pycbc.inference.sampler import NessaiSampler
from pycbc.inference import models
from pycbc.workflow import configuration

pycbc.init_logging(True)

try:
    os.remove("resume_test.hdf.bkup")
except FileNotFoundError:
    pass
try:
    os.remove("resume_test.hdf.checkpoint")
except FileNotFoundError:
    pass


cp = configuration.WorkflowConfigParser(configFiles=["resume_test.ini"])

model = models.read_from_config(cp)

sampler = NessaiSampler.from_config(
    cp, model=model, output_file="resume_test.hdf"
)

# Force the sampler to stop after 2000 iterations
sampler.run(max_iteration=2000, resume=False, plot=False)
sampler.checkpoint()

del sampler

print("Resuming sampler")

sampler = NessaiSampler.from_config(
    cp, model=model, output_file="resume_test.hdf"
)
# Overwrite the value of max_iteration to allow sampling to continue
# This is a hack as currently nessai does not support updating keyword
# arguments after resuming.
sampler.resume_data.max_iteration = np.inf
# Run
sampler.run(resume=True, plot=False)

print("Finished")