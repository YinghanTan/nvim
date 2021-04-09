let g:coc_global_extensions = [
    \ 'coc-fzf-preview',
    \ 'coc-diagnostic',
    \ 'coc-actions',
    \ 'coc-yank',
    \ 'coc-ultisnips',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-marketplace',
    \ 'coc-leetcode',
    \ 'coc-eslint',
    \ 'coc-jira-complete',
    \ 'coc-git',
    \ 'coc-java-debug',
    \ 'coc-java',
    \ 'coc-emmet',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-vimlsp',
    \ 'coc-sh',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-json',
    \ 'coc-svg',
    \ 'coc-xml',
    \ 'coc-pyright',
    \ 'coc-jedi',
    \ 'coc-flutter',
    \ ]
    " \ 'coc-python',
    " \ 'coc-pairs',





" Brief help
" :CocUninstall   - Uninstall extensions
" :CocInstall     - installs extensions
" :CocUpdate      - To update your extensions
" :CocEnable      - Enable Coc
" :CocDisable     - Disable Coc


" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
