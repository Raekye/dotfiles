#!/usr/bin/env bash

# Requires: ctags, cmake, clang, python-devel

set -e

cd vim

mkdir autoload plugin

wget -O autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd plugin

# a.vim
wget -O a-2_18.vim http://www.vim.org/scripts/download_script.php?src_id=7218

# cscope.vim
wget -O cscope_maps.vim http://cscope.sourceforge.net/cscope_maps.vim
