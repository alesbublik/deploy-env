export PYTHONPATH=${PWD}

MKFILES = $(wildcard */Makefile)
SORTED = $(shell echo $(MKFILES) | xargs -n 1 | sort -g | xargs)

bootstrap: venv
	./bootstrap.sh cookiecutters.txt

venv:
	python -m venv venv --clear
	venv/bin/pip install -U pip
	venv/bin/pip install -r requirements.txt

init: venv
	@for MK in ${SORTED}; do make --no-print-directory -f $$MK init-$$(dirname $$MK); done

cleanup:
	@for MK in ${SORTED}; do make --no-print-directory -f $$MK cleanup-$$(dirname $$MK); done

deploy: venv
	venv/bin/ansible-playbook playbook.yml -i inventory.ini
	@set -e; \
	for MK in ${SORTED}; do make --no-print-directory -f $$MK deploy-$$(dirname $$MK); done

# Should exist at least one
include */Makefile
