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

highlight LspErrorText       guibg=#343f44 guifg=#e67e80
highlight LspWarningText     guibg=#343f44 guifg=#dbbc7f
highlight LspInformationText guibg=#343f44 guifg=#d699b6
highlight LspHintText        guibg=#343f44 guifg=#7fbbb3
