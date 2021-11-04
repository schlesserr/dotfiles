" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jupyter-vim/jupyter-vim'
"colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
call plug#end()

filetype plugin indent on
syntax on
set noswapfile
set scrolloff=20
set incsearch
" always show the status bar
set laststatus=2
set cursorline
" turn on line numbering
set relativenumber
set nu

" enable 256 colors
set t_Co=256
set noshowmode

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

"" code folding
set foldmethod=indent
set foldlevel=99

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" color scheme
highlight Comment cterm=italic
colorscheme jellybeans
set bg=dark
let g:lightline = {'colorscheme': 'jellybeans'}

filetype on
filetype plugin indent on

" ale
map <C-j> <Plug>(ale_next_wrap)
map <C-k> <Plug>(ale_previous_wrap)
let g:ale_fixers = {'python': ['isort', 'black']}
let g:ale_linters = {'python': ['flake8', 'pyright']}
let g:ale_python_black_options = '-S -l 79'
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"fzf
:map <C-f> :Files<CR>
:map <C-b> :Buffers<CR>
"ripgrep
:map <C-r> :Rg<CR>
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}

let test#strategy = 'dispatch'

"maybe
map <F3> :term++rows=15 python %<CR>
set splitright
