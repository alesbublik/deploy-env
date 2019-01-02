.PHONY: base-packages

init-base-packages: venv ;

cleanup-base-packages: ;

deploy-base-packages:
	venv/bin/ansible-playbook base-packages/playbook.yml -i inventory.ini
