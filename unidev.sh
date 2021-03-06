#!/bin/bash
usage() { echo "Usage: $) [-p <profile>]" 1>&2; exit 1; }

cwd=$(pwd -P)
profile=${UNIDEV__DEFAULT_PROFILE:-default}

while getopts "hp:" o; do
	case "${o}" in
		p)
			profile="${OPTARG}";;
		h)
			usage;;
		*)
			usage;;
	esac
done
shift "$((OPTIND-1))"

echo PROFILE: ${profile}

cd ~/dev/unidev
if [ $(git status --porcelain | wc -l) == 0 ]
then
	git pull --commit --no-edit
fi
make install
make cwd="${cwd}" profile="${profile}"
