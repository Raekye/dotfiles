#!/usr/bin/env bash

# Requires: ctags, cmake, clang, python-devel

set -e

cd vim

mkdir autoload

wget -O autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
