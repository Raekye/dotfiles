" Plugins:
" - Pathogen
" - NERDTree
" - CtrlP
" - Solarized (theme)
" - Taglist

set number
set smartindent
set nobackup
set noswapfile
set scrolloff=4
set ignorecase
set smartcase
set autoread
set ruler
set incsearch
set backspace=indent,eol,start
set ssop-=options
set ssop-=curdir
set ssop+=sesdir
set showcmd
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let mapleader="\\"
let g:ctrlp_show_hidden = 1
set laststatus=2
set wildmenu
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ctrlp_working_path_mode = 0
let g:solarized_visibility = "low"

let g:ctrlp_custom_ignore = { 'file': '\v\.(jar|class)$', }
let g:ctrlp_max_files=0

filetype on

set shiftwidth=4
set tabstop=4

autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set encoding=utf8
set ffs=unix,dos

set list
set listchars=tab:>\ ,trail:-,nbsp:+,eol:$

syntax enable

execute pathogen#infect()
execute pathogen#helptags()

let g:solarized_termcolors=256
colorscheme solarized
set background=light

function! C_include_guard()
	let basename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	let include_guard = "__" . basename . "_"
	call append(0, "#ifndef " . include_guard)
	call append(1, "#define " . include_guard)
	call append(line("$"), "#endif /* " . include_guard . " */")
endfunction

map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>
map Q <Nop>
map <C-m> :TagbarToggle<CR>
map <C-g> :A<CR>
map <C-b> :YcmForceCompileAndDiagnostics<CR>
map <C-i> :call C_include_guard()<CR>
map <C-j> :bp<CR>
map <C-k> :bn<CR>
map <C-l> :ls<CR>:buffer<Space>
map <C-h> <C-^>
map <C-f> :b#<CR>
map <C-s> <esc>:update<CR>
