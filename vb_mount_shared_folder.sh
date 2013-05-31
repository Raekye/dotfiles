#!/bin/bash
if [ "$1" = "-u" ]; then
	if [ "$#" -eq 1 ]; then
		read -p "Folder name to dismount: " FOLDER
	else
		FOLDER="$2"
	fi
	sudo umount "$HOME/host/$FOLDER"
	echo "Dismounted $FOLDER"
else
	if [ "$#" -eq 0 ]; then
		read -p "Folder name to mount: " FOLDER
	else
		FOLDER=$1
	fi
	mkdir -p "$HOME/host/$FOLDER"
	sudo mount -t vboxsf -o uid=1000,gid=1000 "$FOLDER" "$HOME/host/$FOLDER"
	echo "Mounted $FOLDER"
fi
read -s -n 1 -p "Press anything to continue... "
echo
