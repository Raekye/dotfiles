# Requires: ctags, cmake, clang

cd "$HOME"
rm -rf ".vim"
mkdir ".vim"
cd ".vim"

mkdir autoload bundle plugin

# Pathogen
wget -O autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd bundle

# NERDTree
git clone https://github.com/scrooloose/nerdtree.git

# CtrlP
git clone https://github.com/kien/ctrlp.vim.git

# Solarized
git clone git://github.com/altercation/vim-colors-solarized.git

# Taglist
wget -O taglist-46.zip http://vim.sourceforge.net/scripts/download_script.php?src_id=19574
unzip taglist-46.zip -d taglist-46
rm taglist-46.zip

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
