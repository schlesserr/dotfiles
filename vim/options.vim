let g:black_linelength = 79
let g:black_skip_string_normalization = 1
augroup black_on_save
    autocmd!
    autocmd BufWritePre *.py Black
augroup end
filetype plugin indent on
let python_highlight_all=1
syntax on
autocmd FileType help wincmd L
autocmd FileType man wincmd L
set noswapfile
set splitright
set scrolloff=20
set incsearch
set laststatus=2
set cursorline
set relativenumber
set nu
set t_Co=256
set noshowmode
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=indent
set foldlevel=99
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
set viminfo='25,\"50,n~/.viminfo
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set clipboard+=unnamedplus

highlight Comment cterm=italic

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
