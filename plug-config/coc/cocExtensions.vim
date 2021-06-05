let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-fzf-preview',
    \ 'coc-diagnostic',
    \ 'coc-yank',
    \ 'coc-ultisnips',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-marketplace',
    \ 'coc-jira-complete',
    \ 'coc-java-debug',
    \ 'coc-java',
    \ 'coc-lua',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-vimlsp',
    \ 'coc-sh',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-svg',
    \ 'coc-xml',
    \ 'coc-pyright',
    \ 'coc-jedi',
    \ 'coc-flutter',
    \ 'coc-swagger',
    \ 'coc-git',
    \ ]
    " \ 'coc-python',
    " \ 'coc-pairs',
    " \ 'coc-list',
    " \ 'coc-hightlight',
    " \ 'coc-leetcode',
    " 'coc-fzf',




" coc-fzf-preview options
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" Brief help
" :CocUninstall   - Uninstall extensions
" :CocInstall     - installs extensions
" :CocUpdate      - To update your extensions
" :CocEnable      - Enable Coc
" :CocDisable     - Disable Coc


" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Swagger
" tip: add a (slightly) short command
command -nargs=0 Swagger :CocCommand swagger.render
