#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "$DIR/inputrc" "$HOME/.inputrc"
ln -s "$DIR/vimrc" "$HOME/.vimrc"
ln -s "$DIR/emacs" "$HOME/.emacs"
