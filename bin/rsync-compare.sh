#!/usr/bin/env bash

set -e

exec rsync \
	--dry-run \
	--itemize-changes \
	--recursive \
	--checksum \
	--delete \
	"$@"
