.PHONY: 11zsh

init-11zsh: venv ;

cleanup-11zsh: ;

deploy-11zsh:
	venv/bin/ansible-playbook 11zsh/playbook.yml -i inventory.ini
