#!/usr/bin/env bash

# Requires: ctags, cmake, clang, python-devel

set -e

mkdir vim
cd vim

mkdir autoload plugin

wget -O autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd plugin

# a.vim
wget -O a-2_18.vim http://www.vim.org/scripts/download_script.php?src_id=7218

# cscope.vim
wget -O cscope_maps.vim http://cscope.sourceforge.net/cscope_maps.vim

cd ..

mkdir after
mkdir ftplugin
echo 'setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=0' > after/ftplugin/python.vim
