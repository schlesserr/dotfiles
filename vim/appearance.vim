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

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
set bg=dark
colorscheme gruvbox
highlight Comment cterm=italic

