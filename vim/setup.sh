#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

if [[ "$(realpath "$HOME"/.vim)" != "$(pwd)" ]]; then
	echo "'~/.vim' needs to be symlinked to '$(pwd)'!"
	exit 1
fi

mkdir autoload

curl --fail --location --output autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/junegunn/vim-plug/wiki/tips#install-plugins-on-the-command-line
# https://vimhelp.org/message.txt.html#E10
vim -es --cmd 'set cpoptions-=C' -u vimrc -i NONE -c PlugInstall -c qa
