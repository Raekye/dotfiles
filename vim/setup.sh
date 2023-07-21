#!/usr/bin/env bash

# Requires: ctags, cmake, clang, python-devel

set -e

cd "$(dirname "$0")"

mkdir autoload

curl --fail --location --output autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -es -u vimrc -i NONE -c PlugInstall -c qa
