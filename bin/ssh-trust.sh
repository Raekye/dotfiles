#!/usr/bin/env bash

exec ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null' "$@"
