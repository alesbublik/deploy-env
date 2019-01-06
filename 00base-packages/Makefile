.PHONY: 00base-packages

init-00base-packages: venv ;

cleanup-00base-packages: ;

deploy-00base-packages:
	venv/bin/ansible-playbook 00base-packages/playbook.yml -i inventory.ini
