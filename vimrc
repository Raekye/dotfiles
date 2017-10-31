
set exrc
set secure
set number
set ruler
set showcmd
set smartindent " less strict than cindent
set autoindent
set ignorecase
set smartcase
set wildmenu " command line completion
set nobackup " make backup before overwriting, and leave it around
set noswapfile " use swapfile for buffer
set autoread " update if changed externally and not modified locally
set incsearch " ctrl-g and ctrl-t to move to next and previous match
set scrolloff=4
set laststatus=2 " always show status line for last window
set backspace=indent,eol,start
set ssop-=options
set ssop-=curdir
set ssop+=sesdir

let mapleader=","

let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0 " set local working directory to pwd
let g:ctrlp_max_files = 0

let g:airline#extensions#tabline#enabled = 1

let g:bufferline_echo = 0 " don't show in command bar

let g:ycm_autoclose_preview_window_after_completion = 1

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

let g:gundo_prefer_python3 = 1

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
let g:ack_mappings = { "o": "<CR><C-W><C-W>:ccl<CR>" }

set encoding=utf8
set ffs=unix,dos
set list
set listchars=tab:>\ ,trail:-,nbsp:+,eol:$

filetype on

set shiftwidth=4
set tabstop=4

autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

syntax enable

"execute pathogen#infect()
"execute pathogen#helptags()
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-characterize'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'sjl/gundo.vim'
Plug 'mileszs/ack.vim'

call plug#end()

let g:solarized_termcolors=256
let g:solarized_visibility = "low"
colorscheme solarized
set background=light

function! C_include_guard()
	let basename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	let include_guard = "__" . basename . "_"
	call append(0, "#ifndef " . include_guard)
	call append(1, "#define " . include_guard)
	call append(line("$"), "#endif /* " . include_guard . " */")
endfunction

map Q <Nop>
map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
map <C-l> :CtrlPBuffer<CR>
map <C-c> :TagbarToggle<CR>
map <C-b> :YcmForceCompileAndDiagnostics<CR>
map <C-j> :bp<CR>
map <C-k> :bn<CR>
map <C-i> :ls<CR>:buffer<space>
map <C-h> <C-^>
map <C-f> :b#<CR>
map <C-g> :GundoToggle<CR>
map <C-[> <C-w><C-w>:ccl<CR>
map <leader>a :A<CR>
map <leader>g :Ack!<space>
map <leader>r <C-\>c
map <leader>e <C-]>
map <leader>w <C-\>s
map <leader>f :cs f c<space>
map <leader>d :cs f g<space>
map <leader>s :cs f s<space>
