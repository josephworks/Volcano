#!/usr/bin/env bash

(
set -e
basedir="$(cd "$1" && pwd -P)"
gitcmd="git -c commit.gpgsign=false"

($gitcmd submodule update --init && cd Paper && ./paper p && cd .. && ./volcano p && ./volcano b) || (
    echo "Failed to build Volcano"
    exit 1
) || exit 1
if [ "$2" == "--jar" ]; then
	mvn clean install
fi
) || exit 1