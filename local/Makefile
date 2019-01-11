.PHONY: local

init-local: ;
	cd local && vagrant up

cleanup-local: ;
	cd local && vagrant halt

deploy-local:
	venv/bin/ansible-playbook local/playbook.yml -i inventory.ini
