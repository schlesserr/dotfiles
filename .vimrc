" plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'tomasr/molokai'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
call plug#end()

filetype plugin indent on
syntax on
set noswapfile
set scrolloff=20
set incsearch
" always show the status bar
set laststatus=2

" enable 256 colors
set t_Co=256
"set termguicolors
set t_ut=

" turn on line numbering
set relativenumber
set nu

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

"vim slime
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
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

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

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

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" color scheme
syntax on
highlight Comment cterm=italic gui=italic
colorscheme gruvbox
" grubox
set bg=dark
let g:gruvbox_contrast_dark='hard'


"molokai
"let g:molokai_original = 1

filetype on
filetype plugin indent on

" airline
set noshowmode
let g:airline_theme = 'gruvbox'

"" code folding
set foldmethod=indent
set foldlevel=99

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" NerdTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info']
let NERDTreeMinimalUI = 1
autocmd VimEnter * NERDTree | wincmd p
map <C-t> :NERDTreeToggle<CR>
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


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
:map <C-c> "+y
:map! <C-c> "+y

"cut
:map <C-x> "+c
:map! <C-x> "+c

"paste
:map <C-v> c<ESC>"+p
:map! <C-v> <ESC>"+pa

"fugitive
:map <C-f> :Files<CR>
:map <leader>b :Buffers<CR>
"ripgrep
:map <C-r> :Rg<CR>
"let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
