#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo 'No input.'
	exit 1
fi

for d in "$@"; do
	find "$d" -type f -exec md5sum -b {} \; | sort | sha256sum
done
