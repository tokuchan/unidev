#!/bin/bash
cwd=$(pwd -P)
cd ~/dev/unidev
if [ $(git status --porcelain | wc -l) == 0 ]
then
	git pull
	make install
fi
make cwd="${cwd}"
