.PHONY: vim

init-vim: venv ;

cleanup-vim: ;

deploy-vim:
	venv/bin/ansible-playbook vim/playbook.yml -i inventory.ini
