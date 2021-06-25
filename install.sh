#! /usr/bin/bash

if uname -a | grep 'Ubuntu'
then
	sudo apt install build-essential
else
	sudo yum groupinstall 'Development Tools'
fi

make
