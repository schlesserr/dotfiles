filetype plugin indent on
let python_highlight_all=1
syntax on
set noswapfile
set splitright
set scrolloff=20
set incsearch
set laststatus=2
set cursorline
set relativenumber
set nu
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
set wildmenu wildoptions=pum,fuzzy pumheight=25
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set clipboard+=unnamedplus

highlight Comment cterm=italic

autocmd FileType help wincmd L
autocmd FileType man wincmd L
autocmd FileType doc wincmd L
autocmd FileType dbout wincmd L
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Configurações do vim-dadbod-completion
let g:dadbod_completion_backend = 'vim-dadbod'
let g:db_completion_use_snippets = 1
let g:db_completion_auto_trigger = 1

" Configurar omnifunc para arquivos SQL
autocmd FileType sql,mysql,plsql setlocal omnifunc=vim_dadbod_completion#omni

" # Configuração Vim9 Script - Suporte a Python 3 no Linux
set pyxversion=3 " # Garante uso do Python 3

set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'vim': 'vim -e',
            \   }

let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '9'
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

