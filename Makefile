
.PHONY: quick-tests
quick-tests : simple-test multiprocessing-test multiprocessing-test-mpi resume-test

.PHONY: simple-test
simple-test : 
	mkdir -p simple_test/outdir
	cd simple_test; pycbc_inference --config-files simp.ini nessai_stub.ini \
	--output-file outdir/nessai.hdf --seed 10 --nprocesses 1 --verbose --force

.PHONY: multiprocessing-test
multiprocessing-test : 
	mkdir -p multiprocessing_test/outdir
	cd multiprocessing_test; pycbc_inference --config-files mp_test.ini \
	--output-file outdir/multprocessing_test.hdf --seed 10 --nprocesses 4 --verbose --force

.PHONY: multiprocessing-test-mpi
multiprocessing-test-mpi : 
	mkdir -p multiprocessing_test/outdir_mpi
	cd multiprocessing_test; pycbc_inference --config-files mp_test.ini \
	--output-file outdir_mpi/multprocessing_test.hdf --seed 10 --nprocesses 4 --use-mpi --verbose --force

.PHONY: resume-test
resume-test : 
	rm -r resume_test/outdir
	mkdir -p resume_test/outdir
	cd resume_test; bash run_test.sh

bbh_injection/injection.hdf :
	cd bbh_injection/; bash make_injection.sh

.PHONY: bbh-injection
bbh-injection : bbh_injection/injection.hdf
	mkdir -p bbh_injection/outdir
	cd bbh_injection; bash run_test.sh

.PHONY: bbh-injection-ogc
bbh-injection-ogc : bbh_injection/injection.hdf
	mkdir -p bbh_injection/outdir_ogc
	cd bbh_injection; bash run_test_ogc.sh


.PHONY: clean-simple-test clean-multiprocessing-test clean-bbh-injection

clean-simple-test :
	rm -rf simple_test/outdir

clean-multiprocessing-test:
	rm -rf multiprocessing_test/outdir

clean-bbh-injection:
	rm -rf bbh_injection/outdir
