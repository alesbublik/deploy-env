#!/usr/bin/env bash

IFS=$'\n'       # make newlines the only separator
for line in $(cat $1); do
	IFS=$' '
	strparams=($line)
	./venv/bin/cookiecutter --no-input --overwrite-if-exists ${strparams[0]} ${strparams[1]}
done
