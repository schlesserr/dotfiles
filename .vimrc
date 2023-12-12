" plugins
call plug#begin('~/.vim/plugged')
    Plug 'vim-python/python-syntax'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-dadbod'
    Plug 'airblade/vim-gitgutter'
    Plug 'yegappan/lsp'
        let lspServers = [#{
                         \   name: 'pyright',
                         \   filetype: 'python',
                         \   path: 'pyright-langserver',
                         \   args: ['--stdio'],
                         \   workspaceConfig: #{
                         \     python: #{
                         \       analysis: #{
                         \          typeCheckingMode: 'off',
                         \          diagnosticsMode: 'openFilesOnly',
                         \          diagnosticSeverityOverrides: #{
                         \                 strictParameterNoneValue: 'false',
                         \                 reportMissingImports: 'error',
                         \                 reportUndefinedVariable: 'error',
                         \                 reportAssertAlwaysTrue: 'information',
                         \                 reportWildcardImportFromLibrary: 'warning',
                         \                 reportGeneralTypeIssues: 'none',
                         \                 reportOptionalSubscript: 'none',
                         \                 reportOptionalMemberAccess: 'none',
                         \                 reportOptionalCall: 'none',
                         \                 reportOptionalIterable: 'none',
                         \                 reportOptionalContextManager: 'none',
                         \                 reportOptionalOperand: 'none',
                         \                 reportTypedDictNotRequiredAccess: 'information',
                         \                 reportPrivateImportUsage: 'error',
                         \                 reportUnboundVariable: 'error',
                         \                 reportUnusedCoroutine: 'information',
                         \                 reportConstantRedefinition: 'warning',
                         \                 reportDeprecated: 'information',
                         \                 reportDuplicateImport: 'warning',
                         \                 reportPrivateUsage: 'error',
                         \                 reportUnnecessaryCast: 'information',
                         \                 reportUnnecessaryComparison: 'information',
                         \                 reportUnnecessaryContains: 'information',
                         \                 reportUnnecessaryIsInstance: 'information',
                         \                 reportUnusedImport: 'information',
                         \                 reportUnusedVariable: 'information',
                         \    }
                         \    }
                         \   }}
                         \ }]
        autocmd VimEnter * call LspAddServer(lspServers)

        nnoremap <buffer> gd <Cmd>LspGotoDefinition<CR>
        nnoremap <buffer> [d <Cmd>LspDiagPrev<CR>
        nnoremap <buffer> ]d <Cmd>LspDiagNext<CR>


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


    Plug 'psf/black', {'branch': 'stable'}
        let g:black_linelength = 79
        let g:black_skip_string_normalization = 1
        augroup black_on_save
          autocmd!
          autocmd BufWritePre *.py Black
        augroup end


    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
        :nmap <space>f :Files<CR>
        :nmap <space>b :Buffers<CR>
        :nmap <space>r :Rg<CR>
        let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 }}
        let g:fzf_colors =
                    \ {'fg':      ['fg', 'Normal'],
                    \ 'bg':      ['bg', 'Normal'],
                    \ 'hl':      ['fg', 'Comment'],
                    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                    \ 'hl+':     ['fg', 'Statement'],
                    \ 'info':    ['fg', 'PreProc'],
                    \ 'border':  ['fg', 'Ignore'],
                    \ 'prompt':  ['fg', 'Conditional'],
                    \ 'pointer': ['fg', 'Exception'],
                    \ 'marker':  ['fg', 'Keyword'],
                    \ 'spinner': ['fg', 'Label'],
                    \ 'header':  ['fg', 'Comment'] }


    Plug 'morhetz/gruvbox'
        let g:gruvbox_contrast_dark = 'hard'
        let g:gruvbox_italicize_comments=1
        let g:gruvbox_italicize_strings=1

call plug#end()

filetype plugin indent on
let python_highlight_all=1
syntax on
autocmd Filetype help wincmd L
autocmd Filetype man wincmd L
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

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
 
set bg=dark
colorscheme gruvbox
highlight Comment cterm=italic
