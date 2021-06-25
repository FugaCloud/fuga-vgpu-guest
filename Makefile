SHELL := /usr/bin/env bash

all: build/venv/ grid

build/venv/:
	sudo apt-get update
	sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q python3-venv
	python3 -m venv --system-site-packages $@
	$@bin/python3 -m pip install --upgrade pip
	$@bin/python3 -m pip install "ansible>=2.11"

grid:
	source ./build/venv/bin/activate && \
	ansible-playbook -i localhost, grid.yaml
