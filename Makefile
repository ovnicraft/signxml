env: setup.py
	virtualenv env
	env/bin/pip install .
	env/bin/pip list --outdated

lint:
	./setup.py flake8

test: env lint
	env/bin/python test/test.py -v

test3: env
	python3 ./test/test.py -v

init_docs:
	cd docs; sphinx-quickstart

docs:
	$(MAKE) -C docs html

install:
	./setup.py install

.PHONY: test release docs lint

include common.mk
