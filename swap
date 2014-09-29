#!/bin/bash
set -e
if [ "$1" == "-r" ]; then
	REMOVE=1
	shift
fi
if [ -z "$1" ]; then
	SIZE="1G"
else
	SIZE="$1"
fi
SWAP="/mnt/$SIZE.swap"
if [ -z $REMOVE ]; then
	echo "Making swap $SWAP..."
	sudo fallocate -l "$SIZE" "$SWAP"
	sudo chmod 600 "$SWAP"
	sudo mkswap "$SWAP"
	sudo swapon "$SWAP"
	echo "Done."
else
	echo "Removing swap $SWAP..."
	sudo swapoff "$SWAP"
	sudo rm "$SWAP"
	echo "Done."
fi
