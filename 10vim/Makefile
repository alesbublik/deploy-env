.PHONY: 10vim

init-10vim: venv ;

cleanup-10vim: ;

deploy-10vim:
	venv/bin/ansible-playbook 10vim/playbook.yml -i inventory.ini
