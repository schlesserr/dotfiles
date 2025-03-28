let g:vim_config_path = '~/.vim/'

function! SourceConfigFile(file)
    exec 'source ' . g:vim_config_path . a:file . '.vim'
endfunction

call SourceConfigFile('keymap')
call SourceConfigFile('plugins')
call SourceConfigFile('lsp')
call SourceConfigFile('appearance')
call SourceConfigFile('options')
call SourceConfigFile('plugins')
call SourceConfigFile('db_connections')
