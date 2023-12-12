call plug#begin()
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-dadbod'
    Plug 'airblade/vim-gitgutter'
    Plug 'yegappan/lsp'
    Plug 'itchyny/lightline.vim'
    Plug 'psf/black', {'branch': 'stable'}
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-python/python-syntax'
call plug#end()
