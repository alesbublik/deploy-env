.PHONY: 01vim

init-01vim: venv ;

cleanup-01vim: ;

deploy-01vim:
	venv/bin/ansible-playbook 01vim/playbook.yml -i inventory.ini
