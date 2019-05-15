#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
. $(dirname $SOURCE)/init.sh

workdir=$basedir/Paper/work
minecraftversion=$(cat $basedir/Paper/work/BuildData/info.json | grep minecraftVersion | cut -d '"' -f 4)
decompiledir=$workdir/Minecraft/$minecraftversion
cd $basedir
	target="$basedir/Paper/Paper-Server/src/main/java/$nms/$file"
	base="$decompiledir/$nms/$file"
		cp "$base" "$target"
		echo "UN-NEEDED IMPORT STATEMENT: $file"
	lastlog=$(git log -1 --oneline)
	if [[ "$lastlog" = *"V-Extra mc-dev Imports"* ]]; then
		git reset --hard HEAD^
	rm -rf nms-patches
	git add src -A
	echo -e "V-Extra mc-dev Imports\n\n$MODLOG" | git commit src -F -