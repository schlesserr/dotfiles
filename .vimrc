" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jupyter-vim/jupyter-vim'
Plug 'fenetikm/falcon'
call plug#end()

filetype plugin indent on
syntax on
set noswapfile
set scrolloff=20
set incsearch
let mapleader='\'
" always show the status bar
set laststatus=2
set cursorline
" turn on line numbering
set relativenumber
set nu

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

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
colorscheme nord
highlight Comment cterm=italic
"highlight ColorColumn ctermbg=0 guibg=lightgrey
" enable 256 colors
set t_Co=256

set noshowmode
let g:lightline = {'colorscheme': 'nord'}

filetype on
filetype plugin indent on

" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

"" code folding
set foldmethod=indent
set foldlevel=99

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>


" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ale
map <C-j> <Plug>(ale_next_wrap)
map <C-k> <Plug>(ale_previous_wrap)
let g:ale_fixers = {'python': ['isort', 'black']}
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_black_options = '-S -l 79'
let g:ale_fix_on_save = 1

" tags
nmap <F8> :TagbarToggle<CR>

":map works in normal, visual, select and operator mode
":map! works un insert and command-line mode

" copy
":map <C-c> "+y
":map! <C-c> "+y

"cut
":map <C-x> "+c
":map! <C-x> "+c

"paste
":map <C-v> c<ESC>"+p
":map! <C-v> <ESC>"+pa

"fzf
:map <C-f> :Files<CR>
:map <C-b> :Buffers<CR>
"ripgrep
:map <C-r> :Rg<CR>
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}
let g:help_layout = {'window': {'width': 0.9, 'height': 0.9}}

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
