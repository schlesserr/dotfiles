call plug#begin()
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-completion'
    Plug 'airblade/vim-gitgutter'
    Plug 'yegappan/lsp'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'aditya-azad/candle-grey'
    Plug 'fenetikm/falcon'
    Plug 'vim-python/python-syntax'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'sillybun/vim-repl'
    Plug 'sjl/badwolf'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()
