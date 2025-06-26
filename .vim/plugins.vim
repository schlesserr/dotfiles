call plug#begin()
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-completion'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'airblade/vim-gitgutter'
    Plug 'yegappan/lsp'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-python/python-syntax'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'sillybun/vim-repl'
call plug#end()
