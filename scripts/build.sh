#!/usr/bin/env bash

(
set -e
basedir="$(cd "$1" && pwd -P)/Paper"
gitcmd="git -c commit.gpgsign=false"

(${gitcmd} submodule update --recursive --init && ./scripts/remap.sh "$basedir" && ./scripts/decompile.sh "$basedir" && ./scripts/init.sh "$basedir" && ./scripts/applyPatches.sh "$basedir") || (
    echo "Failed to build Volcano"
    exit 1
) || exit 1
mvn clean install
) || exit 1
