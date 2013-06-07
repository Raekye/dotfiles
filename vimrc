" Plugins:
" - Pathogen
" - NERDTree
" - CtrlP
" - Solarized (theme)

set number
set autoindent
set nobackup
set noswapfile
set scrolloff=4
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set autoread
set ruler
set incsearch
set backspace=indent,eol,start
set ssop-=options
set ssop-=curdir
set ssop+=sesdir
let NERDTreeShowLineNumbers=1

set encoding=utf8
set ffs=unix,dos

set list
set listchars=tab:>\ ,trail:-,nbsp:+,eol:$

filetype plugin on

syntax enable

execute pathogen#infect()
execute pathogen#helptags()

" autocmd vimenter * if !argc() | NERDTree | endif

if has("gui_running")
	let g:solarized_termcolors=256
	colorscheme solarized
	set background=dark
endif

map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
map Q <Nop>
