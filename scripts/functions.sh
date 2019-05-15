#!/usr/bin/env bash

color() {
    if [ $2 ]; then
            echo -e "\e[$1;$2m"
    else
            echo -e "\e[$1m"
    fi
}

colorend() {
    echo -e "\e[m"
}

volcanostash() {
    STASHED=$(git stash  2>/dev/null|| return 0) # errors are ok
}

volcanounstash() {
    if [[ "$STASHED" != "No local changes to save" ]] ; then
        git stash pop 2>/dev/null|| return 0 # errors are ok
    fi
}
