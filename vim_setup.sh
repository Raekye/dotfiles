# Clean
rm -rf ~/.vim

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# NERDTree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

# CtrlP
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

# Solarized
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

# Fugitive
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git

# Taglist
cd ~/.vim/bundle
wget -O taglist-46.zip http://vim.sourceforge.net/scripts/download_script.php?src_id=19574
unzip taglist-46.zip -d taglist-46
rm taglist-46.zip
