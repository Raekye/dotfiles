#!/usr/bin/env bash

if test -z "$1"; then
	echo 'No input.'
	exit 1
fi

for d in "$@"; do
	find "$d" -type f -exec md5sum --binary {} ';' | sort | sha256sum
done
