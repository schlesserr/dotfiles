call plug#begin()
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'yegappan/lsp'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'vim-python/python-syntax'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
