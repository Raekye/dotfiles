#!/usr/bin/env bash
# https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/#sect-clean-up-old-kernels

set -e

OLD_KERNELS=($(dnf repoquery --installonly --latest-limit=-2 --quiet))

if test "${#OLD_KERNELS[@]}" -eq 0; then
	echo 'No old kernels found.'
	exit 0
fi

dnf remove "${OLD_KERNELS[@]}"
