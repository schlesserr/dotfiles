" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
" xnoremap <leader>db <Plug>db#op_exec()
" nnoremap <leader>db <Plug>db#op_exec()
" nnoremap <leader>dbb <Plug>db#op_exec() . '_'

nmap <leader>dy db#op_exec()<CR>
" nmap <leader>db  
" omap <leader>db  
" nmap <leader>dbb 

Plug 'vim-test/vim-test'

Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste'],
        \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \},
    \ 'component_function': {
    \    'gitbranch': 'FugitiveHead'
    \   },
    \}
Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'
map <C-j> <Plug>(ale_next_wrap)
map <C-k> <Plug>(ale_previous_wrap)
let g:ale_fixers = {'python': ['isort', 'black']}
let g:ale_linters = {'python': ['pyright']}
let g:ale_python_black_options = '-S -l 79'
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'
:map <C-f> :Files<CR>
:map <C-b> :Buffers<CR>
:map <C-r> :Rg<CR>
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}

Plug 'jupyter-vim/jupyter-vim'
Plug 'vim-python/python-syntax'
Plug 'avakhov/vim-yaml'

Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython',
            \   }
let g:repl_position = 3
nnoremap <leader>r :REPLToggle<CR>

"colorschemes
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1

Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'owickstrom/vim-colors-paramount'
call plug#end()

filetype plugin indent on
let python_highlight_all=1
syntax on
set splitright
autocmd Filetype help wincmd L
autocmd Filetype man wincmd L
set noswapfile
set scrolloff=20
set incsearch
set laststatus=2
set cursorline
set relativenumber
set nu

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
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" color scheme
set bg=dark
colorscheme gruvbox
highlight Comment cterm=italic
filetype on
filetype plugin indent on
let g:pydoc_open_cmd = 'vsplit'
