#!/usr/bin/env bash

# Requires: ctags, cmake, clang, python-devel

set -e

cd "$HOME"
#rm -rf ".vim"
mkdir ".vim"
cd ".vim"

#mkdir autoload bundle plugin
mkdir autoload plugin

wget -O autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd plugin

# a.vim
wget -O a-2_18.vim http://www.vim.org/scripts/download_script.php?src_id=7218

# cscope.vim
wget -O cscope_maps.vim http://cscope.sourceforge.net/cscope_maps.vim

exit 0

# Pathogen
wget -O autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd bundle

# NERDTree
git clone https://github.com/scrooloose/nerdtree.git

# CtrlP
git clone https://github.com/kien/ctrlp.vim.git

# Surround
git clone https://github.com/tpope/vim-surround.git

# Solarized
git clone https://github.com/altercation/vim-colors-solarized.git

# Taglist
git clone https://github.com/majutsushi/tagbar.git

# Airline
git clone https://github.com/vim-airline/vim-airline.git

# Bufferline
git clone https://github.com/bling/vim-bufferline.git

# Airline themes
#git clone https://github.com/vim-airline/vim-airline-themes.git

# Easymotion
git clone https://github.com/Lokaltog/vim-easymotion.git

# Rails
git clone git://github.com/tpope/vim-rails.git

# Bundler
git clone git://github.com/tpope/vim-bundler.git

# YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git you_complete_me
cd you_complete_me
git submodule update --init --recursive
./install.sh --clang-completer
cd ..

cd .. # up from bundle
cd plugin

# a.vim
wget -O a-2_18.vim http://www.vim.org/scripts/download_script.php?src_id=7218
